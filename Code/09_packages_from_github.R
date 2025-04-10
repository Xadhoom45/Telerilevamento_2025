# R code fro installing packages from Github

library(devtools) # or remotes
install_github("ducciorocchini/cblindplot")
library(cblindplot)

install_github("clauswilke/colorblindr")
library(colorblindr)

# From CRAN
install.packages("colorblindcheck")
library(colorblindcheck)
