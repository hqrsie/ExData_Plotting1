setwd("G:/Coursera/EDA/Assignment1")
hpc <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
h1 <- hpc[hpc$Date == "1/2/2007",]
h2 <- hpc[hpc$Date == "2/2/2007",]
h1$Date <- as.Date(h1$Date, "%d/%m/%Y")
h2$Date <- as.Date(h2$Date, "%d/%m/%Y")

epc <- rbind(h1, h2)

rm(hpc)
rm(h1)
rm(h2)

epc$Global_active_power <- as.numeric(epc$Global_active_power)


png(filename="Plot1.png")
hist(epc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylab = "Frequency", col = "Red")
dev.off()