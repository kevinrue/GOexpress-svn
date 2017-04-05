
# listMethods ----

lm <- listMethods()

test_that("listMethods works",{

    expect_s3_class(lm, "data.frame")
    expect_named(lm, c('name', 'package', 'type'))

})
