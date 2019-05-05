rm(list = ls(all = TRUE))

context("\n>> makeRadlibs")

context("End-to-End Testing")

test_that("makeRadlibs runs end-to-end without error", expect_true({

    funny <- makeRadlibs("What the noun verb adjective!")

    funny <- makeRadlibs("Interjection! Adverb!")
    TRUE

})
)
