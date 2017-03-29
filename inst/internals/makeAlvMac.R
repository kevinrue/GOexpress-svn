library(edgeR)
library(limma)

countFolder <- "/Users/kevin/Dropbox/Bioconductor/AlvMac"

countFiles <- list.files(countFolder)

pSplit <- as.data.frame(strsplit2(countFiles, "_"))
colnames(pSplit) <- c("Animal","Infection","Timepoint","Strand")

pSplit[,"Strand"] <- NULL

pSplit[,"Time"] <- as.numeric(gsub("H", "", pSplit[,"Timepoint"]))

pSplit[,"ID"] <- gsub("_S$", "", countFiles)

pSplit[,"files"] <- countFiles

keepAnimals <- sample(levels(pSplit[,"Animal"]), 5)

pSplit <- subset(pSplit, Animal %in% keepAnimals)

RG <- readDGE(
    pSplit,
    countFolder,
    c(1, 3),
    paste(pSplit[,"Infection"], pSplit[,"Timepoint"], sep = "_"),
    pSplit[,"ID"])

RG.cpm <- cpm(RG)
avgCpm <- rowMeans(RG.cpm)
plot(density(log10(avgCpm)))

keep <- rowSums(cpm(RG) > 1) >= 10
table(keep)

RG.detected <- RG[keep, , keep.lib.sizes = FALSE]

RG.detected <- calcNormFactors(RG.detected)

avgCPM <- rowMeans(cpm(RG.detected))
plot(density(log2(avgCPM)))
table(avgCPM > 10)

Bt.logCPM <- cpm(RG.detected, log = TRUE)[avgCPM > 10,]
dim(Bt.logCPM); class(Bt.logCPM)

save(Bt.logCPM, file="data/Bt.logCPM.rda")
tools::resaveRdaFiles("data/Bt.logCPM.rda")

BtPheno <- RG.detected$samples
BtPheno$files <- NULL
BtPheno$lib.size <- NULL
BtPheno$norm.factors <- NULL

lapply(BtPheno, class)

save(BtPheno, file="data/BtPheno.rda")
tools::resaveRdaFiles("data/BtPheno.rda")

# zz <- file("inst/extdata/alvmac_norm.csv.gz",'rt')  # open an input file connection
# dat = read.csv(zz, row.names = 1)
