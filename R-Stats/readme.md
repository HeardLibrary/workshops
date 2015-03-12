#Open Source Statistical Analysis with R

##Goals

R is an open source programming language for statistical analysis. In this session, we’ll show you how to get started with R. Learn how to load data into R and to plot simple graphs. We’ll also introduce you to RStudio, a free integrated development environment (IDE) for R. You won’t leave as an R expert, but you’ll learn enough to get started on your data analysis journey.

##Prerequisites

* Download the [R Programming Language](http://www.r-project.org/) in the version appropriate to your computer.
* Download the desktop version of [R Studio](http://www.rstudio.com/products/rstudio/)
* Install [ggplot2](http://cran.r-project.org/web/packages/ggplot2/index.html) and [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html) packages (the code below is for our workshop laptops)

```R
install.packages("ggplot2")
library("ggplot2", lib.loc = "~/R/win-library/3.1")

install.packages("RCurl")
library("RCurl", lib.loc = "~/R/win-library/3.1")
```

##Why R?

* R is open source, meaning that you can get started today without any upfront costs
* R is widely-used both here at Vanderbilt and globally for data analysis
* R has [a package (usually multiple packages!)](http://cran.r-project.org/) for nearly every kind of analysis
* Using R fosters [reproducible research](http://christophergandrud.github.io/RepResR-RStudio/index.html)

##R is a *Programming* Language

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
csv <- rget("https://www.quandl.com/api/v1/datasets/UN/UIS_LOWERSECONDARYSCHOOLAGEPOPULATION__ALLGENDERS_USA.csv")
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
csv <- getURL("https://www.quandl.com/api/v1/datasets/FRED/TNBPPRIVSA.csv")
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

This dataset from the Association for Research Libraries (ARL) contains key information about academic library budgets and staffing. An Excel (XLS) file is available [here](http://www.arlstatistics.org/documents/ARLStats/index13.xls), but we will be working with a converted CSV file on your desktop.

```R
# Load required libraries
library(ggplot2)
library(scales)

# Load dataset from CSV
arl <- read.csv(file.choose(), header=T, skip=1)

# Explore dataset
head(arl)
str(arl)
View(arl)

# Remove columns we do not want for our analysis
arl <- arl[,-c(1,2,3,4,5)]
View(arl)

# Remove row of extraneous data
arl <- arl[-116,]
View(arl)

# Changes names of columns for easier access 
names(arl)[c(1:5)] <- c("Institution", "Total", "Salaries", "Material", "Staff")
View(arl)

# Create a simple scatter plot
ggplot(arl, aes(x=Staff, y=Salaries)) + geom_point()

# Convert wages from factor (discrete variable) to numeric (continuous variable)
wages <- arl$Salaries
wages <- unlist(wages)
wages <- gsub(",","",wages)
wages <- as.numeric(wages)
arl$Wages <- wages

# Create a simple scatter plot (with trend line)
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point()
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm")

# Make the Y axes less cluttered
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma)

# Add title
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + main("ARL Salaries")

# Highlight Vanderbilt on the plot
# Thanks to http://stackoverflow.com/questions/14351608/color-one-point-and-add-an-annotation-in-ggplot2/14351684#14351684

# First, create a subset of the data with only vanderbilt
Vandy <- subset(arl, Institution == "VANDERBILT")
View(Vandy)

# Then, create a scatter plot with a highlighted point for Vanderbilt
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + ggtitle("ARL Salaries") + xlab("All Staff") + ylab("Professional Salaries") + geom_point(data=Vandy, colour="red")

```

###Next Steps with R

* Sign up for the [Free Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) on [DataCamp](https://www.datacamp.com)
* Read a good book on R. 
 * Gentle introduction: [R for Dummies](http://www.amazon.com/R-For-Dummies-Andrie-Vries/dp/1119962846/ref=cm_cr_pr_product_top) by Andrie de Vries
 * Graphing in R (with ggplot2): [R Graphics Cookbook](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956) by Winston Chang
 * R as a programming language: [The Art of R Programming](http://www.nostarch.com/artofr.htm) by Norman Matloff
* Consider pursuing the [Data Science specialization](https://www.coursera.org/specialization/jhudatascience/1) on Coursera.
