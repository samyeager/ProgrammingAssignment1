## Collect the pollutant data from 332x .csv files.

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    path <- paste0(getwd(), "/", directory, "/")
    data <- NULL
    
    for (i in id) {
        name <- paste0(formatC(i, width = 3, flag = "0"), ".csv")
        filename <- paste0(path, name)
        filedata <- read.csv(filename)
        if(is.null(data)) {
            data <- filedata
        } else {
            data <- rbind(data, filedata)
        }
    }
    data_mean <- mean(data[[pollutant]], na.rm = TRUE)
    data_mean
}