exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")

exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

fData(eset)[,'dummy'] <- sample(LETTERS, nrow(eset), TRUE)

# subset ----

test_that("subset works",{

    s <- subset(eset, pheno = (Time == '2H'), feature = (dummy < 'N'))

    expect_s4_class(s, "ExpressionSet")
    expect_lt(nrow(s), nrow(eset))
    expect_lt(ncol(s), ncol(eset))

})
