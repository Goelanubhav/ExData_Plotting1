
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

plot(Global_active_power ~ datetime, data=dt,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()




