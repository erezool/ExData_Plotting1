# temporary variable holding the data base name (used across this script)
data_name <- 'household_power_consumption'

# check if the digested data variable exists otherwise load it
if (!exists(data_name)) {
	
	# check if we have a cached digested data file and if so load it (much faster)
	if (file.exists(paste0(data_name, '.RData'))) {
		load(paste0(data_name, '.RData'))
	} else { # we
		# choose a download method based on the current OS
		# Mac needs 'curl' others should be fine with 'auto'
		if (Sys.info()[['sysname']] == 'Darwin') {
			download_method <- 'curl'
		} else {
			download_method <- 'auto'
		}
		
		# download the ZIPPED data file
		download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
					  destfile = paste0(data_name, '.zip'),
					  method = download_method,
					  quiet = TRUE)
		# and delete the temporary variable
		rm('download_method')
		
		# open a connection to the text file inside the zip
		text_file_connection <- unz(paste0(data_name, '.zip'), paste0(data_name, '.txt'))
		
		# load the data from the text file connection
		data <- read.table(text_file_connection,
						   header = TRUE,
						   sep = ';',
						   na.strings = "?",
						   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
						   )
		# and delete the temporary variable
		rm('text_file_connection')
		# and delete the temporary variable
		file.remove(paste0(data_name, '.zip'))
		
		# filter and further prepare the data
		data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]
		data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
		
		# assign the filtered and prepared data to the final variable
		assign(data_name, data)
		# and delete the temporary variable
		rm('data')
		
		# finally save the digested data to a data file (cache) for better load time on next itterations
		save(list = data_name,
			 file = paste0(data_name, '.RData'))
	}
}

# remove the temporary variable holding the data base name (used across this script)
rm('data_name')


# define a function that plots to PNG whatever is plotted from an anonymous function past in
pngPlot <- function(filename, width, height, plotfunc) {
	
	# create a graphic device for PNG format output and predefined size
	png(filename = paste0(filename, '.png'), width = width, height = height, units = 'px')
	
	# execute the plotting function
	plotfunc()
	
	# close the PNG devide after plotting
	dev.off()
}
