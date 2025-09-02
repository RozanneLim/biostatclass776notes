#Lecture 5: Literate Statistical Programming [09/02/2025]

#literate programming: report or publication as a stream of text and code, can include
#presentation code

#literate programs can be weaved to produce PDFs and HTML, and they can be tangled to produce
#machine readable "documents"

#R Markdown: weaves together R code chunks, and has the extension .Rmd
#Quarto is a more recent alternative to R Markdown, and has the extension .qmd, and can include
#other programming languages

#Rmd syntax
``
`{r}
#| label: plot1b
#| height: 4
#| width: 5
#| eval: FALSE
#| echo: TRUE
data(airquality)
plot(airquality$Ozone ~ airquality$Wind)
`
``

#Example Rmd code chunk
``
`{r plot1, height=4, width=5, eval=FALSE, echo=TRUE}
data(airquality)
plot(airquality$Ozone ~ airquality$Wind)
`
``
#plot1 is the label, height and width are in inches, eval=FALSE means the code won't be run, echo is=TRUE means you show the code chunk

#using ```` backticks will show the entire code chunk in text format
#can also use #| for chunk options

#rmarkdown function: rmarkdown::render()

#format: revealjs for slides, html_document for html, pdf_document for pdf for Qmd file
