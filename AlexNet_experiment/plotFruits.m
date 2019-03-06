%% Load In Feature Dimensions From FruitNet Classification
features_data = [output_dir_path features_data_name];
load(features_data);

%% Clean Up Collapsed Datasets
for i = 1:length(fruitFeauturesTestCollapsed)    
    fruitTest(i,:) = fruitFeauturesTestCollapsed{i};
end

%% Use Multidimensional Scaling to Plot Image Classification Feature Dimensions
d_test = pdist(fruitTest);
[Y_test, eigvals_test] = mdscale(d_test, 2);

%% Cast Categorical Labels to Char
plot_labs = char(plot_labs);

%% Plot MDS of Image Classified Data
figure('name', features_data);
plot(Y_test(:,1), Y_test(:,2), '.');

% TODO: Fix labs
text(Y_test(:,1)+0.01, Y_test(:,2), plot_labs);
axis auto square;
