#reading the file household_power_consumption.txt from the working directory
f <- read.csv("household_power_consumption.txt", sep=";")

#converting date and time
f$Date <- strptime(paste(f$Date, f$Time), format = "%d/%m/%Y %H:%M:%S")


#subsetting the date range
f01 <- subset(f, as.Date(Date) == as.Date("2007-02-01"))
f02 <- subset(f, as.Date(Date) == as.Date("2007-02-02"))
f <- rbind(f01, f02)

#drawing an actual histogram
plot (f$Date, as.numeric(levels(f$Global_active_power))[f$Global_active_power], type= "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()