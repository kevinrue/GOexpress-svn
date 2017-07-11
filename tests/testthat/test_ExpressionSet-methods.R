Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

fData(Bt.eset)[,'dummy'] <- rnorm(nrow(Bt.eset))

# subset ----

test_that("subset works",{

    s <- subset(Bt.eset, pheno = (Timepoint == '2H'), feature = (dummy < 0))

    expect_s4_class(s, "ExpressionSet")
    expect_lt(nrow(s), nrow(Bt.eset))
    expect_lt(ncol(s), ncol(Bt.eset))

})
