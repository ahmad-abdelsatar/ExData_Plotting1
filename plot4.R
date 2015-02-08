
#reading data into working space
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subsetting the required dates
epc <- epc[epc$Date %in% c("1/2/2007", "2/2/2007"),]

epc <-na.omit(epc)

#changing date format
epc$Date <- strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %H:%M:%S")

#openenig a png device to save the polt the default size is 480 * 480

png(file = "plot4.png")

#setting number of rows and columns to 2
par(mfrow = c(2,2))

#first plot (1,1)
plot(epc$Date,epc$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

#second plot (1,2)
plot(epc$Date,epc$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

#third plot (2,1)
#first plotting with only the first sub metering
plot(epc$Date,epc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l")

#adding the other two sub metering
lines(epc$Date,epc$Sub_metering_2, xlab = "", ylab = "Energy sub metering", col = "red", type = "l")

lines(epc$Date,epc$Sub_metering_3, xlab = "", ylab = "Energy sub metering", col = "blue", type = "l")

#adding legens 
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1 , lwd = 0.75  , bty = "n")

#fourth plot (2,2)
plot(epc$Date,epc$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")


#closing the png device
dev.off()
