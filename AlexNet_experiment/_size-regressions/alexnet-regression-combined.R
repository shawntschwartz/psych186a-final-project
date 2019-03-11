#
# Shawn Schwartz, 2019
# Psych 186A, UCLA Winter 2019
# 

# Clear Workspace
rm(list=ls())

# Library Imports
library(tidyverse)
library(ggplot2)
library(dplyr)

# Set Up Paths
wd_path <- "~/Developer/Psych186A-Final-Project/AlexNet_experiment/_size-regressions/"
setwd(wd_path)
output_plots_dir <- "_plots/"
output_stats_dir <- "_stats/"

dir.create(file.path(wd_path, output_plots_dir), showWarnings = FALSE)
dir.create(file.path(wd_path, output_stats_dir), showWarnings = FALSE)

# Read in CSVs
#alexnet_classifications <- read.csv(file = "_csvs/y_test_combined_coords_purged.csv", header = FALSE, sep = ",")
alexnet_classifications <- read.csv(file = "_csvs/y_test_combined_BW_coords_purged.csv", header = FALSE, sep = ",")
names(alexnet_classifications)[1] <- "FruitLabels"
names(alexnet_classifications)[2] <- "AlexNetX"
names(alexnet_classifications)[3] <- "AlexNetY"

fruit_sizes <- read.csv(file = "_csvs/fruits.avgsizes.csv", header = TRUE, sep = ",")
fruit_img_dims <- read.csv(file = "_csvs/fruit-img-dims.csv", header = TRUE, sep = ",")

