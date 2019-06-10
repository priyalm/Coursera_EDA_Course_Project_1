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

# Plotting
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()