#Getting Started with Text Mining in R

##Prerequisites

In this talk, I am using [R]( https://www.r-project.org/) version 3.1.3 (2015-03-09) -- "Smooth Sidewalk" for my examples. Any recent version of R should also be fine. We'll be using Revision 1345 of the [tm Package](http://tm.r-forge.r-project.org/).

You'll need to load the following R packages to carry out the examples below.

```R
library(cluster)  
library(ggdendro)
library(ggplot2)
library(reshape2)
library(tm)
```

##Getting Textual Data

*Ted Underwood collected this data from Project Gutenberg. See his excellent introduction to text mining [Where to start with text mining](http://tedunderwood.com/2012/08/14/where-to-start-with-text-mining/) as well as his updated post titled [Seven ways humanists are using computers to understand text](http://tedunderwood.com/2015/06/04/seven-ways-humanists-are-using-computers-to-understand-text/).*

You may download the data for the corpus we'll be building here [here](https://dl.dropbox.com/u/4713959/JDH%20article/19cTexts.zip). You should unzip the files to a folder titled ```19cTexts``` on your Desktop.

```R
setwd("/Users/Clifford/Desktop/19cTexts")
```

##Creating a Corpus


```R
corpus <- Corpus(DirSource("1800-09"))
```

```R
corpus
```

```R
corpus[[2]]$content
```

```R
(corpus[[2]]$content)[5:15]
```

```R
corpus[[2]]$meta
```

```R
meta(corpus[[2]])
```

```R
DublinCore(corpus[[2]])
```

```R 
DublinCore(corpus[[2]], tag="title") <- strsplit(corpus[[1]]$content, '\t')[[2]][14]
```

##Cleaning a Corpus

```R
clean <- corpus[-1]
```

```R
inspect(corpus)
```

```R
inspect(corpus[1:3])
```

```R
(corpus[[3]])$meta
```

```R
(corpus[[3]])$content
```

```R
meta(corpus[[3]])
```

```R
DublinCore(corpus[[3]])
```

```R
DublinCore(corpus[[3]], "Title") <- "Address to the People of the United States on the Policy of Maintaining Permanent Navy"
```

```R
writeCorpus(corpus, path = "./corpus", filenames = DublinCore(corpus)$identifier)
```

##Transforming a Corpus

```R
getTransformations()
```

```txt
[1] "removeNumbers"     "removePunctuation" "removeWords"       "stemDocument"      "stripWhitespace"
```

```R
clean <- tm_map(clean, stripWhitespace)
```

```R
clean <- tm_map(clean, content_transformer(tolower))
```

```R
clean <- tm_map(clean, removeNumbers)
```

```R
clean <- tm_map(clean, removePunctuation)
```

```R
 clean <- tm_map(clean, content_transformer(gsub), pattern = 'new york', replacement = 'newyork')
```

```R
clean <- tm_map(clean, removeWords, stopwords("english"))
```

```R
stem  <- tm_map(clean, stemDocument, language = "english")  
```

```R
writeCorpus(corpus, path = "./corpus", filenames = DublinCore(corpus)$identifier)
```

##Exploring a Term Document Matrices

```R
tdm <- TermDocumentMatrix(clean)
```

```R
dtm <- DocumentTermMatrix(clean)
```

```R
inspect(DocumentTermMatrix(clean,list(dictionary = c("economy", "money", "finance", "debt", "income", "expenditures", "bonds", "stocks"))))
```

```R
findFreqTerms(tdm, 10000, Inf)
```

```R
findAssocs(tdm, "money", .85)
```

```txt
$money
    subsidy    merchant         pay      paying        sums       emden     packers        paid 
       0.93        0.91        0.91        0.91        0.91        0.90        0.90        0.90 
    trading     payment silkweavers   southwark      buying     coinage      coined     foreign 
       0.90        0.89        0.89        0.89        0.88        0.88        0.88        0.88 
 foreigners      london   merchants    purchase        sell     brokers    licences       ports 
       0.88        0.88        0.88        0.88        0.88        0.87        0.87        0.87 
 privileges  stipulated      truely     wherein     charter  commercial     enacted     england 
       0.87        0.87        0.87        0.87        0.86        0.86        0.86        0.86 
  exempting   exporting       faked       penny      prices    subjects    commerce       duely 
       0.86        0.86        0.86        0.86        0.86        0.86        0.85        0.85 
fishmongers     granted       later       naval   newcastle  poflefllon     selling thenceforth 
       0.85        0.85        0.85        0.85        0.85        0.85        0.85        0.85 
```

##Visualizing A Corpus

###Making a Heatmap

*This example is adapted slightly from [Text Mining the Complete Works of William Shakespeare](http://www.exegetic.biz/blog/2013/09/text-mining-the-complete-works-of-william-shakespeare/) by Andew Collier.*

```R
common <- removeSparseTerms(tdm, 0.005)
```

```R
common <- as.matrix(common)
common <- common[,-1]
```

```R
dense = melt(common, value.name = "count")
```

```R
g <- ggplot(dense, aes(x = Docs, y = Terms, fill = log(count)))
g <- g + geom_tile(colour = "grey")
g <- g + scale_fill_gradient(high="#114357" , low="#F29492")
g <- g +  theme(axis.text.x = element_text(angle = 90, hjust = 1))
g <- g + ggtitle("Heatmap of Term Frequency")
g
```

![Heatmap](http://i.imgur.com/pESrRzd.png)


###Clustering Similar Words

*This visualization is adapted slightly from [Basic Text Mining in R](https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html).*

```R
sparse <- removeSparseTerms(dtm, 0.01)
```

```R
d <- dist(t(sparse), method="euclidian")   
fit <- hclust(d=d, method="ward.D2")
```

```R
g <- ggplot(segment(ddata))
g <- g + geom_segment(aes(x = x, y = y, xend = xend, yend = yend))
g <- g + geom_text(data = ddata$labels, aes(x = x, y = y, label = label))
g <- g + coord_flip() 
g <- g + theme_dendro()
g <- g + ggtitle("Clusters of Most Frequent Terms")
g
```

![dendrogram](http://i.imgur.com/yfYTnQY.png)

##Next Steps
