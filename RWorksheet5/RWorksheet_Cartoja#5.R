# 1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.
enrollment <- data.frame("Course Year" = c ("1st", "2nd", "3rd", "4th"), " 2019–2020" = c(80, 75, 70, 60))
enrollment

# a. Plot the data using a bar graph. Write the codes and copy the result.
barplot_data <- c("1st" = 80, "2nd" = 75, "3rd" = 70, "4th" = 60)
barplot_data
barplot(barplot_data)


# b. Using the same table, label the barchart with Title = ” Enrollment of BS Computer Science" horizontal axis = “Curriculum Year” and vertical axis = “number of students”

barplot_tab <- c("1st" = 80 , "2nd" = 75, "3rd" = 70, "4th" = 60)
barplot_tab
barplot(barplot_tab, 
        main = "Enrollment of BS Computer Science", 
        xlab = "Curriculum Year", 
        ylab = "Number of Students")


# 2. The monthly income of De Jesus family was spent on the following: 60% on Food, 10% on electricity, 5% for savings, and 25% for other miscellaneous expenses.
# a. Create a table for the above scenario. Write the codes and its result.

matters <- c("Food", "Electricity", "Savings", "Miscellaneous_expenses")
spent <- c(60, 10, 5, 25)

monthly_data <- data.frame(
  matters,
  spent)

monthly_data
tab_data <- table(monthly_data)
tab_data

# b. Plot the data using a pie chart. Add labels, colors and legend. Write the codes and its result.
data_per <- round(spent/sum(spent) * 100, 1)
data_per <- paste(data_per,"%",sep = "")

data_pie <- pie(spent,
            main = "Month Data",
            col = rainbow(4),
            labels =  data_per, cex = 0.8)
data_pie
                
            legend(1.3,1.5, c("Food","Electricity","Savings","Miscellaneous expenses"),
                cex = 0.8,fill = (rainbow(4)))
                
# 3. Open the mtcars dataset
# a. Create a simple histogram specifically for mpg (miles per gallon) variable. Use $ to select the mpg only. Write the codes and its result.

data("mtcars")

data_mtcars <- (mtcars$mpg)
data_mtcars

hist(data_mtcars, breaks=12)
                
# b. Colored histogram with different number of bins. hist(mtcars$mpg, breaks=12, col="red") Note: breaks= controls the number of bins.
hist(data_mtcars, breaks=12, col="pink")
                
# c. Add a Normal Curve x <- mtcars$mpg h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon", main="Histogram with Normal Curve") xfit<-seq(min(x),max(x),length=40) yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) yfit <- yfit*diff(h$mids[1:2])*length(x) lines(xfit, yfit, col="blue", lwd=2) Copy the result.
data_curve <- data_mtcars
data_curve
                
data_hist <-hist(data_curve, breaks=10, col="pink", xlab="Miles Per Gallon",
main="Histogram with Normal Curve")

xfit<-seq(min(data_curve),max(data_curve),length=40)

yfit<-dnorm(xfit,mean=mean(data_curve),sd=sd(data_curve))                                 
yfit <- yfit*diff(data_hist$mids[1:2])*length(data_curve)

lines(xfit, yfit, col="red", lwd=2)
data_hist
                
# 4. Open the iris dataset. Create a subset for each species.
# a. Write the codes and its result.
data("iris")
data_iris <- data.frame(iris)
data_iris
                
data_setosa <- subset(data_iris, Species == 'setosa' )
data_setosa
                
data_versicolor <- subset(data_iris, Species == 'versicolor' )
data_versicolor
                
data_virginica <- subset(data_iris, Species == 'virginica' )
data_virginica
                
# b. Get the mean for every characteristics of each species using colMeans(). Write the codes and its result. Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])
setosa <- colMeans(data_setosa[sapply(data_setosa,is.numeric)])
setosa
                
versicolor <- colMeans(data_versicolor[sapply(data_versicolor,is.numeric)])
versicolor
                
virginica <- colMeans(data_virginica[sapply(data_virginica,is.numeric)])
virginica

#c.Combine all species by using rbind()
rbinddata_iris <- rbind(setosa, versicolor, virginica)
rbinddata_iris


#d. From the data in 4-c: Create the barplot().Write the codes and its result.The barplot should be like this.

barplot(height = as.matrix(rbinddata_iris),
        main = "Data Iris",
        xlab = "Characteristics",
        ylab = "Mean Scores", 
        beside =TRUE, 
        col = rainbow(3)
)
        
        