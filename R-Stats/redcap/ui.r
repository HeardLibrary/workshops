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
