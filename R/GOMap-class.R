
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

# biomaRt ----

# nocov start
GOMap.biomart <- function(
    dataset, feature = "ensembl_gene_id", ..., go = "go_id",
    host = "www.ensembl.org", biomart = "ENSEMBL_MART_ENSEMBL"
){
    stopifnot(requireNamespace("biomaRt"))
    mart <- biomaRt::useMart(biomart, dataset, host = host, ...)
    bm_res <- biomaRt::getBM(attributes = c(go, feature), mart = mart)
    keep <- (nchar(bm_res[,1]) > 0 & nchar(bm_res[,2]) > 0)
    bm_filt <- bm_res[keep,]
    gm <- GOMap(bm_filt, source = c("biomaRt", dataset, host, go, feature))
    return(gm)
}
# nocov end

# nrow ----

setMethod(
    "nrow", 'GOMap', function(x){
        dd <- nrow(x@table)
        names(dd) <- 'annotations'
        return(dd)
    }
)
