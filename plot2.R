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
png(file='plot2.png')
plot(subdf$Date,subdf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
