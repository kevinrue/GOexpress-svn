# nocov start
# multiHtest ----

.valid.multiHtest <- function(object){
    errors <- c()

    if (length(object@pFactor) != 1){
        msg <- sprintf(
            "object@pFactor must be a character vector of length 1: %i",
            length(object@pFactor)
        )
        errors <- c(errors, msg)
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
        method = "character",
        pFactor = "character"
    ),

    validity = .valid.multiHtest
)

# GOMap ----

.valid.GOMap <- function(object){
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

    validity = .valid.GOMap
)

# GOSummarisedRank ----

.valid.GOSummarisedRank <- function(object){
    errors <- c()

    if (any(colnames(object@table) != c('rank','n','d'))){
        msg <- 'Invalid colnames(object@table)'
        errors <- c(errors, msg)
    }

    if (any(colnames(object@featureData) != c('metric','rank'))){
        msg <- 'Invalid colnames(object@featureData)'
        errors <- c(errors, msg)
    }

    if (length(object@metric) != 2){
        msg <- sprintf(
            "object@metric must be a character vector of length 2: %i",
            length(object@metric)
        )
        errors <- c(errors, msg)
    }

    if (length(object@pFactor) != 1){
        msg <- sprintf(
            "object@pFactor must be a character vector of length 1: %i",
            length(object@pFactor)
        )
        errors <- c(errors, msg)
    }

    if (length(errors > 0)){
        return(errors)
    }

    return (TRUE)
}

GOSummarisedRank <- setClass(
    "GOSummarisedRank",

    slots = list(
        table = 'data.frame',
        metric = 'character',
        # FUN = 'function',
        GOMap = 'GOMap',
        featureData = 'data.frame',
        pFactor = 'character'
    ),

    validity = .valid.GOSummarisedRank
)
# nocov end
