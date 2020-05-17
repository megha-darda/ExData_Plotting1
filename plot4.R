Data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = c("character","character",rep("numeric",7)),na.strings = "?")
subdata <- subset(Data,Data$Date == "1/2/2007"|Data$Date == "2/2/2007")
Date <- as.Date(subdata$Date,format = "%d/%m/%Y")
DateTime <- as.POSIXct(paste(Date,subdata$Time))

png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))
    
with(subdata,plot(DateTime,Global_active_power,type="line",xlab="",ylab="Global Active Power(kilowatts)"))

with(subdata,plot(DateTime,Sub_metering_1,type="n",xlab = "",ylab="Energy sub metering"))

points(DateTime,subdata$Sub_metering_1,type="line")

points(DateTime,subdata$Sub_metering_2,type="line",col="red")

points(DateTime,subdata$Sub_metering_3,type="line",col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1,1))

with(subdata,plot(DateTime,Voltage,type="line",xlab="datetime",ylab="voltage"))

with(subdata,plot(DateTime,Global_reactive_power,type="line",xlab="datetime",ylab="Global_reactive_power"))

dev.off()
