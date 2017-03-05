# Set working director and verify
setwd ("C:/Users/Alpesh/Desktop/EDA")
getwd()

# Download data and unzip file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileurl, destfile = "Dataset.zip")
unzip(zipfile="Dataset.zip", exdir = "./project")

# Read data from data set, subset data and verify data structure
dfile <- file('./project/household_power_consumption.txt')
data1 <- read.table(dfile, header = T, sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
subdata2 <- subset(data1, as.Date(data1$Date, "%d/%m/%Y") >= as.Date("01/02/2007", "%d/%m/%Y") & as.Date(data1$Date, "%d/%m/%Y") <= as.Date("02/02/2007", "%d/%m/%Y"))
str(subdata2)


# Plot 4
# convert data and time to specific format
subdata2$Date <- as.Date(subdata2$Date, format = '%d/%m/%Y')
subdata2$DateTime <- as.POSIXct(paste(subdata2$Date, subdata2$Time))
# open device, plot graph and close device
png(filename = './project/plot4.png', width = 480, height = 480, units='px')
par(mfrow = c(2, 2))
plot(subdata2$DateTime, subdata2$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(subdata2$DateTime, subdata2$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(subdata2$DateTime, subdata2$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(subdata2$DateTime, subdata2$Sub_metering_2, col = 'red')
lines(subdata2$DateTime, subdata2$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(subdata2$DateTime, subdata2$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()

