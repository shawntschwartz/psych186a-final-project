#
# By Shawn T. Schwartz, 2019
# <shawnschwartz@ucla.edu>
#

# Clear Workspace
rm(list=ls())

# Library Imports
library(tidyverse)
library(ggplot2)
library(dplyr)

# Setup Dir Paths
wd_path <- "~/Developer/Psych186A-Final-Project/AlexNet_experiment/_Kmeans/"
setwd(wd_path)
output_plots_dir <- "_plots/"
output_stats_dir <- "_stats/"

# Create Output Dirs
dir.create(file.path(wd_path, output_plots_dir), showWarnings = FALSE)
dir.create(file.path(wd_path, output_stats_dir), showWarnings = FALSE)

# Read in Data & Import PCA
kmeans_PCS <- read.csv(file = "_output/alexnet_kmeans_pcs.csv", header = TRUE, sep = ",")
cluster_ids <- read.csv(file = "_csvs/Kmeans_c_ids.csv", header = FALSE, sep = ",")
names(cluster_ids)[1] <- "Cluster.ID"
centroids <- read.csv(file = "_output/alexnet_kmeans_centroids.csv", header = TRUE, sep = ",")
unique_clusterids <- unique(cluster_ids$Cluster.ID)

# Plot PCS for Kmeans Clusters
Cluster <- as.factor(cluster_ids$Cluster.ID)
ggplot(kmeans_PCS, aes(PC1, PC2, col = Cluster)) +
  geom_point() +
  labs(x = "AlexNet PC1", y = "AlexNet PC2") +
  theme(legend.position="bottom", legend.box = "horizontal") +
  geom_point(mapping = aes(centroids$PC1.Centroid, centroids$PC2.Centroid, colour = factor(unique_clusterids)), shape=42, size=10, data = centroids)
  
ggsave("_plots/kmeans_alexnet_pcs.png")
