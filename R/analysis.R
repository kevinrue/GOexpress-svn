GO_analyse <- function(
    eSet, f, subset=NULL, biomart_name = "ENSEMBL_MART_ENSEMBL",
    biomart_dataset="", microarray="",
    method="randomForest", rank.by="rank", do.trace=100, ntree=1000,
    mtry=ceiling(2*sqrt(nrow(eSet))), GO_genes=NULL, all_GO=NULL,
    all_genes=NULL, FUN.GO=mean, ...){
    .Defunct('GOrank')
}
