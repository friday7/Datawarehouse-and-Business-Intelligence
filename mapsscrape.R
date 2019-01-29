library(htmltab)
url ='https://www.mapsofindia.com/maps/schoolchildrens/statesandcapitals.htm'
data <- htmltab(doc=url, which=1,header = FALSE)
data
