


        

        data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
        data2<-subset(data,Date=='1/2/2007'|Date=='2/2/2007')
        d<-data2[,'Date']
        t<-data2[,'Time']
        dt<-paste(d,t)
        #a<-vector("numeric")
        #a<-strptime(dt,"%d/%m/%Y %H:%M:%S")
        #data2[,'datetime']<-strptime(paste(dat?a2[,'Date'],data2[,'Time']),"%d/%m/%Y %H:%M:%S")
        data2[,'datetime']<-dt                                                         
        #strptime() and as.Date() functions. 

        par(mfrow = c(1, 1))
        par(xaxt="s")
               
        hist(data2$Global_active_power,
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             col="red"
             )
        dev.copy(png, width = 480, height = 480, file = "plot1.png") 
        dev.off() 