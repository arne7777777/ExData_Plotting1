# read csv file without factors
hh_power_cons <- read.table("household_power_consumption.txt", header = TRUE, sep=";", as.is = TRUE, na.strings="?")

# convert Date column into date type:
hh_power_cons$Date <- as.Date(hh_power_cons$Date, "%d/%m/%Y")

# subset to 2007-02-01 and 2007-02-01 dates:
hh_power_cons2007 <- hh_power_cons[hh_power_cons$Date >= "2007-02-01" & hh_power_cons$Date <= "2007-02-02",]

# remove large data frame from memory:
rm(hh_power_cons)

# convert Global_active_power to numeric
hh_power_cons2007$Global_active_power <- 
    as.numeric(hh_power_cons2007$Global_active_power)

# open png device
png("plot1.png", width=480, height=480)

# plot the histogram:
hist(hh_power_cons2007$Global_active_power, main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", col = "red")

# close png device:
dev.off()
