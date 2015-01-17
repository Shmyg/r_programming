pollutantmean <- function(directory,  pollutant, id = 1:332) {
## Setting directory to default if missing
if (missing(directory)) {
	directory="/home/shmyg/work/specdata"
	}
## Empty vector to hold pollutant values
values <- c()
## Looping through all specified files
for (i in id) {
	filename <- sprintf("%03d.csv", i)
	filepath <- file.path(directory, filename)
	my_dataframe <- read.csv(filepath)
	## Removing NA values and copying pollutant data
	new_values <- my_dataframe[!is.na(my_dataframe[, pollutant]), pollutant]
	## Extending vector
	values <- c(values, new_values)
	}
	return (mean(values))
}
