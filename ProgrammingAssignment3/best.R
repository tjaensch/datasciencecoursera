best <- function(state, outcome) {
        check_valid <- c("heart attack","heart failure","pneumonia")
        # Check if the outcome is a valid one
        if(outcome %in% check_valid)
        {
                file <- read.csv(file="outcome-of-care-measures.csv",colClasses = "character")
                subset <- file[c(2, 7, 11, 17, 23)]
                # 2 Hospital Name
                # 7 State
                # 11 Heart Attack
                # 17 Heart Failure
                # 23 Pneumonia
                names(subset) <- c("name","state","heart attack","heart failure","pneumonia")
                
                #Check if valid state
                if (state %in% subset[,"state"]) 
                {       # get where the valid rows with the information about the given state       
                        validData <- subset[,"state"] == state   &   subset[,outcome] != "Not Available"              
                        minPos <- which.min(subset[,outcome][validData])   # give the position of the lower outcome rate
                        name <- subset[,"name"][validData][minPos]         # get hospital name
                } else stop("invalid state")       
        }
        else stop("invalid outcome")
        name
}