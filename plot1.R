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

#Create plot
png(file='plot1.png')
hist(subdf$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
