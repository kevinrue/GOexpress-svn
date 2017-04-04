
# Constructor ----

GOMap <- function(table, source = NA_character_){
    gm <- new(
        "GOMap",
        table = table,
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
