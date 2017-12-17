#set working directory
setwd("D:/ISB Co 2018/Coursera/Data Science Specialization/Exploratory Data Analysis/Individual Household Power Consumption Set")
#read the household power conssumption .txt file & plot the charts
house_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
house_power_1 <- house_power[house_power$Date %in% c("1/2/2007","2/2/2007") ,]
house_power_time <- strptime(paste(house_power_1$Date, house_power_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(house_power_1$Global_active_power)
sm1 <- as.numeric(house_power_1$Sub_metering_1)
sm2 <- as.numeric(house_power_1$Sub_metering_2)
sm3 <- as.numeric(house_power_1$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(house_power_time, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(house_power_time, sm2, type="l", col="red")
lines(house_power_time, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "S3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
