library(dplyr)
hh<- read.table("household_power_consumption.txt", sep=";", header = TRUE)
#View(hh)
hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")

hh <- hh[(hh$Date=="2007-02-01") | (hh$Date=="2007-02-02"),]

hh$DateTime <- with(hh, as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))
#str(hh)

hh <- transform(hh, Global_active_power = as.numeric(as.character(Global_active_power)))
plot(hh$DateTime, hh$Sub_metering_1, type = "l", xlab="", ylab="Energy Sub Metering", yaxt="n")
lines(hh$DateTime, hh$Sub_metering_2,  col = "red")
lines(hh$DateTime, hh$Sub_metering_3,  col = "blue")
axis(2, at=seq(0, 30, by=10))

legend("topright",                                    
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()