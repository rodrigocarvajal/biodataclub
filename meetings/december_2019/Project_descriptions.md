# Bio-Data Hackathon Projects 

## Efficient, Fast & Accurate compression of large datasets using PCA (Team Lead: Anders Berglund)

BIG DATA is the basis of multiple research projects and initiative at Moffitt Cancer Center (MCC). Examples include the Merck collaboration with more than 10,000 tumors with gene expression, in-house methylation data with more than 850,000 probes measuring the degree of methylation in tumors or more recently the Orien/Avatar data which currently have more than 2,500 samples with both mutation and RNAseq gene expression data. In addition to these in-house data sources, researchers frequently use the 10,000 tumor samples from TCGA to support findings discovered at MCC. These large datasets require efficient, fast and accurate methods in order to make the analysis simple and yet biologically informative.
Principal Component Analysis (PCA) is a well-established approach for data reduction that is heavily used today, possibly more now than ever. PCA allows researchers to compress large datasets with thousands of variables into a small sub-space, without losing any vital information. In fact, many of the more modern, big-data algorithms, such as t-SNE, use PCA as a first step to compress the data to a manageable number of variables. PCA has been used in many settings, such as (a) assessment and adjustment for batch effects present in ‘omic data, (b) for the use of adjustment of population stratification in GWAS studies, and (c) to summarize gene sets for a gene signatures, such as the 12-Chemokine signature.
The most common implementation of PCA uses either Singular Value Decomposition (SVD) or Eigenvalue Decomposition (Eig), which are relatively slow, memory inefficient, and also unable to handle missing values. An alternative method is non-linear iterative partial least squares (NIPALS) which is faster, takes up less memory and can also handle missing values. Unfortunately, there is a misconception that the algorithm is not suitable for large datasets since the results are unstable and do not generate orthogonal principal components, which is a key requirement for any PCA model. This misconception has been propagated in articles and also into the Wikipedia page for PCA.
Preliminary studies have shown that, with the right adjustment, the NIPALS generates exactly the same results as the other algorithms for large datasets, while still being an order of magnitude faster and requiring less memory than the SVD or Eig implementations of PCA. The goal is to implement the NIPALS PCA algorithm in several languages.
 
The project can be described in the following steps:
 
Read data file
Error check and handling of missing values
Convert to matrix format
Remove mean
Scale to unit variance (optional)
Calculate PCA model using NIPALS
Calculate relevant statistics
Save/Export results
 
The implementation will be based on my MATLAB code for NIPALS PCA.

**Technical specifications:**  The aim is to implement NIPALS PCA in several commonly used data science programming languages such as PYTHON, C, C++, C#, JAVA, R, Julia, JavaScript or any other of the participants choice. Most of these languages have a Basic Linear Algebra Subprograms (BLAS) based library for matrix operation that will be used. For example, in C, GNU Scientific language (GSL) is a possible choice and for PYTHON Numpy would be a good choice.

**Impact:** The project will be a vital part of a publication comparing the performance and accuracy of NIPALS PCA to other implementations such as SVD or Eig. The code produced in the project will be made available through GitHub. In addition, the code will be available for BBSR to use in other projects and also increase the participants understanding of PCA.

**Number of participants:** Each implementation in the different languages would require 1-2 persons.

**Programming background:** The participant needs to master the language they choose to use. Prior experience of matrix operations using BLAS, Numpy or GSL would also be beneficial.

## Dynamic web visualization tool (Team Lead: Guillermo Gonzalez-Calderon)

Create a web application that connects to a server’s API, accesses JSON data, and creates charts with the options such as selecting columns/variables, switching axes, and specifying variables for aggregating data

**Technical specifications:** The front-end should be a JavaScript-based framework. 

**Impact:** The final product should generate graphs/charts from any server that provides API’s endpoints with data to create reports.

**Number of participants:** The project would require 1 to 2 people.

**Programming background:** Familiarity with JavaScript. 

## Extending MoffittFunctions (Team Lead: Jose Laborde)

The goal is to create a MoffittFunctions template for R Markdown that incorporates Bayesian data analyses comparable to the ones that are currently implemented for non-Bayseian analyses. 

**Technical specifications:** Participants wll need access to GitLab, Rstudio, Rstan,and Bayseian libraries such as: rethinking, bayesplot, rstanarm, and brms. 

**Impact:** Enhanced reproducibility and better research practices by providing options for utilizing Bayesian tools that have been incorporated to the MoffittFunctions repo.

**Number of participants:** This project would require at least 3 people including: a person knowledgeable in modifying the MoffittFunctions repo, a person with git abilities who understands the current template, a person with general Bayseian and non-Bayseian statistical familiarity. 

**Programming background:** Familiarity with Rstudio, Git and Bayseian analysis.

## Extended Heatmaps (Team Lead: Jordan Creed)

Many genomic annotations, such as LD and Hi-C are visualized as heatmaps, however current heatmaps only allow for one type of measurement to be plotted in a heatmap. This project would extend current heatmap visualization options in R by creating 3-D heatmaps and allowing users to plot different annotations along the same x-axis. 

**Technical specifications:** This project will primarily use R and R packages such as the tidyverse and rayshader. 

**Impact:** This project will provide an extension of current heatmap visualization in R and will be made available through GitHub. 

**Number of participants:** This project would require at least 3 people including a person working on: combining matrices, and creating static and 3-D visuals. 

**Programming background:** Knowledge of R package creation and current heatmap packages would be beneficial. 
