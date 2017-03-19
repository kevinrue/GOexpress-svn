
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

    if (FALSE){
        errors <- c(
            errors, "error message")
    }

    if (length(errors > 0)){
        return(errors)
    }

    return (TRUE)
}

GOInfo <- setClass(
    "GOInfo",

    slots = list(
        # data.frame, EnsDb
        # class(source) defines how to handle it
        source = "character",
        # NA_character, packageVersion(source)
        # Raise warning if version is different from installed one
        version = "character"
    ),

    prototype = list(
        source = "GO.db",
        version = as.character(packageVersion("GO.db"))
    ),

    validity = .valid.GOInfo
)
