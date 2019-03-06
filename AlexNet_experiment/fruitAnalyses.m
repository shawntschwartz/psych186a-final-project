function [featuresTestCollapsed] = fruitAnalyses(featuresTest, fruit_imgs)
%This function averages each fruit image and its fc7 Fully Connected
% layer across each related fruit subcategory.

num_subcats = length(featuresTest);
num_subfruits = length(fruit_imgs{1});

for i = 1:num_subcats
    for j = 1:num_subfruits
        % create a num_subfruits x 4096 matrix to find avg. feature
        % dimensions per each subcategory of fruit
        
        featuresTestCollapsed_mat(j,:) = featuresTest{i}{j};
    end
    
    % average matrix row-wise
    featuresTestCollapsed_mat = mean(featuresTestCollapsed_mat);
    
    % store the averaged matrix for each subcategory of fruit
    % returned by the function    
    featuresTestCollapsed{i} = featuresTestCollapsed_mat;
    fprintf('\n\nCollaposed Fruit Test Features for Subcategory %d and Fruit %d Successfully Stored!', i, j);
end
end