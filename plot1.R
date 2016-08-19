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
png(file="plot1.png")

#PLOT 1 ---- building the first histogram 

hist(my.data.plot$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)",col = "red")

#closing the .png file
dev.off()
