readHouseholdPowerConsumption <- function()
{
    # Assume that the source file is in the working directory
    filePath <- "household_power_consumption.txt"
    
    columnClasses = c("character", "character", rep("numeric",7) )
    
    data <- read.table(filePath, header = TRUE, sep=";", 
                       colClasses = columnClasses, 
                       na.strings = "?")
    
    data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date = as.Date(data$Date, format = "%d/%m/%Y")

    subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
}

data <- readHouseholdPowerConsumption()

png(filename = "plot3.png", width = 480, height = 480, units = "px")

Sys.setlocale(category = "LC_ALL", locale = "english")

plot(data$datetime, 
     data$Sub_metering_1, 
     type = "n", 
     xlab="", 
     ylab="Energy sub metering")

lines(data$datetime, data$Sub_metering_1, col="black")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))

dev.off()