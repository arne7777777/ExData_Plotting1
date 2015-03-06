# read csv file without factors
hh_power_cons <- read.table("household_power_consumption.txt", 
    header = TRUE, sep=";", as.is = TRUE, na.strings="?")

# convert Date column into date:
hh_power_cons$Date2 <- as.Date(hh_power_cons$Date, "%d/%m/%Y")

# subset to 2007-02-01 and 2007-02-01 dates:
hh_power_cons2007 <- hh_power_cons[hh_power_cons$Date2 >= "2007-02-01" & hh_power_cons$Date2 <= "2007-02-02",]

# convet Date and Time columns into new datetime variable:
hh_power_cons2007$DateTime <- as.POSIXlt(paste(hh_power_cons2007$Date, hh_power_cons2007$Time), format = "%d/%m/%Y %H:%M:%S")

# remove large data frame from memory:
rm(hh_power_cons)


# open PNG device
png("plot3.png", width=480, height=480)

# plot sub metering 1-3 in differenet colors:

plot(hh_power_cons2007$DateTime, hh_power_cons2007$Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering")
lines(hh_power_cons2007$DateTime, hh_power_cons2007$Sub_metering_2, col="red")
lines(hh_power_cons2007$DateTime, hh_power_cons2007$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# close png device:
dev.off()
