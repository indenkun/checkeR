#' View NEWS of RStudio
#' @description
#' Function to display the RStudio Release Notes web page in a web browser.
#' The default web browser will launch and display Posit's RStudio release notes web page.
#' @note
#' It just open Posit's RStudio release notes web page with `browseURL()`.
#' @export
view_news_RStudio <- function(){
  utils::browseURL(url = "https://docs.posit.co/ide/news/")
}
