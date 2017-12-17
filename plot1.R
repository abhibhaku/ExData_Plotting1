#set working directory
setwd("D:/ISB Co 2018/Coursera/Data Science Specialization/Exploratory Data Analysis/Individual Household Power Consumption Set")
#read the household power conssumption .txt file
house_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
house_power_1 <- house_power[house_power$Date %in% c("1/2/2007","2/2/2007") ,]

gap <- as.numeric(house_power_1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
