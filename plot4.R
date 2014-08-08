# source the common scripts that loads the data from its original source or
# from the cache if available (much faster)
source('common.R')

# generate a histogram plot on the PNG device
pngPlot('plot4', 480, 480, function() {
	par(mfrow = c(2, 2),
		mar = c(4, 4, 2, 1),
		oma = c(0, 0, 2, 0))
	with(household_power_consumption, {
		plot(DateTime,
			 Global_active_power,
			 xlab = '',
			 ylab = 'Global Active Power',
			 type = 'l')
		plot(DateTime,
			 Voltage,
			 xlab = 'datetime',
			 ylab = 'Voltage',
			 type = 'l')
		plot(DateTime,
			 Sub_metering_1,
			 type = 'l',
			 xlab = '',
			 ylab = 'Energy sub metering')
		lines(DateTime, Sub_metering_2, type = 'l', col = 'red')
		lines(DateTime, Sub_metering_3, type = 'l', col = 'blue')
		legend('topright',
			   lty = 1,
			   lwd = 1,
			   col = c('black', 'blue', 'red'),
			   bty = 'n',
			   legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))		
		plot(DateTime,
			 Global_reactive_power,
			 xlab = 'datetime',
			 ylab = 'Global_reactive_power',
			 type = 'l')        
	})    
})