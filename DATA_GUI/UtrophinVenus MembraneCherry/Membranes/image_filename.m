function data = image_filename(time_i, layer_i, src)
% ** This is an automatically generated function
% ** created at 4/25/2011, 3:30 PM by write_image_filename_function.m
% ** Inputs the time, layer, and source directory of a data set.
% ** Outputs the filename of that image.

% ** For data set: UtrophinVenus MembraneCherry

filename = 'utr_memb_t001_z001_c002.tif';

z_name = sprintf(strcat('%.', num2str(3), 'u'), layer_i);
filename(16:16+3-1) = z_name;

t_name = sprintf(strcat('%.', num2str(3), 'u'), time_i);
filename(11:11+3- 1) = t_name;

data = fullfile(src, filename);
