function cellsi = correct_centroids(cellsi, energy, centroids)
%CORRECT_CENTROIDS Takes an undersegmented image and further segments it so
%as to fit the cells to their centroids.

centroids = round(centroids);
centroids = unique(centroids, 'rows');

[x y] = size(cellsi);
intmap = zeros(x, y);
for i=1:x
    for j=1:y
        intmap(i, j) = (i-1)*y + j;
    end
end

repeat = 1;
while repeat
    repeat = 0;
    cellsinv = ~cellsi;

    regions = bwlabel(cellsinv, 4);

    % Keep track of which one is the "background."
    background = -1;
    background_count = 15000; % 15000 pixels for background classification.

    centroid_track = zeros(1, length(unique(regions)) - 1);

    original = cellsi;

    for centroid=centroids'
        cellnum = regions(centroid(1), centroid(2));
        if cellnum == 0
            cellsi(centroid(1), centroid(2)) = 0;
        else
            centroid_track(cellnum) = centroid_track(cellnum) + 1;
            count = length(regions(regions == cellnum));
            if count > background_count
                background_count = count;
                background = cellnum;
            end
        end
    end

    for region=unique(regions)'
        if region > 0
            n = centroid_track(region);
            if n == 0
                % Empty - need to remove cell.
                % Trick: white-out the region, then re-skeletonize later.
                % TODO: This doesn't work well. Figure out a better way to
                % do this.
                % cellsi = cellsi + (regions == region);
            elseif n == 1
                % Region is good, so do nothing.
            else
                % Too many centroids! Split them.
                if region == background
                    % For now, ignore.
                    % @TODO we need a way to deal with this.
                else
                    % Split!
                    cellsi = correct_centroids_split(cellsi, intmap, energy, centroids, regions, region);
                    repeat = 1;
                end
            end
        end
    end
    figure, imshow(cellsi - 0.75 * original);
end

cellsi = bwmorph(cellsi, 'shrink', Inf);
cellsi = bwmorph(cellsi, 'clean');

figure, imshow(cellsi);

h = max(max(energy));
l = min(min(energy));
normal = 1.0 - ((energy - l) / (h - l));

[x y] = size(cellsi);
newimg = zeros(x, y, 3);
for i=1:x
    for j=1:y
        newimg(i, j, :) = normal(i, j);
        if cellsi(i, j)
            newimg(i, j, :) = [1 0 0];
        end
    end
end
figure, imshow(newimg);

end