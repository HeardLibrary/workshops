#Open Source Statistical Analysis with R

##Goals

R is an open source programming language for statistical analysis. In this session, we’ll show you how to get started with R. Learn how to load data into R and to plot simple graphs. We’ll also introduce you to RStudio, a free integrated development environment (IDE) for R. You won’t leave as an R expert, but you’ll learn enough to get started on your data analysis journey.

##Prerequisites

* Download the [R Programming Language](http://www.r-project.org/) in the version appropriate to your computer.
* Download the desktop version of [R Studio](http://www.rstudio.com/products/rstudio/)

##Why R?

* R is open source, meaning that you can get started today without any upfront costs
* R is widely-used both here at Vanderbilt and globally for data analysis
* R has [a package (usually multiple packages!)](http://cran.r-project.org/) for nearly every kind of analysis
* Using R fosters [reproducible research](http://christophergandrud.github.io/RepResR-RStudio/index.html)

##R is a *programming* Language

* R is a programming language, not a 'point-and-click' statistical application 
* RStudio provides a integrated development environment (IDE) for R, making its appearance more user-friendly 
* People use R in lots of different ways
  * from evaluating simple statistical functions in a [REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)
  * to developing interactive web applications with [Shiny](http://shiny.rstudio.com/)
* The combination of R & RStudio makes it possible to become production by learning a few functions and then develop expertise over time as necessary
  
##R Exercises

###[Average Heights and Weights for American Women](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/women.html)

This practice dataset of the average heights and weights for American women (ages 30-39) comes built in with the R programming language.

```R
# Load the ggplot2 graphing library
library(ggplot2)

# Assign the dataset to a variable
averages <- women

# explore the dataset
head(averages)
str(averages)
View(averages)

# plot the dataset
ggplot(averages, aes(x=height, y=weight)) + geom_point()

# plot the dataset with a trend line (linear regression)
ggplot(averages, aes(x=height, y=weight)) + geom_point() + stat_smooth(method = "lm")
```

###[Lower Secondary School Age Population in the USA](https://www.quandl.com/data/UN/UIS_LOWERSECONDARYSCHOOLAGEPOPULATION__ALLGENDERS_USA-Lower-Secondary-School-age-population-All-genders-United-States-of-America)

This dataset from the United Nations on [Quandl](https://www.quandl.com/) contains the population of all genders of middle school ("lower secondary school") kids in the United States.

```R
# Load the required libraries
library(RCurl)
library(ggplot2)

# Load the dataset directly from Quandl & read CSV into data.frame
csv <- rget("https://www.quandl.com/api/v1/datasets/UN/UIS_LOWERSECONDARYSCHOOLAGEPOPULATION__ALLGENDERS_USA.csv?auth_token=[TOKEN]")
kids <- read.csv(text = csv, header=T)

# Explore the dataset
head(kids
str(kids)
View(kids)

# Plot the dataset
ggplot(kids, aes(x=Year, y=Number)) + geom_point()

# Plot the dataset with cleaner x axis and title
gplot(kids, aes(x=Year, y=Number)) + geom_point() + theme(axis.text.x = element_text(angle = 90) + ggtitle("Lower Secondary School Age Population")
```

###[New Private Housing Units Authorized By Building Permit for Tennessee](https://www.quandl.com/data/FRED/TNBPPRIV-New-Private-Housing-Units-Authorized-By-Building-Permit-for-Tennessee)

This dataset from the Federal Reserve on [Quandl](https://www.quandl.com) contains data on new private housing units authorized by building permit for Tennessee.

```R
#Load required libraries
library(ggplot2)
library(RCurl)

# Get dataset directly from Quandl 
csv <- getURL("https://www.quandl.com/api/v1/datasets/FRED/TNBPPRIVSA.csv?auth_token=[TOKEN]")
permits <- read.csv(text = csv)

# Explore dataset
head(permits)
View(permits)
str(permits)

# Make a simple scatter plot
ggplot(permits, aes(x=Date, y=Value)) + geom_point()
 
# Edit the dates in the dataset using the strptime function
# Thanks to http://stackoverflow.com/questions/20967445/plotting-historical-data-with-missing-values/20969623#20969623
permits$Year <- strptime(as.character(permits$Date), "%Y-%m-%d")
permits$Year <- format(permits$Year, "%Y")

# Make another simple scatter plot
ggplot(permits, aes(x=Year, y=Value)) + geom_point()

# Switch to a boxplot
ggplot(permits, aes(x=Year, y=Value)) + geom_boxplot() + ggtitle("New Private Housing Units Authorized By Building Permit for Tennessee")
```

###[ARL Library Investment Index](http://www.arlstatistics.org/analytics)

###Next Steps with R
 
