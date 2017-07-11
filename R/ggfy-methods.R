
setMethod(
    "ggfy", c("ExpressionSet"),
    function(
        eset, pheno = NULL, feature = NULL, assay = "exprs",
        suffixes = c(".pheno",".feature")
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
        if (!is.null(pheno)){
            ggData <- merge(
                ggData, pData(eset)[,pheno, drop = FALSE],
                by.x = "sample", by.y = "row.names",
                sort = FALSE
            )
        }
        if (!is.null(feature)){
            ggData <- merge(
                ggData, fData(eset)[,feature, drop = FALSE],
                by.x = "feature", by.y = "row.names",
                sort = FALSE, suffixes = suffixes
            )
        }
        return(ggData)
    }
)
