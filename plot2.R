#Plot2.R

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
png('plot2.png', width = 480, height = 480)

#Plot the data
with(pow, plot(y=Global_active_power,x=datetime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(pow, lines(y=Global_active_power,x=datetime))

#Close the device
dev.off()



