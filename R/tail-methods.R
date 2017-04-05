# multiHtest ----

setMethod(
    "tail", "multiHtest",
    function(x, n = 6L, ...){
        x@table <- tail(x@table, n, ...)
        return(x)
    }
)
