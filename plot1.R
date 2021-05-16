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
hist(as.numeric(HH_small$Global_active_power),col = "red",xlab = "Global Active Power (kilowats)",ylab = "Frequuency",main = "Global Active Power")


###copy to png
dev.copy(png,file = "plot1.png",width =480,height=480)
dev.off()
