mydata <- read.table("C:\\Users\\Joel\\Desktop\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";")

mydata[,1] <- as.Date(strptime(mydata[,1], "%d/%m/%Y"))

relevantData <- subset(mydata, mydata[,1]<="2007-02-02" & mydata[,1]>="2007-02-01")
dateTime <- paste(relevantData[,1], relevantData[,2])
png('plot3.png', width=504, height=504)
plot(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,7])), type="l", ylab="Energy sub metering", xlab="")
lines(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,8])), col="red", type="l", ylab="", xlab="")
lines(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,9])), col="blue", type="l", ylab="Global Active Power (kilowatts)", xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black","red","blue"))
dev.off()


