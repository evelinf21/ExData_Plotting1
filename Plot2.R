## Fetches dataset - it should already be in the working directory
base_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')
base_data$Date <- as.Date(base_data$Date, format="%d/%m/%Y")

## Subsets the data by selecting the right timeframe
data <- subset(base_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(base_data)

## Converts the dates
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

## Plot 2
plot(data$Global_active_power~data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saves Plot 2 to png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)

## Turns device off
dev.off()
