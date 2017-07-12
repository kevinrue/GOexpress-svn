
Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Constructors ----

rf <- randomForest(Bt.eset, "Infection")

test_that("randomForest works",{

    expect_s3_class(rf, "randomForest")

})

# topFeeatures(multiHtest) ----

test_that("topFeatures works on multiHtest objects",{

    expect_s3_class(topFeatures(rf), "data.frame")

})

# GOrank ----

gr <- GOrank(rf, Bt.GOMap)

test_that("GOrank works on multiHtest objects",{

    expect_s4_class(gr,"GOSummarisedRank")
    expect_equal(gr@pFactor, "Infection")
    expect_equal(gr@metric, c("MeanDecreaseGini", "randomForest"))

})
