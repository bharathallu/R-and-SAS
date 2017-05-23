#scriptName: jallu_HW05_script.R
#Location:C:/Users/jayabharath/Desktop/STAT 604/Assignments
#Created By: Jay
#creation Date: 09/17/16
#Purpose: Practice working with vectors, matrices, and data frames. Analyze Oklahoma school data.
#Last executed:09/20/216
Sys.time()
#Housekeeping
ls()
rm(list=ls())
#Loading saved workspace
load("C:/Users/jayabharath/Desktop/STAT 604/Assignments/HW04.RData")
#contents of work space
ls()

#3 Create a new data frame of schools containing HS in the name

Ok_HS<-Oklahoma[grep(" HS",Oklahoma$School),]
Ok_HS<- Ok_HS[-c(6,7,12:14)]

# show the structure of the new data frame
str(Ok_HS)


#4 Read in zip code database into a data frame for future use
zip_code<- read.csv("C:/Users/jayabharath/Desktop/STAT 604/Assignments/hw05/zip_codes.csv",header=T,sep=",")
#show the structure of the new data frame
str(zip_code)

#5a Create a data frame of Oklahoma zips. Remove PO BOX and Decommisioned zips
zip_ok<- zip_code[zip_code$state=="OK"&zip_code$decommissioned=="0"&zip_code$type!="PO BOX",c(1,3,7,15)]

#5b Change the name of primary_city to MailCity
names(zip_ok)<- sub("primary_city","MailCity",names(zip_ok))

#5c Change the names of the cities to upper case
zip_ok$MailCity<- toupper(zip_ok$MailCity)

#5d create a zip3 column using the first 3 digits of the zip code
zip_ok$Zipregion<- substr(zip_ok$zip,1,3)

#5e Display information on new data frame
str(zip_ok)
zip_ok[1:20,]

#6 Merge the zip data with the Oklahoma High School data and dimension of data frame
OKHS_zip<-merge(Ok_HS,zip_ok)
dim(OKHS_zip)

#7 Create a data frame of unduplicated High Schools
OKHS_zip<- OKHS_zip[!duplicated(OKHS_zip$School),]
str(OKHS_zip)

#8 Display the 25 smallest and largest schools based on number of Teachers
OKHS_zip[order(OKHS_zip$Teachers),c(15,2,1,4,10,5)][1:25,]
OKHS_zip[order(OKHS_zip$Teachers,decreasing = T),c(15,2,1,4,10,5)][1:25,]

#9  create csv file of schools including zipRegion and system time
cat(paste(OKHS_zip$School,OKHS_zip$MailCity,OKHS_zip$County,OKHS_zip$Zipregion,OKHS_zip$HSTotal,Sys.time(),sep=","),file="C:/Users/jayabharath/Desktop/STAT 604/Assignments/hw05/OKHS_zip.csv",sep="\n")

rm(list=ls())
