# Test data ----

df <- data.frame(
    paste0("GO:000", 1:9),
    sample(LETTERS[1:2], 9, TRUE),
    stringsAsFactors = FALSE
)
df <- rbind(df, c('', ''))

# Constructors ----

test_that("Constructor produce a valid object",{
    expect_s4_class(
        GOMap(df, "dummy"), "GOMap"
    )
})

# nrow ----

test_that("nrow works",{

    gm <- GOMap(df, "dummy")

    nr <- nrow(gm)

    expect_type(nr, 'integer')
    expect_length(nr, 1)
    expect_identical(names(nr), 'annotations')
})
