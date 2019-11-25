
## Пивний датасет

```{r}
setwd("/Users/anymac/Documents/MyCode/R/BeerAnalysis_TimVerlaan_v02")
theData <- read.csv('beer_reviews.csv', header = T)
setwd("/Users/anymac/Documents/GitHub/ML_KMA")
```

##
```{r}
str(theData)

library(dplyr)

theData %>%
  group_by(review_profilename) %>%
  summarise(total = n()) %>%
  arrange(desc(total))
```

```{r}
train <- theData[theData$review_profilename == "akorsak",]
library(dplyr)
train1 <- train %>%
  transmute(review_mean = rowMeans(data.frame(train$review_aroma, 
                                              train$review_appearance,
                                              train$review_palate,
                                              train$review_taste)))
train1$review <- train$review_overall
train1
```

##

```{r}
tree <- rpart(review_overall ~ review_aroma + 
                review_appearance + 
                review_palate + 
                review_taste + 
                beer_abv , data = train, method = "class")

fancyRpartPlot(tree)
```

## Інший ревювер

```{r}
train <- theData[theData$review_profilename == "northyorksammy",]
tree <- rpart(review_overall ~ review_aroma + 
                review_appearance + 
                review_palate + 
                review_taste + 
                beer_abv + 
                beer_name + 
                beer_style, data = train, method = "class")
```

