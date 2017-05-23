head(cpi)
head(capitals)
merge(cpi,capitals,all=T)# displays all the rows which are nit common
merge(cpi,capitals,all=F)# displays rows which only match

merge(cpis,capitals)
s <- c("apple","bee","cars","danish","eggs")
nchar(s)# legth of each characters in each string
toupper(s)# to uppercase
s
substr(s,1,3)# this will extract 1 to 3 characters from all strinfs in s.
substr(s,1,2)<- "BU" # replacing 1 to 2 characters of every string in s with BU
s
(substr(s,1,5)<- "jayallu")# R is intelligent. it will only consider the 5 characters and will repalce only the original length of string
sub('s','e',s)# we are replacing the first "s" character in every string with "e" in s.
gsub('e',"ass",s)# we are repalcing every "e" with "ass" in s.
grep('e',s)# will tell in which strings e appears.
grep('e',s,value = T)# will return values rather than indices.
grepl('e',s)# will return logical values 

cpi$avgcpi<- rowMeans(cpi[,grepl('^y',names(cpi))],na.rm = T)
cpi$avgcpi
cpi$Avgcpi<- rowMeans(cpi[,grep('^y',names(cpi))],na.rm = T)# can be used for conditioning
cpi$Avgcpi[grep("A",cpi$Country)]
cpi[grep("A",cpi$Country),c(1,12)]# row is the ones which have A in them

sort(cpi$Country)
order(cpi$Country,decreasing = T)
cpi[order(cpi$Country),c(1,12)]
cpi[sort(cpi$Country),c(1,12)]

cpi$Country[order(cpi$Avgcpi)]

# concatenate text output vectors
Capital<- capitals$Capital
Country <- capitals$Country
paste(Country,Capital,sep=",")
Country<- as.character(Country)
Capital<- as.character(Capital)
cat(Country,Capital,sep=",") # 
