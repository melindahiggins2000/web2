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

cancer.survival <- read.csv("cancer-survival.csv", 
                            header = TRUE)

#' Look at the data - both in the Global Environment
#' and can also use the head() function to see first 5 rows

head(cancer.survival)

#' We can make this into a formatted table
#' using the knitr package and the kable() function
#' 
#' NOTE: If knitr is not installed yet, install it first.
#' Once the package is installed it must be loaded
#' using the library() function.

library(knitr)
knitr::kable(head(cancer.survival))

#' Other useful functions of looking at the data
#' and specifically the "variables" or columns in the data
#' str() is the structure function
#' 

str(cancer.survival)



names(cancer.survival)



mean(cancer.survival$Survival)

cancer.survival[5,1]

summary(cancer.survival[,1])

summary(cancer.survival[,2])

knitr::kable(summary(cancer.survival),
             caption = "Table of Summary Statistics for 2 Variables in Dataset")

# install.packages("dplyr")
library(dplyr)
cancer.survival %>%
  summary()

cancer.survival %>%
  summary() %>%
  knitr::kable(caption = "Table of Summary Statistics for 2 Variables in Dataset")


## Let's try some inline code

mean(cancer.survival$Survival)

mnsurv <- mean(cancer.survival$Survival)
sdsurv <- sd(cancer.survival$Survival)

round(mnsurv, digits=2)

hist(cancer.survival$Survival,
main="Histogram of Survival Times")

cancer.survival$Survival %>%
hist(main="Histogram of Survival Times")

# install.packages("ggplot2")
library(ggplot2)
ggplot(cancer.survival,
aes(x = Organ,y=Survival, color = Organ)) +
geom_boxplot() + 
stat_summary(fun.y=mean, 
geom="point", 
shape=23, 
size=4) + 
ggtitle("Survival time of patients affected by different cancers")


