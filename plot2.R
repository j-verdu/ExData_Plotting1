## R source code for plot2 in Course project1, Exploratory Data Analysis, Coursera, june 2014
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
png("plot2.png")
plot(data$Datatime, data$Global_active_power, type="n",ylab="Global Active Power (kilowatts)",xlab=" ")
lines(data$Datatime,data$Global_active_power)
dev.off()
