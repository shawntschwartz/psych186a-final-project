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
ml_lee_data <- read.csv(file = "_csvs/6PCA_Lee_Regression.csv", header = TRUE, sep = ",")
ml_lee_data_avg <- read.csv(file = "_csvs/6PCA_Lee_Regression_Avg.csv", header = TRUE, sep = ",")

# Linear Regression Models
ml_x_lee_x_lm <- lm(ml_lee_data$ML.PC1 ~ ml_lee_data$Lee.2005.X)
ml_x_lee_x_lm_summary <- capture.output(print(summary(ml_x_lee_x_lm)))
writeLines(ml_x_lee_x_lm_summary, con = file("_stats/MachineLearningX-vs-MichaelLeeX.txt"))
plot(ml_lee_data$Lee.2005.X, ml_lee_data$ML.PC1)

ggplot(ml_lee_data, aes(Lee.2005.X, ML.PC1)) +
  geom_point() +
  geom_text(aes(label = ml_lee_data$Fruit), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) X", y = "ML PC1")


#AVG POINTS

ml_x_lee_x_lm_avg <- lm(ml_lee_data_avg$ML.PC1 ~ ml_lee_data_avg$Lee.2005.X)
ml_x_lee_x_lm_avg_summary <- capture.output(print(summary(ml_x_lee_x_lm_avg)))
writeLines(ml_x_lee_x_lm_avg_summary, con = file("_stats/MachineLearningX-vs-MichaelLeeX-AVG.txt"))
plot(ml_lee_data_avg$Lee.2005.X, ml_lee_data_avg$ML.PC1)

ggplot(ml_lee_data_avg, aes(Lee.2005.X, ML.PC1)) +
  geom_point() +
  geom_text(aes(label = ml_lee_data_avg$Fruit), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) X", y = "ML PC1")
ggsave("_plots/MachineLearningX-vs-MichaelLeeX-AVG.png")

ml_y_lee_y_lm_avg <- lm(ml_lee_data_avg$ML.PC2 ~ ml_lee_data_avg$Lee.2005.Y)
ml_y_lee_y_lm_avg_summary <- capture.output(print(summary(ml_y_lee_y_lm_avg)))
writeLines(ml_y_lee_y_lm_avg_summary, con = file("_stats/MachineLearningY-vs-MichaelLeeY-AVG.txt"))
plot(ml_lee_data_avg$Lee.2005.Y, ml_lee_data_avg$ML.PC2)

ggplot(ml_lee_data_avg, aes(Lee.2005.Y, ML.PC2)) +
  geom_point() +
  geom_text(aes(label = ml_lee_data_avg$Fruit), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) Y", y = "ML PC2")
ggsave("_plots/MachineLearningY-vs-MichaelLeeY-AVG.png")

ml_x_lee_y_lm_avg <- lm(ml_lee_data_avg$ML.PC1 ~ ml_lee_data_avg$Lee.2005.Y)
ml_x_lee_y_lm_avg_summary <- capture.output(print(summary(ml_x_lee_y_lm_avg)))
writeLines(ml_x_lee_y_lm_avg_summary, con = file("_stats/MachineLearningX-vs-MichaelLeeY-AVG.txt"))
plot(ml_lee_data_avg$Lee.2005.Y, ml_lee_data_avg$ML.PC1)

ggplot(ml_lee_data_avg, aes(Lee.2005.Y, ML.PC1)) +
  geom_point() +
  geom_text(aes(label = ml_lee_data_avg$Fruit), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) Y", y = "ML PC1")
ggsave("_plots/MachineLearningX-vs-MichaelLeeY-AVG.png")

ml_y_lee_x_lm_avg <- lm(ml_lee_data_avg$ML.PC2 ~ ml_lee_data_avg$Lee.2005.X)
ml_y_lee_x_lm_avg_summary <- capture.output(print(summary(ml_y_lee_x_lm_avg)))
writeLines(ml_y_lee_x_lm_avg_summary, con = file("_stats/MachineLearningY-vs-MichaelLeeX-AVG.txt"))
plot(ml_lee_data_avg$Lee.2005.X, ml_lee_data_avg$ML.PC2)

ggplot(ml_lee_data_avg, aes(Lee.2005.X, ML.PC2)) +
  geom_point() +
  geom_text(aes(label = ml_lee_data_avg$Fruit), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) X", y = "ML PC2")
ggsave("_plots/MachineLearningY-vs-MichaelLeeX-AVG.png")
