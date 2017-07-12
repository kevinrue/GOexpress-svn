Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

fData(Bt.eset)[,"dummy"] <- as.factor(
    sample(LETTERS, size = nrow(Bt.eset), replace = TRUE))


# ggfy -----

test_that("ggfy works",{

    expect_s3_class(
        ggfy(
            Bt.eset[1:2,],
            pheno = c("Time", "Infection"),
            feature = c("dummy")
        ),
        "data.frame"
    )

    expect_s3_class(
        ggplot(ggfy(
            Bt.eset[1:2,],
            pheno = c("Timepoint", "Infection", "Animal"),
            feature = c("dummy")
        )) +
            geom_line(
                aes(Timepoint, exprs, colour = Infection, group = Infection),
                alpha = 0.5
            ) +
            facet_grid(feature ~ Animal),
        "ggplot"
    )

})
