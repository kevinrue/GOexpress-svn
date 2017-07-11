exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")

exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

eset$Time <- factor(eset$Time, c("2H", "6H", "24H", "48H"))

fData(eset)[,"dummy"] <- as.factor(
    sample(LETTERS, size = nrow(eset), replace = TRUE))

# ggfy -----

test_that("ggPheno works",{

    expect_s3_class(
        ggfy(
            eset[1:2,],
            pheno = c("Time", "Infection"),
            feature = c("dummy")
        ),
        "data.frame"
    )

    expect_s3_class(
        ggplot(ggfy(
            eset[1:2,],
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

# ggPheno ----

test_that("ggPheno works",{

    # One gene, all aesthetic, keep.names
    expect_s3_class(
        ggPheno(
            eset[1,], assay = "exprs",
            x = "Time", group = "Infection", colour = "Animal",
            shape = "Timepoint", fill = "Group", facet = "Animal"
        ),
        "data.frame"
    )

    # One gene, no aesthetic
    expect_s3_class(
        ggPheno(
            eset[1,], assay = "exprs"
        ),
        "data.frame"
    )

    # Multiple genes, no aesthetic
    expect_s3_class(
        ggPheno(
            eset[1:2,], assay = "exprs"
        ),
        "data.frame"
    )

    # One gene, all aesthetic, do not keep.names
    expect_s3_class(
        ggPheno(
            eset[1,], assay = "exprs",
            x = "Time", group = "Infection", colour = "Animal",
            shape = "Timepoint", fill = "Group", facet = "Animal"
        ),
        "data.frame"
    )

})

# smoothFeature ----

test_that("smoothFeature works",{

    # One feature - no grouping
    expect_s3_class(
        smoothFeature(
            eset[1,],
            x = "Timepoint"
        ),
        "ggplot"
    )

    # One feature - grouping
    expect_s3_class(
        smoothFeature(
            eset[1,],
            x = "Timepoint",
            group = "Infection"
        ),
        "ggplot"
    )
    # NOTE: scale_fill_manual(values = ...) can be used to control colours

    # Multiple features + extra geom_point layer
    expect_s3_class(
        smoothFeature(
            eset[1:2,],
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
            eset[1,],
            x = "Timepoint",
            group = "Infection",
            facet = "Treatment"
        ),
        "ggplot"
    )

})
