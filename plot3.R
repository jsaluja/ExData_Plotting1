 fileData <- read.csv.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors=FALSE)
 fileData$DateTime <- strptime(paste(fileData$Date,fileData$Time),"%d/%m/%Y %H:%M:%S")
 
 png(file="plot3.png",width = 480, height = 480, units = "px")

 with(fileData,plot(fileData$DateTime,fileData$Sub_metering_1,ylab="Energy sub metering",type="l",xlab=""))
 lines(fileData$DateTime,fileData$Sub_metering_2,col="red")
 lines(fileData$DateTime,fileData$Sub_metering_3,col="blue")
 legend("topright" , c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"),lty=1) 
 
 dev.off()