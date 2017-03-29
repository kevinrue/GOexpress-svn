listMethods <- function(type = NULL){
    GOexpress.methods <- readRDS(
        system.file("internals","GOexpress.methods.rds", package = "GOexpress")
    )
    if (is.null(type)){
        type <- unique(GOexpress.methods$type)
    }

    res <- subset(GOexpress.methods, type == type)

    return(GOexpress.methods)
}
