fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"power.zip")
unzip("power.zip")



## read in only those lines that correspond to the dates needed

library(sqldf)

completefile <- "household_power_consumption.txt"

power_household <- read.csv.sql(completefile,
                  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                  header = TRUE, sep = ";")



## Clean power_household, such that dates and times are in correct format

power_household$Date <- as.Date(power_household$Date, format = "%d/%m/%Y")
power_household$DateTime <- strptime(paste(power_household$Date, power_household$Time), format = "%Y-%m-%d %H:%M:%S")

## Create the histogram and send it to a png file

png("plot1.png", width = 480, height = 480)
hist(power_household$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "")
dev.off()

