{

	# reads only the data for 02/01/2007 and 02/02/2007 from 	the original data text file  into a Data Frame called 	power

	power <- read.table("household_power_consumption.txt",sep=";", header=FALSE, skip=66637, nrows=2880)

	# adds the right column/variables names to the power Data 	Frame

	colnames(power) <- c	("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

	# loads the lubridate package

	library(lubridate)

	# Adds a DateTime variable/column to the power Data 	Frame, which is a merge of Date and Time in Date/Time 	format

	power$DateTime = dmy_hms(paste(power$Date,power$Time))

	# Sets the date language to English

	Sys.setlocale("LC_ALL", "English")

	# Opens png device
	png(file="plot4.png")

	# Sets 2*2 multiple plots in the graphics parameters

	par(mfrow = c(2,2))

	# Draws the 1st plot	

	with(power,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))	

	# Draws the 2nd plot

	with(power,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))	

	# Draws the 3rd plot

	with(power,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))	
	lines(power$DateTime,power$Sub_metering_2,col="red")
	lines(power$DateTime,power$Sub_metering_3,col="blue")
	legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

	# Draws the 4th plot

	with(power,plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

	# Closes devices
	dev.off()
}