% variable to hold name of the output directory
output_dir = '_output/';

% check if directory already exists, if not, create it
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% now write .mat file to output dir
data_output_filename = [pwd '/' output_dir 'classified_fruit_data.mat'];
subcat_data_output_filename = [pwd '/' output_dir 'classified_subcat_fruit_data.mat'];
combined_data_output_filename = [pwd '/' output_dir 'combined_fruit_data.mat'];
combined_data_output_bw_filename = [pwd '/' output_dir 'combined_fruit_BW_data.mat'];
save(combined_data_output_bw_filename);

%fprintf('\n\nFruitNet Classification Successfully Completed and Saved as classified_fruit_data.mat\n\n');
fprintf('\n\nFruitNet Classification Successfully Completed and Saved as combined_fruit_BW_data.mat\n\n');