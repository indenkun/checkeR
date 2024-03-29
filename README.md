
<!-- README.md is generated from README.Rmd. Please edit that file -->

# checkeR

<!-- badges: start -->
<!-- badges: end -->

`{checkeR}` is an add-in package for RStudio that checks for updates to
R and RStudio.

## Installation

You can install the development version of `{checkeR}` like so:

``` r
# install.packages("devtools")
devtools::install_github("indenkun/checkeR")
```

## Example

Once the package is installed, it will be registered as an add-in to
RStudio and can be used.

A dialog will indicate if there are updates available.

![](img/checkeR.gif)

“Checks a newer version of R” is a wrapper for `check.for.updates.R()`
of the `{installr}`.

![](img/checkeRStudio.gif)

“Checks a newer version of RStudio” check for available RStudio updates.

![](img/view_news_RStudio.gif)

“View NEWS of RStudio” display the RStudio Release Notes web page in a
web browser.

The default web browser will launch and display Posit’s RStudio release
notes web page.

## Import

- `{installr}`
- `{purrr}`
- `{stringr}`
- `{rstudioapi}`
- `{stats}`
- `{utils}`

## Notice

The email address listed in the DESCRIPTION is a dummy. If you have any
questions, please post them on ISSUE.

## Licence

MIT.
