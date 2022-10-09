\hfill\break
1. Create a vector using : operator
a. Seq from -5 to 5.
```{r, error = TRUE}
x <- -5:5
x
```

b. x <- 1:7. What will be the value of x?
```{r, error = TRUE}
x <- 1:7.
x
```

\hfill\break
2.* Create a vector using seq() function
a. seq(1, 3, by=0.2) specify step size
```{r, error = TRUE}
num <- seq(1, 3, 0.2)
num
```

\hfill\break
3. A factory has a census of its workers. There are 50 workers in total. The following list shows their ages:

```{r, error = TRUE}
age<-c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27,
         22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
         24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
         18)
age 
#a. Access 3rd element, what is the value?
age[3]
#b. Access 2nd and 4th element, what are the values?
age[2]
age[4]
#c. Access all but the 1st element is not included
age[2:50]
```

\hfill\break
4. *Create a vector x <- c("first"=3, "second"=0, "third"=9). Then named the vector,names(x).
a. Print the results. Then access x[c("first", "third")].

```{r, error = TRUE}
x <- c("first"=3, "second"=0, "third"=9)
x
x[c("first", "third")]
x
```

\hfill\break
5 create a sequence x from -3:2.
a. Modify 2nd element and change it to 0;

```{r, error = TRUE}
x <- seq(-3:2)
x[2] <- 0
x
```

\hfill\break
6 a. Create a data frame for month, price per liter (php) and purchase quantity (liter).

```{r, error = TRUE}
data_frame <- data.frame(Month =c("price_per_liter_php", "purchase_quantity_liter"),
Jan = c("52.50","25"),Feb = c("57.25","30"),March = c("60.00","40"),Apr = c("65.00","50"),May = c("74.25","10"),June = c("54.00","45"))
data_frame
```

b. What is the average fuel expenditure of Mr. Cruz from Jan to June? Note: Use
weighted.mean(liter, purchase)

```{r, error = TRUE}
price_per_liter_php <- c(52.50, 57.25, 60.00, 65.00, 74.25, 54.00)
price_per_liter_php
purchase_quantity_liter <- c(25, 30, 40, 50, 10, 45)
purchase_quantity_liter
weighted.mean(price_per_liter_php, purchase_quantity_liter )
```

\hfill\break
7. a. Type “rivers” in your R console. Create a vector data with 7
elements, containing the number of elements (length) in rivers,
their sum (sum), mean (mean), median (median), variance (var)
standard deviation (sd), minimum (min) and maximum (max).

```{r, error = TRUE}
data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data
```

b. What are the results?

\hfill\break
8. The table below gives the 25 most powerful celebrities and their annual pay as ranked
by the editions of Forbes magazine and as listed on the Forbes.com website.

a. Create vectors according to the above table. Write the codes
8.a

```{r, error = TRUE}
power <- 1:25
celebrities <- c("Tom Cruise", "Rolling Stones", "Oprah Winfrey", "U2", 
               "Tiger Woods", "Steven Spielberg", "Howard Stern", "50 Cent", "Cast of the sopranos",
               "Dan Brown", "Bruce Springsteen", "Donald Trump", "Muhammad Ali", "Paul McCartney",
               "George Lucas", "Elton John", "David Letterman", "Phil Mickelson", "J.K Rowling",
               "Bradd Pitt", "Peter Jackson", "Dr. Phil McGraw", "Jay Lenon", "Celine Dion", "Kobe Bryant")
x<- c(67, 90, 225, 110, 90, 332, 302, 41, 52, 88, 55, 44, 55, 40,
         233, 34, 40, 47, 75, 25, 39, 45, 32, 40, 31)

Data_Ranking <- data.frame(power, celebrities, x)
Data_Ranking

#b. Modify the power ranking and pay of J.K. Rowling. Change power ranking to 15 and pay to 90.

power [19]<-15
power

x [19] <-90
x

Magazine_Rank <- data.frame(power, celebrities, x)
Magazine_Rank
```