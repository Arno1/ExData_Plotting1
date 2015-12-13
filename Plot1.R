{

	# reads only the data for 02/01/2007 and 02/02/2007 from the original data text file  into a Data Frame called power
	power <- read.table("household_power_consumption.txt",sep=";", header=FALSE, skip=66637, nrows=2880)

	# adds the right column/variables names to the power data frame
	colnames(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

	# Opens png device
	png(file="plot1.png")

	# Plots the histogram with the right labels and title on the screen
	hist(power$Global_active_power,xlab="Global Active 	Power",ylab="Frequency",main="Global Active Power (kilowatts)",col="red")

	# Closes devices
	dev.off()
}