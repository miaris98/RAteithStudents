


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
selected <- filter(Data,Data$year==2018 & Data$exam=="S1"&Data$course=="C4")


View(selected)
#===================================summary gives me the info that i need=========#
Summary_Of_Students_In_2018_S1_C4<-summary(selected)

Data_Frame_of_Summary<-as.data.frame.matrix(Summary_Of_Students_In_2018_S1_C4)#converting to dataframe so i can use pull function(Note : it returns vectors) 

grade_of_that_exam<-pull(Data_Frame_of_Summary, var = -1)#i am getting the last column
View(grade_of_that_exam)
#=================================== cut function to convert numeric to factor using break in range ==========
Data_with_grade_bigger_than_5<-filter(Data,Data$grade>5)

Data_with_grade_bigger_than_5$d_grade <- cut(Data_with_grade_bigger_than_5$grade, breaks = c(5,6.25,7.5,8.75,10.1),include.lowest=TRUE,labels = c("medium","good","very good","excellent"), 
                      right = TRUE)

View(Data_with_grade_bigger_than_5)
#================================================================================================================

