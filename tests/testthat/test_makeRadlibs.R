rm(list = ls(all = TRUE))

context("\n>> makeRadlibs")

context("End-to-End Testing")

test_that("makeRadlibs runs end-to-end without error", expect_true({

    makeRadlibs("What the noun verb adjective!")

    makeRadlibs("Interjection! Adverb!")
    TRUE

})
)
