library(dplyr)
hh<- read.table("household_power_consumption.txt", sep=";", header = TRUE)
#View(hh)
hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")

hh <- hh[(hh$Date=="2007-02-01") | (hh$Date=="2007-02-02"),]

hh$DateTime <- with(hh, as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))
hh <- transform(hh, Global_active_power = as.numeric(as.character(Global_active_power)))
hh <- transform(hh, Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
hh <- transform(hh, Voltage = as.numeric(as.character(Voltage)))
#str(hh)

par(mfcol = c(2,2))


with(hh, {
    plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
    
    plot(hh$DateTime, hh$Sub_metering_1, type = "l", xlab="", ylab="Energy Sub Metering", yaxt="n")
    lines(hh$DateTime, hh$Sub_metering_2,  col = "red")
    lines(hh$DateTime, hh$Sub_metering_3,  col = "blue")
    axis(2, at=seq(0, 30, by=10))
    
    legend("topright",                                    
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"),
           lty = 1)
    
    plot(DateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage")
    
    plot(DateTime, Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
    
})

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

