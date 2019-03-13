%% Clean Up Workspace
clear all;
clc;
close all;
home;

%% Load In Datasets
load('_output/classified_fruit_data.mat'); % using fruitFeaturesTest
%ML_Classifications = csvread('_output/processed_exported_image_feature_list.csv');

%% Clean Up fruitFeaturesTest Into Matrix

fruit_features_alexnet = {};

for i = 1:length(fruitFeaturesTest)
    for j = 1:length(fruitFeaturesTest{i})
        fruit_features_alexnet{i}(j,:) = fruitFeaturesTest{i}{j};
    end
end
        

%% Calculate Kmeans Clustering

% Clustering Rationale:
% Fruit Subfamilies (referrenced by biological categories):
% 1) Pomes
% 2) Drupes
% 3) Berries
% 4) Melons
% 5) Citrus
% 6) Tropical

desired_clusts = 6;
    
fruitNet_Kmeans = {};
fruitNet_centroids = {};

for i = 1:length(fruit_features_alexnet)
    [fruitNet_Kmeans{i}, fruitNet_centroids{i}] = kmeans(fruit_features_alexnet{i},desired_clusts);
end

%% Clean Up Datasets

fruitalex = [];
for i = 1:length(fruit_features_alexnet)
   fruitalex = [fruitalex; fruit_features_alexnet{i}];
end

fruit_test = fruitalex;

%% Output Kmeans Data For Plots

csvwrite('_Kmeans/_csvs/Kmeans_coords.csv', fruit_test);

cluster_ids = [];
centroids = [];
for i = 1:length(fruitNet_Kmeans)
    cluster_ids = [cluster_ids; fruitNet_Kmeans{i}];
    centroids = [centroids fruitNet_centroids{i}];
end

csvwrite('_Kmeans/_csvs/Kmeans_c_ids.csv', cluster_ids);
csvwrite('_Kmeans/_csvs/Kmeans_centroids.csv', centroids);

fprintf('Kmeans clustering on AlexNet successfully completed and stored!\n');