library(dplyr)
hh<- read.table("household_power_consumption.txt", sep=";", header = TRUE)
#View(hh)
hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")

hh <- hh[(hh$Date=="2007-02-01") | (hh$Date=="2007-02-02"),]

hh$DateTime <- with(hh, as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))
#str(hh)

hh <- transform(hh, Global_active_power = as.numeric(as.character(Global_active_power)))
with(hh, {
    plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
})

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()