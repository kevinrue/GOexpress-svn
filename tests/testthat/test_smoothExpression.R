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

# smoothFeature ----

test_that("smoothFeature works",{

    # One feature - no grouping
    expect_s3_class(
        smoothFeature(
            Bt.eset[1,],
            x = "Timepoint"
        ),
        "ggplot"
    )

    # One feature - grouping
    expect_s3_class(
        smoothFeature(
            Bt.eset[1,],
            x = "Timepoint",
            group = "Infection"
        ),
        "ggplot"
    )
    # NOTE: scale_fill_manual(values = ...) can be used to control colours

    # Multiple features + extra geom_point layer
    expect_s3_class(
        smoothFeature(
            Bt.eset[1:2,],
            x = "Timepoint", group = "Infection",
            nrow = 1, scales = "free_y"
        ) +
            theme_bw() +
            geom_point(
                aes(x, y, colour = group),
                position = position_dodge(width = 2)
            ),
        "ggplot"
    )

    # Extra aesthetic, available for extra layers
    expect_s3_class(
        smoothFeature(
            Bt.eset[1,],
            x = "Timepoint",
            group = "Infection",
            facet = "Treatment"
        ),
        "ggplot"
    )

})
