function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 4/1/2011, 10:47 AM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: spn-df-2

filename = 'spnDf2_t001_z001.tif';

z_name = sprintf(strcat('%.', num2str(3), 'u'), layer_i);
filename(14:14+3-1) = z_name;

t_name = sprintf(strcat('%.', num2str(3), 'u'), time_i);
filename(9:9+3- 1) = t_name;

data = fullfile(src, filename);
