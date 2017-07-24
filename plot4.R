##Read the household_power_consumption.txt from current directory. It is expect that you have extract the zip to current directory

householdtxt <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data <- householdtxt[householdtxt$Date %in% c("1/2/2007", "2/2/2007"), ]


#Convert date and time	
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))



par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='red')
  lines(Sub_metering_3~DateTime,col='blue')
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="1", lty=1, lwd=2, col=c("black", "red", "blue"))
  plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

## export to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()