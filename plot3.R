# Load supporting libraries
library(lubridate)

# Read in data file
# (Data was downloaded from: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
powerdf<-read.csv("bigdatafiles/household_power_consumption.txt", sep=";", na.strings = "?")

# Make date more useable
powerdf$Date<-dmy_hms(paste(powerdf$Date,powerdf$Time))

# subset data to the range requested
subdf<-subset(powerdf, Date < mdy("2/3/2007") & Date >= mdy("2/1/2007"))

#Create plot
png(file='plot3.png')
plot(subdf$Date,subdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subdf$Date,subdf$Sub_metering_2, col="red")
lines(subdf$Date,subdf$Sub_metering_3, col="blue")
legend("topright",names(subdf[7:9]), lty=1, col=c('black','red', 'blue'), cex=.75)
dev.off()
