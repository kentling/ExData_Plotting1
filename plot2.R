##Read the household_power_consumption.txt from current directory. It is expect that you have extract the zip to current directory

householdtxt <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data <- householdtxt[householdtxt$Date %in% c("1/2/2007", "2/2/2007"), ]


#Convert date and time	
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")


## export to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()