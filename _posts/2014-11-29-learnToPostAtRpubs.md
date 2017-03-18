---
layout : post
title : Learn to Post at RPubs
date: 2014-11-29
category : Reproducible Research
tags : [Reproducible Research]
image: flower02.jpg
---

[Rpubs](http://rpubs.com) is a great place to post markdown files created using [RStudio](http://www.rstudio.com) and `knitr` to create markdown files that are then rendered and posted at Rpubs. This post describes one of my first posts at Rpubs.

<!--more-->

## Install R and RStudio and Rtools

1. Install R from [CRAN](http://cran.r-project.org/)
2. It is also helpful to download [RTools](http://cran.r-project.org/bin/windows/Rtools/)
3. Install [RStudio](http://www.rstudio.com/) which is an Integrated Development Environment (IDE) with a helpful GUI (graphical user interface) layout for your R command line, scripting,  logs, output, help and other useful windows all from the same integrated interface.

### RStudio Interface - screen capture (Windows 8.1 on a Surface Pro 3)

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioMain.png)

To begin you first need to create a R-markdown `(*.rmd)` file. From the RStudio menus, choose File/New File/R markdown.

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDnew.png)

For RStudio version 0.98.1091, creating a new RMD file opens another window where you can customize what kind of RMD file you want to create: 

* either a document (in either HTML, DOC or PDF formats); 
* presentation (as either HTML-ioslides, HTML-Slidy, or PDF-beamer formats); 
* Shiny document (as HTML document with Shiny interactive components or Shiny presentation as IOSlides with interactive components); or 
* from a template of your choosing.

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDinitial.png)

The great thing about R-markdown documents using the current RStudio interface (since 0.96) is that the `knitr` package is now built in as part of RStudio. Yihui Xie  has more information on his website about [knitr support in RStudio](http://yihui.name/knitr/demo/rstudio/). You will notice that the RMD file I created below has both regular text and r code mixed together. When I am ready to compile this document I will click the `Knit HTML` button at the top of the document which will then "weave" the text and code together executing the R code commands and embedding the results in the final document. For example, the first code "chunk" below runs summary statistics on the 2 variables in the `cars` dataset (speed and dist) which comes with the base R software. The second code "chunk" below then creates a scatterplot of these variables (speed on the x-axis and dist on the y-axis). The final produced HTML document will show the summary statistics table and the scatterplot instead of the raw code. 

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDfile.png)

Click on the `Knit HTML`

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDknit.png)

This will then execute the `knitr` commands and process the document "weaving" together the markdown, text and r-codes to produce the HTML file. This HTML file will then open up in another screen (kind of like a temporary browser window from RStudio). From this window you can view your final HTML document, open it another browser application (like IE, Chrome, Firefox, etc), or "Publish" it. 

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDhtml.png)

By clicking on Publish you are asking to post your final document on Rpubs. For this to work you need to have an account set-up and be logged in to your Rpubs account.

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDrpubs.png)

If all goes well your document will then be posted to [RPubs](http://rpubs.com/melindahiggins2000/rpubstest1)   

![center]({{ site.url }}{{ site.baseurl}}/images/blog/rstudioRMDfinal.png)
