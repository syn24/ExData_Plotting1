library(dplyr)
hh<- read.table("household_power_consumption.txt", sep=";", header = TRUE)

hh <- hh[hh$Date == "1/2/2007" | hh$Date == "2/2/2007",]
hh <- transform(hh, Global_active_power = as.numeric(as.character(Global_active_power)))

#str(hh)
#View(hh)

hist(hh$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()



