
##Loading and reading the data
data<-read.csv("household_power_consumption.txt", header=T,
                   sep=";", stringsAsFactors=F, na.strings="?",
                   colClasses=c("character", "character", "numeric",
                                "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"))

##Subsetting by correct timeframe : from 2007-02-01 to 2007-02-02
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
startDate<-as.Date("01/02/2007",format="%d/%m/%Y")
endDate<-as.Date("02/02/2007",format="%d/%m/%Y")
data<-data[data$Date>=startDate & data$Date<= endDate, ]

##Creating the plot in a PNG device
png(filename="plot1.png,width=480,heigth=480")
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()