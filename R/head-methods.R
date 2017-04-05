# multiHtest ----

setMethod(
    "head", "multiHtest",
    function(x, n = 6L, ...){
        x@table <- head(x@table, n, ...)
        return(x)
    }
)
