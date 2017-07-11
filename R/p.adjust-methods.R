
setMethod(
    "p.adjust", c("multiHtest"),
    function(x, method = p.adjust.methods, ...){
        x@table[,"p.adjust"] <-
            stats::p.adjust(x@table[,"p.value"], method, ...)
        return(x)
    }
)
