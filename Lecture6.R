#Lecture 6: Reference Management
#Date: 09/02/2025

#citation package for R packages
citation("rmarkdown")

#collect all references in a bib file
knitr::write_bib("rmarkdown", file = "my_references.bib")

#list.files() #check working directory for the bib file 

#Linking .bib file to R Markdown
#In the YAML header of the R Markdown file, add the following lines:
#bibliography: my_references.bib

---
title: "My top ten favorite R packages"
output: html_document
bibliography: my-refs.bib
---

#include multiple .bib files
---
bibliography: ["my-refs1.bib", "my-refs2.bib"]
---

#inline citation [key is the citation key in the .bib file]
#[@key] for single citation
#[@key1; @key2] multiple citation can be separated by semi-colon
#[-@key] in order to suppress author name, and just display the year
#[see @key1 p 12; also this ref @key2] is also a valid syntax

#specifying citation styles:
#specify a CSL (Citation Style Language) file in the csl metadata field

---
title: "My top ten favorite R packages"
output: html_document
bibliography: my-refs.bib
csl: biomed-central.csl
---

#add an item to bibliography w/o using it
---
nocite: |
  @item1, @item2
---

#add all items to bibliography
---
nocite: '@*'
---

