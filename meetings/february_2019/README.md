## Introduction to t-SNE
### [Zhihua Chen](mailto:zhihua.chen@moffitt.org)
### February 15, 2019

The hands-on part of the meeting. We will do the following things:

1. Compute t-SNE on a toy dataset
2. Do spectral t-SNE. 
    * compute PCA 
    * Prepare json object with the PCA scores and sample labels
    * Load json to interact-tsne to view the tsne iterations.

Requirements:
* R packages: Rtsne, irlba, rjson
    * paste into your R session: `install.packages(c("Rtsne", "irlba", "rjson"))`
* Chrome browser. Computer with webgl2 support. (most laptops should be okay)
