# Load supporting libraries
library(lubridate)

# Read in data file
# (Data was downloaded from: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
powerdf<-read.csv2("bigdatafiles/household_power_consumption.txt")

# Make date more useable
powerdf$Date<-dmy_hms(paste(powerdf$Date,powerdf$Time))

# subset data to the range requested
subdf<-subset(powerdf, Date < mdy("2/3/2007") & Date >= mdy("2/1/2007"))

# Make numbers more useable
subdf$Global_active_power<-as.numeric(subdf[,3])
subdf$Global_reactive_power<-as.numeric(subdf[,4])
subdf$Voltage<-as.numeric(subdf[,5])
subdf$Sub_metering_1<-as.numeric(subdf[,7])
subdf$Sub_metering_2<-as.numeric(subdf[,8])
subdf$Sub_metering_3<-as.numeric(subdf[,9])

#Create plots
png(file='plot4.png')
par(mfrow=c(2, 2))
plot(subdf$Date,subdf$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(subdf$Date,subdf$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subdf$Date,subdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subdf$Date,subdf$Sub_metering_2, col="red")
lines(subdf$Date,subdf$Sub_metering_3, col="blue")
legend("topright",names(subdf[7:9]), lty=1, col=c('black','red', 'blue'), cex=.75)
plot(subdf$Date,subdf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
par(mfrow=c(1,1))