

        

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
        with(data2, plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
        dev.copy(png, width = 480, height = 480, file = "plot2.png") 
        dev.off() 