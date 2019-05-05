#' makeWordset
#'
#' @param word_list Vector or column of words to be assigned part of speech
#'
#' @return Dataframe including part of speech of each word as best we can tell.
#' @importFrom qdap pos
#' @export
#'
#' @examples
#' \dontrun{word_list <- c("cat", "green", "slowly")
#' makeWordset(word_list)}
makeWordset <- function(word_list) {
  taggedPOS <- qdap::pos(word_list)
  taggedPOS2 <- data.frame(cbind(word_list, taggedPOS$POStagged))

  taggedPOS2$part_of_speech <- NA
  taggedPOS2[grep("NN|NNS|NNP|NNPS", taggedPOS2$POStags), "part_of_speech"] <- "Noun"
  taggedPOS2[grep("VB|VBD|VBZ", taggedPOS2$POStags), "part_of_speech"] <- "Verb"
  taggedPOS2[grep("JJ|JJR|JJS", taggedPOS2$POStags), "part_of_speech"] <- "Adjective"
  taggedPOS2[grep("RB|RBR|RBS", taggedPOS2$POStags), "part_of_speech"] <- "Adverb"
  taggedPOS2[grep("UH", taggedPOS2$POStags), "part_of_speech"] <- "Interjection"

  return(taggedPOS2)
}

#' fastPOStagger
#'
#' @param wordDF Dataframe including one column labeled "word" for tagging
#'
#' @return Original dataframe including part of speech columns.
#' @export
#'
#' @examples
#' \dontrun{newwords <- data.frame(word = c("cat", "green", "slowly"))
#' fastPOStagger(newwords)}
fastPOStagger <- function(wordDF) {
  wordset <- lexicon::grady_pos_feature(lexicon::hash_grady_pos)
  taggedDF <- merge(wordDF, wordset, by = "word", all.x = TRUE)
  return(taggedDF)
}
