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

textures <- read.csv(file = "_csvs/texture_analyses_vals.csv", header = FALSE, sep = ",")
names(textures)[1] <- "Fruit.Labels"
names(textures)[2] <- "Mean.Texture"

# arrange by order
alexnet_classifications <- arrange(alexnet_classifications, alexnet_classifications$Fruit.Labels)
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
