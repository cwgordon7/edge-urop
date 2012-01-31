% Gets the channel names from a directory (basically just folder names),
% but ignores a folder named 'Membranes'

function channelnames = get_channelnames(input_dir)

channelnames = cell(0);
files = dir(input_dir);  % get the channels from this data set
for i = 1:length(files)
    if files(i).isdir && ~strcmp(files(i).name , '.') && ~strcmp(files(i).name, '..') ...
            && ~strcmp(files(i).name, 'Membranes')
        channelnames{length(channelnames)+1} = files(i).name;
    end
end
