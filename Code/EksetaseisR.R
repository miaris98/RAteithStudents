


rm(list=ls())
library(data.table)
# load libraries
library(readxl)
# library(stringr)
library(dplyr)
library(ISLR)


# =====================================================================
#                               Import the data 
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
#View(grade_of_that_exam)
#=================================== cut function to convert numeric to factor using break in range ==========
Data_with_grade_bigger_than_5<-filter(Data,Data$grade>5)

Data_with_grade_bigger_than_5$d_grade <- cut(Data_with_grade_bigger_than_5$grade, breaks = c(5,6.25,7.5,8.75,10.1),include.lowest=TRUE,labels = c("medium","good","very good","excellent"), 
                      right = TRUE)

#View(Data_with_grade_bigger_than_5)
#================================================================================================================metrw tous ba8mous >5 ana taksh kai diarw ana taksh me tous sunolikous ba8mous===
Data_with_varaiety_in_classes<-filter(Data,Data$year==2018 & Data$exam=="S1")
Data_with_varaiety_in_classes$d_grade <- cut(Data_with_varaiety_in_classes$grade, breaks = c(0,5,6.25,7.5,8.75,10.1),include.lowest=TRUE,labels = c("failed","medium","good","very good","excellent"), 
                   right = TRUE)
View(Data_with_varaiety_in_classes)

#===Failed attempts====
#count_row_if(Data_with_varaiety_in_classes$d_grade>5)
#table(Data_with_varaiety_in_classes)


#aggregate(x = Data_with_varaiety_in_classes$d_grade,
#          by = list(Data_with_varaiety_in_classes$course),
#          FUN=sum)
#====================================
table_data<-tbl_df(Data_with_varaiety_in_classes)#convert dataframe to table
View(table_data)
#effective group by using %>% which it does "pipe/merge" functions together
results<-table_data %>%
  group_by(course)%>%
  summarize(percentage_passed = sum(grade>5, na.rm = TRUE)/sum(grade,na.rm = TRUE)*100)
View(results)
