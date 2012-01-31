function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 7/8/2011, 9:00 PM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: Squashed

filename = 'SqhGFP Gap43 Squashed 2_t0001_z0001.tif';

z_name = sprintf(strcat('%.', num2str(4), 'u'), layer_i);
filename(32:32+4-1) = z_name;

t_name = sprintf(strcat('%.', num2str(4), 'u'), time_i);
filename(26:26+4- 1) = t_name;

data = fullfile(src, filename);
