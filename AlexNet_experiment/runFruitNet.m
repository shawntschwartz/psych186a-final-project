%% Clean Up Workspace
clc;
clear all;
close all;

%% Parameter Settings
% Set "is_bw" to 1 images to be processed by AlexNet should be converted to
% grayscale. Otherwise, for COLOR PROCESSING, set to 0.
is_bw = 1;

%% Run Core Fruit Image Classification
coreFruitNet;