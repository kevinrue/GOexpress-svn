# multiHtest ----

setMethod(
    "head", "multiHtest",
    function(x, n = 6L, ...){
        return(head(x@table, n, ...))
    }
)
