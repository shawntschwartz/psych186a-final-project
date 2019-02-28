function [featuresTrainCollapsed, featuresTestCollapsed] = fruitAnalyses(featuresTrain, featuresTest)
%This function averages each fruit image and its fc7 Fully Connected
% layer across each related fruit subcategory.

num_subcats = length(featuresTrain{1});
num_subfruits = length(featuresTrain{2});

featuresTrainCollapsed = {num_subcats};
featuresTestCollapsed = {num_subcats};

for i = 1:num_subcats
    for j = 1:num_subfruits
        % create a num_subfruits x 4096 matrix to find avg. feature
        % dimensions per each subcategory of fruit
        featuresTrainCollapsed_mat(j,:) = featuresTrain{i}{j};
        featuresTestCollapsed_mat(j,:) = featuresTest{i}{j};
    end
    
    % average matrix row-wise
    featuresTrainCollapsed_mat = mean(featuresTrainCollapsed_mat);
    featuresTestCollapsed_mat = mean(featuresTestCollapsed_mat);
    
    % store the averaged matrix for each subcategory of fruit
    % returned by the function
    featuresTrainCollapsed{i} = featuresTrainCollapsed_mat;
    featuresTestCollapsed{i} = featuresTestCollapsed_mat;
end
end