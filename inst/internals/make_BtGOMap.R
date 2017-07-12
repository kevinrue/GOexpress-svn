require(biomaRt)

mart = useMart(
    biomart = 'ENSEMBL_MART_ENSEMBL',
    dataset = 'btaurus_gene_ensembl',
    host = 'feb2014.archive.ensembl.org'
)

bm <- getBM(c('go_id','ensembl_gene_id'), mart = mart)
dim(bm)

colnames(bm)

bm.sub <- subset(bm, ensembl_gene_id != '' & go_id != '')
dim(bm.sub)

# Keep only annotations for features in demo data set (no!)
# Requires makeAlvMac.R script run first
# bm.sub <- subset(bm.sub, feature %in% rownames(Bt.logCPM))

bm.source <- c(
    'biomaRt',
    'btaurus_gene_ensembl',
    'feb2014.archive.ensembl.org',
    'ensembl_gene_id',
    'go_id'
)

Bt.GOMap <- GOMap(bm.sub, bm.source)

save(Bt.GOMap, file = 'data/Bt.GOMap.rda')

tools::resaveRdaFiles('data/Bt.GOMap.rda')
