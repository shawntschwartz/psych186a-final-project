% variable to hold name of the output directory
output_dir = '_output/';

% check if directory already exists, if not, create it
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% retrieve current file name
[~,name,ext] = fileparts(current_dataset);
current_file_name = [name ext];

% now write .mat file to output dir
data_output_filename = [pwd '/' output_dir 'classified_fruit_data.mat'];
save(data_output_filename);