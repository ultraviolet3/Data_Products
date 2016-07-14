---
title       : World Clock
subtitle    : Data Products Shiny & Slidify project
author      : Uma Venkat
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- .class #id
## Objective
The objective of this report is to produce a user interface using shiny library. This project will have the following:
- Some form of input (widget: textbox, radio button, checkbox, ...)
- Some operation on the ui input in sever.R
- Some reactive output displayed as a result of server calculations
- Enough documentation so that a novice user could use your application.

--- .class #id 
## Approach
To achieve the objectives, the project uses Shiny to develop an application to show the time of a city. The project will
- Provide a list of cities for the user to select from.
- Determine the current time in the city, selected by the user.
- Present the time to the user
- Create documentation of the functions that will be used for this purpose.

--- .class #id 
## Concept
The idea for the project is to get user(s) to select a city from a predefined list, convert the system time time the time in the city selected by the user. For instance, if the user select Chennai in Tamilnadu, India, then this application will use the sys time to determine the time in Chennai, Tamilnadu, India and display the results to the user. In addition, the application will also show the location of Chennai on the world map.

--- .class #id 
## Environment
1. OS: Windows 7; 
2. Tool: R 3.2.4, R studio Version  0.99.902, Shiny; 
3. R packages used: shiny, maps, ggmap, dplyr, lubridate, ggplot2, slidify, devtools; 
4. Publishing tool: shinyapps.io; 
5. Analyst: Uma Venkat; 
6. Date of Analysis: Jul 2016

--- .class #id 
## Location of the project files
- Shiny Repo:  https://ultraviolet.shinyapps.io/DataProducts/
- Github: https://github.com/ultraviolet3/Data_Products
- Published project: https://ultraviolet.shinyapps.io/DataProducts/

--- .class #id 
## Data Source
Data: The data used for this project was manually compiled based on various various websites including 
- timezonedb.com 
- http://www.timeanddate.com/
- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones. 

Disclaimer: Since the data was manually compiled, there is a possibility of errors and the result displayed may not be accurate.
