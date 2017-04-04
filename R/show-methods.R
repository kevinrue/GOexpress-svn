# multiHtest ----

setMethod(
    "show", "multiHtest",
    function(object){
        cat("Class: multiHtest\n")
        cat("@table:\n")
        print(head(object@table))
        if (nrow(object@table) > 6)
            cat(sprintf("%i more rows...\n", nrow(object@table) - 6))
        cat("\n")
        cat(sprintf("@method: %s\n", object@method))
        cat(sprintf("@pFactor: %s", object@pFactor))
        return(NULL)
    }
)

# GOMap ----

setMethod(
    "show", "GOMap",
    function(object){
        cat("Class: GOMap\n")
        cat("@table:\n")
        print(head(object@table))
        if (nrow(object@table) > 6)
            cat(sprintf("%i more rows...\n", nrow(object@table) - 6))
        cat("\n")
        cat(sprintf("source:\n- %s", paste(object@source, collapse = "\n- ")))
        # cat(sprintf("@source:\n- %s", object@source))
        return(NULL)
    }
)

# GOSummarisedRank ----

setMethod(
    "show", "GOSummarisedRank",
    function(object){
        cat("Class: GOSummarisedRank\n")
        cat("@table:\n")
        print(head(object@table))
        if (nrow(object@table) > 6)
            cat(sprintf("%i more rows...\n", nrow(object@table) - 6))
        cat("\n")
        om <- object@metric
        cat(sprintf("@metric: %s [%s]\n", om[1], om[2]))
        cat(sprintf("@pFactor: %s\n", object@pFactor))
        cat("Other slots: @featureData, @GOMap")
        return(NULL)
    }
)
