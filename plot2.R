mydata <- read.table("C:\\Users\\Joel\\Desktop\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";")

mydata[,1] <- as.Date(strptime(mydata[,1], "%d/%m/%Y"))

relevantData <- subset(mydata, mydata[,1]<="2007-02-02" & mydata[,1]>="2007-02-01")
dateTime <- paste(relevantData[,1], relevantData[,2])

png('plot2.png', width=504, height=504)
plot(strptime(dateTime, format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(relevantData[,3])), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()