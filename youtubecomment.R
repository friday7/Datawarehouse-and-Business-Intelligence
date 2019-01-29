library(SocialMediaLab)
library(stringr)
library(syuzhet)
#google api key
apikey = "AIzaSyAo0s9k67xIXUAt52JhrDD5O7jXU-4LuBU"
key = AuthenticateWithYoutubeAPI(apikey)
emptyframe = c() 
##
video = ('2rCr7_PQOKw')
ytdata = CollectDataYoutube(video,key,writeToFile = FALSE)
 ytdata
ytcomment = iconv(ytdata$Comment, to = 'utf-8-mac')
ytcomment
ytcomment.df = data.frame(ytcomment)
class(ytcomment.df)
sam = c(ytcomment)
class(sam)
s = get_nrc_sentiment(sam)
head(s)
class(s)
sneg = s[9]
sneg1 = c(sneg)
sneg1

spos = s[10]
spos1 = mean(spos)
sneg1 + spos1
average_sentiment_score=sum(spos/(spos+sneg))

ytcomment = gsub("//. Ã°Å¸â€“Â¤","",ytcomment)
ytcomment= gsub( "[^[:alnum:]]", " ",ytcomment)
ytcomment= gsub("//o",'',ytcomment)
ytcomment= gsub("// Ã ",'',ytcomment)
ytcomment= gsub("// Å",'',ytcomment)
ytcomment= gsub("//â ",'',ytcomment)
ytcomment= gsub("//o Ã Å â ",'',ytcomment)
ytcomment.df = data.frame(ytcomment)
###
