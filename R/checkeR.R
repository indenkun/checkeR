#' Check the version of R
#' @description
#' Fetches the latest (not development!) R version and compares it with your currently installed R version (the version of the R session from which you are running this function).
#' This is a wrapper for the RStudio add-in for `check.for.updates.R()` in `{installr}`.
#' @export
checkeR <- function(){
  stopifnot(rstudioapi::isAvailable())

  checke_r <- purrr::map(TRUE, purrr::quietly(installr::check.for.updates.R), GUI = FALSE)[[1]]

  if(checke_r$result){
    title <- "Update Available"
  }else{
    title <- "No Update Availabele"
  }

  checke_r$output <- stringr::str_replace_all(checke_r$output, pattern = "\n", replacement = "<p>")

  rstudioapi::showDialog(title = title,
                         message = checke_r$output,
                         url = "https://cran.rstudio.com/")
}
