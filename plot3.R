# source the common scripts that loads the data from its original source or
# from the cache if available (much faster)
source('common.R')

# generate a histogram plot on the PNG device
pngPlot('plot3', 480, 480, function() {
	with(household_power_consumption, {
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
			   legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
	})
})