
power <- read.table('household_power_consumption.txt')

power$newDate <- as.Date(power$Date, format = '%d/%m/%Y')

pow <- subset(power, power$newDate == '2007-02-01' | power$newDate == '2007-02-02')

pow$GApow <- type.convert(as.character(pow$Global_active_power), dec = '.')

png('plot1.png', width = 480, height = 480)

hist(pow$GApow, col = 'red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')

dev.off()
