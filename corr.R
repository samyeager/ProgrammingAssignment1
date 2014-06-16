## Takes a directory of data files and a threshold for complete cases 
## and calculates the correlation between sulfate and nitrate for monitor 
## locations where the number of completely observed cases (on all variables)
## is greater than the threshold.

## Returns a numeric vector of correlations.
## If no monitors meet the threshold requirement, then the function returns
## a numeric vector of length 0.

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0


corr <- function(directory, threshold = 0) {
    
    cases <- complete(directory)
    path <- paste0(getwd(), "/", directory, "/")
    data <- numeric()
    
    cases <- cases[cases[["nobs"]] > threshold, ]
    for(i in cases[["id"]]) {
        name <- paste0(formatC(i, width = 3, flag = "0"), ".csv")
        filename <- paste0(path, name)
        filedata <- read.csv(filename)
        filedata <- filedata[complete.cases(filedata), ]
        cr <- cor(filedata[["sulfate"]], filedata[["nitrate"]])
        data <- c(data, cr)
    }
    
    data
}