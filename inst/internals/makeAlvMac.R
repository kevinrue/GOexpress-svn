library(edgeR)
library(limma)

countFolder <- "/Users/kevin/Dropbox/Bioconductor/AlvMac"

countFiles <- list.files(countFolder)

pSplit <- as.data.frame(strsplit2(countFiles, "_"))
colnames(pSplit) <- c("Animal","Infection","Timepoint","Strand")

pSplit[,"Strand"] <- NULL

pSplit[,"Timepoint"] <- factor(pSplit[,"Timepoint"], c('0H','2H','6H','24H','48H'))

pSplit[,"Time"] <- as.numeric(gsub("H", "", pSplit[,"Timepoint"]))

pSplit[,"ID"] <- gsub("_S$", "", countFiles)

pSplit[,"files"] <- countFiles

# pSplit <- subset(pSplit, Animal %in% keepAnimals)

RG <- readDGE(
    pSplit,
    countFolder,
    c(1, 3),
    paste(pSplit[,"Infection"], pSplit[,"Timepoint"], sep = "_"),
    pSplit[,"ID"])

RG.cpm <- cpm(RG)
avgCpm <- rowMeans(RG.cpm)
plot(density(log10(avgCpm)))

# For normalisation filter, retain genes with 10 animals above 1 CPM
keep <- rowSums(cpm(RG) > 1) >= 10
table(keep)

RG.detected <- RG[keep, , keep.lib.sizes = FALSE]

RG.detected <- calcNormFactors(RG.detected)

# Restrict data set to fit an acceptable Bioconductor package size ----

# order remaining features by decreasing expression level
oo <- order(avgCpm[keep], decreasing = TRUE)
# Retain the top 4,000 highest expressed features
RG.top <- RG.detected[oo,][1:4E3,]

# Retain only certains Animal and Timepoints

keepAnimals <- c("N1178", "N121", "N138",  "N158R", "N1855")
keepTimepoints <- c('2H','24H','48H')

RG.subset <- RG.top[
    ,
    RG.top$samples$Timepoint %in% keepTimepoints &
        RG.top$samples$Animal %in% keepAnimals
]



avgCPM <- rowMeans(cpm(RG.subset))
plot(density(log2(avgCPM)))
table(avgCPM > 10)

Bt.logCPM <- cpm(RG.subset, log = TRUE)[avgCPM > 10,]
dim(Bt.logCPM); class(Bt.logCPM)

save(Bt.logCPM, file="data/Bt.logCPM.rda")
tools::resaveRdaFiles("data/Bt.logCPM.rda")

Bt.pheno <- RG.subset$samples
Bt.pheno$files <- NULL
Bt.pheno$lib.size <- NULL
Bt.pheno$norm.factors <- NULL

lapply(Bt.pheno, class)

save(Bt.pheno, file="data/Bt.pheno.rda")
tools::resaveRdaFiles("data/Bt.pheno.rda")

# zz <- file("inst/extdata/alvmac_norm.csv.gz",'rt')  # open an input file connection
# dat = read.csv(zz, row.names = 1)
