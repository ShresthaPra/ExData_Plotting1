totalEleData<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")
#Getting Total Data in R

toCheckEleData<-subset(totalEleData,(Date=="1/2/2007"|Date=="2/2/2007"))
#Extracting the data with the required dates

toCheckEleData$DateTime<-paste(toCheckEleData$Date,toCheckEleData$Time,sep = " ")
#Concatinating the date and time elements to get the cmplete date time column

toCheckEleData$DateTime<-strptime(toCheckEleData$DateTime,"%d/%m/%Y %H:%M:%S")
#Transfering all the date and time to readable date for R  

par(mfrow = c(2,2),cex=0.5)
#Putting device image with 2 rows an 2 columns with font size as 0.25 of value

#Plot 1
plot(y = toCheckEleData$Global_active_power,x=toCheckEleData$DateTime,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
#Plotting Global Active Power with type as Line 

#Plot 2
plot(y = toCheckEleData$Voltage,x=toCheckEleData$DateTime,type = "l",ylab = "Voltage",xlab = "datetime")
#Plotting Voltage with type as Line 

#Plot 3
plot(y = toCheckEleData$Sub_metering_1,x=toCheckEleData$DateTime,type = "n",xlab="",ylab="Energy sub metering")
#Creating the outer plot

points(y = c(toCheckEleData$Sub_metering_1),x=c(toCheckEleData$DateTime),type = "l",col="black")
points(y = c(toCheckEleData$Sub_metering_2),x=c(toCheckEleData$DateTime),type = "l",col="red")
points(y = c(toCheckEleData$Sub_metering_3),x=c(toCheckEleData$DateTime),type = "l",col="blue")
#Plotting all three meter values using line("l") technique with different colours

legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",xjust=1)
#Putting the legend at the top right corner with all the data

#Plot 3 complete

#Plot 4
plot(y = toCheckEleData$Global_reactive_power,x=toCheckEleData$DateTime,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
#Plot 4 Complete

dev.copy(png,"plot4.png")
#Copying data in plot4.png file

dev.off()
#Switching the device(PNG file) off