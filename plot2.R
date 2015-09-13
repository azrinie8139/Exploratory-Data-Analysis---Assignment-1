household_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
names(household_power)
lapply(household_power, class)

household_power$DateTime <- paste(household_power$Date, household_power$Time)
household_power$DateTime <- strptime(household_power$DateTime, "%d/%m/%Y %H:%M:%S")

start <- which(household_power$DateTime == strptime("2007-02-01", "%Y-%m-%d"))
end <- which(household_power$DateTime == strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
household_power <- household_power[start:end,]

plot(household_power$DateTime, as.numeric(as.character(household_power$Global_active_power)),
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()