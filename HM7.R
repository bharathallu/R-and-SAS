#scriptName: jallu_HW07_script.R
#Location:C:/Users/jayabharath/Desktop/STAT 604/Assignments
#Created By: Jay
#creation Date: 09/26/16
#Purpose: This assignment  reinforces the material covered in all R Lectures, concentrating primarily on the last three lectures.
#Last executed:09/30/216
Sys.time()
#Housekeeping
ls()
rm(list=ls())
# reading data from csv file
cis.data<- read.csv(file="C:/Users/jayabharath/Desktop/STAT 604/Assignments/HM7/cisco.csv",header=T,sep=",")

#pdf file to save graphics
pdf(file="C:/Users/jayabharath/Desktop/STAT 604/Assignments/HM7/hm7.pdf",11,8.5)

# assigning a scalar to N
N<- 30

# alpha value
alpha<- (2/(1+N))

attach(cis.data)
# creating a vector of zeros
EMA<- rep(0,length(Adj.Close))

#assign avg of first 30 to EMA[30]
EMA[30]<- mean(Adj.Close[1:30])

# Running loop to fill EMA vector
for (i in N+1:length(Adj.Close)){
  EMA[i]<- (Adj.Close[i]*alpha)+(EMA[i-1]*(1-alpha))
}

# plotting 
plot(1:260,EMA[(length(Adj.Close)-259):length(Adj.Close)],type="l",ylim=c(0,35),col="purple",xlab="Days",ylab="Adjusted Closing Price",main="30 Day EMA and Daily Stock Prices")
lines(Adj.Close[(length(Adj.Close)-259):length(Adj.Close)],type="l",col="green")

#legend
legend(0,2,bty="n",horiz=T,cex=1,x.intersp=.10,y.intersp =0.10,expression(paste(EMA[i]," = ",(P[i]%*%alpha)+(EMA[i-1]%*%(1-alpha)), " where ", alpha, " = ", frac(2,1+30))))

# Creating function with three Arguments

EMAf<- function(adj.closingpri,N=30,up.lim=35){
  EMA<- rep(0,length(adj.closingpri))
  for (i in N+1:length(adj.closingpri)){
    EMA[N]<- mean(adj.closingpri[1:N])
    EMA[i]<- (adj.closingpri[i]*(2/(1+N)))+(EMA[i-1]*(1-(2/(1+N))))}
  plot(1:260,EMA[(length(adj.closingpri)-259):length(adj.closingpri)],type="l",ylim=c(0,up.lim),col="purple",xlab="Days",ylab="Adjusted Closing Price",
       main=paste(N, "Day EMA and Daily Stock Prices"))
  lines(adj.closingpri[(length(adj.closingpri)-259):length(adj.closingpri)],type="l",col="green")
  #legend
  legend(0,4,bty="n",horiz=T,x.intersp=0,y.intersp = 0,pt.cex=1,cex=.9,bquote(paste(EMA[i]," = ",(P[i]%*%alpha)+(EMA[i-1]%*%(1-alpha)), " where ", alpha, " = ",
      frac(2,1+.(N)))))
}


#setting overall margins in inches
par(omi=c(.5,0.5,1.5,0.5))

#two columns
par(mfcol=c(1,2))

# setting margins for individual graphs
par(mar=c(5,4,2,0))

# calling function Twice
EMAf(cis.data$Adj.Close,30)
EMAf(cis.data$Adj.Close,100)

# adding time
mtext(Sys.time(), side=1, line=3.5, at=-300)

detach(cis.data)
dev.off()

rm(list=ls())

