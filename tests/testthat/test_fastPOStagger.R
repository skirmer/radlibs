rm(list = ls(all = TRUE))

context("\n>> fastPOStagger")

context("End-to-End Testing")

test_that("fastPOStagger runs end-to-end without error", expect_true({

    wordDF <- data.frame(word = c("cat", "green", "slowly"))
    fastPOStagger(wordDF)
    TRUE

})
)

test_that("fastPOStagger returns expected output", {

    wordDF <- data.frame(word = c("cat", "green", "slowly"))
    results <- fastPOStagger(wordDF)

    expect_equal(colnames(results), c( "word","pos","n_pos","space","primary"))
    expect_equal(nrow(results), 6)
    expect_equal(results$pos, c("Verb (usu participle)","Noun","Noun","Verb (usu participle)", "Adjective", "Adverb" ))
})
