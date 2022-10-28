data_iris <- data.frame(iris)
data_iris

Newdata <- subset(data_iris, Species == 'versicolor')
Newdata

Verslng <- iris$Sepal.Length[51:100]
lng

Verslng1 <- iris$Sepal.Width[51:100]
lng1 

Verslng2 <- iris$Petal.Length[51:100]
lng2

Verslng4 <- iris$Petal.Width[51:100]
lng4

mn2 <- c(Verslng, Verslng1, Verslng2, Verslng4)
mn2

# Total mean of each characteristics.
mean(mn2)

# Mean of each characteristics of the species.
mean(Verslng)
mean(Verslng1)
mean(Verslng2)
mean(Verslng4)