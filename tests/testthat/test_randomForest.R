
exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")

exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

# Constructors ----

rf <- randomForest(eset, "Infection")

test_that("simple usage",{

    expect_s3_class(rf, "randomForest")

})

# GOrank ----

gr <- GOrank(rf, Bt.GOMap)

test_that("GOrank works on multiHtest objects",{

    expect_s4_class(gr,"GOSummarisedRank")
    expect_equal(gr@pFactor, "Infection")
    expect_equal(gr@metric, c("MeanDecreaseGini", "randomForest"))

})
