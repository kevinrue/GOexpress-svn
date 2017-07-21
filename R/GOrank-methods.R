# Ideas:
# exclude GO categories with 0 annotated features detected
# exclude GO categories with < x% annotated features detected
# ggplot(goTable) + geom_histogram(aes(d/n))
# Investigate relation between GO size and expected average rank
# ggplot(goTable) + geom_point(aes(log10(n), rank))

# multiHtest ----

setMethod(
    "GOrank", c("multiHtest", "GOMap"), function(x, map, ...){
        # NOTE: rank by _decreasing_ metric
        message("TODO: count of features not found in GOMap")
        message("TODO: count of GO categories without genes in data set")
        metric <- 'statistic'
        # Get the metric
        geneMetric <- x@table[,metric]
        names(geneMetric) <- rownames(x@table)
        # Pass the named metric to the core function
        gor <- .GOrank(geneMetric, map, ...)
        gor@metric <- c(metric, 'multiHtest')
        gor@pFactor <- x@pFactor
        return(gor)
    }
)

# randomForest ----

setMethod(
    "GOrank", c("randomForest", "GOMap"), function(x, map, ...){
        # NOTE: rank by _decreasing_ metric
        message("TODO: count of features not found in GOMap")
        message("TODO: count of GO categories without genes in data set")
        metric <- 'MeanDecreaseGini'
        # Get the metric
        geneMetric <- randomForest::importance(x)[,metric]
        names(geneMetric) <- rownames(randomForest::importance(x))
        # Pass the named metric to the core function
        gor <- .GOrank(geneMetric, map, ...)
        gor@metric <- c(metric, 'randomForest')
        gor@pFactor <- as.character(x$call$y)
        return(gor)
    }
)

# Main ----

.GOrank <- function(geneMetric, map, ...){
    # List of unique features in annotations
    fdata <- data.frame(
        row.names = unique(map@table[,'feature'])
    )
    # Set default values for annotated features absent in data
    fdata[,'metric'] <- NA_integer_
    fdata[,'rank'] <- (length(geneMetric) + 1)
    # Set metric and rank for features in data set
    namesMetric <- names(geneMetric)
    fdata[namesMetric,'metric'] <- geneMetric
    fdata[namesMetric,'rank'] <-
        rank(-fdata[namesMetric,'metric'], ties.method='min')
    # Calculate average rank for each GO term
    resTable <- merge(
        x = map@table,
        y = fdata[,'rank', drop = FALSE],
        by.x = "feature", by.y = "row.names", all.x = TRUE
    )
    # TODO: allow custom function to summarise ranks
    goRank <- tapply(resTable[,'rank'], resTable[,'go'], 'mean')
    # Count total annotated features by GO term
    # totalFeatures <- with(map@table, tapply(feature, go, 'length'))
    totalFeatures <- tapply(map@table[,'feature'], map@table[,'go'], 'length')
    # Count feature annotated to GO term in data set
    # (at this stage we can release some memory by reducing the map table)
    resTable <- resTable[
        resTable[,'feature'] %in% names(geneMetric),c('go','feature')]
    dataFeatures <- tapply(resTable[,'feature'], resTable[,'go'], 'length')
    # Combine information (ensure matched order of data)
    goIds <- unique(map@table[,'go'])
    goTable <- data.frame(
        rank = goRank[goIds],
        n = totalFeatures[goIds],
        d = 0,
        row.names = goIds
    )
    goTable[names(dataFeatures),'d'] <- dataFeatures
    # Order tables by (average) rank
    fdata <- fdata[order(fdata[,'rank']),]
    goTable <- goTable[order(goTable[,'rank']),]
    # Re-type rank as integer
    storage.mode(fdata$rank) <- "integer"
    storage.mode(goTable$d) <- "integer"
    # Return the output object
    gor <- GOSummarisedRank(
        godata = goTable,
        metric = rep(NA_character_, 2),
        map = map,
        fdata = fdata,
        pFactor = NA_character_
    )
    return(gor)
}
