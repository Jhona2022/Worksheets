install.packages('twitteR')
install.packages("rtweet")
install.packages("dplyr")
install.packages("tm")
install.packages("tidytext")
install.packages("plotly")
install.packages("wordcloud")
install.packages("wordcloud2")
install.packages("RColorBrewer")
install.packages("magrittr")
install.packages("ggplot2")
install.packages("stringr")

library(twitteR)
library(rtweet)
library(dplyr)
library(tm)
library(plotly)
library(tidytext)
library(wordcloud)
library(wordcloud2)
library(RColorBrewer)
library(magrittr)
library(ggplot2)
library(stringr)

#
CONSUMER_SECRET <- "QIRfYugwmcPxAjR7Z05s1WJKDFMPE3pRiEtzsvFfkgFoFyIB8Z"
CONSUMER_KEY <- "MkIJjzJ0eqOgxPjlzA9tN86OB"
ACCESS_SECRET <- "KQmifcOdtw68DHwt0C2IRLKVbHvb43eJt2qcP9YNKhF5C"
ACCESS_TOKEN <- "1595764187086479361-gz2Gqb9wQcCQJriDGBBhO3AxalNMJi"

#
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#
trendTweets <- searchTwitter("BLACKPINK -filter:retweets",
                             n = 10000,
                             since = "2022-11-23",
                             until = "2022-11-30",
                             lang = "en", 
                             retryOnRateLimit = 120)
#
trendTweetsDF <- twListToDF(trendTweets)
class(trendTweetsDF)
names(trendTweetsDF)
View(trendTweetsDF)
head(trendTweetsDF)[1:5]
head(trendTweetsDF$text)[1:5]

save(trendTweetsDF,file = "trendingTweetsDF.Rdata")

load(file = "trendingTweetsDF.Rdata")

#
trendTweetsDF$text <- sapply(trendTweetsDF$text,function(x) iconv(x,to='UTF-8'))

load(file = "trendingTweetsDF.Rdata")
trendTweetsDF$text <- sapply(trendTweetsDF$text,function(x) iconv(enc2utf8(x), 
                                                                  sub="byte"))
head(trendTweetsDF$text)

tweetsDF <- trendTweetsDF %>%
  select(screenName,text,created,statusSource)

#saving file as Rdata
save(tweetsDF, file = "tweetsDF.Rdata")

#saving file as csv
write.csv(tweetsDF,file = "tweetsDF.csv")

#
tweetsDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

#
tweetsDF %<>% 
  mutate(Created_At_Round = created%>% 
           round(units = 'hours') %>% 
           as.POSIXct())

tweetsDF %>% pull(created) %>% min()

tweetsDF %>% pull(created) %>% max()

#
plt <- tweetsDF %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt %>% ggplotly()

#
ts_plot(tweetsDF, "hours") +
  labs(x = NULL, y = NULL,
       title = "Frequency of tweets with a #BLACKPINK hashtag",
       subtitle = paste0(format(min(tweetsDF$created), "%d %B %Y"), " to ", 
                         format(max(tweetsDF$created),"%d %B %Y")),
       caption = "Data collected from Twitter's REST API via twitteR") +
  theme_minimal()

#
ggplot(data = tweetsDF, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "pink", high = "black")

#
encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  #This looks unreliable...
    "facebook"
  }else {
    "others"
  }
}

tweetsDF$tweetSource = sapply(tweetsDF$statusSource, 
                              encodeSource)
#
tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#
ggplot(tweetsDF[tweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

#
dataDF <- data.frame(
  category = tweet_appSource$tweetSource,
  count = tweet_appSource$count
)

dataDF$fraction = dataDF$count / sum(dataDF$count)
dataDF$percentage = dataDF$count / sum(dataDF$count) * 100
dataDF$ymax = cumsum(dataDF$fraction)
dataDF$ymin = c(0, head(dataDF$ymax, n=-1))
dataDF$roundP = round(dataDF$percentage, digits = 2)

#plotting of category without values
ggplot(dataDF,aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, 
                  fill=category)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")

#
Source <- paste(dataDF$category, dataDF$roundP, "%")

ggplot(dataDF, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Source)) +
  geom_rect() +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")

#
tweet_appScreen <- tweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

namesCorpus <- Corpus(VectorSource(tweetsDF$screenName))  

#
pal <- brewer.pal(8, "Dark2")
pal <- pal[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

#
wordcloud(words = namesCorpus, scale=c(3,0.5),
          max.words=500,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal)

#
wordcloud2(data=tweet_appScreen, 
           size=0.8, 
           color='random-dark',
           shape = 'pentagon')

#
wordcloud2(data=tweet_appScreen,
           size=0.8,
           color = "random-light",
           backgroundColor = "grey")

