#' makeRadlibs
#'
#' @param phrase String including any number of the words noun, verb, adjective, adverb, plural, or interjection enclosed in curly braces
#' @param wordset Data table of your choosing with columns "word" and "pos" at the minimum. Preferably all lowercase.
#'
#' @return New string replacing the keywords with alternatives. Hopefully funny.
#' @import stringr
#' @import lexicon
#' @importFrom data.table data.table
#' @importFrom utils read.csv
#' @export
#'
#' @examples
#' \dontrun{makeRadlibs("not sure if i should {verb} or {verb} because it's an {adjective} {noun}")}
makeRadlibs <- function(phrase, wordset = NA) {
  if (is.na(wordset)) {
    wordset <- radlibs::humor_dataset
    wordset <- data.table::data.table(POSTagger(wordset))[mean > 1.2, ]
    wordset$pos <- tolower(wordset$pos)

    propernouns <- radlibs::proper_nouns
    colnames(propernouns) <- c("word", "pos")
    wordset <- rbind(wordset, propernouns, fill = TRUE)
  }

  word_types <- .generateWordOptions()
  repeat_word_types = c("repeatnoun", "repeatverb", "repeatplural", "repeatverb", "repeatadjective", "repeatinterjection", "repeatplace", "repeatcelebrity")

  for (row in word_types) {
    type <- as.character(row["type"])
    regex <- as.character(row["regex"])
    descriptors <- unlist(row["descriptors"])

    word_types[[type]]$count <- stringr::str_count(phrase, regex)
    word_types[[type]]$valueset <- unlist(stringr::str_extract_all(phrase, regex))

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
    
    if(as.character(row["type"]) %in% repeat_word_types & count > 0){
        valueset <- unique(row[["valueset"]])
        valueset <- gsub("{", "\\{", valueset, fixed=T) 
        valueset <- gsub("}", "\\}", valueset, fixed=T) 
        
        valuecount <- length(valueset)
        valuesub = row[["sample"]][1:valuecount]
        res = cbind(valueset, valuesub)
        
        for(i in c(1:nrow(res))){
          new_phrase <- stringr::str_replace_all(new_phrase, as.character(res[i, "valueset"]), as.character(res[i, "valuesub"]))
        }
    }
    else if (count > 0) {
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
      regex = "\\{[nN]oun\\}"
    ),
    repeatnoun = list(
      descriptors = c("noun", "noun phrase"),
      type = "repeatnoun",
      regex = "\\{[nN]oun[:digit:]\\}"
    ),
    adverb = list(
      descriptors = "adverb",
      type = "adverb",
      regex = "\\{[aA]dverb\\}"
    ),
    repeatadverb = list(
      descriptors = "adverb",
      type = "repeatadverb",
      regex = "\\{[aA]dverb[:digit:]\\}"
    ),
    plural = list(
      descriptors = "plural",
      type = "plural",
      regex = "\\{[pP]lural\\}"
    ),
    repeatplural = list(
      descriptors = "plural",
      type = "repeatplural",
      regex = "\\{[pP]lural[:digit:]\\}"
    ),
    verb = list(
      descriptors = c("verb (transitive)", "verb"),
      type = "verb",
      regex = "\\{[vV]erb\\}"
    ),
    repeatverb = list(
      descriptors = c("verb (transitive)", "verb"),
      type = "repeatverb",
      regex = "\\{[vV]erb[:digit:]\\}"
    ),
    adjective = list(
      descriptors = "adjective",
      type = "adjective",
      regex = "\\{[aA]djective\\}"
    ),
    repeatadjective = list(
      descriptors = "adjective",
      type = "repeatadjective",
      regex = "\\{[aA]djective[:digit:]\\}"
    ),
    interjection = list(
      descriptors = "interjection",
      type = "interjection",
      regex = "\\{[iI]nterjection\\}"
    ),
    repeatinterjection = list(
      descriptors = "interjection",
      type = "repeatinterjection",
      regex = "\\{[iI]nterjection[:digit:]\\}"
    ),
    place = list(
      descriptors = c("city", "state", "country", "region", "place"),
      type = "place",
      regex = "\\{[pP]lace\\}"
    ),
    repeatplace = list(
      descriptors = c("city", "state", "country", "region", "place"),
      type = "repeatplace",
      regex = "\\{[pP]lace[:digit:]\\}"
    ),
    celebrity = list(
      descriptors = c("celebrity", "president", "hero", "character"),
      type = "celebrity",
      regex = "\\{[cC]elebrity\\}"
    ),
    repeatcelebrity = list(
      descriptors = c("celebrity", "president", "hero", "character"),
      type = "repeatcelebrity",
      regex = "\\{[cC]elebrity[:digit:]\\}"
    )
  )
)}
