#Making Interactive Graphs with R

##Goals

R is an open source programming language for statistical analysis. In this session, we’ll show you how to get started with creating graphs in R. In particular, we'll demonstrate how to use two popular alternative to the base graphics utilities in R: [ggplot2](http://ggplot2.org/) and [ggvis](http://ggvis.rstudio.com/). We'll talk about how these packages compliment each other as well as how they differ conceptually.

##Prerequisites

* Download the [R Programming Language](http://www.r-project.org/) in the version appropriate to your computer.
* Download the desktop version of [R Studio](http://www.rstudio.com/products/rstudio/)
* Install the required packages (the code below is for our workshop laptops)

```R
install.packages("ggplot2")
library(ggplot2)

install.packages("RCurl")
library(RCurl)

install.packages("dplyr")
library(dplyr)

install.packages("ggvis")
library(ggvis)

install.packages("scales")
library(scales)

install.packages("readxl")
library(readxl)
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

We'll begin our explorations by rendering a simple graph with base graphics, ggplot2, and ggvis. This practice dataset of the average heights and weights for American women (ages 30-39) comes built in with the R programming language. Let's load the dataset into R and then explore it a little.

```R
# Assign the dataset to a variable
averages <- women

# explore the dataset
head(averages)
str(averages)
View(averages)
```

Now let's examine what how to make a scatter plot with this date using the built-in graphics package in R.

```R
attach(averages)
plot(weight, height, main="Average Heights and Weights of American Women", xlab="Weight", ylab="Height", pch=1)
```

We can also add a regression line to our plot by calling the `lines` function.

```R
lines(lowess(weight,height), col="blue")
```

The ggplot package allows us to produce the same graph, but provides a more consistent way to provide the data.

```R
# load ggplot 
library(ggplot2)

# plot the dataset
ggplot(averages, aes(x=weight, y=height)) + geom_point()

# plot the dataset with a trend line (linear regression)
ggplot(averages, aes(x=height, y=weight)) + geom_point() + stat_smooth(method = "lm")
```

Finally, here's the same plot with regression line using the ggvis package.

```R
# load ggvis and dplyr
library(ggvis)
library(dplyr)

# plot the dataset
averages %>%
  ggvis(~weight, ~height) %>% 
  layer_points() %>%
  layer_smooths()
```

You may reasonably ask, why are there essentially three different ways of producing the same scatter plot? We'll answer that question as we move forward with our examples.

###[ARL Library Investment Index](http://www.arlstatistics.org/analytics)

This dataset from the Association for Research Libraries (ARL) contains key information about academic library budgets and staffing. An Excel (XLS) file is available [here](http://www.arlstatistics.org/documents/ARLStats/index15.xls). Please download the file and save it somewhere accessible on your system.

```R
# Load required libraries
library(ggplot2)
library(readxl)
library(scales)

# Load dataset from the Excel file
arl <- read_excel(file.choose(), sheet="e15", skip=1)

# Explore dataset
head(arl)
str(arl)
View(arl)

# Remove columns we do not want for our analysis
arl <- arl[,-c(1,2,3,9,10,11,12,13,14)]
View(arl)

# Remove row of extraneous data
arl <- arl[-115,]
View(arl)

# Changes names of columns for easier access 
names(arl)[c(1:5)] <- c("Institution", "Total", "Salaries", "Material", "Staff")
View(arl)

# Create a simple scatter plot
ggplot(arl, aes(x=Staff, y=Salaries)) + geom_point()

# Create a simple scatter plot (with trend line)
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point()
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm")

# Make the Y axes less cluttered
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma)

# Add title
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + main("ARL Salaries")
```

Of course, we're really interested to see where Vanderbilt appears on this trend line. Let's add another layer to our plot to highlight Vanderbilt in red.

```R
# Highlight Vanderbilt on the plot
# Thanks to http://stackoverflow.com/questions/14351608/color-one-point-and-add-an-annotation-in-ggplot2/14351684#14351684

# First, create a subset of the data with only vanderbilt
Vandy <- subset(arl, Institution == "VANDERBILT")
View(Vandy)

# Then, create a scatter plot with a highlighted point for Vanderbilt
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + ggtitle("ARL Salaries") + xlab("All Staff") + ylab("Professional Salaries") + geom_point(data=Vandy, colour="red")

```

Wouldn't it be nice as a next step to mark out points interactively? Here's where ggvis comes to the fore. We can use ggivs to set up an identical version of our graph with a dropdown box to select the library we'd like to highlight. 

```R
library(dplyr)
library(ggvis)
library(scales)

# data available at http://www.arlstatistics.org/documents/ARLStats/index15.xls
arl <- read_excel(file.choose(), sheet="e15", skip=1)
arl <- arl[,-c(1,2,3,9,10,11,12,13,14)]
arl <- arl[-115,]

names(arl)[c(1:5)] <- c("Institution", "Total", "Salaries", "Material", "Staff")
institutions <- as.vector(unique(arl$Institution))

arl %>%
    ggvis(~Staff, ~Total) %>% 
    layer_points() %>%
    layer_model_predictions(model = "lm", se = TRUE) %>%
    filter(Institution %in% eval(input_select(institutions, selected = 1))) %>%
    layer_points(fill := "red") 
```



###Next Steps with R

* Sign up for the [Free Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) on [DataCamp](https://www.datacamp.com)
* Read a good book on R. 
 * Gentle introduction: [R for Dummies](http://www.amazon.com/R-For-Dummies-Andrie-Vries/dp/1119962846/ref=cm_cr_pr_product_top) by Andrie de Vries
 * Graphing in R (with ggplot2): [R Graphics Cookbook](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956) by Winston Chang
 * R as a programming language: [The Art of R Programming](http://www.nostarch.com/artofr.htm) by Norman Matloff
* Consider pursuing the [Data Science specialization](https://www.coursera.org/specialization/jhudatascience/1) on Coursera.
