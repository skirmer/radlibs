rm(list = ls(all = TRUE))

context("\n>> makeWordset")

context("End-to-End Testing")

test_that("makeWordset runs end-to-end without error", expect_true({

    word_list <- c("cat", "green", "slowly")
    makeWordset(word_list)
    TRUE

})
)

test_that("makeWordset returns expected output", {

    word_list <- c("cat", "green", "slowly")
    results <- makeWordset(word_list)

    expect_equal(colnames(results), c("word_list","POStagged","POStags","word.count","part_of_speech"))
    expect_equal(nrow(results), 3)
    expect_equal(results$part_of_speech, c("Noun","Adjective", "Adverb" ))
})
