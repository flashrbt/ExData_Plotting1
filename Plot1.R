library(data.table)
library(dplyr)


file<-"household_power_consumption.txt"


dt_data<-fread(file,na.strings = c("?"))

newdata<-dt_data[grep("?/2/2007",dt_data$Date)]

newdata2<-newdata[as.Date(newdata$Date,format="%d/%m/%Y")<as.Date("3/2/2007",format="%d/%m/%Y"),]


png(file="plot1.png",width=480,height=480,units='px')
hist(newdata2$Global_active_power,col="red",main="Global Active Power")
dev.off()

