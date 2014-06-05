## R source code for plot4 in Course project1, Exploratory Data Analysis, Coursera, june 2014
## reading file
initial<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE,nrows=70000)
## subsetting to particular Dates
initial$Date<-as.Date(strptime(initial$Date,"%d/%m/%Y"))
data<-subset(initial,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
rm(initial)
## generating date+time variable
data$Datatime<-paste(as.character(data$Date),data$Time)
data$Datatime<-strptime(data$Datatime,"%Y-%m-%d %H:%M:%S")
#open graph device
png("plot4.png")
par(mfcol=c(2,2))
#1st graph, similar to plot2.r
plot(data$Datatime, data$Global_active_power, type="n",ylab="Global Active Power",xlab=" ")
lines(data$Datatime,data$Global_active_power)
#2nd graph, similar to plot3.r
plot(data$Datatime, data$Sub_metering_1, type="n",ylab="Energy sub metering",xlab=" ")
lines(data$Datatime,data$Sub_metering_1, col="black")
lines(data$Datatime,data$Sub_metering_2, col="red")
lines(data$Datatime,data$Sub_metering_3, col="blue")
legend("topright",legend=names(data[7:9]),lty=1, col=c("black","red","blue"),bty="n")
#3rd graph
plot(data$Datatime, data$Voltage, type="n",ylab="Voltage",xlab="datetime")
lines(data$Datatime,data$Voltage)
#4th graph
plot(data$Datatime, data$Global_reactive_power, type="n",ylab="Global_reactive_power",xlab="datetime")
lines(data$Datatime,data$Global_reactive_power)
dev.off()
