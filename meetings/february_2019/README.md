## Introduction to t-SNE - [link to meeting slides](https://docs.google.com/presentation/d/1cNyRJRtl6bab2jarF22TUVsGHBSb_HqIT4kCTlzTcfc/edit?usp=sharing)
### [Zhihua Chen](mailto:zhihua.chen@moffitt.org)
### February 15, 2019

The hands-on part of the meeting. We will do the following things:

1. Compute plain and spectral t-SNE entirely within R on the MNIST example dataset
   
      10,000 images of handwritten digits 0-9, 784 pixels each
      
2. Do spectral t-SNE on several active research data sets using an interactive web app
    * Precomputed PCA scores
    * Prepare json object with the PCA scores and sample labels
    * Load json to interact-tsne to view the tsne iterations

Requirements:
* Recent versions of R and RStudio
* R packages: Rtsne, irlba, rjson
    * paste into your R session: `install.packages(c("Rtsne", "irlba", "rjson"))`
* Meeting files
    * Please [email Paul Stewart](mailto:paul.stewart@moffitt.org) if you did not receive a Google Drive link via email
* Chrome browser and a laptop with webgl2 support (most laptops should be okay)
* [Download sample t-SNE R code](https://raw.githubusercontent.com/pstew/biodataclub/master/meetings/february_2019/tsne-tutorial.R)
