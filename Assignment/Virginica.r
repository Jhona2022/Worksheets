data_iris<- data.frame(iris)
data_iris

New_data <- subset(data_iris, Species == 'virginica' )
New_data

Newlng <- iris$Sepal.Length[101:150]
Newlng

Newlng1 <- iris$Sepal.Width[101:150]
Newlng1 

Newlng2 <- iris$Petal.Length[101:150]
Newlng2

Newlng4 <- iris$Petal.Width[101:150]
Newlng4

mn3 <- c(Newlng, Newlng1, Newlng2, Newlng4)
mn3

# Total mean of each characteristics.
mean(mn3)

# Mean of each characteristics of the species.
mean(Newlng)
mean(Newlng1)
mean(Newlng2)
mean(Newlng4)
