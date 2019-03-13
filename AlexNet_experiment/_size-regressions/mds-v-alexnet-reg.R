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
alexnet_classifications <- read.csv(file = "_csvs/y_test_combined_coords_purged.csv", header = FALSE, sep = ",")
names(alexnet_classifications)[1] <- "Fruit.Labels"
names(alexnet_classifications)[2] <- "AlexNetX"
names(alexnet_classifications)[3] <- "AlexNetY"

michael_lee <- read.csv(file = "_csvs/mds_fruit2_coords.csv", header = FALSE, sep = ",")
names(michael_lee)[1] <- "Fruit.Labels"
names(michael_lee)[2] <- "MLMDSX"
names(michael_lee)[3] <- "MLMDSY"

# arrange by order
alexnet_classifications <- arrange(alexnet_classifications, alexnet_classifications$Fruit.Labels)
michael_lee <- arrange(michael_lee, michael_lee$Fruit.Labels)

# Linear Regression Models

## AlexNet vs Michael Lee
al_ml_reg <- lm(alexnet_classifications$AlexNetX ~ michael_lee$MLMDSX)
al_ml_reg_summary <- capture.output(print(summary(al_ml_reg)))
writeLines(al_ml_reg_summary, con = file("_stats/alexnetX-vs-MichaelLeeX.txt"))
plot(michael_lee$MLMDSX, alexnet_classifications$AlexNetX)

ggplot(alexnet_classifications, aes(michael_lee$MLMDSX, alexnet_classifications$AlexNetX)) +
  geom_point() +
  geom_text(aes(label = alexnet_classifications$Fruit.Labels), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) X", y = "AlexNet Classification Reduced (X)")

ggsave("_plots/alexnetX-vs-leeX.png")


al_ml_reg_y <- lm(alexnet_classifications$AlexNetY ~ michael_lee$MLMDSY)
al_ml_reg_y_summary <- capture.output(print(summary(al_ml_reg_y)))
writeLines(al_ml_reg_y_summary, con = file("_stats/alexnetY-vs-MichaelLeeY.txt"))
plot(michael_lee$MLMDSY, alexnet_classifications$AlexNetY)

ggplot(alexnet_classifications, aes(michael_lee$MLMDSY, alexnet_classifications$AlexNetX)) +
  geom_point() +
  geom_text(aes(label = alexnet_classifications$Fruit.Labels), hjust = 0.5, vjust = -0.5) +
  geom_smooth(method = "lm") +
  labs(x = "Lee (2005) Y", y = "AlexNet Classification Reduced (Y)")

ggsave("_plots/alexnetY-vs-leeY.png")


# Correlation Matrices
x_cor <- data.frame()
x_cor <- cbind(alexnet_classifications$AlexNetX, michael_lee$MLMDSX)

y_cor <- cbind(alexnet_classifications$AlexNetY, michael_lee$MLMDSY)

library(Hmisc)

x_cor_sum <- cor(x_cor, use="complete.obs", method="spearman") 
x_rcor_cor <- rcorr(x_cor, type = "spearman")

y_cor_sum <- cor(y_cor, use="complete.obs", method="spearman") 
y_rcor_cor <- rcorr(y_cor, type = "spearman")
