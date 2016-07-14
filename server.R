# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to help people choose the best car for their trip,
# using mtcars dataset, from [R]

library(shiny)
library(rsconnect)
library(dplyr)
library(lubridate)
library(ggplot2)
library(ggmap)
library(maps)
library(DT)
library(devtools)
library(lint)



load<- function(tzfile="tz.csv"){
  wd=getwd()
  file=paste(wd,tz,sep="/")
    if(!file.exists(file)) {
    download.file("https://github.com/ultraviolet3/Data_Products/blob/master/data/tz.csv",file)}
  tzdf<<-data.frame(read.csv(file,header=T,sep=",",stringsAsFactors = T, na.strings=c("?",NA,"NA"," ",NULL,"#DIV/0!"), blank.lines.skip = T))
}

procdata<- function(y="All") {

  cnames=colnames(tzdf)
  if (y == "All") {
    zon_e=tzdf$Zone
    Local_Time=as.character(sapply(zon_e,tim_e))
    tzres<<-cbind(tzdf,Local_Time)
    }
  else {
    tzcity<<-subset(tzdf,tzdf$City %in% as.character(y))
    zon_e=tzcity$Zone
    Local_Time=as.character(sapply(zon_e,tim_e))
    tzres<<-cbind(tzcity,Local_Time)
  }
    datatable(tzres, options = list(pageLength = 5),rownames= FALSE) %>%
    formatStyle(cnames,  color = "#000000", backgroundColor = "#CCFF33") %>%
    formatStyle('Local_Time',  color = "#CCFF33", backgroundColor = "#990099", fontWeight = 'bold')
  }

tim_e<- function (z) {

  lt=as.character(as.POSIXlt(Sys.time(),tz=as.character(z)))
}

cities<- function(df=tzdf) {

  load()
  city0=as.character(unique(df$City))
  city0=sort(city0)
  city=c("All",city0)
  city}

cmap<- function(y,df=tzres){

    if (y == "All") {
    zborder= borders("world", colour="#663366", fill="#CC6699")
    z=ggplot() +   zborder
    z= z+ theme(panel.background = element_rect(fill = "#333333",color="#000000"),panel.grid.major = element_line(),panel.grid.minor = element_line())
    z
  }
  else {
    ycity <- geocode(y)
    co.x <- ycity$lon
    co.y <- ycity$lat
    zborder <- borders("world", colour="#663366", fill="#CC6699")
    z= ggplot() +   zborder
    z= z + geom_point(aes(x=co.x, y=co.y) ,color="#CCFF66", size=5)
    z= z+ theme(panel.background = element_rect(fill = "#333333",color="#000000"),panel.grid.major = element_line(),panel.grid.minor = element_line())
    z
  }
}


shinyServer(function(input,output) {
  x=cities()
  output$cities <- renderUI({selectInput('city',"City",choices=x, selected = "All", multiple = FALSE)})
  observeEvent(input$city, {
    y<-input$city
    cmaps<-cmap(y)
    output$times <- renderDataTable({procdata(y)})
    output$maps<- renderPlot(cmaps)

})
})



