Data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = c("character","character",rep("numeric",7)),na.strings = "?")
subdata <- subset(Data,Data$Date == "1/2/2007"|Data$Date == "2/2/2007")
Date <- as.Date(subdata$Date,format = "%d/%m/%Y")
DateTime <- as.POSIXct(paste(Date,subdata$Time))

png("plot2.png",width=480,height=480)

with(subdata,plot(DateTime,Global_active_power,type="line",xlab="",ylab="Global Active Power(kilowatts)"))

dev.off()
