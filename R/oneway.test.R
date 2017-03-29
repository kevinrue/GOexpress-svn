setMethod(
    "oneway.test", c("ExpressionSet", "factor"),
    function(x, pheno, ...){
        stopifnot(length(pheno) == nrow(x))
        .oneway.test(x, pheno, ...)
    }
)

setMethod(
    "oneway.test", c("ExpressionSet", "character"),
    function(x, pheno, ...){
        stopifnot(pheno %in% colnames(pData(x)))
        .oneway.test(x, pData(x)[,pheno], ...)
    }
)

# Default method
# x: ExpressionSet
# pdata: factor (length(pdata) == nrow(x))
.oneway.test <- function(x, pheno, ...){
    stopifnot(is.factor(pheno))

    tablePheno <- table(pheno)
    stopifnot(all(tablePheno != 0))

    levelsPheno <- names(tablePheno)
    message(length(levelsPheno), " levels")
    for (i in seq_along(levelsPheno)){
        message("  - ", levelsPheno[i], " : ", tablePheno[i], " samples")
    }
    message("")

    resTable <- do.call("rbind", apply(
        X = exprs(x),
        MARGIN = 1,
        FUN = function(geneExprs){
            suppressMessages(broom::tidy(stats::oneway.test(
                formula = expr~group,
                data = cbind(
                    expr = geneExprs,
                    group = pheno
                ),
                ...
            )))
        }
    ))
    resMethod <- as.character(resTable[1, "method"])
    resTable[, "method"] <- NULL

    res <- multiHtest(table = resTable, method = resMethod)

    return(res)
}
