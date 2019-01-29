library(htmltab)
library(stringr)
library(tidyr)
library(rvest)
#the list of url in the csv file is read here
tedxeventlist<- read.csv(file="C:\\Users\\sam pc\\Desktop\\tedtalks dwbi\\tedxeventslat.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)
class(tedxeventlist)
#the fifth column from the tedxevent dataframewhich contins all the tedxevents url's is loaded at tedxallurls
tedxallurls<- tedxeventlist[,5]
class(tedxallurls)
#the total number of urls in the data.frame tedxeventlist is counted here
totalcount <- length(tedxeventlist$urls)
#locationmat matrix is created
locationmat <- matrix(,totalcount)
for (i in 1:totalcount){
  currenturl <- tedxeventlist$urls[i]
  print(currenturl)
  #location of filter which is the tedx event
  Locationof <- htmltab(doc=currenturl, which = 1)
  locationmat[i,1] <- Locationof$Location[2]
}
locationmat
locationmat <- gsub("Location","",location)
locationmat <- gsub('([[:upper:]])', ' \\1', location)
locationmat

#write.csv(location, "DimLocations.csv", row.names = FALSE)
location <- cbind(locationmat,locationmat)
library(maps)
data("world.cities")
caa <- gsub("[[:punct:]]", "",toString(locationmat))
saa <- strsplit(location, " ")
c <- lapply(saa, function(x)x[max(which(x %in% world.cities$name))])
d <- lapply(saaa,function(x)x[which(x %in% world.cities$country.etc)])
location$V2 <- NULL
write.csv(location, "DimLocations.csv", row.names = FALSE)