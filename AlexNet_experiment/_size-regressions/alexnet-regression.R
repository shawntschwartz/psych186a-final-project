rm(list=ls())
library(pavo)
library(tidyverse)
library(ggplot2)
library(ggimage)
library(ggbiplot)

wd_path <- "~/Developer/Psych186A-Final-Project/AlexNet_experiment/"
setwd(wd_path)

alexnet_classifications <- read.csv(file = "y_test_coords.csv", header = FALSE, sep = ",")
fruit_sizes <- read.csv(file = "fruits.avgsizes.csv", header = TRUE, sep = ',')

names(alexnet_classifications)[1] <- "AlexNetX"
names(alexnet_classifications)[2] <- "AlexNetY"

x_reg <- lm(alexnet_classifications$AlexNetX ~ fruit_sizes$size.cm)
plot(fruit_sizes$size.cm, alexnet_classifications$AlexNetX)

ggplot(alexnet_classifications, aes(fruit_sizes$size.cm, alexnet_classifications$AlexNetX)) +
  geom_point() +
  geom_smooth(method = "lm")


y_reg <- lm(alexnet_classifications$AlexNetY ~ fruit_sizes$size.cm)
plot(fruit_sizes$size.cm, alexnet_classifications$AlexNetY)

ggplot(alexnet_classifications, aes(fruit_sizes$size.cm, alexnet_classifications$AlexNetY)) +
  geom_point() +
  geom_smooth(method = "lm")

summary(x_reg)
summary(y_reg)
summary(fruit_sizes)
