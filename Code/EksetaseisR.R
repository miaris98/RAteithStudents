


rm(list=ls())

# load libraries
library(readxl)
# library(stringr)
library(dplyr)


# =====================================================================
#                               Import the data stringsAsFactors = FALSE,read.table(filname.txt, row.names=1),headers einai ta labels
# =====================================================================
Data <- read.csv(file ="Data.csv", fileEncoding = "UTF-8-BOM", sep=",")
View(Data)
levels(Data$course)
selected <- filter(Data,Data$year==2018 & Data$exam=="S1",Data$course=="C4")
View(selected)

