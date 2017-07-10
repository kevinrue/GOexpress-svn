# TODO: logical 'keep.names' to preserve pData column names in output d.f
setMethod(
    "ggFeature", c("ExpressionSet"),
    function(
        eset, feature,
        x = NULL, assay = "exprs", group = NULL,
        colour = NULL, shape = NULL, fill = NULL, facet = NULL
    ){
        stopifnot(length(feature) > 0)
        # Require feature to be all in featureNames
        # TODO: support fData columns as a named list
        stopifnot(all(feature %in% featureNames(eset)))
        # Fetch expression data
        exprsMat <- assayData(eset)[[assay]][feature,]
        # Sample by feature data in long format
        if (length(feature) == 1){
            ggData <- data.frame(
                feature = feature,
                sample = sampleNames(eset),
                y = exprsMat,
                row.names = NULL,
                stringsAsFactors = FALSE
            )
        } else {
            ggData <- melt(
                exprsMat,
                varnames = c("feature", "sample"),
                value.name = "y"
            )
        }
        ggData[, "x"] <- pData(eset)[ggData$sample, x]
        ggData[, "group"] <- pData(eset)[ggData$sample, group]
        ggData[, "colour"] <- pData(eset)[ggData$sample, colour]
        ggData[, "shape"] <- pData(eset)[ggData$sample, shape]
        ggData[, "fill"] <- pData(eset)[ggData$sample, fill]
        ggData[, "facet"] <- pData(eset)[ggData$sample, facet]
        return(ggData)
    }
)
