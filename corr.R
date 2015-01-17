corr <- function(directory, threshold=0) {
filenames<- list.files(directory, pattern="*.csv", full.names=TRUE)
cor_vector<- c()
for (i in filenames) {
	my_dataframe <- read.csv(i)
	good <- complete.cases(my_dataframe)
	if (sum(good)>threshold) {
	clean_dataframe<-my_dataframe[good,]
	sulfate_vector<-c(clean_dataframe$sulfate)
	nitrate_vector<-c(clean_dataframe$nitrate)
	my_cor<-cor(sulfate_vector, nitrate_vector)
	cor_vector<-c(cor_vector,my_cor)
	}
	}
return (cor_vector)
}
