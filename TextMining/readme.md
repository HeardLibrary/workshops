#Getting Started with Text Mining in R

##Prerequisites

In this talk, I am using [R]( https://www.r-project.org/) version 3.1.3 (2015-03-09) -- "Smooth Sidewalk" for my examples. Any recent version of R should also be fine. We'll be using Revision 1345 of the [tm Package](http://tm.r-forge.r-project.org/).

```R
library("tm")
```
##Getting Textual Data

```R
setwd("/Users/Clifford/Desktop/19cTexts")
```

##Generating a Corpus 

```R
corpus <- Corpus(DirSource("1800-09"))
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
clean <- tm_map(corpus, content_transformer(tolower))
```

```R
clean <- tm_map(clean, removeNumbers)
```

```R
clean <- tm_map(clean, removePunctuation)
```

```R
clean <- tm_map(clean, removeWords, stopwords("english"))
```

```R
writeCorpus(corpus, path = "./corpus", filenames = DublinCore(corpus)$identifier)
```

##Exploring a Term Document Matrix

```R
tdm <- TermDocumentMatrix(clean)
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


##Visualizing Textual Data

##Next Steps
