library(ggplot2)
library(dplyr)

data(mpg_data)
as.data.frame(data(mpg))

data <- as.data.frame(mpg)
data

#1. How many columns are in mpg dataset? How about the number of rows? Show the codes and its result.
mpg_dataset <- glimpse(dataframe)


#2. Which manufacturer has the most models in this data set? Which model has the most variations?

manufacturer <- mpg_dataset %>% group_by(manufacturer,model) %>% count()
manufacturer

colnames(manufacturer) <- c("manufacturer", "model", "Counts")


#a. Group the manufacturers and find the unique models. Copy the codes and result.

unique_model <- mpg_dataset %>% group_by(manufacturer) %>%
  distinct(model) %>% count()
unique_model

colnames(unique_data)<-c("Manufacturer", "Unique Counts")

#b. Graph the result by using plot() and ggplot(). Write the codes and its result.

plot(manufacturer)

ggplot(ggplot(manufacturer, aes(Manufacturer, Model)) + geom_point(), aes(Manufacturer,Model)) + geom_point()

#3. Same dataset will be used. You are going to show the relationship of the model and the manufacturer.

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?

ggplot(dataframe, aes(model, manufacturer)) + geom_point()

#b. For you, is it useful? If not, how could you modify the data to make it more informative?

#4. Using the pipe (%>%), group the model and get the number of cars per model. Show codes and its result.

cars_per_model <- mpg_dataset %>% group_by(model) %>% count()
cars_per_model

colnames(cars_per_model) <- c("Model","Counts")
cars_per_model
#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show codes and its result.

qplot(model, data = dataframe,
      main = "Number of Cars per Model",
      xlab = "Model",
      ylab = "Number of Cars", geom = "bar", fill = manufacturer) + coord_flip()

#b. Use only the top 20 observations. Show code and results.

twenty <- cars_per_model[1:20,] %>% top_n(2)
twenty

ggplot(twenty, aes(x = Model, y = Counts)) +
  geom_bar(stat = "Identity") + coord_flip()

#5. Plot the relationship between cyl - number of cylinders and displ- engine displacement using geom_point with aesthetic colour = engine displacement.  
#Title should be “Relationship between No. of Cylinders and Engine Displacement”.

ggplot(data = mpg_dataset, mapping = aes(x = displ, y = cyl, 
                                      main = "Relationship between No of Cylinders
                                      and Engine Displacement")) +
  geom_point(mapping = aes(colour = "engine displacement"))

#b. How would you describe its relationship?


#6. Get the total number of observations for drv - type of drive train
#(f = front-wheel drive,r = rear wheel drive, 4 = 4wd) and class - type of class
#(Example: suv, 2seater, etc.). Plot using the geom_tile() where the number of observations for 
#class be used as a fill for aesthetics.

#a. Show the codes and its result for the narrative in #6.

ggplot(data = mpg_dataset, mapping = aes(x = drv, y = class)) +
  geom_tile(aes(fill = class))

#b. Interpret the result.


#7. Discuss the difference between these codes. Its outputs for each are shown below.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#8. Try to run the command ?mpg. What is the result of this command?

command <-? mpg
command


#a. Which variables from mpg dataset are categorical?


#b. Which are continuous variables?


#c. Plot the relationship between displ (engine displacement) and hwy(highway miles
#per gallon). Mapped it with a continuous variable you have identified in #5-b.What is its result? Why it produced such output?

ggplot(mpg, aes(x = cty, y = hwy, colour = displ)) + geom_point()

#9. Plot the relationship between displ (engine displacement) and hwy(highway miles 
#per gallon) using geom_point(). Add a trend line over the existing plot usinggeom_smooth() 
#with se = FALSE. Default method is “loess”.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(se = FALSE)

#10. Using the relationship of displ and hwy, add a trend line over existing plot.
#Set the se = FALSE to remove the confidence interval and method = lm to check for linear modeling.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point()+
  geom_smooth(se = FALSE, method = lm)