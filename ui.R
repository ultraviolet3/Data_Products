# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app


library(shiny)
library(rsconnect)
library(markdown)

shinyUI(fluidPage(h1("World Clock"),
        fluidRow(column(12,
        plotOutput('maps',width="80%",height="400px"))),
        fluidRow(column(2,

                        uiOutput("cities")
                        ),
                 column(9,h4("Time"),
                        DT:: dataTableOutput("times"))),

        fluidRow(
        column(12,includeMarkdown(("README.md"))))
                 ))





