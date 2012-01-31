function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 6/21/2011, 11:56 AM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: UtrGFP SqhCher 1

filename = 'embryo1_t050_z008_c002.tif';

z_name = sprintf(strcat('%.', num2str(3), 'u'), layer_i);
filename(15:15+3-1) = z_name;

t_name = sprintf(strcat('%.', num2str(3), 'u'), time_i);
filename(10:10+3- 1) = t_name;

data = fullfile(src, filename);
