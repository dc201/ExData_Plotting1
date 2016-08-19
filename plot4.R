rm(list=ls())

#reading the file
my.data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#coverting Date to date class in R
my.data$Date<-as.Date(my.data$Date, format="%d/%m/%Y")

#selecting the subset of the data we are interested in -- no point working with 
#a huge file
my.data.plot<-subset(my.data, Date>="2007-02-01"& Date<="2007-02-02")

#variables of interest are of integer type, converting to numeric for the plots
my.data.plot$Global_active_power<-as.numeric(as.character(my.data.plot$Global_active_power))
my.data.plot$Sub_metering_1<-as.numeric((as.character(my.data.plot$Sub_metering_1)))
my.data.plot$Sub_metering_2<-as.numeric((as.character(my.data.plot$Sub_metering_2)))
my.data.plot$Sub_metering_3<-as.numeric((as.character(my.data.plot$Sub_metering_3)))
my.data.plot$Voltage<-as.numeric((as.character(my.data.plot$Voltage)))
my.data.plot$Global_reactive_power<-as.numeric((as.character(my.data.plot$Global_reactive_power)))

#building the .png file
png(file="plot4.png")

#setting up the desired 2:2 format
par(mfrow=c(2,2)) 

#1 of 4
with(my.data.plot, plot(round(Global_active_power, Date), type="s", xaxt='n',ylab="Global Active Power (kilowatts)", xlab=""))
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))

#2 of 4

with(my.data.plot, plot(round(Voltage, Date), type="s", xaxt='n', ylab="Voltage", xlab="datetime"))
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))


#3 of 4

with(my.data.plot, plot(round(Sub_metering_1, Date), type="s", xaxt='n', ylab="Energy sub metering", xlab=""))
lines(round(my.data.plot$Sub_metering_2, my.data.plot$Date), col="red")
lines(round(my.data.plot$Sub_metering_3, my.data.plot$Date), col="blue")
legend("topright", lty= 1,bty = "n", cex=.8, text.font=1, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #add title

axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))

#4 of 4

with(my.data.plot, plot(round(Global_reactive_power, Date), type="s", xaxt='n', ylab="Voltage", xlab="datetime"))
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))

#closing the .png file
dev.off()
