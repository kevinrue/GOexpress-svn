
Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Constructors ----

rf <- randomForest(Bt.eset, "Infection")

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
