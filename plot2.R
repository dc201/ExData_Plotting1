rm(list=ls())

#reading the file
my.data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#coverting Date to date class in R
my.data$Date<-as.Date(my.data$Date, format="%d/%m/%Y")

#selecting the subset of the data we are interested in -- no point working with 
#a huge file
my.data.plot<-subset(my.data, Date>="2007-02-01"& Date<="2007-02-02")

#Global_active_power variable is integer -- saving as numeric for the hist function to run:
my.data.plot$Global_active_power<-as.numeric(as.character(my.data.plot$Global_active_power))

#building the .png file
png(file="plot2.png")

with(my.data.plot, plot(round(Global_active_power, Date), type="s", ylab="Global Active Power (kilowatts)"))

with(my.data.plot, plot(round(Global_active_power, Date), type="s", xaxt='n',ylab="Global Active Power (kilowatts)", xlab=""))
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))

#closing the .png file
dev.off()