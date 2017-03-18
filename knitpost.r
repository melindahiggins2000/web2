# knitpost

library(knitr)

KnitPost <- function(input, base.url = "{{ site.url }}{{ site.baseurl }}/") {
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("figs/", 
                     sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  knit(input, envir = parent.frame())
}

# have the following folders created
#   _posts
#   figs
#   rmd with the rmd files for the posts

# put rmd files in rmd directory
# run this from root web directory

file <- '2017-03-18-newpost.Rmd'
runfile <- paste0('cd rmd && copy ',file,' .. && cd ..')
shell(runfile)
KnitPost(file)
movefile <- paste0("move ",sub(".Rmd$", "", basename(file)),".md _posts")
shell(movefile)
shell(paste0('del ',file))



