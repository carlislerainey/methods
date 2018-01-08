
# fractions
rmarkdown::render("p2-ch07-fractions.Rmd", 
                  output_format = "pdf_document")
#file.remove("p2-ch07-fractions.tex")
file.rename("p2-ch07-fractions.pdf", "single-chapters/p2-ch07-fractions.pdf")

