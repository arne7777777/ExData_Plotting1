# read csv file without factors
hh_power_cons <- read.table("household_power_consumption.txt", 
    header = TRUE, sep=";", as.is = TRUE, na.strings="?")

# convert Date column into date:
hh_power_cons$Date2 <- as.Date(hh_power_cons$Date, "%d/%m/%Y")

# subset to 2007-02-01 and 2007-02-01 dates:
hh_power_cons2007 <- hh_power_cons[hh_power_cons$Date2 >= "2007-02-01" & hh_power_cons$Date2 <= "2007-02-02",]

# convert Date and Time columns into new datetime variable:
hh_power_cons2007$DateTime <- as.POSIXlt(paste(hh_power_cons2007$Date, hh_power_cons2007$Time), format = "%d/%m/%Y %H:%M:%S")

# remove large data frame from memory:
rm(hh_power_cons)

# convert Global_active_power to numeric
hh_power_cons2007$Global_active_power <- as.numeric(hh_power_cons2007$Global_active_power)

# open PNG device
png("plot4.png", width=480, height=480)

# setup 4 plot areas:
par(mfcol = c(2,2))

# plot 1:
plot(hh_power_cons2007$DateTime, hh_power_cons2007$Global_active_power, xlab= "", ylab = "Global Active Power", type="l")

# plot 2:
plot(hh_power_cons2007$DateTime, hh_power_cons2007$Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering")
lines(hh_power_cons2007$DateTime, hh_power_cons2007$Sub_metering_2, col="red")
lines(hh_power_cons2007$DateTime, hh_power_cons2007$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")

# plot 3:
plot(hh_power_cons2007$DateTime, hh_power_cons2007$Voltage, type="l", col="black", xlab = "datetime", ylab = "Voltage")

# plot 4:
plot(hh_power_cons2007$DateTime, hh_power_cons2007$Global_reactive_power, type="l", 
     col="black", xlab = "datetime", ylab = "Global_reactive_power")

# close png device:
dev.off()
