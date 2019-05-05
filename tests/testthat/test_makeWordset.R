rm(list = ls(all = TRUE))

context("\n>> makeWordset")

test_that("makeWordset runs end-to-end without error", expect_true({

    word_list <- c("cat", "green", "slowly")
    tagged <- makeWordset(word_list)
    TRUE
})
)

test_that("makeWordset returns expected output", {

    word_list <- c("cat", "green", "slowly")
    resultSet <- makeWordset(word_list)

    expect_equal(colnames(resultSet), c("word_list","POStagged","POStags","word.count","part_of_speech"))
    expect_equal(nrow(resultSet), 3)
    expect_equal(resultSet$part_of_speech, c("Noun","Adjective", "Adverb" ))
})
