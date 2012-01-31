function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 10/18/2011, 4:24 PM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: control cytoD 3

filename = 'MyosinProj_t001_z008_c001.tif';

z_name = sprintf(strcat('%.', num2str(3), 'u'), layer_i);
filename(18:18+3-1) = z_name;

t_name = sprintf(strcat('%.', num2str(3), 'u'), time_i);
filename(13:13+3- 1) = t_name;

data = fullfile(src, filename);
