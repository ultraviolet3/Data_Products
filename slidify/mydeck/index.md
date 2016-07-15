---
title       : World Clock
subtitle    : Data Products Shiny & Slidify project
author      : Uma Venkat
framework   : io2012 # {io2012, html5slides, shower, dzslides, ...}
theme       : tomorrow
highlighter : highlight.js # {highlight.js, prettify, highlight}
hitheme     : tomorrow # 
widgets     : [bootstrap, interactive] # {mathjax, quiz, bootstrap}
ext_widgets : [mathjax]
mode        : selfcontained # {standalone, draft, selfcontained}
knit        : slidify::knit2slides
---

### Concept
The idea for the project is to get user(s) to select a city from a predefined list, convert the system time time the time in the city selected by the user. For instance, if the user select Chennai in Tamilnadu, India, then this application will use the sys time to determine the time in Chennai, Tamilnadu, India and display the results to the user. In addition, the application will also show the location of Chennai on the world map.

### How to use the application
- Select a City in the "Choose a City" box to see the time in the city in the table as well as the location of the city in the map above the table results
- The landing page displays all the cities and the time in the city


--- .class #id 
### Environment
1. OS: Windows 7
2. Tool: R 3.2.4, R studio Version  0.99.902, Shiny; 
3. R packages used: shiny, maps, ggmap, dplyr, lubridate, ggplot2, slidify, devtools
4. Publishing tool: shinyapps.io, slidify
5. Analyst: Uma Venkat; Date of Analysis: Jul 2016

--- .class #id 
### Location of the project files
- Shiny Repo:  https://ultraviolet.shinyapps.io/DataProducts/
- Github: https://github.com/ultraviolet3/Data_Products
- Published project: https://ultraviolet.shinyapps.io/DataProducts/

### Data Source
Data: The data used for this project was manually compiled based on various various websites including:
- timezonedb.com 
- http://www.timeanddate.com/
- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones. 

Disclaimer: Since the data was manually compiled, there is a possibility of errors and the result displayed may not be accurate.