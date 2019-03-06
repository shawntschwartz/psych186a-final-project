function [imdsTest, all_fruit_images, labs] = fruitPreprocessing(image_dir_path)
%This function loads in each zip file of fruit images to preprocess
% and outputs each train and test labels as an augmentedImage.

fprintf('\n\nBeginning Image Preprocessing...');

%% Load In and Unpack All Images
all_fruit_paths = dir(image_dir_path);

% Remove directory listings
all_fruit_paths = all_fruit_paths([all_fruit_paths(:).isdir] == 1);
all_fruit_paths = all_fruit_paths(~ismember({all_fruit_paths(:).name}, {'.', '..'}));

all_subcategory_paths = {length(all_fruit_paths)};
all_fruit_images = {length(all_fruit_paths)};

fprintf('\n\nAll Paths Successfully Loaded In...');

for i = 1:length(all_fruit_paths)
    fprintf('\n\nGetting Fruit Path %d', i);
    
    all_subcategory_paths{i} = [all_fruit_paths(i).folder() '/' all_fruit_paths(i).name()];
    all_fruit_images{i} = dir([all_subcategory_paths{i} '/*.jpg']); 
   
    % Resize Images to Match Pretrained Network Input Size
    imds{i} = imageDatastore(all_subcategory_paths{i}, 'IncludeSubfolders', true, ...
       'LabelSource', 'foldernames');
    [imdsTrain, imdsTest] = splitEachLabel(imds{i}, 0.7, 'randomized'); % 70 percent data set for training set
    
    % Return imds subfolder labels as labs
    labs{i} = imds{i}.Labels;
end


fprintf('\n\nSuccessfully Finished Fruit Image Preprocessing for %d Fruit Subcategories', i);
end
 