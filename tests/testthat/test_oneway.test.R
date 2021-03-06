
Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Constructors ----

ow <- oneway.test(Bt.eset, "Infection")

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

# topFeeatures(multiHtest) ----

test_that("topFeatures works on multiHtest objects",{

    expect_s3_class(topFeatures(ow), "data.frame")

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

# GOBootstrapRank ----

t2 <- gr@table
t2[,"P"] <- runif(nrow(t2), 0, 1)

gbr <- GOBootstrapRank(
    table = t2,
    metric = gr@metric,
    GOMap = gr@GOMap,
    featureData = gr@featureData,
    pFactor = gr@pFactor,
    n.bootstrap = 10
)

test_that("bootstrap.p.value works on multiHtest objects",{

    expect_s4_class(gbr,"GOBootstrapRank")
    expect_equal(gbr@pFactor, "Infection")
    expect_equal(gbr@metric, c("statistic", "multiHtest"))
    expect_true(all(gbr@table$n >= gr@table$d))
    expect_true(all(gbr@table$P <= 1))
    expect_true(all(gbr@table$P >= 0))
    expect_true(all(gbr@n.bootstrap > 0))

})

test_that("show works on GOSummarisedRank objects",{

    expect_type(show(gbr), "NULL")

})
