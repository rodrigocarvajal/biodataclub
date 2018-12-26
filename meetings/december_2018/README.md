## Writing RMarkdown Reports and Using Custom Moffitt Templates and Packages
### William “Jimmy” Fulp 
### [William.Fulp@moffitt.org](William.Fulp@moffitt.org)
### 12/14/2018

Meeting Slide are Posted [Here](RMarkdown Workshop Dec2018.pptx)
 
RMarkdown is a file format for making dynamic documents with R. An RMarkdown document is written in markdown (an easy-to-write plain text format) and contains chunks of embedded R code. The purpose of this workshop is to introduce RMarkdown reports, as well as the custom Moffitt Templates and Functions I’ve written specifically to easily make fancy statistical reports.
 
In preparation for the workshop please download the following Software Programs:

* R (Get newest version)
    * [http://archive.linux.duke.edu/cran/](http://archive.linux.duke.edu/cran/)
    * R Packages needed for most reports: rmarkdown, knitr, bookdown, tidyverse, kableExtra, devtools, remotes
    * MoffittFunctions and MoffittTemplates packages from GitHub
        * remotes::install_github("wfulp/MoffittFunctions")
        * remotes::install_github("wfulp/MoffittTemplates")
    * Update all R packages (RStudio -> Packages tab -> Update button)
* RStudio (Get newest version)
    * [https://www.rstudio.com/products/rstudio/download](https://www.rstudio.com/products/rstudio/download)
* Pandoc for Word, html, and PowerPoint reports
    * Comes with RStudio, but need a newer version needed for ppt reports(>=2.0.0)
    * [https://pandoc.org/installing.html](https://pandoc.org/installing.html)
    * Or use installr package in R to download through R
        * installr::install.pandoc()
            * make sure you have admin rights when running this line
* tinytex for pdf reports
    * install.packages('tinytex')
    * tinytex::install_tinytex()
    * If you already have MikTex installed no need to install tinytex
 
Once you have everything installed reach out to me and I can come by to confirm everything is working correctly.
