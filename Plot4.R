setwd("G:/Coursera/EDA/Assignment1")
hpc <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
h1 <- hpc[hpc$Date == "1/2/2007",]
h2 <- hpc[hpc$Date == "2/2/2007",]

epc <- rbind(h1, h2)


rm(hpc)
rm(h1)
rm(h2)

epc$Datetime <- paste(epc$Date, epc$Time, sep = '-')

epc$Datetime <- strptime(epc$Datetime, "%d/%m/%Y-%H:%M:%S")

epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
epc$Voltage <- as.numeric(epc$Voltage)
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)

png(filename = "Plot4.png")

par(mfrow=c(2,2))
#Plot 1
plot(y = epc$Global_active_power, x = epc$Datetime, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2
plot(y = epc$Voltage, x = epc$Datetime, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(y = epc$Sub_metering_1, x = epc$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
lines(x = epc$Datetime, y = epc$Sub_metering_2, col =  "Red")
lines(x = epc$Datetime, y = epc$Sub_metering_3, col =  "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("Black", "Red", "Blue"), bty = "n")

#Plot 4
plot(y = epc$Global_reactive_power, x = epc$Datetime, type = "s", xlab = "datetime")



dev.off()