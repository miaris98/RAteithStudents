


rm(list=ls())

# load libraries
library(readxl)
library(dplyr)


# =====================================================================
#                               Import the data 
# =====================================================================
Data <- read.csv(file ="CSV/Data.csv", fileEncoding = "UTF-8-BOM", sep=",")#maybe u need to change the path to the file
View(Data)
levels(Data$course)
selected <- filter(Data,Data$year==2018 & Data$exam=="S1",Data$course=="C4")
View(selected)

