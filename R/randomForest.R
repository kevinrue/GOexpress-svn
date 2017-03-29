setMethod(
    "randomForest", c("ExpressionSet", "factor"),
    function(x, pheno, ..., do.trace = TRUE){
        stopifnot(length(pheno) == nrow(x))
        .randomForest(x, pheno, ..., do.trace = TRUE)
    }
)

setMethod(
    "randomForest", c("ExpressionSet", "character"),
    function(x, pheno, ..., do.trace = TRUE){
        stopifnot(pheno %in% colnames(pData(x)))
        .randomForest(x, pData(x)[,pheno], ..., do.trace = TRUE)
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
