cluster_GO <- function(
    go_id, result, eSet, f=result$factor, subset=NULL,
    method_dist="euclidean", method_hclust="average", cex=0.8,
    main=paste(go_id, result$GO[result$GO$go_id == go_id, "name_1006"]),
    xlab="Distance", cex.main=1, main.Lsplit=NULL, ...){
    .Defunct('New S4 method required')
}

expression_plot <- function(
    gene_id, result, eSet, x_var, f=result$factor, subset=NULL,
    xlab=x_var, ylab="log2(cpm)", ylim=range(exprs(eSet)),
    col.palette="Accent",
    col=brewer.pal(n=length(levels(pData(eSet)[,f])), name=col.palette),
    level=0.95, title=NULL, title.size=2, axis.title.size=20,
    axis.text.size=15, axis.text.angle=0,
    legend.title.size=20, legend.text.size=15, legend.key.size=30){
    .Defunct('New S4 method required')
}

expression_plot_symbol <- function(
    gene_symbol, result, eSet, x_var, f=result$factor, subset=NULL,
    index=0, xlab=x_var, ylab="log2(cpm)", ylim=range(exprs(eSet)),
    col.palette="Accent",
    col=brewer.pal(n=length(levels(pData(eSet)[,f])), name=col.palette),
    level=0.95, titles=c(), title.size=2, axis.title.size=20,
    axis.text.size=15, axis.text.angle=0,
    legend.title.size=20, legend.text.size=20, legend.key.size=30){
    .Defunct('New S4 method required')
}

expression_profiles <- function(
    gene_id, result, eSet, x_var, seriesF, subset=NULL,
    colourF=result$factor, linetypeF=colourF, line.size=1.5,
    xlab=x_var, ylab="log2(cpm)", ylim=range(exprs(eSet)),
    col.palette="Accent",
    col=brewer.pal(
        n=length(levels(pData(eSet)[,colourF])),
        name=col.palette),
    lty=1:length(levels(pData(eSet)[,linetypeF])),
    title=NULL, title.size=2, axis.title.size=20,
    axis.text.size=15, axis.text.angle=0,
    legend.title.size=20, legend.text.size=15,
    legend.key.size=30){
    .Defunct('New S4 method required')
}

expression_profiles_symbol <- function(
    gene_symbol, result, eSet, x_var, seriesF, subset=NULL,
    colourF=result$factor, linetypeF=colourF, line.size=1.5,
    index=0, xlab=x_var, ylab="log2(cpm)", ylim=range(exprs(eSet)),
    col.palette="Accent",
    col=brewer.pal(
        n=length(levels(pData(eSet)[,colourF])), name=col.palette),
    lty=1:length(levels(pData(eSet)[,linetypeF])),
    titles=c(), title.size=2, axis.title.size=20,
    axis.text.size=15, axis.text.angle=0,
    legend.title.size=20, legend.text.size=15,
    legend.key.size=30){
    .Defunct('New S4 method required')
}

heatmap_GO <- function(
    go_id, result, eSet, f=result$factor, subset=NULL, gene_names=TRUE,
    NA.names=FALSE, margins=c(7 ,5),
    scale="none", cexCol=1.2, cexRow=0.5,
    labRow=NULL,
    cex.main=1, trace="none", expr.col=bluered(75),
    row.col.palette="Accent",
    row.col=c(),
    main=paste(
        go_id, result$GO[result$GO$go_id == go_id,"name_1006"]
        ),
    main.Lsplit=NULL,
    ...){
    .Defunct('New S4 method required')
}

hist_scores <- function(
    result,
    main=paste(
        "Distribution of average scores in",
        deparse(substitute(result))), xlab="Average score",
    ...){
    .Defunct('New S4 method required')
}

list_genes <- function(go_id, result, data.only=TRUE){
    .Defunct('New S4 method required')
}

plot_design <- function(
    go_id, result, eSet, subset=NULL,
    factors=colnames(pData(eSet)), main="", main.Lsplit=NULL, ...){
    .Defunct('New S4 method required')
}

pValue_GO = function(
    result, N=1000, ranked.by=result$rank.by, rank.by='P',
    FUN.GO=result$FUN.GO){
    .Defunct('New S4 method required')
}

quantiles_scores <- function(
    result, probs=c(0.9, 0.95, 0.99, 0.999, 0.9999), quartiles=FALSE){
    .Defunct('New S4 method required')
}

rerank <- function(result, rank.by = 'rank'){
    .Defunct('New S4 method required')
}

subEset <- function(eSet, subset=list()){
    .Defunct('subset')
}

subset_scores <- function(result, ...){
    .Defunct('New S4 method required')
}

table_genes <- function(go_id, result, data.only=FALSE, order.by='rank'){
    .Defunct('New S4 method required')
}
