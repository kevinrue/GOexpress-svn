
# Constructor ----

GOMap <- function(table, source = NA_character_){
    colnames(table) <- c("go", "feature")
    idxGOBlank <- (table[,'go'] == '')
    idxFeatureBlank <- (table[,'feature'] == '')
    idxDuplicate <- duplicated(table[,c('go', 'feature')])
    if (sum(idxGOBlank) > 0){
        message(sprintf(
            "%i annotations with blank GO dropped", sum(idxGOBlank)
        ))
    }
    if (sum(idxFeatureBlank) > 0){
        message(sprintf(
            "%i annotations with blank feature dropped", sum(idxFeatureBlank)
        ))
    }
    if (sum(idxDuplicate) > 0){
        message(sprintf(
            "%i duplicate annotations dropped", sum(idxDuplicate)
        ))
    }
    mapTable <- table[
        !idxGOBlank &
            !idxFeatureBlank &
            !idxDuplicate,
    ]
    gm <- new(
        "GOMap",
        table = mapTable,
        source = source
    )
    colnames(gm@table) <- c("go", "feature")
    validObject(gm)
    return(gm)
}

# nrow ----

setMethod(
    "nrow", 'GOMap', function(x){
        dd <- nrow(x@table)
        names(dd) <- 'annotations'
        return(dd)
    }
)
