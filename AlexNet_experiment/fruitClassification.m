function [featuresTest] = fruitClassification(imdsTest, all_images)
%This function classifies each fruit image and its fc7 Fully Connected
% layer.

fprintf('\n\nBeginning Fruit Classification...');

%% Initailize AlexNet as FruitNet
FruitNet = alexnet;
fprintf('\n\nFruitNet Initialization Successfull!');

%% Read In and Resize All Images
for i = 1:length(all_images)
    for j = 1:length(all_images{i})
        cur_image = imread([all_images{i}(j).folder() '/' all_images{i}(j).name()]);
        net_layer_size = FruitNet.Layers(1).InputSize;
        cur_image = imresize(cur_image, [227 227]);
        
        augimdsTest = augmentedImageDatastore(net_layer_size(1:2), cur_image);
        
        layer = 'fc7';
        
        featuresTest{i}{j} = activations(FruitNet, augimdsTest, layer, 'OutputAs', 'rows');
        
        fprintf('\n\nFruit Subcategory %d with Fruit %d Successfully Imported', i, j);
    end
end
end
