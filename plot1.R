# Note 1. The package install is required just once not everytime
# Note 2. library command is required because read.csv.sql is present in sqldf package
# Note 3. File has been downloaded and unzipped in the working directory, the script works on the file 
# Note 4: read.csv.sql filters the data using the where clause in Select statement. Data for '1/2/2007' '2/2/2007' is loaded into fileData
 install.packages("sqldf")
 library(sqldf)

 fileData <- read.csv.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors=FALSE)
 fileData$DateTime <- strptime(paste(fileData$Date,fileData$Time),"%d/%m/%Y %H:%M:%S")
 png(file="plot1.png",width = 480, height = 480, units = "px")
 with(fileData,hist(fileData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
 dev.off()
 
