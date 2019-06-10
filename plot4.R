library(data.table)

#Reads in data from file then subsets data for specified dates
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter Dates for 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



# Converting into numeric variable
globalActivePower <- as.numeric(data$Global_active_power)

# Change Date Column to Date Type
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Converting into numeric variable
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)

#Plotting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

