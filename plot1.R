## R source code for plot1 in Course project1, Exploratory Data Analysis, Coursera, june 2014
## reading file and generating date+time
initial<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE,nrows=70000)
initial$Date<-as.Date(strptime(initial$Date,"%d/%m/%Y"))
initial$Time<-strptime(initial$Time,"%H:%M:%S")
## subsetting to particular Dates
data<-subset(initial,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
rm(initial)
## plotting histogram to png device
png("plot1.png")
hist(data$Global_active_power, col="red", main="Global active power", xlab="Global Active Power (kilowatts)")
dev.off()
