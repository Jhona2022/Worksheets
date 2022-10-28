data_iris <- data.frame(iris)
data_iris

Irisdata <- subset(data_iris, Species == 'setosa' )
Irisdata

lng <- iris$Sepal.Length[1:50]
lng

lng1 <- iris$Sepal.Width[1:50]
lng1 

lng2 <- iris$Petal.Length[1:50]
lng2

lng4 <- iris$Petal.Width[1:50]
lng4

mn <- c(lng, lng1, lng2, lng4 )
mn

# Total mean of each characteristics.
mean(mn)

# Mean of each characteristics of the species.
mean(lng)
mean(lng1)
mean(lng2)
mean(lng4)