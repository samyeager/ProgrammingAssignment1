## Reads a directory full of files and reports the number of 
## completely observed cases in each data file.

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Returns a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332) {
    path <- paste0(getwd(), "/", directory, "/")
    nobs <- integer()
    
    for (i in id) {
        name <- paste0(formatC(i, width = 3, flag = "0"), ".csv")
        filename <- paste0(path, name)
        filedata <- read.csv(filename)
        cases <- complete.cases(filedata)        
        nobs <- c(nobs, sum(cases))        
    }
    data <- data.frame(id, nobs)
    data
}