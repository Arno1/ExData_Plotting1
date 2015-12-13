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
	png(file="plot3.png")

	# Plots Sub_metering_1 with the right axis labels

	with(power,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))	

	# Adds Sub_metering_2 in red and Sub_metering_3 in blue

	lines(power$DateTime,power$Sub_metering_2,col="red")
	lines(power$DateTime,power$Sub_metering_3,col="blue")

	# Adds the requested legend

	legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

	# Closes devices
	dev.off()
}