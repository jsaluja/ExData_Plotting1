 fileData <- read.csv.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors=FALSE)
 fileData$DateTime <- strptime(paste(fileData$Date,fileData$Time),"%d/%m/%Y %H:%M:%S")
 png(file="plot1.png",width = 480, height = 480, units = "px")
 with(fileData,hist(fileData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
 dev.off()
 
