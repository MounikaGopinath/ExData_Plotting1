#############Global Active Power Vs Time - Graph 2


if(!file.exists("./InputData")){
	dir.create("./InputData")
}

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./InputData/household_power_consumption.zip",method="curl")

##Unzipping the file downloaded

unzip(zipfile="./InputData/household_power_consumption.zip",exdir="./InputData")

###Listing the files list

path_rf = file.path("./InputData")
files=list.files(path_rf, recursive=TRUE)
files



# Naming and Subset
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Functions


png(file = "Plot2.png", width = 480, height = 480)

plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (KWs)") 

# Title
title(main="Global Active Power Vs Time")

dev.off()
