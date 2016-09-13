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
