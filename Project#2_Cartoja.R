#Extract 10000 tweets from Twitter using twitteR package including retweets.
#Subset the retweets and the original tweets into a separate file
#Plot the retweets and the original tweets using bar graph in vertical manner.
#Include legends
#Extract 10000 tweets from Twitter using twitteR package including retweets.


library(wordcloud)
library(plotly)
library(tm)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(twitteR)

#SET-UP CREDENTIALS
CONSUMER_SECRET <- "QIRfYugwmcPxAjR7Z05s1WJKDFMPE3pRiEtzsvFfkgFoFyIB8Z"
CONSUMER_KEY <- "MkIJjzJ0eqOgxPjlzA9tN86OB"
ACCESS_SECRET <- "KQmifcOdtw68DHwt0C2IRLKVbHvb43eJt2qcP9YNKhF5C"
ACCESS_TOKEN <- "1595764187086479361-gz2Gqb9wQcCQJriDGBBhO3AxalNMJi"

#CONNECT TO TWITTER APP
setup_twitter_oauth(consumer_secret = CONSUMER_SECRET,
                    consumer_key = CONSUMER_KEY,
                    access_secret = ACCESS_SECRET,
                    access_token = ACCESS_TOKEN
)

#Get 10000 observations "excluding retweets.
trendTweets <- searchTwitter("BLACKPINK", 
                             n = 10000,
                             lang = "en",
                             since = "2022-11-23",
                             until = "2022-12-30",
                             retryOnRateLimit=120)

#twitter list to data frame
BLACKPINKDF <- twListToDF(trendTweets)

#Save and Load Data frame files
save(BLACKPINKDF, file = "BLACKPINKDF.Rdata")
load(file = "BLACKPINKDF.Rdata")

#Checking for missing values in data frame
sample_data <- sapply(BLACKPINKDF, function(x) sum(is.na(x)))
sample_data


#Subsetting using the dplyr() PACKAGE.
library(dplyr)
trendSubsetA <- BLACKPINKDF %>% select(text, screenName, created, isRetweet) %>% 
  filter(isRetweet == FALSE)

trendSubsetB <- BLACKPINKDF %>% select(text, screenName, created, isRetweet) %>% 
  filter(isRetweet == TRUE)   


#Grouping the data created. 
BLACKPINKDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

#
BLACKPINK_data <- BLACKPINKDF %>%  mutate(Created_At_Round = created %>%
                                            round(units = 'hours') %>% as.POSIXct())

BLACKPINKDF %>% pull(created) %>% min()

BLACKPINKDF %>% pull(created) %>% max()


#Plot the original tweets and the retweets using a bar graph in a vertical manner.
library(ggplot2)
ggplot(data = trendSubsetA, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  xlab("Date") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "black", high = "pink")
theme(legend.position = "topleft")

#
library(ggplot2)
ggplot(data = trendSubsetB, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  xlab("Date") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "black", high = "pink")
theme(legend.position = "topleft")
