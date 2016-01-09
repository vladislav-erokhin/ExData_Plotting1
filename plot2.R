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

# Open png
png(filename = "plot2.png", width = 480, height = 480, units = "px")

Sys.setlocale(category = "LC_ALL", locale = "english")

plot(data$datetime, 
     data$Global_active_power, 
     type = "l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()