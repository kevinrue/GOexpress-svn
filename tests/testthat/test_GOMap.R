# Constructors ----

test_that("Constructor produce a valid object",{
    df <- data.frame(
        paste0("GO:000", 1:9),
        sample(LETTERS[1:2], 9, TRUE),
        stringsAsFactors = FALSE
    )
    df <- rbind(df, c('', ''))

    expect_s4_class(
        GOMap(df, "dummy"), "GOMap"
    )
})
