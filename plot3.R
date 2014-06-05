## R source code for plot3 in Course project1, Exploratory Data Analysis, Coursera, june 2014
## reading file
initial<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE,nrows=70000)
## subsetting to particular Dates
initial$Date<-as.Date(strptime(initial$Date,"%d/%m/%Y"))
data<-subset(initial,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
rm(initial)
## generating date+time variable
data$Datatime<-paste(as.character(data$Date),data$Time)
data$Datatime<-strptime(data$Datatime,"%Y-%m-%d %H:%M:%S")
## plotting to png device
png("plot3.png")
plot(data$Datatime, data$Sub_metering_1, type="n",ylab="Energy sub metering",xlab=" ")
lines(data$Datatime,data$Sub_metering_1, col="black")
lines(data$Datatime,data$Sub_metering_2, col="red")
lines(data$Datatime,data$Sub_metering_3, col="blue")
legend("topright",legend=names(data[7:9]),lty=1, col=c("black","red","blue"))
dev.off()
