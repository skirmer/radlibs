#' POSTagger
#'
#' @param wordDF Dataframe including one column labeled "word" for tagging
#'
#' @return Original dataframe including part of speech columns.
#' @export
#'
#' @examples
#' \dontrun{newwords <- data.frame(word = c("cat", "green", "slowly"))
#' POSTagger(newwords)}
POSTagger <- function(wordDF) {
  wordset <- lexicon::grady_pos_feature(lexicon::hash_grady_pos)
  taggedDF <- merge(wordDF, wordset, by = "word", all.x = TRUE)
  return(taggedDF)
}
