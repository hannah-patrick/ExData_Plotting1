# Ensure data is in your working directory
# Read in data 

data <- read.csv(file="household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

#convert to to Date dates 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# only keep data for dates between 
data <- data[which(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")),]

# Convert Global_active_power, Global_reactive_power, Voltage, 
#Global_intensity, Sub_metering_1, Sub_metering_2 to numeric. 
# NA's introduced are from ? representing missing values. 
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

# Create a datetime column in dataset 
data$datetime <-strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 


#Create Plot3 in file plot3.png
png("plot3.png", width=480, height=480)
plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()







