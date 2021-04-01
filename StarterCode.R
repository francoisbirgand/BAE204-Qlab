ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, library, character.only = TRUE)
}
# usage
packages <- c("knitr", "captioner", "stringr", "devtools", "bookdown","kableExtra", "rmarkdown","blogdown","pander","shape")
ipak(packages)

