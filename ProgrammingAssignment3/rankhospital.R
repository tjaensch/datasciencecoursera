rankhospital <- function(state, outcome, num = "best"){
        check_valid <- c("heart attack","heart failure","pneumonia")
        
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
                
                if (state %in% subset[,"state"]) 
                {             
                        dFrameFilter <- subset[subset$state==state & subset[outcome] != "Not Available", ]
                        if(is.numeric(num) & nrow(dFrameFilter) <= num) 
                        {
                                NA
                        }
                        else
                        {       
                                index <- order(dFrameFilter$name) # order by name
                                dFrameFilter <- dFrameFilter[index,]
                                index <- order(as.numeric(dFrameFilter[,outcome])) # order by outcome
                                
                                if(is.numeric(num))     dFrameFilter[index,][,"name"][num]
                                else if(num == "best")  dFrameFilter[index,][,"name"][1]
                                else                    tail(dFrameFilter[index,], n=1)[,"name"] # worst
                        }
                }
                else stop("invalid state")   
        }
        else stop("invalid outcome")
}