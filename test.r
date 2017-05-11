# test script for image retrival

# install_github('remi-daigle/flickRgeotag')

library(flickRgeotag)
library(leaflet)


api_key<-""
api_secret<-""


bb<-'-36, -30, 37, 56'


# MONGOOSE ANALYSIS

photos1 <- flickr.photos.search(api_key, secret = api_secret, bbox=bb, text="banded mongoose", .allpages = TRUE)
photos1$latitude<-as.numeric(photos1$latitude)
photos1$longitude<-as.numeric(photos1$longitude)
qflickr.plot(photos1)

photos2 <- flickr.photos.search(api_key, secret = api_secret, bbox=bb, text="Mungos mungo", .allpages = TRUE)
photos2$latitude<-as.numeric(photos2$latitude)
photos2$longitude<-as.numeric(photos2$longitude)
qflickr.plot(photos2)

# without BB

photos1 <- flickr.photos.search(api_key, secret = api_secret, text="banded mongoose", .allpages = TRUE)
photos1$latitude<-as.numeric(photos1$latitude)
photos1$longitude<-as.numeric(photos1$longitude)
qflickr.plot(photos1)

photos2 <- flickr.photos.search(api_key, secret = api_secret, text="Mungos mungo", .allpages = TRUE)
photos2$latitude<-as.numeric(photos2$latitude)
photos2$longitude<-as.numeric(photos2$longitude)
qflickr.plot(photos2)


####################################################

# COWBIRD ANALYSIS, NO BB

cowbird1 <- flickr.photos.search(api_key, secret = api_secret, text="brown headed cowbird", .allpages = TRUE)
cowbird1$latitude<-as.numeric(cowbird1$latitude)
cowbird1$longitude<-as.numeric(cowbird1$longitude)
qflickr.plot(photos1)

cowbird2 <- flickr.photos.search(api_key, secret = api_secret, text="Molothrus ater", .allpages = TRUE)
cowbird2$latitude<-as.numeric(cowbird2$latitude)
cowbird2$longitude<-as.numeric(cowbird2$longitude)

all_cowbirds<-rbind(cowbird1, cowbird2)
qflickr.plot(all_cowbirds)

# use package to sense check coordinates
install.packages("scrubr")
library(scrubr)

likely_cowbirds<-coord_unlikely(all_cowbirds)
qflickr.plot(likely_cowbirds)
