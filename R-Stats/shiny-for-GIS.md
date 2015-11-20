#Visualizing GIS Data with R and Shiny

##Goals

In this session, we will demonstrate how to visualize GIS data using R and Shiny.

##Prerequisites

* Download the [R Programming Language](http://www.r-project.org/) in the version appropriate to your computer.
* Download the desktop version of [R Studio](http://www.rstudio.com/products/rstudio/)
* Install the required packages from CRAN (the R code is below):
 * [ggplot2](http://cran.r-project.org/web/packages/ggplot2/index.html)
 * [leaflet](http://rstudio.github.io/leaflet/)
 * [library(REDCapR)](https://cran.r-project.org/web/packages/REDCapR/index.html)
 * [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html)
 * [Scales](https://cran.r-project.org/web/packages/scales/index.html)
 * [Shiny](https://cran.r-project.org/web/packages/shiny/index.html)

```R
install.packages("ggplot2")
library(ggplot2)

install.packages("leaflet")
library(leaflet)

install.packages("REDCapR")
library(REDCapR)

install.packages("RCurl")
library(RCurl)

install.packages("scales")
library(scales)

install.packages("shiny")
library(shiny)
```

##Why R?

* R is open source, meaning that you can get started today without any upfront costs
* R is widely-used both here at Vanderbilt and globally for data analysis
* R has [a package (usually multiple packages!)](http://cran.r-project.org/) for nearly every kind of analysis
* Using R fosters [reproducible research](http://christophergandrud.github.io/RepResR-RStudio/index.html)

##Why Shiny?

[Shiny](http://shiny.rstudio.com/) is a framework developed by [RStudio](https://www.rstudio.com/) for turning data analyses in R into interactive websites. Shiny allows you to port your code over to the web without having to know very much about HTML, CSS, Javascript or other web technologies. Shiny apps are generally divided into two parts: ```ui.R``` and ```server.R```. The first part contains the layout and the second the analysis. If you need to make code available to both ```ui.R``` and ```server.R```, you can also include a ```global.R``` file. 

##[Mapping Stabucks Locations](https://opendata.socrata.com/Business/All-Starbucks-Locations-in-the-World-Point-Map/7sg8-44ed)

In this example, we use [leaflet](https://rstudio.github.io/leaflet/), an open source Javascript mapping library, to produce a map of Starbuck's locations in Tennessee.

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

###Shiny Starbucks

But why strict ourselves to Tennessee? Wouldn't it be better to allow users to select their own location from a dropdown control? Here's a Shiny version of the code above, which permits users to display Starbuck's locations in their own regions.

We divide the code between the files this time. Note how we've divided things up. We've placed most of the code outside the reactive context in ```global.R```, meaning that it will only be called on loading the application, not everytime a user updates the plot. ```global.R``` puts our code in scope of both ```ui.R``` and ```server.R```.

```R
# global.R
# Code here is in scope to both ui.R and server.R

#Load required library
library(leaflet)

# Get dataset from CSV 
starbucks <- read.csv("data/starbucks.csv", header=TRUE)

# Create a vector of country subdivions (i.e. states in the U.S.)
regions <- unique(as.vector(starbucks$Country.Subdivision))

```

We then create a drop down list populated by the regions column of our data frame. Ideally, we'd clean up this list and make it more human readible.

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

##Visualizing REDCap GIS Data

In this example, we will visualize GIS information from REDCap on map. Again, we will be using the leaflet Javascript library, as helpfully made available to use in the ```leaflet``` package.  We will also be using the ```REDCapR``` package to connect to our REDCap survey through the REDCap API.

###REDCap Survey

First, we'll develop a REDCap survey to collect our data. The survey looks like this to our end users.

![REDCap Survey](http://i.imgur.com/TPUHBos.png)

###Using the REDCap API 

Next we'll connect to the data in our REDCap survey using the REDCap API. For this purpose, we use the REDCapR package to access the API.

```R
ds <- redcap_read(redcap_uri='https://redcap.vanderbilt.edu/api/', token='#######')$data
View(ds)
```

This package allows us to connect with REDCap, extract our data, and use it within our program. Our data should look something like what we see below.

![REDCap data](http://i.imgur.com/WYrFZCE.png)

###Mapping Our REDCap Data

```R
# global.R
# Code here is in scope to both ui.R and server.R

#Load required library
library(leaflet)
library(REDCapR)

# Get dataset from REDCap
fields <- c("record_id", "latitude", "longitude", "where", "object")
ds <- redcap_read_oneshot(redcap_uri='https://redcap.vanderbilt.edu/api/', token='###################', fields=fields)$data```
```

```R
# ui.R

shinyUI(fluidPage(
  titlePanel("REDCap Locations"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Here are the REDCap points from our Surveys. Take the survey with http://bit.ly/1QktxjB"),
      
      radioButtons("object_selection", "What kind of objects?:",
                   c("Campus Buildings" = 1,
                     "Public Art" = 2,
                     "Trees" = 3,
                     "Everything" = 4))
    ),
    
    mainPanel(leafletOutput("map"))
  )
))
```

```R
# server.R

# Instantiate leaflet map
map <- leaflet()
map <- setView(map, lng = -86.80, lat = 36.14, zoom = 14)
map <- addProviderTiles(map, "CartoDB.Positron")

shinyServer(
  function(input, output) {
    
    output$map <- renderLeaflet({
        if (input$object_selection==4) { points <- ds}        
        else {points <- subset(ds, object== input$object_selection)}
        map  <- addMarkers(map, points$longitude, points$latitude, popup=points$where)
        map    
    })
  }
)
```
Here's the result--an interactive map of the data that we've collected about places with our REDCap survey.

![REDCap Map](http://i.imgur.com/INjpKTe.png)

###Next Steps with R

* Sign up for the [Free Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) on [DataCamp](https://www.datacamp.com)
* Take the Shiny tutorial at RStudio: [Shiny Tutorial](http://shiny.rstudio.com/tutorial/)
* Read a good book on R. 
 * Gentle introduction: [R for Dummies](http://www.amazon.com/R-For-Dummies-Andrie-Vries/dp/1119962846/ref=cm_cr_pr_product_top) by Andrie de Vries
 * Graphing in R (with ggplot2): [R Graphics Cookbook](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956) by Winston Chang
 * R as a programming language: [The Art of R Programming](http://www.nostarch.com/artofr.htm) by Norman Matloff
* Consider pursuing the [Data Science specialization](https://www.coursera.org/specialization/jhudatascience/1) on Coursera.
