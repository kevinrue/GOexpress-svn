
exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")

exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

# Constructors ----

ow <- oneway.test(eset, "Infection")

test_that("oneway.test works",{

    expect_s4_class(ow, "multiHtest")

})

# show(multiHtest) ----

test_that("show works on multiHtest objects",{

    expect_type(show(ow), "NULL")

})

# head(multiHtest) ----

test_that("head works on multiHtest objects",{

    expect_s4_class(head(ow), "multiHtest")

})

# tail(multiHtest) ----

test_that("tail works on multiHtest objects",{

    expect_s4_class(tail(ow), "multiHtest")

})

# p.adjust ----

pa <- p.adjust(ow)

test_that("p.adjust works on multiHtest objects",{

    expect_s4_class(pa,"multiHtest")
    expect_true('p.adjust' %in% colnames(pa@table))

})

# GOrank ----

gr <- GOrank(ow, Bt.GOMap)

test_that("GOrank works on multiHtest objects",{

    expect_s4_class(gr,"GOSummarisedRank")
    expect_equal(gr@pFactor, "Infection")
    expect_equal(gr@metric, c("statistic", "multiHtest"))
    expect_true(all(gr@table$n >= gr@table$d))

})

# show(GOSummarisedRank) ----

test_that("show works on GOSummarisedRank objects",{

    expect_type(show(gr), "NULL")

})
