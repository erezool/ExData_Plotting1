# source the common scripts that loads the data from its original source or
# from the cache if available (much faster)
source('common.R')

# generate a histogram plot on the PNG device
pngPlot('plot2', 480, 480, function() {
	plot(household_power_consumption$DateTime,
		 household_power_consumption$Global_active_power,
		 type = 'l',
		 xlab = '',
		 ylab = 'Global Active Power (kilowatts)')
})