mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

mydata[,1] <- as.Date(strptime(mydata[,1], "%d/%m/%Y"))

relevantData <- subset(mydata, mydata[,1]<="2007-02-02" & mydata[,1]>="2007-02-01")

png('plot1.png', width=504, height=504)
graph <- hist(as.numeric(as.character(relevantData[,3])), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


