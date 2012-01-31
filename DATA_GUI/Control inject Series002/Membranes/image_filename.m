function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 12/10/2009, 11:35 AM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: Control inject Series002

filename = 'Series002_t00_z7_ch01.tif';

z_name = sprintf(strcat('%.', num2str(1), 'u'), layer_i);
filename(16:16+1-1) = z_name;

t_name = sprintf(strcat('%.', num2str(2), 'u'), time_i);
filename(12:12+2- 1) = t_name;

data = fullfile(src, filename);
