function [featuresTrain, featuresTest] = fruitClassification(imdsTrain, imdsTest, all_images)
%This function classifies each fruit image and its fc7 Fully Connected
% layer.

%% Initailize AlexNet as FruitNet
FruitNet = alexnet;

%% Read In and Resize All Images
for i = 1:length(all_images)
    for j = 1:length(all_images{i})
        cur_image = imread(all_images{i}{j});
        net_layer_size = FruitNet.Layers(1).InputSize;
        cur_image = imresize(cur_image, [227 227]);
        
        augimdsTrain = augmentedImageDatastore(net_layer_size(1:2), imdsTrain);
        augimdsTest = augmentedImageDatastore(net_layer_size(1:2), imdsTest);
        
        layer = 'fc7';
        
        featuresTrain{i}{j} = activations(FruitNet, augimdsTrain, layer, 'OutputAs', 'rows');
        featuresTest{i}{j} = activations(FruitNet, augimdsTest, layer, 'OutputAs', 'rows');
    end
end
end