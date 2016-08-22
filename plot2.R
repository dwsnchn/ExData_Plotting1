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

#plot 2: Time during 2007-02-01 to 2007-02-02 to Global active power

#Make a new column named exact_time that merge Date and Time  
extracted$exact_time = extracted$Date + extracted$Time

png("plot2.png",  width = 480, height = 480, units = "px")
plot(extracted$exact_time, extracted$Global_active_power, col="black", main = "", xlab = "", ylab = "Global Active Power (kilowatts)", lwd=1,pch=".", type = "o")
dev.off()