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
alexnet_classifications <- read.csv(file = "_csvs/y_test_combined_coords.csv", header = FALSE, sep = ",")
names(alexnet_classifications)[1] <- "Fruit.Labels"
names(alexnet_classifications)[2] <- "AlexNetX"
names(alexnet_classifications)[3] <- "AlexNetY"

alexnet_classifications_BW <- read.csv(file = "_csvs/y_test_combined_BW_coords.csv", header = FALSE, sep = ",")
names(alexnet_classifications_BW)[1] <- "Fruit.Labels"
names(alexnet_classifications_BW)[2] <- "AlexNetX"
names(alexnet_classifications_BW)[3] <- "AlexNetY"

textures <- read.csv(file = "_csvs/texture_analyses_vals.csv", header = FALSE, sep = ",")
names(textures)[1] <- "Fruit.Labels"
names(textures)[2] <- "Mean.Texture"

# arrange by order
alexnet_classifications <- arrange(alexnet_classifications, alexnet_classifications$Fruit.Labels)
alexnet_classifications_BW <- arrange(alexnet_classifications_BW, alexnet_classifications_BW$Fruit.Labels)
textures <- arrange(textures, textures$Fruit.Labels)

# Linear Regression Models
## AlexNet (Y) vs. Mean Texture Analysis Value
al_texture_lm <- lm(alexnet_classifications$AlexNetY ~ textures$Mean.Texture)
al_texture_lm_summary <- capture.output(print(summary(al_texture_lm)))
writeLines(al_texture_lm_summary, con = file("_stats/alexnetY-vs-Texture.txt"))
plot(textures$Mean.Texture, alexnet_classifications$AlexNetY)

ggplot(alexnet_classifications, aes(textures$Mean.Texture, alexnet_classifications$AlexNetY)) +
  geom_point() +
  geom_text(aes(label = alexnet_classifications$Fruit.Labels), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Mean Texture", y = "AlexNet Classification Reduced (Y)")

ggsave("_plots/alexnetY-vs-Texture.png")

## AlexNet (Y) Black & White Version vs. Mean Texture Analysis Value
albw_texture_lm <- lm(alexnet_classifications_BW$AlexNetY ~ textures$Mean.Texture)
albw_texture_lm_summary <- capture.output(print(summary(albw_texture_lm)))
writeLines(albw_texture_lm_summary, con = file("_stats/alexnetYBW-vs-Texture.txt"))
plot(textures$Mean.Texture, alexnet_classifications_BW$AlexNetY)

ggplot(alexnet_classifications_BW, aes(textures$Mean.Texture, alexnet_classifications_BW$AlexNetY)) +
  geom_point() +
  geom_text(aes(label = alexnet_classifications_BW$Fruit.Labels), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Mean Texture", y = "AlexNet Classification Reduced - BW (Y)")

ggsave("_plots/alexnetYBW-vs-Texture.png")

## AlexNet (X) vs. Mean Texture Analysis Value
al_texture_lm <- lm(alexnet_classifications$AlexNetX ~ textures$Mean.Texture)
al_texture_lm_summary <- capture.output(print(summary(al_texture_lm)))
writeLines(al_texture_lm_summary, con = file("_stats/alexnetX-vs-Texture.txt"))
plot(textures$Mean.Texture, alexnet_classifications$AlexNetX)

ggplot(alexnet_classifications, aes(textures$Mean.Texture, alexnet_classifications$AlexNetX)) +
  geom_point() +
  geom_text(aes(label = alexnet_classifications$Fruit.Labels), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Mean Texture", y = "AlexNet Classification Reduced (X)")

ggsave("_plots/alexnetX-vs-Texture.png")

## AlexNet (X) Black & White Version vs. Mean Texture Analysis Value
albw_texture_lm <- lm(alexnet_classifications_BW$AlexNetX ~ textures$Mean.Texture)
albw_texture_lm_summary <- capture.output(print(summary(albw_texture_lm)))
writeLines(albw_texture_lm_summary, con = file("_stats/alexnetXBW-vs-Texture.txt"))
plot(textures$Mean.Texture, alexnet_classifications_BW$AlexNetX)

ggplot(alexnet_classifications_BW, aes(textures$Mean.Texture, alexnet_classifications_BW$AlexNetX)) +
  geom_point() +
  geom_text(aes(label = alexnet_classifications_BW$Fruit.Labels), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Mean Texture", y = "AlexNet Classification Reduced - BW (X)")

ggsave("_plots/alexnetXBW-vs-Texture.png")
