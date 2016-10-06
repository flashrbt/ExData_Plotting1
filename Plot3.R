library(data.table)
library(dplyr)

#read data file

file<-"household_power_consumption.txt"

dt_data<-fread(file,na.strings = c("?"))

#select the data with date in range of "01/02/2007-02/02/2007"

newdata<-dt_data[grep("?/2/2007",dt_data$Date)]

newdata2<-newdata[as.Date(newdata$Date,format="%d/%m/%Y")<as.Date("3/2/2007",format="%d/%m/%Y"),]

#create x axis data

x<-paste(as.Date(newdata2$Date,format="%d/%m/%Y"),newdata2$Time)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")

#start plotting here

png(file="plot3.png",width=480,height=480,units='px')

plot(x,newdata2$Sub_metering_1,type='l',xlab="",ylab="energy sub metering")

lines(x,newdata2$Sub_metering_2,type='l',col="red")

lines(x,newdata2$Sub_metering_3,type='l',col='blue')

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

dev.off()

