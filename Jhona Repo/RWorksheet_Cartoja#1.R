age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37, 34, 19, 
         20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41, 51, 35, 24, 33, 41)
length(age)
rec_age
new_age <- c(age, 0, age)
new_age
sort(age)
min(age)
max(age)
data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3, 2.5, 2.3, 2.4, 2.7)
length(data)
data * 2
seq(1,100)
seq(20,60)
mean(20,60)
sum(51,91)
seq(1, 1000)
seq(1, 1000, 100)
Filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))
seq(100, 1)
num3 <- c(3, 6, 9, 12, 15, 18, 21, 24)
num5 <- c(5, 10, 15, 20, 25)
sum(num3)
sum(num5)
sum(num3, num5)
length(seq(100, 1))
length(num3)
{ x <- 0+ x + 5 + }
score <- c(72, 86, 92, 63, 88, 89, 91, 92, 75, 75, 77)
score[2]
score[3]
a = c(1,2,NA,4,NA,6,7)
print(a,na.print="-999")
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ") 
print(paste("My name is",name, "and I am",age ,"years old."))
print(R.version.string)

