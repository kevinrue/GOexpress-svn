# randomForest ----

setMethod(
    "topFeatures", "randomForest",
    function(x, n = 6L, value = "MeanDecreaseGini"){
        ii <- importance(x)
        oo <- order(ii[, value], decreasing = TRUE)
        return(head(ii[oo,], n))
    }
)

# multiHtest ----

setMethod(
    "topFeatures", "multiHtest",
    function(x, n = 6L){
        ii <- x@table
        oo <- order(ii[, "statistic"], decreasing = TRUE)
        return(head(ii[oo,], n))
    }
)
