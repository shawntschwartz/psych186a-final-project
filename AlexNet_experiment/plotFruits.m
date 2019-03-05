%% Load In Feature Dimensions From FruitNet Classification
features_data = [output_dir_path features_data_name];
load(features_data);

%% Clean Up Collapsed Datasets
for i = 1:length(fruitFeauturesTest)    
    fruitTest(i,:) = fruitFeauturesTest{i};
end

%% Use Multidimensional Scaling to Plot Image Classification Feature Dimensions

    %d_test = pdist(fruitTest);
    % for testing data output
    [Y_test, eigvals_test] = mdscale(fruitTest, 2);
    
%% Add Path to mds_experiment directory to access functions
if (IS_RUNNING_ON_MAC == 1)
    addpath('../mds_experiment/'); % for mac
else
    addpath('..\mds_experiment\'); % for pc
end

%% Call analyzeMDS from mds_experiment directory
% for testing data
analyzeMDS(features_data, 1, Y_test);
