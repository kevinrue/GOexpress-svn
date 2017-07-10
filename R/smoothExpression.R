setMethod(
    "smoothExpression", c("ExpressionSet", "character"),
    function(
        eset, feature, x, group = NULL, ...,
        assay = "exprs", alpha = GeomSmooth$default_aes$alpha,
        scales = "fixed"
    ){
        ggData <- ggFeature(
            eset, feature,
            x = x, group = group, assay = assay)
        gg <- ggplot(ggData, aes_string("x", "y"))
        if (!is.null(group)){
            gg <- gg +
                geom_smooth(
                    aes_string(fill = "group", colour = "group"),
                    alpha = alpha,
                    ...
                ) +
                labs(group = group)
        } else {
            gg <- gg + geom_smooth(...)
        }
        gg <- gg + labs(y = assay, x = x)
        if (length(feature) == 1){
            # TODO: subtitle,
            gg <- gg + labs(title = feature)
        } else {
            # TODO: allow choice between facet_[wrap|grid]
            gg <- gg + facet_wrap(~ feature, scales = scales)
        }
        return(gg)
    }
)

# Default method
# x: ExpressionSet
# pdata: factor (length(pdata) == nrow(x))
# .randomForest <- function(x, pheno, ..., do.trace = 100){
#     stopifnot(nrow(x) >= 4)
#     stopifnot(is.factor(pheno))
#
#     tablePheno <- table(pheno)
#     stopifnot(all(tablePheno != 0))
#
#     levelsPheno <- names(tablePheno)
#     message(length(levelsPheno), " levels")
#     for (i in seq_along(levelsPheno)){
#         message("  - ", levelsPheno[i], " : ", tablePheno[i], " samples")
#     }
#     message("")
#
#     return(randomForest::randomForest(
#         t(exprs(x)), y = pheno, importance = TRUE, do.trace = do.trace, ...
#     ))
# }
