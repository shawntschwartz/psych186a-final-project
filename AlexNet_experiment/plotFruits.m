%% Load In Feature Dimensions From FruitNet Classification
features_data = [output_dir_path features_data_name];
load(features_data);

%% Clean Up Collapsed Datasets
for i = 1:length(fruitFeauturesTestCollapsed)    
    fruitTest(i,:) = fruitFeauturesTestCollapsed{i};
end

%% Use Multidimensional Scaling to Plot Image Classification Feature Dimensions
d_test = pdist(fruitTest);
d_test_matrix = squareform(d_test);
[Y_test] = mdscale(d_test_matrix, 2);

%% Cast Datatype Categorical Labels to Datatype Char
plot_labs = char(plot_labs);

%% Scale Plots To Michael Lee MDS Data Scale
Y_test = Y_test ./ 400;

%% Plot MDS of Image Classified Data
figure('name', features_data);
plot(Y_test(:,1), Y_test(:,2), '.');
text(Y_test(:,1)+0.01, Y_test(:,2), plot_labs);
axis auto square;

%% Save figure as png to _output directory
% check if directory already exists, if not, create it
if ~exist(output_dir_path, 'dir')
    mkdir(output_dir_path);
end

% retrieve current file name
[~,name,ext] = fileparts(features_data);
current_file_name = [name ext];

% now write figure to output dir
fig_output_filename = [pwd '/' output_dir current_file_name '_figure.png'];
saveas(gcf, fig_output_filename);

%% Save list of fruit subcategories to txt file
subcat_output_filename = [pwd '/' output_dir current_file_name '_subcategories.txt'];
dlmwrite(subcat_output_filename, plot_labs, '');