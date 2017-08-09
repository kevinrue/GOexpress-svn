setMethod(
    "randomForest", c("ExpressionSet", "character"),
    function(x, pheno, ..., do.trace = 100){
        stopifnot(pheno %in% colnames(pData(x)))
        rf <- .randomForest(x, pData(x)[,pheno], ..., do.trace = do.trace)
        rf$call$x <- substitute(x)
        rf$call$y <- substitute(pheno)
        return(rf)
    }
)

# Default method
# x: ExpressionSet
# pdata: factor (length(pdata) == nrow(x))
.randomForest <- function(x, pheno, ..., do.trace = 100){
    stopifnot(nrow(x) >= 4)
    stopifnot(is.factor(pheno))
    stopifnot(requireNamespace("randomForest"))

    tablePheno <- table(pheno)
    stopifnot(all(tablePheno != 0))

    levelsPheno <- names(tablePheno)
    message(length(levelsPheno), " levels")
    for (i in seq_along(levelsPheno)){
        message("  - ", levelsPheno[i], " : ", tablePheno[i], " samples")
    }
    message("")

    return(randomForest::randomForest(
        t(exprs(x)), y = pheno, importance = TRUE, do.trace = do.trace, ...
    ))
}
