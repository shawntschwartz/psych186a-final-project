%% Setup Dir Path for Fruit Images
main_fruit_path = '_curated-fruit-images';

%% Run Fruit Image Preprocessing
[fruitFeaturesTrain, fruitFeauturesTest, all_fruit_images, labs] = ...
    fruitPreprocessing(main_fruit_path);

%% Run Fruit Image Classification and Feature Output Layers
[fruitFeaturesTrain, fruitFeauturesTest] = ...
    fruitClassification(fruitFeaturesTrain, fruitFeauturesTest, all_fruit_images);

%% Run Fruit Image Analyses
[fruitFeaturesTrainCollapsed, fruitFeauturesTestCollapsed] = ... 
    fruitAnalyses(fruitFeaturesTrain, fruitFeauturesTest, all_fruit_images);

%% Get Only Unique Fruit Sublabels
labs = unique(labs);

%% Save .mat File With Collaposed Fruit Image Feature Dimensions
saveFruitFeatures;