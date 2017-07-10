exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")

exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

eset$Time <- factor(eset$Time, c("2H", "6H", "24H", "48H"))

# ggGene ----

test_that("smoothExpression works",{

    # One gene, all aesthetic, keep.names
    expect_s3_class(
        ggFeature(
            eset,
            feature = head(featureNames(eset), 1), assay = "exprs",
            x = "Time", group = "Infection", colour = "Animal",
            shape = "Timepoint", fill = "Group", facet = "Animal"
        ),
        "data.frame"
    )

    # One gene, no aesthetic
    expect_s3_class(
        ggFeature(
            eset,
            feature = head(featureNames(eset), 1), assay = "exprs"
        ),
        "data.frame"
    )

    # Multiple genes, no aesthetic
    expect_s3_class(
        ggFeature(
            eset, assay = "exprs",
            feature = head(featureNames(eset), 2)
        ),
        "data.frame"
    )

    # One gene, all aesthetic, do not keep.names
    expect_s3_class(
        ggFeature(
            eset,
            feature = head(featureNames(eset), 1), assay = "exprs",
            x = "Time", group = "Infection", colour = "Animal",
            shape = "Timepoint", fill = "Group", facet = "Animal"
        ),
        "data.frame"
    )

})

# smoothExpression ----

test_that("smoothExpression works",{

    # One feature - no grouping
    expect_s3_class(
        smoothExpression(
            eset,
            feature = head(featureNames(eset), 1),
            x = "Timepoint"
        ),
        "ggplot"
    )

    # One feature - grouping
    expect_s3_class(
        smoothExpression(
            eset,
            feature = head(featureNames(eset), 1),
            x = "Timepoint",
            group = "Infection"
        ),
        "ggplot"
    )
    # NOTE: scale_fill_manual(values = ...) can be used to control colours

    # Multiple features + extra geom_point layer
    expect_s3_class(
        smoothExpression(
            eset,
            feature = head(featureNames(eset), 2),
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
        smoothExpression(
            eset,
            feature = head(featureNames(eset), 1),
            x = "Timepoint",
            group = "Infection",
            facet = "Treatment"
        ),
        "ggplot"
    )

})
