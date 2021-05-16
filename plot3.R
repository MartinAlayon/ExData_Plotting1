###Set your working direcctory to where your data is
setwd("~/R/Scripts/Exploratory_Data/W1/ExData_Plotting1")


###Read data
HH<-read.table("household_power_consumption.txt",sep = ";", header = TRUE)


###Explore data
#head(HH)
#summary(HH)


###Subset data
library(lubridate)
dates<-dmy(HH$Date)
Idx<-dmy("1/2/2007")<=dmy(HH$Date) & dmy(HH$Date)<=dmy("2/2/2007")
HH_small<-HH[Idx,]



###Plot
HH_small$Timeindex<-dmy_hms(paste(HH_small$Date,HH_small$Time))
plot(HH_small$Timeindex,HH_small$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(HH_small$Timeindex,HH_small$Sub_metering_2,type="l",col = "red")
lines(HH_small$Timeindex,HH_small$Sub_metering_3,type="l",col = "blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.8)



###copy to png
dev.copy(png,file = "plot3.png",width =480,height=480)
dev.off()
