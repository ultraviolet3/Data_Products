#' Libraries
library(shiny)
library(dplyr)
library(lubridate)
library(ggplot2)
library(ggmap)
library(maps)
library(DT)
library(devtools)

## Helper functions

#' @family Time of city functions
#' load function: Download a csv file from an external source, parses the data into a data frame and returns the data frame and the zone.
#' @param tzfile: Data file that.Default is "tz.csv"
#' @param URL: Accepts a url for the location of the csv. Default is "https://github.com/ultraviolet3/Data_Products/blob/master/tz.csv"
#' @return data.table
#'

load<- function(tzfile="tz.csv",url="https://github.com/ultraviolet3/Data_Products/blob/master/tz.csv"){
  wd=getwd()
  file=paste(wd,tz,sep="/")
  if(!file.exists(file)) {
    download.file(url,file)}
  tzdf<<-data.frame(read.csv(file,header=T,sep=",",stringsAsFactors = T, na.strings=c("?",NA,"NA"," ",NULL,"#DIV/0!"), blank.lines.skip = T))
}
#' @family Time of city functions
#' procdata function: Calculate time for the city: Captures the user selection for the city and in the city as the timezone of the city.
#' @param y: City selected by the user. Default is all cities around the world.
#' @return tzres data table: Showing the time in the city as at that point in time.
#' @seealso time_e()
#'
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

#' @family Time of city functions
#' tim_e function: Calculate time for the city: Converts the system time to the time in the city as the timezone of the city.
#' @param z: IANA time zone of the city.
#' @return lt: Time in the city.
#' @examples lt=as.POSIXlt(Sys.time(),tz="India/Kolkata")
#'
tim_e<- function (z) {

  lt=as.character(as.POSIXlt(Sys.time(),tz=as.character(z)))
}
#' @family Time of city functions
#' cities function: Executes the load function and extracts a unique copy of cities from the data frame from the load function, as input for the "Choose a City" selectInput.
#' @param df: dataframe returned by load(). Default is tzdf.
#' @return lt: city: list of cities.
#' @seealso load()
#'
cities<- function(df=tzdf) {

  load()
  city0=as.character(unique(df$City))
  city0=sort(city0)
  city=c("All",city0)
  city}

#' @family Time of city functions
#' cmap function: Executes the load function and extracts a unique copy of cities from the data frame from the load function, as input for the "Choose a City" selectInput
#' @param y: City selected by the user. Default is all cities around the world.
#' @param df: dataframe returned by load(). Default is tzdf.
#' @return Map of the world with or without highlighting the location of the city
#' @seealso cities()
#'
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
