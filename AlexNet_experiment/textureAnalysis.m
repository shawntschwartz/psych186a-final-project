%
% By Shawn T. Schwartz, 2019
% <shawnschwartz@ucla.edu>
%

%% Clean Up Workspace
clear all;
clc;
close all;
home;

%% Image Dir Path
images_path = '_combined-images';
main_img_dir_path = "/Users/shawn/Developer/Psych186A-Final-Project/AlexNet_experiment/_combined-images/";

%% Load In and Unpack All Images
all_fruit_paths = dir(images_path);

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
end

%% Read In and Resize All Images

% To Store Mean Texture Values of Fruit Subcategories
mean_subcat_textures = [];

for i = 1:length(all_fruit_images)
    for j = 1:length(all_fruit_images{i})
        cur_img = imread([all_fruit_images{i}(j).folder() '/' all_fruit_images{i}(j).name()]);
        cur_img = imresize(cur_img, [227 227]);
        
        % Perform Texturization
        filt_cur_img = rangefilt(cur_img);
        filt_cur_img_meanval = mean(mean(mean(filt_cur_img)));
        temp_mean_matrix_subcats(j,:) = filt_cur_img_meanval;
        
        fprintf('\nTextureized Image %d of Subcat %d', j, i);
    end
    
    mean_subcat_textures(i) = mean(temp_mean_matrix_subcats);
    fprintf('\n\nSuccessfully Recorded Mean Texture Value of Fruit Subcat %s \n', all_fruit_images{i}(j).folder());
    fruit_labels_ordered(i) = string(erase(all_fruit_images{i}(j).folder(), main_img_dir_path));
    clear temp_mean_matrix_subcats;
end

fprintf('\n\nSuccessfully Recorded All Mean Texture Values!\n\n');

% Transpose Matrices
mean_subcat_textures = mean_subcat_textures';
fruit_labels_ordered = fruit_labels_ordered';

% Append Fruit Labels to Texture Data
combined_output_data = horzcat(fruit_labels_ordered, mean_subcat_textures);

% Write to CSV
csvwrite('_output/texture_analyses_vals.csv', mean_subcat_textures);

% Save Output File
save('_output/texture_analyses.mat');