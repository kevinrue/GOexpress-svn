
setMethod(
    "oneway.test", c("ExpressionSet", "character"),
    function(x, pheno, ..., p.adjust = "BH"){
        stopifnot(pheno %in% colnames(pData(x)))
        .oneway.test(
            x,
            pData(x)[,pheno],
            p.adjust,
            pheno,
            ...
        )
    }
)

# Default method
# x: ExpressionSet
# pdata: factor (length(pdata) == nrow(x))
# p.adjust: character (one of p.adjust.methods)
# pFactor: column name in phenoData slot
.oneway.test <- function(x, pheno, p.adjust, pFactor, ...){
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

    res <- multiHtest(
        table = resTable,
        method = resMethod,
        pFactor = pFactor
    )

    res <- p.adjust(res, p.adjust, ...)

    return(res)
}
