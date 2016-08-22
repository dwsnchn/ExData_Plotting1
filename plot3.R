library(lubridate)
setwd("~/Documents/R/R-exploratory data")

power_consumption=read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))
summary(power_consumption)
#Reformat the column Date and Time by package "lubridate"
power_consumption$Date=dmy(power_consumption$Date)
power_consumption$Time=hms(power_consumption$Time)

#extracted data from 2007-02-01 to 2007-02-02
extracted = subset(power_consumption, Date=="2007-02-01" | Date =="2007-02-02")
summary(extracted)

#plot 3: Time to energy sub metering

#Make a new column named exact_time that merge Date and Time  
extracted$exact_time = extracted$Date + extracted$Time

png("plot3.png",  width = 480, height = 480, units = "px")
plot(extracted$exact_time, extracted$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n")
lines(extracted$exact_time, extracted$Sub_metering_1, col="black", lwd=1,lty=1, type = "o", pch=".")
lines(extracted$exact_time, extracted$Sub_metering_2, col="red", lwd=1,lty=1, type = "o", pch=".")
lines(extracted$exact_time, extracted$Sub_metering_3, col="blue", lwd=1,lty=1, type = "o", pch=".")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()