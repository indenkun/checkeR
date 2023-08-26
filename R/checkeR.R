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

#' Check the version of RStudio
#' @description
#' Fetches the latest (not development!) RStudio version and compares it with your currently installed RStudio version (the version of the RStudio session from which you are running this function).
#' @param GUI a logical indicating whether a graphics menu should be used.
#' @export
checkeRStudio <- function(GUI = TRUE){
  stopifnot(rstudioapi::isAvailable())

  page_with_download_url <- "https://posit.co/download/rstudio-desktop/"
  page <- readLines(page_with_download_url, warn = FALSE)
  pat <- "RStudio-[0-9.]+-[0-9.]+\\.exe"

  filename <- stats::na.omit(stringr::str_extract(page, pat))[1]
  newest_RStudio_version <- stringr::str_extract(filename, "[0-9.]+-[0-9]+")
  newest_RStudio_version <- sub(pattern = "-", replacement = "+", newest_RStudio_version)
  current_RStudio_version <- rstudioapi::versionInfo()[["long_version"]]

  update_available <- utils::compareVersion(gsub(pattern = "\\+", replacement = ".", current_RStudio_version),
                                                    gsub(pattern = "\\+", replacement = ".", newest_RStudio_version)) == -1

  if(update_available){
    title <- "Update Available"
    message_text <-   paste("There is a newer version of RStudio for you to download!\n",
                            "You are using RStudio version:\t", current_RStudio_version, "\n",
                            "And the latest RStudio version is:\t", newest_RStudio_version, "\n",
                            sep = "")
  }else{
    title <- "No Update Availabele"
    message_text <- paste("No need to update. You are using the latest RStudio version: \n", current_RStudio_version)
  }

  if(GUI){
  rstudioapi::showDialog(title = title,
                         message = stringr::str_replace_all(message_text, "\n", "<p>"),
                         url = page_with_download_url)
  }else{
    cat(message_text)
  }

  return(update_available)
}
