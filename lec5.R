C:\Users\jayabharath\Desktop\STAT 604
?read.table
#quote in a read.csv??
dta<- read.csv("C:/Users/jayabharath/Desktop/STAT 604/CorruptionPerceptionIndexNA.csv",na.strings = c('*','?','n/a'))
# everything is numeric since we used na.strings, otherwisw they would've been factors
?Devices
plot(dta$y2002,dta$y2011)
par()# current values of plot 
#pch vector of numbers defining plot symbol
?plot
?points
# colors() to get a list of all colors
# palette()[i] i for color number. displays vector of colors
palette()

plot(2002:2011,dta[2,11:2],type="l")
dta[2,11:2]

dta1<- read.csv("C:/Users/jayabharath/Desktop/STAT 604/bcs.csv",na.strings = c('*','?','n/a'))
plot(dta1$Sqft,dta1$Price)
attach(dta1)
(pchv<- (Location=="College Station, TX")+1)
colv<- rep(NA,length(Sqft))
(colv[Location=="College Station, TX"]<- "red")
(colv[Location=="Bryan, TX"]<- "blue")
colv
plot(Sqft,Price,pch=pchv,col=colv)



table(Baths)
barplot(sort(table(Baths),decreasing = T))
barplot(sort(table(Baths),decreasing = T),horiz=T)
barmat<- table(Baths,Location)
barplot(barmat,beside=T)
barplot(barmat,beside=F)


pie(sort(table(Baths)),decreasing=T)
pie(sort(table(Baths)),decreasing=T,clockwise = T)
