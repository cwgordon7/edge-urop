function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 3/24/2011, 2:14 PM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: MyosinGFP_MembCherry

filename = 'Embryo01_t00_z0_ch00.tif';

z_name = sprintf(strcat('%.', num2str(1), 'u'), layer_i);
filename(15:15+1-1) = z_name;

t_name = sprintf(strcat('%.', num2str(2), 'u'), time_i);
filename(11:11+2- 1) = t_name;

data = fullfile(src, filename);
