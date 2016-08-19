rm(list=ls())

#reading the file
my.data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#coverting Date to date class in R
my.data$Date<-as.Date(my.data$Date, format="%d/%m/%Y")

#selecting the subset of the data we are interested in -- no point working with 
#a huge file
my.data.plot<-subset(my.data, Date>="2007-02-01"& Date<="2007-02-02")

#Sub_metering  variables are in integer format
#Saving as numeric for the hist function to run:
my.data.plot$Sub_metering_1<-as.numeric((as.character(my.data.plot$Sub_metering_1)))
my.data.plot$Sub_metering_2<-as.numeric((as.character(my.data.plot$Sub_metering_2)))
my.data.plot$Sub_metering_3<-as.numeric((as.character(my.data.plot$Sub_metering_3)))


#building the .png file
png(file="plot3.png")

#building the graph
with(my.data.plot, plot(round(Sub_metering_1, Date), type="s", xaxt='n', ylab="Energy sub metering", xlab=""))
lines(round(my.data.plot$Sub_metering_2, my.data.plot$Date), col="red")
lines(round(my.data.plot$Sub_metering_3, my.data.plot$Date), col="blue")
legend("topright", lty= 1, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #add title

#adding custom axis labels
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))

#closing .png file
dev.off()