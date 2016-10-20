#' R Code for Analysis of Variance Example
#' 
#' The following exercise comes from 
#' (http://r-exercises.com/), which is a site created 
#' by Research for Decisions, a Dutch research/consulting 
#' firm. They provide many exercises for learning R and 
#' practicing R coding skills. They also provide a large 
#' list of courses available for learning R - both free 
#' and paid - with detailed summaries of each option 
#' at (http://r-exercises.com/r-courses/).

#' Read in dataset - CSV comma delimited data format
#' 
#' Note: make sure the file "cancer-survival.csv" is
#' in the SAME directory as getwd(). If it isn't, then use
#' setwd("C:/xxxx/xxx") to tell R where your file is located.
#' The /'s will be opposite of what you expect on a Windows
#' computer.

getwd()
setwd("C:/MyGithub/web2/teaching/RWorkshopsFall2016")
cancer.survival <- read.csv("cancer-survival.csv", 
                            header = TRUE)

#' Look at the data - check your Global Environment - there
#' should now be a "Data" object with 64 obs and 2 variables.
#' You can also use the head() function to see first 6 rows.
#' the tail() function can be used to look at the bottom 6 rows.

head(cancer.survival)
tail(cancer.survival)

#' We can make this into a formatted table
#' using the knitr package and the kable() function
#' 
#' NOTE: If knitr is not installed yet, install it first.
#' Once the package is installed it must be loaded
#' using the library() function.

library(knitr)
knitr::kable(head(cancer.survival))

#' The output may look a little odd when printed to the 
#' Console, but this will format correctly into a table
#' in HTML, WORD and PDF formats when this is compiled
#' next in your RMD (Rmarkdown) file.

#' Other useful functions of looking at the data
#' and specifically the "variables" or columns in the data
#' str() is the structure function
#' names() will also list the names of each column/variables
#' in the dataset.

str(cancer.survival)
names(cancer.survival)

#' you will notice that from the str() function it tells
#' us that the data object is a "data.frame" with 2 columns
#' the first column is Survival and it is an int (integer)
#' variable and the second column is Organ and it is a Factor
#' type variable with 5 levels. Another way to see this is
#' to use the class() function and select each 
#' column specifically. We can select columns using the $
#' selector or use [row,column] designation. To select
#' the 1st column use [,1]. To select the 1st row,
#' use [1,]. To select the element on the 5th row, column 1,
#' use [5,1].

class(cancer.survival$Survival)
class(cancer.survival[,1])
class(cancer.survival$Organ)
class(cancer.survival[,2])

# look at the value on row 5 column 1
# this should be 412.
cancer.survival[5,1]

#' let's get some statistics on this data
#' for the days of Survival (column 1).
#' We'll use mean() and sd() function to
#' find the mean and standard deviation for the
#' Days of Survival for this dataset.

mean(cancer.survival$Survival)
sd(cancer.survival$Survival)

#' try help for mean using ?mean or help(mean)
#' try ??standard

#' ===== EXERCISE =====
#' use the help menus to see if you can figure out
#' how to find the median and the minimum and 
#' maximum values for the Days of Survival






#' ===== ANSWER =====
median(cancer.survival$Survival)
min(cancer.survival$Survival)
max(cancer.survival$Survival)


#' another useful function for finding summary
#' statistics is the summary() function. Let's
#' run summaries of each column.
#' What do you notice that is different for 
#' each of these 2 variables?

summary(cancer.survival[,1])
summary(cancer.survival$Organ)

#' and we can run summary() for the whole data frame
#' for all variables at once. And let's save this output.
 
summary(cancer.survival)
sumout <- summary(cancer.survival)

#' What kind of object is sumout?
class(sumout)

#' For Rmarkdown purposes, the summary() function
#' actually creates a 'table' object which we can
#' print out using the knitr::kable() function.

knitr::kable(sumout,
             caption = "Table of Summary Statistics for 2 Variables in Dataset")

