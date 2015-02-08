
#reading data into working space
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
 
#subsetting the required dates
epc <- epc[epc$Date %in% c("1/2/2007", "2/2/2007"),]

epc <-na.omit(epc)

#changing date format
epc$Date <- strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %H:%M:%S")

#openenig a png device to save the polt the default size is 480 * 480
png(file = "plot2.png")

plot(epc$Date,epc$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

#closing the png device
dev.off()