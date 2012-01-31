function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 5/26/2011, 11:37 AM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: 52411sqhGFPgap43

filename = 'MAX_52411sqhGFPgap43_z001_t001.tif';

z_name = sprintf(strcat('%.', num2str(3), 'u'), layer_i);
filename(23:23+3-1) = z_name;

t_name = sprintf(strcat('%.', num2str(3), 'u'), time_i);
filename(28:28+3- 1) = t_name;

data = fullfile(src, filename);
