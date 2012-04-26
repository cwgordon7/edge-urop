function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 2/7/2012, 5:00 PM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: test1

filename = 'test1.tif';

z_name = sprintf(strcat('%.', num2str(1), 'u'), layer_i);
filename(5:5+1-1) = z_name;

data = fullfile(src, filename);
