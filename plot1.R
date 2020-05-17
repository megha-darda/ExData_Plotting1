Data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = c("character","character",rep("numeric",7)),na.strings = "?")
subdata <- subset(Data,Data$Date == "1/2/2007"|Data$Date == "2/2/2007")

png("plot1.png",width=480,height=480)

with(subdata,hist(Global_active_power,col = "red",main = "Global Active Power",xlab="Global Active Power(kilowatts)"))

dev.off()
