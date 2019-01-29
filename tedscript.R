library(htmltab)
library(stringr)
library(tidyr)
library(rvest)
evt_lst <- read.csv(file="C:\\Users\\sam pc\\Desktop\\tedtalks dwbi\\tedxeventslat.csv", header = TRUE, sep = ",",  stringsAsFactors=FALSE)
event_url<- evt_lst[,5]
count <- length(evt_lst$urls)
location<- matrix(,count)
for (i in 1:count){
  url <- evt_lst$urls[i]
  print(url)
  Location_lp <- htmltab(doc=url, which = 1)
  #Location_lp <-toString(Location_lp)
  location[i,1] <- Location_lp$Location[2]
}
location <- gsub("Location","",location)
location <- gsub('([[:upper:]])', ' \\1', location)
write.csv(location, "DimLocations.csv", row.names = FALSE)
library(maps) 
data("world.cities") 
b <- gsub(toString(location), "[[:punct:]]", "") 
a <- strsplit(location, " ") 

c <- lapply(a, function(x)x[max(which(x %in% world.cities$name))]) 
d <- lapply(a,function(x)x[which(x %in% world.cities$country.etc)])
location$V2 <- NULL 
write.csv(location, "DimLocations1.csv", row.names = FALSE) 