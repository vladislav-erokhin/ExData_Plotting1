readHouseholdPowerConsumption <- function()
{
    # Assume that the source file is in the working directory
    filePath <- "household_power_consumption.txt"
    
    columnClasses = c("character", "character", rep("numeric",7) )
    
    data <- read.table(filePath, header = TRUE, sep=";", 
                       colClasses = columnClasses, 
                       na.strings = "?")
    
    data$Date = as.Date(data$Date, format = "%d/%m/%Y")

    subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
}

data <- readHouseholdPowerConsumption()

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()