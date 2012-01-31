function [data names units] = actin_intensity(embryo, getActin, t, z, c, dx, dz, dt, other)

% the names
names{1} = 'Actin intensity';

% the units
units{1} = 'intensity units';

% draw the Cell
[cell_img R] = drawCellSmall(embryo, t, z, c);

actin = getActin(t, z);

actin = actin(R(1):R(1)+size(cell_img, 1)-1, R(2):R(2)+size(cell_img, 2)-1);

% compute the actin intensity in each cell
data{1} = sum(sum(actin(cell_img))); 
