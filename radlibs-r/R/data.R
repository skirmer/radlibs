#' A list of English words with the "humor ratings" attached.
#'
#' A dataset compiled by Tomas Englethaler for his research on humor.
#' https://github.com/tomasengelthaler/HumorNorms
#' Please visit his page for more details on the methodology used to score words.
#'
#' @docType data
#' @usage data(humor_dataset)
#'
#' @format A data frame with 4997 rows and 16 variables:
#' \describe{
#'   \item{word}{string of the actual word}
#'   \item{mean}{mean of humor rating across all audiences}
#'   \item{mean_F}{mean of humor rating (women)}
#'   \item{mean_M}{mean of humor rating (men)}
#'   \item{mean_old}{mean of humor rating (old)}
#'   \item{mean_young}{mean of humor rating (young)}
#'   \item{n}{audience size}
#'   \item{n_F}{audience size (women)}
#'   \item{n_M}{audience size (men)}
#'   \item{n_old}{audience size (old)}
#'   \item{n_young}{audience size (young)}
#'   \item{sd}{sd of humor rating across all audiences}
#'   \item{sd_F}{sd humor rating (women)}
#'   \item{sd_M}{sd of humor rating (men)}
#'   \item{sd_old}{sd humor rating (old)}
#'   \item{sd_young}{sd of humor rating (young)}
#'
#' }
#' @source \url{https://github.com/tomasengelthaler/HumorNorms}
"humor_dataset"



#' A list of English proper nouns with the classifications.
#'
#' A dataset derived from https://www.kaggle.com/vered1986/propernames-categories/version/1.
#' The words are British focused, and I have adjusted some
#' classifications to be easier for users to work with.
#'
#' @docType data
#' @usage data(proper_nouns)
#'
#' @format A data frame with 747 rows and 2 variables:
#' \describe{
#'   \item{word}{string of the actual word}
#'   \item{pos}{part of speech (aka celebrity, place, etc)}
#' }
#' @source \url{https://www.kaggle.com/vered1986/propernames-categories/version/1}
"proper_nouns"
