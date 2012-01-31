function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 10/12/2011, 11:15 AM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: control CytoD 2

filename = 'CellsProj_t001_z008_c002.tif';

z_name = sprintf(strcat('%.', num2str(3), 'u'), layer_i);
filename(17:17+3-1) = z_name;

t_name = sprintf(strcat('%.', num2str(3), 'u'), time_i);
filename(12:12+3- 1) = t_name;

data = fullfile(src, filename);
