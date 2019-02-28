function [imdsTrain, imdsTest, all_images, labs] = fruitPreprocessing(image_dir_path)
%This function loads in each zip file of fruit images to preprocess
% and outputs each train and test labels as an augmentedImage.

%% Load In and Unpack All Images
all_zips = dir([image_dir_path '/*.zip']);
all_zips_paths = {length(all_zips)};
all_images = {length(all_zips)};

for i = 1:length(all_zips)
    all_zips_paths{i} = [all_zips(i).folder() '/' all_zips(i).name()];
    all_images{i} = unzip(all_zips_paths{i}, image_dir_path);
    
    % Resize Images to Match Pretrained Network Input Size
    imds{i} = imageDatastore(all_images{i}, 'IncludeSubfolders', true, ...
        'LabelSource', 'foldernames');
    [imdsTrain, imdsTest] = splitEachLabel(imds, 0.7, 'randomized'); % 70 percent data set for training set
end

%% Return imds subfolder labels as labs
labs = imds{1}.Labels
end
 