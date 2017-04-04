
# Constructor ----

GOSummarisedRank <- function(godata, metric, map, fdata){
    colnames(godata) <- c('rank', 'n', 'd')
    colnames(fdata) <- c("metric", "rank")
    gsr <- new(
        "GOSummarisedRank",
        table = godata,
        metric = metric,
        GOMap = map,
        featureData = fdata
    )
    validObject(gsr)
    return(gsr)
}
