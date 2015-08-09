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

png(filename = "Plot2.png")
plot(y = epc$Global_active_power, x = epc$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()