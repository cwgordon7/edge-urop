function cellsi = correct_centroids_split(cellsi, intmap, energy, centroids, regions, region)
%CORRECT_CENTROIDS_SPLIT Helper function for CORRECT_CENTROIDS; cuts a path
%through


region_centroids = [];
for centroid=centroids'
    if regions(centroid(1), centroid(2)) == region
        region_centroids(size(region_centroids, 1) + 1, :) = centroid;
    end
end

num_centroids = size(region_centroids, 1);
distances = dist(region_centroids');

closest = find(distances == min(distances(find(distances))));
closest = closest(1);
% Centroids a and b are the closest two centroids in the region.
centroid_a = region_centroids(ceil(closest / num_centroids), :);
centroid_b = region_centroids(mod(closest - 1, num_centroids) + 1, :);

% General idea: find two closest centroids, prepare guideline "cut", find
% border intersection, find least-cost path from border intersection point
% 1 to border intersection point 2.

mid = (centroid_a + centroid_b) / 2;
angle = atan2((centroid_a(1) - centroid_b(1)), (centroid_a(2) - centroid_b(2)));
vector = [sin(angle + pi/2) cos(angle + pi/2)];

intersect = zeros(2, 2);

for i=1:2
    pt = mid;
    while cellsi(round(pt(1)), round(pt(2))) == 0 && cellsi(round(pt(1)) + 1, round(pt(2))) == 0 && cellsi(round(pt(1)), round(pt(2)) + 1) == 0 && cellsi(round(pt(1)) - 1, round(pt(2))) == 0 && cellsi(round(pt(1)), round(pt(2)) - 1) == 0
        pt = pt + vector;
    end
    intersect(i, :) = round(pt);
    vector = vector * -1;
end

h = max(max(energy));
l = min(min(energy));
normal = 1.0 - ((energy - l) / (h - l));

% Make sure the cut actually cuts the two points by setting boundary points
% to infinity.
vector = [-cos(angle + pi/2) sin(angle + pi/2)] / 2;

for pt = [centroid_a
          centroid_b]'
    pt = pt';
    [x y] = size(cellsi);
    while pt(1) >= 0.5 && pt(1) < x - 0.5 && pt(2) >= 1.5 && pt(2) < y + 0.5;
        normal(round(pt(1)), round(pt(2))) = Inf;
        normal(round(pt(1)) + 1, round(pt(2))) = Inf;
        normal(round(pt(1)), round(pt(2)) - 1) = Inf;
        size(pt);
        size(vector);
        pt = pt + vector;
    end
    vector = vector * -1;
end

sprintf('cutting region %d', region)

path = find_min_path(normal, intmap, intersect(1, :), intersect(2, :));

for point=path'
    cellsi(point(1), point(2)) = 1;
end

end