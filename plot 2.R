
## Reading the data 
data <- read.csv("household_power_consumption.txt", header=T,sep=";", stringsAsFactors=F, na.strings="?",colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

## Check data
head(data)

## Formatting the data in order to selec date range
data$timestamp = strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

## Date range
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")

## Subseting the data according to date range
data <- data[data$Date >= startDate & data$Date <= endDate, ]

## Creating the plot
png(filename="plot2.png", width=480, height=480)
plot(data$timestamp, data$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()