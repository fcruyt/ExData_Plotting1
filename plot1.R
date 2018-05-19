## R-code for plot 1

## Load data
unzip("exdata_data_household_power_consumption.zip")
house <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
file.remove("household_power_consumption.txt")

## Convert to Date and Time class
## Note that Time is in POIXlt format and get's todays date as default
house$Date <- as.Date(house$Date, "%d/%m/%Y")
house$Time <- strptime(house$Time, "%H:%M:%S")

## Subset 2007-02-01 and 2007-02-02
house <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")

## Plot graph 1
hist(house$Global_active_power, 
        main = "Global Active Power", 
        col = "red", 
        xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()

