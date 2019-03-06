%% Setup Dir Path for Fruit Images
main_fruit_path = '_curated-fruit-images';

%% Run Fruit Image Preprocessing
[fruitFeaturesTest, all_fruit_images, labs] = ...
    fruitPreprocessing(main_fruit_path);

%% Run Fruit Image Classification and Feature Output Layers
[fruitFeaturesTest] = ...
    fruitClassification(fruitFeaturesTest, all_fruit_images);

%% Run Fruit Image Analyses
[fruitFeauturesTestCollapsed] = ... 
    fruitAnalyses(fruitFeaturesTest, all_fruit_images);

%% Get Only Unique Fruit Sublabels
for i = 1:length(labs)
   plot_labs(i,:) = labs{i}(1); 
end

%% Save .mat File With Collaposed Fruit Image Feature Dimensions
saveFruitFeatures;