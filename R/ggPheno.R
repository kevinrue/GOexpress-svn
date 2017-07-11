
setMethod(
    "ggPheno", c("ExpressionSet"),
    function(
        eset,
        x = NULL, assay = "exprs", group = NULL,
        colour = NULL, shape = NULL, fill = NULL, facet = NULL
    ){
        # Fetch feature identifiers
        fnames <- featureNames(eset)
        # Fetch expression data
        exprsMat <- assayData(eset)[[assay]][fnames,]
        # Sample by feature data in long format
        if (length(fnames) == 1){
            ggData <- data.frame(
                feature = fnames,
                sample = sampleNames(eset),
                y = exprsMat,
                row.names = NULL,
                stringsAsFactors = FALSE
            )
            colnames(ggData)[3] <- assay
        } else {
            ggData <- melt(
                exprsMat,
                varnames = c("feature", "sample"),
                value.name = assay
            )
        }
        ggData[, x] <- pData(eset)[ggData$sample, x]
        ggData[, group] <- pData(eset)[ggData$sample, group]
        ggData[, colour] <- pData(eset)[ggData$sample, colour]
        ggData[, shape] <- pData(eset)[ggData$sample, shape]
        ggData[, fill] <- pData(eset)[ggData$sample, fill]
        ggData[, facet] <- pData(eset)[ggData$sample, facet]
        return(ggData)
    }
)
