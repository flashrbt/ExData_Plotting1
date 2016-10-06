library(data.table)
library(dplyr)


file<-"household_power_consumption.txt"


dt_data<-fread(file,na.strings = c("?"))

newdata<-dt_data[grep("?/2/2007",dt_data$Date)]

newdata2<-newdata[as.Date(newdata$Date,format="%d/%m/%Y")<as.Date("3/2/2007",format="%d/%m/%Y"),]



x<-paste(as.Date(newdata2$Date,format="%d/%m/%Y"),newdata2$Time)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")


png(file="plot2.png",width=480,height=480,units='px')
plot(x,newdata2$Global_active_power,type='l',xlab="",ylab="Global Active Power (Killowatts)")

dev.off()

