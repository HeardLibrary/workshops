# global.R
# Code here is in scope to both ui.R and server.R

#Load required library
library(leaflet)
library(REDCapR)

# Get dataset from REDCap
fields <- c("record_id", "latitude", "longitude", "where", "object")
ds <- redcap_read_oneshot(redcap_uri='https://redcap.vanderbilt.edu/api/', token='CA05A32B0ED851E8C4FF16F4B147F759', fields=fields)$data
