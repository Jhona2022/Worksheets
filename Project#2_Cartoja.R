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


#Tweets

#Subsetting using the dplyr() PACKAGE.
BLACKPINK_tweets <- BLACKPINKDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
  save(BLACKPINK_tweets, file = "BLACKPINK_tweetsF.Rdata")
  load(file = "BLACKPINK_tweets.Rdata")

  
#Grouping the data created. 
tweetsDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

#
BLACKPINK_data <- tweetsDF %>%  mutate(Created_At_Round = created %>%
                     round(units = 'hours') %>% as.POSIXct())

#
BLACKPINKDF %>% pull(created) %>% min()

BLACKPINKDF %>% pull(created) %>% max()

#Plot tweets using the library(plotly) and ggplot().
plt <- BLACKPINKDF %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt %>% ggplotly()

BLACKPINKData_plotting %>% ggplotly()


#Retweets

#Subsetting using the dplyr() PACKAGE.
BLACKPINK_tweets2 <- philippinesDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)


#Grouping the data created.
tweetsDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

#
BLACKPINK_data <- tweetsDF %>%  mutate(Created_At_Round = created %>%
                                         round(units = 'hours') %>% as.POSIXct())

#
BLACKPINKDF %>% pull(created) %>% min()

BLACKPINKDF %>% pull(created) %>% max()

#Plot Retweets using the library(plotly) and ggplot().
plt <- BLACKPINKDF %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt %>% ggplotly()

BLACKPINKData_plotting %>% ggplotly()

