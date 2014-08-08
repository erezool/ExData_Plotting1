# source the common scripts that loads the data from its original source or
# from the cache if available (much faster)
source('common.R')

# generate a histogram plot on the PNG device
pngPlot('plot1', 480, 480, function() {
	hist(household_power_consumption$Global_active_power,
		 main = 'Global Active Power',
		 xlab = 'Global Active Power (kilowatts)',
		 col = 'red')	
})