# Linear Regression Models

  ### MEASURED FRUIT SIZES (FROM WEB)
  ## X-Coordinate AlexNet against Avg. Fruit Sizes (cm)
  x_reg <- lm(alexnet_classifications$AlexNetX ~ fruit_sizes$size.cm)
  x_reg_summary <- capture.output(print(summary(x_reg)))
  writeLines(x_reg_summary, con = file("_stats/alexnetX-vs-size-cm-stats.txt"))
  plot(fruit_sizes$size.cm, alexnet_classifications$AlexNetX)
  
  ggplot(alexnet_classifications, aes(fruit_sizes$size.cm, alexnet_classifications$AlexNetX)) +
    geom_point() +
    geom_text(aes(label = fruit_img_dims$Fruit), hjust = 0.5, vjust = -0.5) +
    geom_smooth(method = "lm") +
    labs(x = "Avg. Fruit Size (cm)", y = "AlexNet Classification Reduced (X)")
  
  ggsave("_plots/alexnetX-vs-size-cm.png")

  ## Y-Coordinate AlexNet against Avg. Fruit Sizes (cm)
  y_reg <- lm(alexnet_classifications$AlexNetY ~ fruit_sizes$size.cm)
  y_reg_summary <- capture.output(print(summary(y_reg)))
  writeLines(y_reg_summary, con = file("_stats/alexnetY-vs-size-cm-stats.txt"))
  plot(fruit_sizes$size.cm, alexnet_classifications$AlexNetY)

  ggplot(alexnet_classifications, aes(fruit_sizes$size.cm, alexnet_classifications$AlexNetY)) +
    geom_point() +
    geom_text(aes(label = fruit_img_dims$Fruit), hjust = 0.5, vjust = -0.5) +
    geom_smooth(method = "lm") +
    labs(x = "Avg. Fruit Size (cm)", y = "AlexNet Classification Reduced (Y)")
  
  ggsave("_plots/alexnetY-vs-size-cm.png")

  ## Linear Model Summary for AlexNet X/Y vs. Fruit Sizes (cm)
  fruit_sizes_summary <- capture.output(print(summary(fruit_sizes)))
  writeLines(fruit_sizes_summary, con = file("_stats/fruit_sizes-lm-stats.txt"))
  
  ### FRUIT IMAGE PROPORTIONS
  ## X-Coordinate AlexNet against Image WIDTH 
  x_width <- lm(alexnet_classifications$AlexNetX ~ fruit_img_dims$Width)
  x_width_summary <- capture.output(print(summary(x_width)))
  writeLines(x_width_summary, con = file("_stats/alexnetX-vs-img-width-stats.txt"))
  plot(fruit_img_dims$Width, alexnet_classifications$AlexNetX)
  
  ggplot(alexnet_classifications, aes(fruit_img_dims$Width, alexnet_classifications$AlexNetX)) +
    geom_point() +
    geom_text(aes(label = fruit_img_dims$Fruit), hjust = 0.5, vjust = -0.5) +
    geom_smooth(method = "lm") +
    labs(x = "Fruit Size on Image (Width)", y = "AlexNet Classification Reduced (X)")
  
  ggsave("_plots/alexnetX-vs-img-width.png")
  
  ## X-Coordinate AlexNet against Image HEIGHT 
  x_height <- lm(alexnet_classifications$AlexNetX ~ fruit_img_dims$Height)
  x_height_summary <- capture.output(print(summary(x_height)))
  writeLines(x_height_summary, con = file("_stats/alexnetX-vs-img-height-stats.txt"))
  plot(fruit_img_dims$Height, alexnet_classifications$AlexNetX)
  
  ggplot(alexnet_classifications, aes(fruit_img_dims$Height, alexnet_classifications$AlexNetX)) +
    geom_point() +
    geom_text(aes(label = fruit_img_dims$Fruit), hjust = 0.5, vjust = -0.5) +
    geom_smooth(method = "lm") +
    labs(x = "Fruit Size on Image (Height)", y = "AlexNet Classification Reduced (X)")
  
  ggsave("_plots/alexnetX-vs-img-height.png")
  
  ## Y-Coordinate AlexNet against Image WIDTH 
  y_width <- lm(alexnet_classifications$AlexNetY ~ fruit_img_dims$Width)
  y_width_summary <- capture.output(print(summary(y_width)))
  writeLines(y_width_summary, con = file("_stats/alexnetY-vs-img-width-stats.txt"))
  plot(fruit_img_dims$Width, alexnet_classifications$AlexNetY)
  
  ggplot(alexnet_classifications, aes(fruit_img_dims$Width, alexnet_classifications$AlexNetY)) +
    geom_point() +
    geom_text(aes(label = fruit_img_dims$Fruit), hjust = 0.5, vjust = -0.5) +
    geom_smooth(method = "lm") +
    labs(x = "Fruit Size on Image (Width)", y = "AlexNet Classification Reduced (Y)")
  
  ggsave("_plots/alexnetY-vs-img-width.png")
  
  ## Y-Coordinate AlexNet against Image HEIGHT 
  y_height <- lm(alexnet_classifications$AlexNetY ~ fruit_img_dims$Height)
  y_height_summary <- capture.output(print(summary(y_height)))
  writeLines(y_height_summary, con = file("_stats/alexnetY-vs-img-height-stats.txt"))
  plot(fruit_img_dims$Height, alexnet_classifications$AlexNetY)
  
  ggplot(alexnet_classifications, aes(fruit_img_dims$Height, alexnet_classifications$AlexNetY)) +
    geom_point() +
    geom_text(aes(label = fruit_img_dims$Fruit), hjust = 0.5, vjust = -0.5) +
    geom_smooth(method = "lm") +
    labs(x = "Fruit Size on Image (Height)", y = "AlexNet Classification Reduced (Y)")
  
  ggsave("_plots/alexnetY-vs-img-height.png")
  
  ## Linear Model Summary for AlexNet X/Y vs. Fruit Image Width/Height
  fruit_img_dims_summary <- capture.output(print(summary(fruit_img_dims)))
  writeLines(fruit_img_dims_summary, con = file("_stats/fruit_img_dims-lm-stats.txt"))
  