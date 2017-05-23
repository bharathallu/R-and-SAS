#scriptName: jallu_HW06_script.R
#Location:C:/Users/jayabharath/Desktop/STAT 604/Assignments
#Created By: Jay
#creation Date: 09/26/16
#Purpose: This assignment reinforces the R material covered through R Lesson 6(Lecture 7).You will practice using higher level graphics and adding objects to graphs
#Last executed:09/27/216
Sys.time()
#Housekeeping
ls()
rm(list=ls())
#Loading saved workspace
load("C:/Users/jayabharath/Desktop/STAT 604/Assignments/HW04.RData")

#contents of work space
ls()

# pdf file for graphics output
pdf(file="C:/Users/jayabharath/Desktop/STAT 604/Assignments/HM6/hm6.pdf")

# Create histogramsof the PTRatioin the Oklahoma schools
attach(Oklahoma)
hist(PTRatio,main="Pupil/Teacher Ratios in Oklahoma Schools",xlab="Pupils/Teacher",ylab="Density",freq = F)

# b) Creating a vector for breaks
brv<- seq(0,155,5)

#c) Histogram with break points at 5 pupils/teacher
hist(PTRatio,main="Pupil/Teacher Ratios in Oklahoma Schools",xlab="Pupils/Teacher",ylab="Density",breaks = brv,freq=F)

#5 Adding a maroon line to the graph that shows the normal distribution density of the PTRatio 
curve(dnorm(x,mean(PTRatio,na.rm=T),sd(PTRatio,na.rm=T)), add=TRUE, col="maroon", lwd=2)

#6 Drawing a yellow vertical lineon the previous histogram at the average PTRatio
abline(v=mean(PTRatio,na.rm=T),col=7)

#7 plot showing the number of teachers compared to the Pupil Teacher Ratio (PTRatio)
plot(Teachers,PTRatio,pch=3,col="purple",xlim=c(0,140))

#8 Adding a colored fit line to the plot.
abline(lm(PTRatio~Teachers),col="#FF9900")
summary(lm(PTRatio~Teachers))

#9 Imbedding the date and time of creation near the upper righthand corner of the graph area.
legend("topright",legend= Sys.time(),bty="n")

#10 Creating a boxplot of the number of students in each grade(Columns Grade7 through Grade12).
boxplot(Grade7,Grade8,Grade9,Grade10,Grade11,Grade12,range = 0,xlab="Grades",ylab="Students",main="Tulsa county vs. State",col="lightgreen")
axis(1,1:6,7:12)

#11 Adding diamonds that can be colored and filledthat represent the average number of students in each grade from Tulsa County
Y<- c(mean(Grade7[County=="TULSA COUNTY"],na.rm=T),mean(Grade8[County=="TULSA COUNTY"],na.rm=T),mean(Grade9[County=="TULSA COUNTY"],na.rm=T),mean(Grade10[County=="TULSA COUNTY"],na.rm=T),mean(Grade11[County=="TULSA COUNTY"],na.rm=T),mean(Grade12[County=="TULSA COUNTY"],na.rm=T))
points(Y,pch=23,cex=1.8,bg="darkgreen",col="red")

detach(Oklahoma)

dev.off()
rm(list=ls())
