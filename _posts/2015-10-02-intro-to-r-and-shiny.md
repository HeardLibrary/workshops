---
layout: post
title:  "Getting Started with R and Shiny"
date:   2015-10-02 11:00:00
categories: tech
description: "R is an open source programming language for statistical analysis. In this session, we’ll show you how to get started with R. We’ll introduce you to RStudio, a free integrated development environment (IDE) for R. You will learn how to load data into R and to plot simple graphs. We'll also demonstrate how to migrate your graphs to the web and make them interactive. You won’t leave as an R expert, but you’ll learn enough to get started on your data analysis journey."
---

##Goals

R is an open source programming language for statistical analysis. In this session, we’ll show you how to get started with R. We’ll introduce you to RStudio, a free integrated development environment (IDE) for R. You will learn how to load data into R and to plot simple graphs. We'll also demonstrate how to migrate your graphs to the web and make them interactive. You won’t leave as an R expert, but you’ll learn enough to get started on your data analysis journey.

##Prerequisites

* Download the [R Programming Language](http://www.r-project.org/) in the version appropriate to your computer.
* Download the desktop version of [R Studio](http://www.rstudio.com/products/rstudio/)
* Install the required packages from CRAN (the R code is below):
 * [ggplot2](http://cran.r-project.org/web/packages/ggplot2/index.html)
 * [leaflet](http://rstudio.github.io/leaflet/)
 * [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html)
 * [Shiny](https://cran.r-project.org/web/packages/shiny/index.html)

```R
install.packages("ggplot2")
library(ggplot2)

install.packages("leaflet")
library(leaflet)

install.packages("RCurl")
library(RCurl)

install.packages("Shiny")
library(Shiny)
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
csv <- getURL("https://www.quandl.com/api/v1/datasets/UN/UIS_LOWERSECONDARYSCHOOLAGEPOPULATION__ALLGENDERS_USA.csv")
kids <- read.csv(text = csv, header=T)

# Explore the dataset
head(kids
str(kids)
View(kids)

# Plot the dataset
ggplot(kids, aes(x=Year, y=Number)) + geom_point()

# Plot the dataset with cleaner x axis and title
ggplot(kids, aes(x=Year, y=Number)) + geom_point() + theme(axis.text.x = element_text(angle = 90)) + ggtitle("Lower Secondary School Age Population")
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

####Shiny Housing Starts

[Shiny](http://shiny.rstudio.com/) is a framework developed by [RStudio](https://www.rstudio.com/) for turning data analyses in R into interactive websites. Shiny allows you to port your code over to the web without having to know very much about HTML, CSS, Javascript or other web technologies. Shiny apps are divided into two parts: ```ui.R``` and ```server.R```. The first part contains the layout and the second the analysis.

In this example, the ```ui.R``` allows users to select a date range from a date menu picker.

```R
# ui.R

shinyUI(fluidPage(
  titlePanel("Housing Permits in Tennessee"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a date range."),
      
      dateRangeInput("daterange", "Date range:",
                     start  = "1988-01-01",
                     end    = "2015-07-01",
                     min    = "1988-01-01",
                     max    = "2015-07-01",
                     format = "mm/dd/yyyy",
                     startview = "year",
                     separator = " - ")
    ),
    
    mainPanel(plotOutput("plot"))
  )
))
```

Whenever a new date is selected, the ```server.r``` code will update the plot accordingly. This paradigm is termed 'reactive' programming because the server *reacts* to the user's selections in ```ui.r```.

```R
# server.R

#Load required libraries
library(ggplot2)
library(RCurl)

# Get dataset directly from Quandl 
csv <- getURL("https://www.quandl.com/api/v1/datasets/FRED/TNBPPRIVSA.csv")
permits <- read.csv(text = csv)

# Edit the dates in the dataset using the strptime function
# Thanks to http://stackoverflow.com/questions/20967445/plotting-historical-data-with-missing-values/20969623#20969623
permits$Year <- strptime(as.character(permits$Date), "%Y-%m-%d")
permits$Year <- format(permits$Year, "%Y")

permits$Date <- as.Date(permits$Date)

shinyServer(
  function(input, output) {
    
    output$plot <- renderPlot({
      minYear <- as.Date(input$daterange[1])
      maxYear <- as.Date(input$daterange[2])
      permits <- subset(permits, Date >= minYear & Date <= maxYear)
      ggplot(permits, aes(x=Year, y=Value)) + geom_boxplot() + ggtitle("New Private Housing Units Authorized By Building Permit for Tennessee")    
    })
  }
)
```

Here's a screenshow the resulting [Shiny application](https://andersoncliffb.shinyapps.io/housing-starts-TN):

![Imgur](http://i.imgur.com/mrmYE0L.png)

###[Mapping Stabucks Locations](https://opendata.socrata.com/Business/All-Starbucks-Locations-in-the-World-Point-Map/7sg8-44ed)

R doesn't just produce plots. You can produce all kinds of outputs with the appropriate packages. In this example, we use [leaflet](https://rstudio.github.io/leaflet/), an open source Javascript mapping library, to produce a map of Starbuck's locations in Tennessee.

```R
# Plot Starbuck locations in Tennessee on a map

library(leaflet)
library(RCurl)

# Data source: https://opendata.socrata.com/Business/All-Starbucks-Locations-in-the-World-Point-Map/7sg8-44ed
data <- getURL("https://opendata.socrata.com/api/views/7sg8-44ed/rows.csv?accessType=DOWNLOAD")
starbucks <- read.csv(text = data, header=TRUE)
starbuckstn <- subset(starbucks, Country.Subdivision == "TN")

# Create and display leaflet map
map <- leaflet()
map <- addTiles(map)
map  <- addMarkers(map, starbuckstn$Longitude, starbuckstn$Latitude, popup=starbuckstn$Name)
map
```

####Shiny Starbucks

But why strict ourselves to Tennessee? Wouldn't it be better to allow users to select their own location from a dropdown control? Here's a Shiny version of the code above, which permits users to display Starbuck's locations in their own regions.

```R
# ui.R

regions <- unique(as.vector(starbucks$Country.Subdivision))

shinyUI(fluidPage(
  titlePanel("Starbucks Locations"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a region from the list below."),

      selectInput("region", choices = regions, label = "Regions", selected="TN")
    ),
    
    mainPanel(leafletOutput("map"))
  )
))
```

Like all Shiny applications, the ```server.R``` code below will update the map according to the region selected by the user. As you'll note, we're storing the CSV locally in a folder called ```data``` in order to avoid sending too many requests to the website of the data provider.

```R
# server.R

#Load required libraries
library(leaflet)
library(RCurl)

# Get dataset from CSV 
starbucks <- read.csv("data/starbucks.csv", header=TRUE)

# Insantiate leaflet map
map <- leaflet()
map <- addTiles(map)

shinyServer(
  function(input, output) {
    
    output$map <- renderLeaflet({
      starbuckstn <- subset(starbucks, Country.Subdivision == input$region)
      map  <- addMarkers(map, starbuckstn$Longitude, starbuckstn$Latitude, popup=starbuckstn$Name)
      map    
    })
  }
)
```

Here's how your Shiny application winds up looking:

![Imgur](http://i.imgur.com/TqxSsi7.png)

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
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + ggtitle("ARL Salaries")

# Highlight Vanderbilt on the plot
# Thanks to http://stackoverflow.com/questions/14351608/color-one-point-and-add-an-annotation-in-ggplot2/14351684#14351684

# First, create a subset of the data with only vanderbilt
Vandy <- subset(arl, Institution == "VANDERBILT")
View(Vandy)

# Then, create a scatter plot with a highlighted point for Vanderbilt
ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + ggtitle("ARL Salaries") + xlab("All Staff") + ylab("Professional Salaries") + geom_point(data=Vandy, colour="red")

```

####Shiny ARL

A final example makes it possible for users to select their own institution as a basis of comparison.

```R
# ui.R

#Convert Data.Frame to Vector for display in selectInput
Institutions <- as.vector(arl$Institution)

shinyUI(fluidPage(
  titlePanel("ARL Salaries"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a library to highlight."),
      
      selectInput("var", 
                  label = "Choose a library",
                  choices = Institutions,
                  selected = "VANDERBILT")
    ),
    
    mainPanel(plotOutput("plot"))
  )
))
```

Note how we've divided up the code. We've placed most of the code outside the reactive context, meaning that it will only be called on loading the application, not everytime a user updates the plot.

```R
# server.R

library(ggplot2)
library(scales)

# Load dataset from CSV
arl <- read.csv("data/index13.csv", header=T, skip=1)

# Remove columns we do not want for our analysis
arl <- arl[,-c(1,2,3,4,5)]

# Remove row of extraneous data
arl <- arl[-116,]

# Changes names of columns for easier access 
names(arl)[c(1:5)] <- c("Institution", "Total", "Salaries", "Material", "Staff")

# Convert wages from factor (discrete variable) to numeric (continuous variable)
wages <- arl$Salaries
wages <- unlist(wages)
wages <- gsub(",","",wages)
wages <- as.numeric(wages)
arl$Wages <- wages

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      Vandy <- subset(arl, Institution == input$var)
      ggplot(arl, aes(x=Staff, y=Wages)) + geom_point() + stat_smooth(method="lm") + scale_y_continuous(labels = comma) + ggtitle("ARL Salaries") + xlab("All Staff") + ylab("Professional Salaries") + geom_point(data=Vandy, colour="red", size = 5)      
    })
  }
)
```

###Next Steps with R

* Sign up for the [Free Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) on [DataCamp](https://www.datacamp.com)
* Read a good book on R. 
 * Gentle introduction: [R for Dummies](http://www.amazon.com/R-For-Dummies-Andrie-Vries/dp/1119962846/ref=cm_cr_pr_product_top) by Andrie de Vries
 * Graphing in R (with ggplot2): [R Graphics Cookbook](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956) by Winston Chang
 * Take the Shiny tutorial at RStudio: [Shiny Tutorial](http://shiny.rstudio.com/tutorial/)
 * R as a programming language: [The Art of R Programming](http://www.nostarch.com/artofr.htm) by Norman Matloff
* Consider pursuing the [Data Science specialization](https://www.coursera.org/specialization/jhudatascience/1) on Coursera.
