mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

mydata[,1] <- as.Date(strptime(mydata[,1], "%d/%m/%Y"))

relevantData <- subset(mydata, mydata[,1]<="2007-02-02" & mydata[,1]>="2007-02-01")
dateTime <- paste(relevantData[,1], relevantData[,2])
png('plot4.png', width=504, height=504)
par(mfrow=c(2,2))
plot(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,3])), type="l", ylab="Global Active Power", xlab="")

plot(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,5])), type="l", ylab="Voltage", xlab="datetime")

plot(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,7])), type="l", ylab="Energy sub metering", xlab="")
lines(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,8])), col="red", type="l", ylab="", xlab="")
lines(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,9])), col="blue", type="l", ylab="Global Active Power (kilowatts)", xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black","red","blue"), bty="n", cex=0.9)

plot(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,4])), type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()