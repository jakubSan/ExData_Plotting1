#Plot4.R

#Create "data" directory for storing data if doesn't exist
if(!file.exists("data")){
  dir.create("data")
}

#Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method = "internal")

#Unzip the file
unzip("./data/household_power_consumption.zip")

#Read in downloaded file 
power <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")

#Convert the date
power$newDate <- as.Date(power$Date, format = '%d/%m/%Y')

#Subset the datat only for 1-2.02.2007
pow <- subset(power, power$newDate == '2007-02-01' | power$newDate == '2007-02-02')

#Convert the date and time
pow$datetime <- strptime(paste(pow$Date,pow$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")


#Open the png device
png('plot4.png', width = 480, height = 480)

#Set plotting system to display 4 plots in two columns
par(mfcol=c(2,2))

#Plot the data
#Top left plot
with(pow, plot(y=Global_active_power,x=datetime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(pow, lines(y=Global_active_power,x=datetime))

#Bottom left plot
with(pow, plot(y=Sub_metering_1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering"))
with(pow, lines(y=Sub_metering_1,x=datetime))
with(pow, lines(y=Sub_metering_2,x=datetime,col="red"))
with(pow, lines(y=Sub_metering_3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Top right plot
with(pow,plot(y=Voltage,x=datetime, type = "n" ))
with(pow, lines(y=Voltage,x=datetime))

#Bottom right plot
with(pow,plot(y=Global_reactive_power,x=datetime, type = "n" ,ylab = "Global_reactive_power"))
with(pow, lines(y=Global_reactive_power,x=datetime))

#Close the device
dev.off()
