%% Load In Feature Dimensions From FruitNet Classification
features_data = [output_dir_path features_data_name];
load(features_data);

%% Use Multidimensional Scaling to Plot Image Classification Feature Dimensions

% for training data output
[Y_train, eigvals_train] = mdscale(fruitFeaturesTrainCollapsed, 2);

% for testing data output
[Y_test, eigvals_test] = mdscale(fruitFeauturesTestCollapsed, 2);

%% Add Path to mds_experiment directory to access functions
if (IS_RUNNING_ON_MAC == 1)
    addpath('../mds_experiment/'); % for mac
else
    addpath('..\mds_experiment\'); % for pc
end

%% Call analyzeMDS from mds_experiment directory

% for training data
analyzeMDS(features_data, 1, Y_train);

% for testing data
analyzeMDS(features_data, 1, Y_test);
