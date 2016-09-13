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
