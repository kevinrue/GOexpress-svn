
# subset : ExpressionSet ----

setMethod(
    "subset", "ExpressionSet", function(x, pheno, feature, ...){
        sampleExpr <- substitute(pheno)
        featureExpr <- substitute(feature)

        keepSamples <- TRUE
        if (!missing(pheno)){
            # message('Apply pData subset')
            # print(str(sampleExpr)); print(head(pData(x)))
            keepSamples <- eval(sampleExpr, pData(x))
        }

        keepFeatures <- TRUE
        if (!missing(feature)){
            # message('Apply fData subset')
            # print(str(featureExpr)); print(head(fData(x)))
            keepFeatures <- eval(featureExpr, fData(x))
        }

        # print(keepSamples); print(keepFeatures)

        newX <- x[keepFeatures, keepSamples]
        return(newX)
    }
)

# subset : GOMap ----

setMethod(
    "subset",
    signature = "GOMap",
    function(x, go = NULL, feature = NULL){
        subTable <- x@table
        if (!is.null(go)){
            subTable <- subTable[subTable[,"go"] %in% go,]
        }
        if (!is.null(feature)){
            subTable <- subTable[subTable[,"feature"] %in% feature,]
        }
        x@table <- subTable
        return(x)
    }
)
