setGeneric(
    "randomForest",
    signature = c("x", "pheno"),
    function(x, pheno, ..., do.trace = 100)
        standardGeneric("randomForest")
)

setGeneric(
    "oneway.test",
    signature = c("x", "pheno"),
    function(x, pheno, ..., p.adjust = "BH")
        standardGeneric("oneway.test")
)

setGeneric(
    "p.adjust",
    signature = c("x"),
    function(x, method = p.adjust.methods, ...)
        standardGeneric("p.adjust")
)

setGeneric(
    "GOrank",
    signature = c("x", "map"),
    function(x, map, ...)
        standardGeneric("GOrank")
)

setGeneric(
    "ggfy",
    signature = c("eset"),
    function(
        eset, pheno = NULL, feature = NULL, assay = "exprs",
        suffixes = c(".pheno",".feature")
    )
        standardGeneric("ggfy")
)

setGeneric(
    "smoothFeature",
    signature = c("eset"),
    function(
        eset, x, group = NULL, ...,
        assay = "exprs", alpha = GeomSmooth$default_aes$alpha,
        scales = "fixed"
    )
        standardGeneric("smoothFeature")
)

setGeneric("nrow")
setGeneric("subset")

setGeneric(
    "topFeatures",
    signature = c("x"),
    function(x, n = 6L, value = "MeanDecreaseGini")
        standardGeneric("topFeatures")
)
