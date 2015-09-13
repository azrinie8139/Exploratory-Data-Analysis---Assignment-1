household_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
names(household_power)
lapply(household_power, class)

household_power$DateTime <- paste(household_power$Date, household_power$Time)
household_power$DateTime <- strptime(household_power$DateTime, "%d/%m/%Y %H:%M:%S")

start <- which(household_power$DateTime == strptime("2007-02-01", "%Y-%m-%d"))
end <- which(household_power$DateTime == strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
household_power <- household_power[start:end,]

par(mfcol = c(2,2))

plot(household_power$DateTime, as.numeric(as.character(household_power$Global_active_power)),
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

plot(household_power$DateTime, as.numeric(as.character(household_power$Sub_metering_1)),
     type = "l", 
     ylab = "Energy sub metering",
     xlab = "")

lines(household_power$DateTime, as.numeric(as.character(household_power$Sub_metering_2)),
      type = "l",
      col = "red")

lines(household_power$DateTime, household_power$Sub_metering_3,
      type = "l",
      col = "blue")

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black","red","blue"))

plot(household_power$DateTime, as.numeric(as.character(household_power$Voltage)),
     type = "l", 
     ylab = "Voltage",
     xlab = "datetime")

plot(household_power$DateTime, as.numeric(as.character(household_power$Global_reactive_power)),
     type = "l", 
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()