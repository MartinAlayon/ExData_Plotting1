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
plot(HH_small$Timeindex,HH_small$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")



###copy to png
dev.copy(png,file = "plot2.png",width =480,height=480)
dev.off()

