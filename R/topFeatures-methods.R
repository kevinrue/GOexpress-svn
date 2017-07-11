# randomForest ----

setMethod(
    "topFeatures", "randomForest",
    function(x, n = 6L, value = "MeanDecreaseGini"){
        ii <- importance(x)
        oo <- order(ii[, value], decreasing = TRUE)
        return(head(ii[oo,], n))
    }
)
