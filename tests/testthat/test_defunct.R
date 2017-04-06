
# GO_analyse ----

test_that("GO_analyse is defunct",{

    expect_error(GO_analyse(NULL, NULL), "is defunct")

})

# cluster_GO ----

test_that("cluster_GO is defunct",{

    expect_error(cluster_GO(NULL, NULL, NULL), "New S4 method required")

})

# expression_plot ----

test_that("expression_plot is defunct",{

    expect_error(
        expression_plot(NULL, NULL, NULL, NULL),
        "New S4 method required"
    )

})

# expression_plot_symbol ----

test_that("expression_plot_symbol is defunct",{

    expect_error(
        expression_plot_symbol(NULL, NULL, NULL, NULL),
        "New S4 method required"
    )

})

# expression_profiles ----

test_that("expression_profiles is defunct",{

    expect_error(
        expression_profiles(NULL, NULL, NULL, NULL, NULL),
        "New S4 method required"
    )

})

# expression_profiles_symbol ----

test_that("expression_profiles_symbol is defunct",{

    expect_error(
        expression_profiles_symbol(NULL, NULL, NULL, NULL, NULL),
        "New S4 method required"
    )

})

# heatmap_GO ----

test_that("heatmap_GO is defunct",{

    expect_error(heatmap_GO(NULL, NULL, NULL), "New S4 method required"
    )

})

# hist_scores ----

test_that("hist_scores is defunct",{

    expect_error(hist_scores(NULL), "New S4 method required")

})

# list_genes ----

test_that("list_genes is defunct",{

    expect_error(list_genes(NULL, NULL), "New S4 method required")

})

# plot_design ----

test_that("plot_design is defunct",{

    expect_error(plot_design(NULL, NULL, NULL), "New S4 method required")

})

# pValue_GO ----

test_that("pValue_GO is defunct",{

    expect_error(pValue_GO(NULL), "New S4 method required")

})

# quantiles_scores ----

test_that("quantiles_scores is defunct",{

    expect_error(quantiles_scores(NULL), "New S4 method required")

})

# rerank ----

test_that("rerank is defunct",{

    expect_error(rerank(NULL), "New S4 method required")

})

# subEset ----

test_that("subEset is defunct",{

    expect_error(subEset(NULL), "is defunct")

})

# subset_scores ----

test_that("subset_scores is defunct",{

    expect_error(subset_scores(NULL), "New S4 method required")

})

# table_genes ----

test_that("table_genes is defunct",{

    expect_error(table_genes(NULL, NULL), "New S4 method required")

})
