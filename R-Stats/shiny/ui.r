# ui.R

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
