# Set working director and verify
setwd ("C:/Users/Alpesh/Desktop/EDA")
getwd()

# Download data and unzip file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileurl, destfile = "Dataset.zip")
unzip(zipfile="Dataset.zip", exdir = "./project")

# Read data from data set, subset data and verify data structure
dfile <- file('./project/household_power_consumption.txt')
data1 <- read.table(dfile, header =T, sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
subdata2 <- subset(data1, as.Date(data1$Date, "%d/%m/%Y") >= as.Date("01/02/2007", "%d/%m/%Y") & as.Date(data1$Date, "%d/%m/%Y") <= as.Date("02/02/2007", "%d/%m/%Y"))
str(subdata2)

# Plot 2
# convert data and time to specific format
subdata2$Date <- as.Date(subdata2$Date, format = '%d/%m/%Y')
subdata2$DateTime <- as.POSIXct(paste(subdata2$Date, subdata2$Time))
# open device, plot graph and close device
png(filename = './project/plot2.png', width = 480, height = 480, units='px')
plot(subdata2$DateTime, subdata2$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()
