
# Set Working Directory and other libraries

library(dplyr)
library(lubridate)

setwd("C:/SCM/Coursera/DST-1/EDA")


# Read txt File with Header=TRUE and Separator as ';'
df <- read.table("household_power_consumption.txt", header = TRUE,sep = ';',na.strings = "?")

# Calculate the size of data

bytes <- nrow(dt)*ncol(dt)*8

mbytes <- bytes/2^{20}

gbytes <- mbytes/ 1024

# Convert Data into data Table
dt <- tbl_df(df)
str(dt)
summary(dt)

# Conert Date from Factor to Date

dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")

# Subset the data
dt <- subset(dt, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")
dt$datetime <- as.POSIXct(dt$datetime)

# Histogram

par(mfrow = c(2, 2)) 

plot(Global_active_power ~ datetime, data=dt,type = "l", ylab = "Global Active Power", xlab = "")

plot(Voltage ~ datetime, data=dt,type = "l", ylab = "voltage", xlab = "datetime",breaks=4)

plot(Sub_metering_1 ~ datetime, data=dt,type = "l", ylab = "Energy sub metering", xlab = "")

lines(Sub_metering_2 ~ datetime, data=dt,col = "Red")

lines(Sub_metering_3 ~ datetime, data=dt,col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power ~ datetime, data=dt,type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()




