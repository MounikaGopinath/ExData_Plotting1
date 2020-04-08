########Global Active Power Graph 1

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


#Naming and Subset
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Functions

png(file = "Plot1.png", width = 480, height = 480)

hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(KWs)")

#Graph Title
title(main="Global Active Power")

dev.off()
