setGeneric(
    "randomForest",
    signature = c("x", "pheno"),
    function(x, pheno, ...)
        standardGeneric("randomForest")
)

setGeneric(
    "oneway.test",
    signature = c("x", "pheno"),
    function(x, pheno, ...)
        standardGeneric("oneway.test")
)
