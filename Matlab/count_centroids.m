function count = count_centroids(region, centroids)
% Counts the centroids in a region.
count = 0;

for centroid=centroids
    if size(region(region == centroid))
        count = count + 1;
    end
end

end

