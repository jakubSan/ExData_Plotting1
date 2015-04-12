
power <- read.table('household_power_consumption.txt')

power$newDate <- as.Date(power$Date, format = '%d/%m/%Y')

pow <- subset(power, power$newDate == '2007-02-01' | power$newDate == '2007-02-02')

pow$GApow <- type.convert(as.character(pow$Global_active_power), dec = '.')

pow$datetime <- strptime(paste(pow$Date,pow$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

with(pow, plot(y=Global_active_power,x=datetime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(pow, lines(y=Global_active_power,x=datetime))


with(pow, plot(y=Sub_metering_1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering"))
with(pow, lines(y=Sub_metering_1,x=datetime))
with(pow, lines(y=Sub_metering_2,x=datetime,col="red"))
with(pow, lines(y=Sub_metering_3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


with(pow,plot(y=Voltage,x=datetime, type = "n" ))
with(pow, lines(y=Voltage,x=datetime))

with(pow,plot(y=Global_reactive_power,x=datetime, type = "n" ,ylab = "Global_reactive_power"))
with(pow, lines(y=Global_reactive_power,x=datetime))
dev.off()