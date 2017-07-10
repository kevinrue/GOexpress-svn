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
    "ggFeature",
    signature = c("eset"),
    function(
        eset, feature,
        x = NULL, assay = "exprs", group = NULL,
        colour = NULL, shape = NULL, fill = NULL, facet = NULL
    )
        standardGeneric("ggFeature")
)

setGeneric(
    "smoothExpression",
    signature = c("eset", "feature"),
    function(
        eset, feature, x, group = NULL, ...,
        assay = "exprs", alpha = GeomSmooth$default_aes$alpha,
        scales = "fixed"
    )
        standardGeneric("smoothExpression")
)

setGeneric("nrow")
setGeneric("subset")
