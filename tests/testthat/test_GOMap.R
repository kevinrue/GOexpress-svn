# Test data ----

df <- data.frame(
    paste0("GO:000", 1:9),
    sample(LETTERS[1:2], 9, TRUE),
    stringsAsFactors = FALSE
)
df <- rbind(df, c('', ''))

# Constructors ----

gm <- GOMap(df, "dummy")

test_that("Constructor produce a valid object",{
    expect_s4_class(gm, "GOMap")
})

# show(GOMap) ----

test_that("show works on GOMap objects",{

    expect_type(show(gm), "NULL")

})

# nrow ----

nr <- nrow(gm)

test_that("nrow works",{

    expect_type(nr, 'integer')
    expect_length(nr, 1)
    expect_named(nr, 'annotations')
})
