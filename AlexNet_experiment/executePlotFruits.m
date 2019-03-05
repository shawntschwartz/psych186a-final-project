%% Clean Up Workspace
clc;
clear all;
close all;

%% SET PARAMETERS HERE
output_dir_path = '_output/';
features_data_name = 'classified_fruit_data.mat';

% Set to (1) if on a MAC and to (0) if on a PC/Windows
IS_RUNNING_ON_MAC = 0;

%% EXECUTE plotFruits.m
plotFruits;