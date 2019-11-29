#1. Find some data on two variables that you would expect to be related to each other. 
#These data can come from your own research, your daily life, or the internet. 
#Enter those data into a text file or Excel and then save a text file, and write a script that loads this text file and produces a scatter plot of those two variables that includes a trend line.

library(ggplot2)
library(cowplot)
library(reshape2)

#the relationship between study hours and GPA:
Variable <- read.csv(file="Variables.csv", header = T, sep = ",")
head(Variable)
v <- ggplot(Variable, aes(x= StudyHours , y= GPA))+ 
  geom_point()+
  geom_smooth(method=lm)
v

#2. Given the data in “data.txt”. Write a script that generates two figures that sumamrize the data. 
#First, show a barplot of the means of the four populations.
#Second, show a scatter plot of all of the observations. 
#You may want to “jitter” the points (geom_jitter()) to make it easier to see all of the observations within a population in your scatter plot. 
#Alternatively, you could also try setting the alpha argument in geom_scatterplot() to 0.1. 
#Do the bar and scatter plots tell you different stories? Why?

data <- read.csv(file= "data.txt")

#First, show a barplot of the means of the four populations:
a <- ggplot(data, aes(x= region, y= observations))+ 
  geom_bar(stat = "summary", fun.y = "mean")+
  theme_classic()

a   #plot the barplot a  

#Second, show a scatter plot of all of the observations:
b <- ggplot(data, aes(x= region, y= observations))+
  geom_jitter()+
  geom_point(alpha=0.1)

b   #plot the scatterplot b

#Do the bar and scatter plots tell you different stories? Why?
#They did not show different stories, though they looked different.
#Bar plot only showed the mean values of each population, but scatter plots showed the entire observations of each population. Although their mean values were similar, as bar plot shown, each population showed different patterns of observation distribution, as scatter plot shown.  

