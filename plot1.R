
# Exploratory Data Analysis - Project 1

# Unzipping files to working directory 

zip_Epc <- "D:/ISB Co 2018/Coursera/Data Science Specialization/Exploratory Data Analysis/Week 1 - Project 1/exdata%2Fdata%2Fhousehold_power_consumption.zip"
unzip(zip_Epc)

# reading .txt file in R into a dataframe & assigning the column names

h_power <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
colnames(h_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# converting Date & Time column variables to Date & Time class

h_power$Date <- as.Date(h_power$Date,format="%d/%m/%Y")
h_power$Time <- strptime(h_power$Time, format="%H:%M:%S")

# extracting relevant data for dates 2007-02-01 and 2007-02-02, into a separate data frame

h_power_Feb <- subset(h_power,Date == "2007-02-01"| Date == "2007-02-02")
h_power_Feb$Global_active_power <- as.numeric(h_power_Feb$Global_active_power/1000)

# plotting plot1 - histogram of Global active power for 2 days of Feb

png("plot1.png", width=480, height=480)
hist(h_power_Feb$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power", col = "red")
dev.off()

