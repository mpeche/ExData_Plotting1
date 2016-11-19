library(graphics)
library(grDevices)

#*******************************************************************
##Load data

setwd(file.path(getwd(),"Workspace","ProgrammingAssignment4_1"))

dataFile <- file.path(getwd(),"Dataset","household_power_consumption.txt")
#Download file, if required
if (!(file.exists(dataFile))){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dataFile)
}

##Since read.table and its varients cannot read the headers AND skip lines, create a vector of names
names <- c("Date" , "Time" , "Global_active_power" , "Global_reactive_power" ,
           "Voltage" , "Global_intensity" , "Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3")

#Load 1&2 Feb 2007 data into a data.frame hh (HouseHold)   (60mins*24hours*2days) = 2880 Records
hh <- read.csv(dataFile, sep=";", header=FALSE, col.names = names, skip=66637, nrows = 2880, na.strings = "?")
rm(names)

## Cast to date and Time not required for this plot

#*******************************************************************
##Make plot

plotFile <- file.path(getwd(),"plot1.png")
png(plotFile, width = 480, height = 480, units = "px")
hist(hh$Global_active_power, col="red", xlab="Global Active Power (kilowats)", main="Global Active Power")
dev.off()

