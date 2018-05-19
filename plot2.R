## R-code for plot 2

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

## Plot graph 2
with(house, plot(Time, Global_active_power, type= "l", 
                 xlab = NA, ylab = "Global Acitve Power (kilowatts)"))

## Copy to png file
dev.copy(png, "plot2.png")
dev.off()

