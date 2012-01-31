function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 2/15/2011, 12:58 PM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: Embryo01

filename = 'Embryo01_t00_z00_ch00.tif';

z_name = sprintf(strcat('%.', num2str(2), 'u'), layer_i);
filename(15:15+2-1) = z_name;

t_name = sprintf(strcat('%.', num2str(2), 'u'), time_i);
filename(11:11+2- 1) = t_name;

data = fullfile(src, filename);
