totalEleData<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")
#Getting Total Data in R

toCheckEleData<-subset(totalEleData,(Date=="1/2/2007"|Date=="2/2/2007"))
#Extracting the data with the required dates

toCheckEleData$DateTime<-paste(toCheckEleData$Date,toCheckEleData$Time,sep = " ")
#Concatinating the date and time elements to get the cmplete date time column

toCheckEleData$DateTime<-strptime(toCheckEleData$DateTime,"%d/%m/%Y %H:%M:%S")
#Transfering all the date and time to readable date for R  

hist(toCheckEleData$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
#Creating histogram to represent the data in the graph as required by question

dev.copy(png,"plot1.png")
#Copying data in plot1.png file

dev.off()
#Switching the device(PNG file) off