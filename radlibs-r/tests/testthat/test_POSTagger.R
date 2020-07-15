rm(list = ls(all = TRUE))

context("\n>> POSTagger")

context("End-to-End Testing")

test_that("POSTagger runs end-to-end without error", expect_true({

    wordDF <- data.frame(word = c("cat", "green", "slowly"))
    tagged <- POSTagger(wordDF)
    TRUE

})
)

test_that("POSTagger returns expected output", {

    wordDF <- data.frame(word = c("cat", "green", "slowly"))
    results <- POSTagger(wordDF)

    expect_equal(colnames(results), c( "word","pos","n_pos","space","primary"))
    expect_equal(nrow(results), 6)
    expect_equal(results$pos, c("Verb (usu participle)","Noun","Noun","Verb (usu participle)", "Adjective", "Adverb" ))
})
