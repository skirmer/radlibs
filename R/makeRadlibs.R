#' makeRadlibs
#'
#' @param phrase String including any number of the words noun, verb, adjective, adverb, plural, or interjection
#'
#' @return New string replacing the keywords with alternatives. Hopefully funny.
#' @import stringr
#' @import lexicon
#' @importFrom data.table data.table
#' @export
#'
#' @examples
#' makeRadlibs("not sure if i should verb or verb because its an adjective noun")
#' "not sure if i should picket or go because its an charlatanical post"

makeRadlibs <- function(phrase, wordset = NA) {
    if(is.na(wordset)){
        wordset <- read.csv("data/humor_dataset.csv", stringsAsFactors = FALSE)
        wordset <- data.table::data.table(fastPOStagger(wordset))[mean > 1.2,]
    }

    nouns <- stringr::str_count(phrase, "noun")
    pnouns <- stringr::str_count(phrase, "plural")
    verbs <- stringr::str_count(phrase, "verb")
    adjectives <- stringr::str_count(phrase, "adjective")
    adverbs <- stringr::str_count(phrase, "adverb")
    interjections <- stringr::str_count(phrase, "interjection")

    nounpick <- sample(wordset[pos %in% c("Noun", "Noun Phrase"),word], nouns, replace = FALSE)
    pnounpick <- sample(wordset[pos == "Plural",word], pnouns, replace = FALSE)
    verbpick <- sample(wordset[pos == "Verb (transitive)",word], verbs, replace = FALSE)
    adjpick <- sample(wordset[pos == "Adjective",word], adjectives, replace = FALSE)
    advpick <- sample(wordset[pos == "Adverb",word], adverbs, replace = FALSE)
    interpick <- sample(wordset[pos == "Interjection",word], interjections, replace = FALSE)

    new_phrase <- phrase
    for(n in nounpick){
        if(!is.na(n)){
            new_phrase <- stringr::str_replace(new_phrase, "noun", n)
        } else { next }
    }

    for(p in pnounpick){
        if(!is.na(p)){
            new_phrase <- stringr::str_replace(new_phrase, "plural", p)
        } else { next }
    }

    for(v in verbpick){
        if(!is.na(v)){
            new_phrase <- stringr::str_replace(new_phrase, "verb", v)
        } else { next }
    }

    for(aj in adjpick){
        if(!is.na(aj)){
            new_phrase <- stringr::str_replace(new_phrase, "adjective", aj)
        } else { next }
    }

    for(av in advpick){
        if(!is.na(av)){
            new_phrase <- stringr::str_replace(new_phrase, "adverb", av)
        } else { next }
    }

    for(i in interpick){
        if(!is.na(i)){
            new_phrase <- stringr::str_replace(new_phrase, "interjection", i)
        } else { next }
    }

    return(new_phrase)
}
