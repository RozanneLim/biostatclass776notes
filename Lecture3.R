#Lecture 3: Git & Github [08/28/25]

##installing usethis package
if (!requireNamespace("usethis", quietly = TRUE)) {
  install.packages("usethis")
}

##creating a folder using the usethis package
usethis::create_project("~/Documents/biostat776classnotes")

##making a public repository on Github

#code for use this and github
## Create an Rstudio project
usethis::create_project("~/Desktop/biostat776project1")

## Start version controlling it
usethis::use_git()

## Use the gh-pages branch in order for
## GitHub pages https://pages.github.com/ to
## host our website.
usethis::git_default_branch_rename(to = "gh-pages")

## Create a .nojekyll file
writeLines("", here::here(".nojekyll"))

## Share it via GitHub with the world
usethis::use_github()
