
# Constructor ----

GOSummarisedRank <- function(godata, metric, map, fdata, pFactor){
    colnames(godata) <- c('rank', 'n', 'd')
    colnames(fdata) <- c("metric", "rank")
    gsr <- new(
        "GOSummarisedRank",
        table = godata,
        metric = metric,
        GOMap = map,
        featureData = fdata,
        pFactor = pFactor
    )
    validObject(gsr)
    return(gsr)
}
