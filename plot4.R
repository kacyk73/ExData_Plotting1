#reading the file household_power_consumption.txt from the working directory
f <- read.csv("household_power_consumption.txt", sep=";")

#converting date and time
f$Date <- strptime(paste(f$Date, f$Time), format = "%d/%m/%Y %H:%M:%S")


#subsetting the date range
f01 <- subset(f, as.Date(Date) == as.Date("2007-02-01"))
f02 <- subset(f, as.Date(Date) == as.Date("2007-02-02"))
f <- rbind(f01, f02)

#drawing an actual histogram
par(mfrow=c(2,2))
plot (f$Date, as.numeric(levels(f$Global_active_power))[f$Global_active_power], type= "l", xlab="", ylab="Global Active Power (kilowatts)")
plot (f$Date, as.numeric(levels(f$Voltage))[f$Voltage], type= "l", xlab="datetime", ylab="Voltage")
with(f, plot(Date, Sub_metering_1, type = "n", ylab="Energy sub metering"))
with(f, points(Date, levels(Sub_metering_1)[Sub_metering_1], col = "black", type="l"))
with(f, points(Date, levels(Sub_metering_2)[Sub_metering_2], col = "red", type="l"))
with(f, points(Date, Sub_metering_3, col = "blue", type="l"))
plot (f$Date, as.numeric(levels(f$Global_reactive_power))[f$Global_reactive_power], type= "l", xlab="datetime", ylab="Global_Reactive_Power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()