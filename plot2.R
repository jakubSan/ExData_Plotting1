
power <- read.table('household_power_consumption.txt')

power$newDate <- as.Date(power$Date, format = '%d/%m/%Y')

pow <- subset(power, power$newDate == '2007-02-01' | power$newDate == '2007-02-02')

pow$GApow <- type.convert(as.character(pow$Global_active_power), dec = '.')

pow$datetime <- strptime(paste(pow$Date,pow$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png('plot2.png', width = 480, height = 480)

with(pow, plot(y=Global_active_power,x=datetime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(pow, lines(y=Global_active_power,x=datetime))


dev.off()



