complete <- function(directory, id = 1:332) {
## Initializing result dataframe
result_df <- data.frame (id=numeric(), nobs=numeric())
## Initializing counter for result set
j <- 1
for (i in id) {
	filename <- sprintf("%03d.csv", i)
	filepath <- file.path(directory, filename)
	my_dataframe <- read.csv(filepath)
	good <- complete.cases(my_dataframe)
	rownum <- nrow(my_dataframe[good,])	
	result_df[j,] <- list(i, rownum)
	j <- j+1
	}
	return (result_df)
}
