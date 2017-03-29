# multiHtest ----

setMethod(
    "tail", "multiHtest",
    function(x, n = 6L, ...){
        return(tail(x@table, n, ...))
    }
)
