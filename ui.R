# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

library(markdown)
library(shiny)
library(leaflet)




shinyUI(fluidPage(h1("World Clock"),

        plotOutput('maps'),
        fluidRow(column(2,
                        h4("Choose a City"),
                        uiOutput("cities")
                        ),
                 column(9,h4("Time"),
                        dataTableOutput("times")),

        fluidRow(
        column(12,includeMarkdown(("README.md")))

                        )
                 )))





