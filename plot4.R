data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
data2<-subset(data,Date=='1/2/2007'|Date=='2/2/2007')

d<-data2[,'Date']
t<-data2[,'Time']
dt<-paste(d,t)
#a<-vector("numeric")
#a<-strptime(dt,"%d/%m/%Y %H:%M:%S")
#data2[,'datetime']<-strptime(paste(dat?a2[,'Date'],data2[,'Time']),"%d/%m/%Y %H:%M:%S")
data2[,'datetime']<-as.numeric(a)
data2[,'day']<-format(strptime(dt,"%d/%m/%Y %H:%M:%S"), "%a")

#strptime() and as.Date() functions. 
#data3<-subset(data2,select = c(datetime,Global_active_power))
#plot(data3,type="l")
data2 <- transform(data2, Day = factor(day))

par(mfrow = c(2, 2))
#par(mfrow = c(1, 1))
#Plot1

        with(data2, plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))


#Plot2
        with(data2, plot(datetime,Voltage,type="l"))
       
#Plot3
        
with(data2,plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering",pty="m",xlab=""))

par(new=TRUE)
with(data2,plot(datetime,Sub_metering_1,type="l",col="black",xlab="",ylab="",xaxt="n", new=TRUE))
par(new=TRUE)
with(data2,plot(datetime,Sub_metering_2,type="l",col="red",xaxt="n",yaxt="n",xlab="",ylab="",yaxs="r",ylim = c(0, 38)))
par(new=TRUE)
with(data2,plot(datetime,Sub_metering_3,type="l",col="blue",xaxt="n",yaxt="n",xlab="",ylab="",ylim = c(0, 38)))
legend("topright",lwd=2,col=c('black','red','blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      
#plot4
        with(data2, plot(datetime,Global_reactive_power,type="l"))


dev.copy(png, width = 480, height = 480, file = "plot4.png") 
dev.off() 
