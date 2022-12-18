#Basic Statistics

install.packages("Hmisc")
install.packages("pastecs")

#1. Create a data frame for the table below 

Student <- seq(1:10)
PreTest <- c(55,54,47,57,51,61,57,54,63,58)
PostTest <- c(61,60,56,63,56,63,59,56,62,61)

dataA <- data.frame(Student,PreTest,PostTest)
dataA


#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).
#Write the codes and its result.

library(Hmisc)
library(pastecs)

A <- describe(dataA)

A <- stat.desc(dataA)


#2. The Department of Agriculture was studying the effects of several levels of a fertilizer on the growth of a plant. 
#For some analyses, it might be useful to convertthe fertilizer levels to an ordered factor.

#a. Write the codes and describe the result.
fertilizers <- c(10,10,10,20,20,50,10,
                20,10,50,20,50,20,10)
fertilizers

data <- factor(fertilizers)
data

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense

Subs <- c("l","n","n","i","l","l","n","n","i","l")
Subs

#a. What is the best way to represent this in R?
#Answer: By factor

data <- factor(Subs)
data

data1 = levels(data) =c("none","light","intense")
data1


#4. Sample of 30 tax accountants from all the states and territories of Australia and
#their individual state of origin is specified by a character vector of state mnemonicsas:
  
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
             "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
             "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
             "vic", "vic", "act")
state


#a. Apply the factor function and factor level. Describe the results.

#Answer:  categorize the data and display the factor's values
data_state <- factor(state)
data_state

levels(data_state)


#5. From #4 - continuation:

#Suppose we have the incomes of the same tax accountants in another vector (in
#suitably large units of money)

incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
              62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
              65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)
incomes


#a. Calculate the sample mean income for each state we can now use the special
#function tapply():
incomes_means <- tapply(incomes, data_state, mean)
incomes_means

#b. Copy the results and interpret.

#act      nsw       nt      qld       sa      tas      vic       wa 
#44.50000 57.33333 55.50000 53.60000 55.00000 60.50000 56.00000 52.25000 

#Intepretation: It gives the mean of each group 


#6. Calculate the standard errors of the state income means (refer again to number 3)
stdError <- function(x) sqrt(var(x)/length(x))

#Note: After this assignment, the standard errors are calculated by:
incster <- tapply(incomes, state, stdError)

stdError <- function(x) sqrt(var(x)/length(x))

incster <- tapply(Subs, data, stdError)
incster


#a. What is the standard error? Write the codes.
      
incster <- tapply(Subs, data, stdError)
incster
     
#b. Interpret the result. 
#Interpretation: The result is NA because the data inside the object in #3 is a Character
   
   
#7. Use the titanic dataset.  
data("Titanic")

titanic_dataset <- data.frame(Titanic)
titanic_dataset


#a. subset the titanic dataset of those who survived and not survived. Show the codes and its result.

Titanicdata<- subset(titanic_dataset, select = "Survived")
Titanicdata
  

#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this
#chronological grouping of the data. You can create this dataset in Microsoft Excel.

#a. describe what is the dataset all about.
 #Description:The dataset is all about Breast cancer sample

#b.Import the data from MS Excel. Copy the codes.

getwd()

importData <- read.table("BreastCancer.xlsx-Sheet#1.csv", header = TRUE, sep=",")
importData


#c. Compute the descriptive statistics using different packages. Find the values of:

    c.1 Standard error of the mean for clump thickness.
    c.2 Coefficient of variability for Marginal Adhesion.
    c.3 Number of null values of Bare Nuclei.
    c.4 Mean and standard deviation for Bland Chromatin
    c.5 Confidence interval of the mean for Uniformity of Cell Shape


#c.1 Standard error of the mean for clump thickness.

stdError <- function(x) sqrt(var(x)/length(x))
stdError(importData)
data1 <-(importData$CL..thickness)
data1

data2 <- factor(data1)
data2

inc <- tapply(data1, data2, stdError)
inc

clump <- mean(data1)
clump


#c.2 Coefficient of variability for Marginal Adhesion.

CV <-sapply(importData, function(x) sd(x) / mean(x) * 100)
CV 

#c.3 Number of null values of Bare Nuclei.

NV <- (importData$Bare..Nuclei)
NV

num <-sum(NV %in% c(NA))
num

nn <-is.null(list(NV)) 
nn
  

#c.4 Mean and standard deviation for Bland Chromatin
ndata <- (importData$Bl..Cromatin)
ndata

BldChr <- mean(ndata)
BldChr

StdD <- sd(ndata)
StdD

#c.5 Confidence interval of the mean for Uniformity of Cell Shape

Calc_Mean <- mean(importData$Cell.Shape)
Calc_Mean

#d. How many attributes?

attr<-attributes(importData)
attr


#e. Find the percentage of respondents who are malignant. Interpret the results.
A1 <- (importData$Class)
A1

nrw <-nrow(importData)
nrw

pp <- sum(c(A1 == "malignant")/nrw*100)
pp


#9. Export the data abalone to the Microsoft excel file. Copy the codes.
install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")

data(abalone)
View(abalone)
head(abalone)
summary(abalone)


#Export Data abalone to xlsx
install.packages("readxl")
install.packages("xlsxjars")
install.packages("xlsx")

setwd
library(readxl)
library(xlsx)
write.xlsx(abalone,"Abalone.xlsx")


