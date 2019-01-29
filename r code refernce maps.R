library(maps)
library(plyr)

# Load data from package maps
data(world.cities)

# Create test data
aa <- c(
  "Mechanical and Production Engineering Department, National University of Singapore.",
  "Cancer Research Campaign Mammalian Cell DNA Repair Group, Department of Zoology, Cambridge, U.K.",
  "Cancer Research Campaign Mammalian Cell DNA Repair Group, Department of Zoology, Cambridge, UK.",
  "Lilly Research Laboratories, Eli Lilly and Company, Indianapolis, IN 46285."
)

# Remove punctuation from data
caa <- gsub( "[[:punct:]]", "",aa)    ### *Edit*
#class(caa)
# Split data at word boundaries
saa <- strsplit(caa, " ")
#class(saa)
saa
# Match on cities in world.cities
# Assumes that if multiple matches, the last takes precedence, i.e. max()
#max(saa %in% world.cities$name)
#saa[max(which(saa %in% world.cities$name))]
#llply(saa, function(x)x[max(which(x %in% world.cities$name))])
a = saa[which(saa %in% world.cities$country.etc)]
#a
# Match on country in world.countries
llply(saa, function(x)x[which(x %in% world.cities$country.etc)])


