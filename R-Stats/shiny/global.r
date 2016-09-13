# global.R
# Code here is in scope to both ui.R and server.R

#Load required library
library(leaflet)

# Get dataset from CSV
starbucks <- read.csv("data/starbucks.csv", header=TRUE)

# Create a vector of country subdivions (i.e. states in the U.S.)
starbucks <- subset(starbucks, Country == "US" )
regions <- unique(as.vector(starbucks$Country.Subdivision))

