##Loading and reading the data
data<-read.csv("household_power_consumption.txt", header=T,
               sep=";", stringsAsFactors=F, na.strings="?",
               colClasses=c("character", "character", "numeric",
                            "numeric", "numeric", "numeric",
                            "numeric", "numeric", "numeric"))

##Subsetting by correct timeframe : from 2007-02-01 to 2007-02-02
data$timestamp = strptime(paste(data$Date, data$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
data = data[data$timestamp >= startDate & data$timestamp <= endDate, ]

## Creating the plot
png(filename="plot2.png", width=480, height=480)
plot(data$timestamp, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()