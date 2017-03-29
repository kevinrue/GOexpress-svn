# multiHtest ----

setMethod(
    "show", "multiHtest",
    function(object){
        cat("Class: multiHtest\n")
        cat("@table:\n")
        print(head(object@table))
        cat(sprintf("%i more rows...\n", nrow(object@table) - 6))
        cat("\n")
        cat(sprintf("@method: %s", object@method))
        return(NULL)
    }
)
