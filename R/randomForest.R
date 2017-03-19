setMethod(
    "randomForest", c("ExpressionSet", "factor"),
    function(x, pheno){
        stopifnot(length(pheno) == nrow(x))
        .randomForest(x, pheno)
    }
)

setMethod(
    "randomForest", c("ExpressionSet", "character"),
    function(x, pheno){
        stopifnot(pheno %in% colnames(pData(x)))
        .randomForest(x, pData(x)[,pheno])
    }
)

# Default method
# x: ExpressionSet
# pdata: factor (length(pdata) == nrow(x))
.randomForest <- function(x, pheno, ..., do.trace = TRUE){
    stopifnot(nrow(x) >= 4)
    stopifnot(is.factor(pheno))

    tablePheno <- table(pheno)
    stopifnot(all(tablePheno != 0))

    levelsPheno <- names(tablePheno)
    message(length(levelsPheno), " levels")
    for (i in seq_along(levelsPheno)){
        message("  - ", levelsPheno[i], " : ", tablePheno[i], " samples")
    }
    message("")

    return(randomForest::randomForest(
        t(exprs(x)), y = pheno, importance=TRUE, ...
    ))
}
