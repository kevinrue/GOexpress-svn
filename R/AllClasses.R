
.valid.multiHtest <- function(object){
    errors <- c()

    if (FALSE){
        errors <- c(
            errors, "error message")
    }

    if (length(errors > 0)){
        return(errors)
    }

    return (TRUE)
}

multiHtest <- setClass(
    "multiHtest",

    slots = list(
        table = "data.frame",
        method = "character"
    ),

    validity = .valid.multiHtest
)

.valid.GOInfo <- function(object){
    errors <- c()

    if (nrow(object@table) == 0){
        msg <- "The mapping data.frame must include at least one row"
        errors <- c(errors, msg)
    }

    if (ncol(object@table) != 2){
        msg <- sprintf(
            "The mapping data.frame must include exactly 2 columns: %i",
            ncol(object@table)
        )
        errors <- c(errors, msg)
    }

    if (length(errors > 0)){
        return(errors)
    }

    return (TRUE)
}

GOMap <- setClass(
    "GOMap",

    slots = list(
        table = "data.frame",
        source = "character"
    ),

    prototype = list(
        source = NA_character_
    ),

    validity = .valid.GOInfo
)