#' Using pipe commands is becomming a defacto
#' standard way of programming and calling functions
#' in R. The idea is to write commands in a logical
#' order instead of using nested commands which get
#' complicated and can be hard to debug and are
#' easy to make mistakes.
#' 
#' So, instead of writing summary(cancer.survival),
#' it would be easier to "say" take the dataset
#' cancer.survival and run a summary() on it.
#' 
#' For this we will use the pipe command %>% which can be 
#' read as take the output from A and send it (pipe it) to B
#' A %>% B
#' 
#' To get access to this command we will install and load
#' the dplyr package. 
#' see https://cran.r-project.org/web/packages/dplyr/

# install.packages("dplyr")
library(dplyr)
cancer.survival %>%
  summary()

#' we can use more %>% pipes as needed to do more things
#' like sending the summary() output to the kable()
#' command for purposes of enbedding the table into a
#' Rmarkdown output

cancer.survival %>%
  summary() %>%
  knitr::kable(caption = "Table of Summary Statistics for 2 Variables in Dataset")

#' as you will see in the Rmarkdown file, in addition
#' to enbedding whole R chunks of code, we can also
#' put in computed values and other commands inset
#' within a line of text. This is called putting in
#' inline code. While you can put in a complicated set of r 
#' commands, it is usually easier to compute the values and
#' save them to an object and then simply call that object.
#' For example, instead of running the mean() command,
#' we can save the mean to an object mnsurv and likewise
#' we can also save the stadnard deviation to sdsurv.

mean(cancer.survival$Survival)
mnsurv <- mean(cancer.survival$Survival)
mnsurv
sdsurv <- sd(cancer.survival$Survival)
sdsurv

#' You'll notice that when these show up in the console,
#' R displays them to many significant digits. What if
#' we only want to show this in our document to 2
#' decimal places. For this we can use the round() function.
#' This is what we'll use in the Rmarkdown document.

round(mnsurv, digits=2)
round(sdsurv, digits=2)

#' Let's also look at some plots and see how we can include
#' these into our Rmarkdown output. Let's look at the
#' distribution of the Survival times - over all subjects.

hist(cancer.survival$Survival, 
     main="Histogram of Survival Times")

#' we could also do this using the pipes %>%

cancer.survival$Survival %>% 
  hist(main="Histogram of Survival Times")

#' Let's also look at the survival times BY Organ group
#' For this we'll use the ggplot2 package - install it and
#' then load this package.
#' 
#' To learn more about ggplot2,
#' see https://cran.r-project.org/web/packages/ggplot2/
#' also see the cheatsheet
#' https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# install.packages("ggplot2")
library(ggplot2)

ggplot(cancer.survival,
       aes(x = Organ, 
           y=Survival, 
           color = Organ)) +
  geom_boxplot()

#' we can also tweak the boxplot details with stat_summary()
#' to the boxplot, we're going to add a diamond (shape=23)
#' for the mean (fun.y) and make it size=4.

ggplot(cancer.survival,
       aes(x = Organ,y=Survival, color = Organ)) +
  geom_boxplot() + 
  stat_summary(fun.y=mean, 
               geom="point", 
               shape=23, 
               size=4)

#' and we can add a title

ggplot(cancer.survival,
       aes(x = Organ,y=Survival, color = Organ)) +
  geom_boxplot() + 
  stat_summary(fun.y=mean, 
               geom="point", 
               shape=23, 
               size=4) + 
  ggtitle("Survival time of patients affected by different cancers")

#' This is the code we'll add for our Rmarkdown file.

#' ===== EXERCISE =====
#' see ggplot2 cheatsheet
#' https://www.rstudio.com/wp-content/uploads/2015/12/ggplot2-cheatsheet-2.0.pdf
#' try the plot code above but use
#' geom_violin() instead of geom_boxplot()
#' and remove the stat_summary() argument








#' ===== ANSWER =====

ggplot(cancer.survival,
       aes(x = Organ,y=Survival, color = Organ)) +
  geom_violin() + 
  ggtitle("Survival time of patients affected by different cancers")



