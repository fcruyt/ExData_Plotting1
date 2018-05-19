## R-code for plot 3

## Load data
unzip("exdata_data_household_power_consumption.zip")
house <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
file.remove("household_power_consumption.txt")

## Convert to Date class and subset 2007-02-01 and 2007-02-02
house$Date <- as.Date(house$Date, "%d/%m/%Y")
house <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")

## Convert to Time class
house$Time <- paste(house$Date, house$Time)
house$Time <- strptime(house$Time, format = "%Y-%m-%d %H:%M:%S")



## Plot graph 3
with(house, plot(Time, Sub_metering_1, type= "l", 
                 xlab = NA, ylab = "Energy sub metering",
                 col = "black"))

with(house, lines(Time, Sub_metering_2, col = "red"))
with(house, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                              col = c("black","red","blue"), lty=1)

## Copy to png file
dev.copy(png, "plot3.png")
dev.off()

