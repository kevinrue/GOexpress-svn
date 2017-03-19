# Constructors ----

test_that("Constructor produce a valid object",{

    expect_s4_class(
        GOInfo(), "GOInfo"
    )
})
