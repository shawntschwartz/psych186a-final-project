function analyzeMDS(current_dataset, iterator)
%This function creates a plot of the MDS data for the current dataset.

figure('name', current_dataset);
plot(Y_vals{____}(:,1), Y_vals{____}(:,2), '.');
text(Y_vals{____}(:,1)+0.01, Y_vals{____}(:,2), labs) % fruit subcategory labels (labs) is assumed to be a part of the current dataset)
axis auto square;

%% Save figure as png to _output directory
% variable to hold name of the output directory
output_dir = '_output/';

% check if directory already exists, if not, create it
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% now write figure to output dir
fig_output_filename = [output_dir current_dataset '_figure.png'];
saveas(gcf, fig_output_filename);

%% Save list of fruit subcategories to txt file
subcat_output_filename = [output_dir current_dataset '_subcategories.txt'];
dlmwrite(subcat_output_filename, labs);
end