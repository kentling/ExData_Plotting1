##Read the household_power_consumption.txt from current directory. It is expect that you have extract the zip to current directory

householdtxt <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data <- householdtxt[householdtxt$Date %in% c("1/2/2007", "2/2/2007"), ]

## Plot histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## export to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()