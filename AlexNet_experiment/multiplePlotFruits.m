%% Load In Feature Dimensions From FruitNet Classification - ONE
features_data_one = [output_dir_path features_data_one_name];
load(features_data_one);

%% Clean Up Collapsed Datasets - ONE
for i = 1:length(fruitFeauturesTestCollapsed)    
    fruitTest(i,:) = fruitFeauturesTestCollapsed{i};
end

%% Use Multidimensional Scaling to Plot Image Classification Feature Dimensions - ONE
d_test = pdist(fruitTest);
d_test_matrix = squareform(d_test);
[Y_test] = mdscale(d_test_matrix, 2);

%% Cast Datatype Categorical Labels to Datatype Char - ONE
plot_labs = char(plot_labs);

%% Scale Plots To Michael Lee MDS Data Scale - ONE
Y_test = Y_test ./ 400;

%% Plot MDS of Image Classified Data - ONE
figure('name', 'Stacked Classifications');
plot(Y_test(:,1), Y_test(:,2), '.b');
text(Y_test(:,1)+0.01, Y_test(:,2), plot_labs, 'Color', 'b');

hold on; % prepare to stack secondary data

%% Partial Workspace Cleanup for Second Plot!
clear fruitTest d_test d_test_matrix Y_test plot_labs

%% Load In Feature Dimensions From FruitNet Classification - TWO
features_data_two = [output_dir_path features_data_two_name];
load(features_data_two);

%% Clean Up Collapsed Datasets - ONE
for i = 1:length(fruitFeauturesTestCollapsed)    
    fruitTest(i,:) = fruitFeauturesTestCollapsed{i};
end

%% Use Multidimensional Scaling to Plot Image Classification Feature Dimensions - TWO
d_test = pdist(fruitTest);
d_test_matrix = squareform(d_test);
[Y_test] = mdscale(d_test_matrix, 2);

%% Cast Datatype Categorical Labels to Datatype Char - TWO
plot_labs = char(plot_labs);

%% Scale Plots To Michael Lee MDS Data Scale - TWO
Y_test = Y_test ./ 400;

%% Plot MDS of Image Classified Data - TWO
plot(Y_test(:,1), Y_test(:,2), '.r');
text(Y_test(:,1)+0.01, Y_test(:,2), plot_labs, 'Color', 'r');
axis auto square;

hold off;

%% Save figure as png to _output directory
% check if directory already exists, if not, create it
if ~exist(output_dir_path, 'dir')
    mkdir(output_dir_path);
end

% retrieve current file name
[~,name,ext] = fileparts(features_data_one);
current_file_name = [name ext];

% now write figure to output dir
fig_output_filename = [pwd '/' output_dir current_file_name '_figure-stacked.png'];
saveas(gcf, fig_output_filename);
