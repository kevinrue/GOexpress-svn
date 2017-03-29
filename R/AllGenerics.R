setGeneric(
    "randomForest",
    signature = c("x", "pheno"),
    function(x, pheno, ..., do.trace = TRUE)
        standardGeneric("randomForest")
)

setGeneric(
    "oneway.test",
    signature = c("x", "pheno"),
    function(x, pheno, ...)
        standardGeneric("oneway.test")
)

setGeneric(
    "p.adjust",
    signature = c("x"),
    function(x, method = p.adjust.methods, ...)
        standardGeneric("p.adjust")
)
