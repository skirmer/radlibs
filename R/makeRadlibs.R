#' makeRadlibs
#'
#' @param phrase String including any number of the words noun, verb, adjective, adverb, plural, or interjection
#' @param wordset Data table of your choosing with columns "word" and "pos" at the minimum. Preferably all lowercase.
#'
#' @return New string replacing the keywords with alternatives. Hopefully funny.
#' @import stringr
#' @import lexicon
#' @importFrom data.table data.table
#' @export
#'
#' @examples
#' makeRadlibs("not sure if i should verb or verb because its an adjective noun")
makeRadlibs <- function(phrase, wordset = NA) {
  if (is.na(wordset)) {
    wordset <- read.csv(
      file.path(system.file(package = "radlibs"), "data/humor_dataset.csv"),
      stringsAsFactors = FALSE
    )
    wordset <- data.table::data.table(fastPOStagger(wordset))[mean > 1.2, ]
    wordset$pos <- tolower(wordset$pos)

    propernouns <- read.csv(
      file.path(system.file(package = "radlibs"), "data/propernames.csv"),
      stringsAsFactors = FALSE, header = FALSE
    )[, c(1:2)]
    colnames(propernouns) <- c("word", "pos")
    wordset <- rbind(wordset, propernouns, fill = TRUE)
  }

  word_types <- .generateWordOptions()

  for (row in word_types) {
    type <- as.character(row["type"])
    regex <- as.character(row["regex"])
    descriptors <- unlist(row["descriptors"])

    word_types[[type]]$count <- stringr::str_count(phrase, regex)

    word_types[[type]]$sample <- sample(
      wordset[pos %in% descriptors, word],
      stringr::str_count(phrase, regex),
      replace = FALSE
    )
  }

  new_phrase <- phrase

  for (row in word_types) {
    count <- as.numeric(row["count"])
    sample <- unlist(row["sample"])
    regex <- as.character(row["regex"])

    if (count > 0) {
      for (word in sample) {
        new_phrase <- stringr::str_replace(new_phrase, regex, word)
      }
    } else {
      next
    }
  }

  return(stringr::str_to_sentence(new_phrase))
}


.generateWordOptions <- function() {
  return(list(
    noun = list(
      descriptors = c("noun", "noun phrase"),
      type = "noun",
      regex = "[nN]oun"
    ),
    adverb = list(
      descriptors = "adverb",
      type = "adverb",
      regex = "[aA]dverb"
    ),
    plural = list(
      descriptors = "plural",
      type = "plural",
      regex = "[pP]lural"
    ),
    verb = list(
      descriptors = c("verb (transitive)", "verb"),
      type = "verb",
      regex = "[vV]erb"
    ),
    adjective = list(
      descriptors = "adjective",
      type = "adjective",
      regex = "[aA]djective"
    ),
    interjection = list(
      descriptors = "interjection",
      type = "interjection",
      regex = "[iI]nterjection"
    ),
    place = list(
      descriptors = c("city", "state", "country", "region", "place"),
      type = "place",
      regex = "[pP]lace"
    ),
    celebrity = list(
      descriptors = c("celebrity", "president", "hero", "character"),
      type = "celebrity",
      regex = "[cC]elebrity"
    )
  ))
}
