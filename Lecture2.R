#Lecture 2: Introduction to R [08/26/25]

##package dependencies
tools::package_dependencies("ggplot2")

##installing packages from github, need to install remotes package first
##remotes::install_github()

##cloning repository from github
#git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git

## in terminal: repo new working directory, list the files, read the README file, show the remote URL
#cd myrepo
#ls
#head README.md
#git remote show origin

## in terminal: add a line to the README file and check the status of the repository
#echo "A line I wrote on my local computer  " >> README.md
#git status

##rewriting credentials
#gitcreds::gitcreds_set()

##code for creating a new R project and pushing it to github
if (!requireNamespace("usethis", quietly = TRUE)) {
  install.packages("usethis")
}

usethis::create_project("~/Desktop/biostat776classnotes")

## Then in your new RStudio project, run the following:
usethis::use_git()
usethis::use_github()

##reproducable code example
install.packages("reprex")
reprex::reprex()
