# Bio-Data Hackathon Projects 

## Dynamic Web Visualization Tool (Team Lead: Guillermo Gonzalez-Calderon)

Create a web application that connects to a server’s API, accesses JSON data, and creates charts with the options such as selecting columns/variables, switching axes, and specifying variables for aggregating data

**Technical specifications:** The front-end should be a JavaScript-based framework. 

**Impact:** The final product should generate graphs/charts from any server that provides API’s endpoints with data to create reports.

**Number of participants:** The project would require 1 to 2 people.

**Programming background:** Familiarity with JavaScript. 

## Efficient, Fast & Accurate Compression of Large Datasets using PCA (Team Lead: Anders Berglund)

The goal of this project is to implement the NIPALS (non-linear iterative partial least squares) PCA algorithm in several languages. The project will include the following steps: read data file, error check and handling of missing values, convert to matrix format, remove mean, scale to unit variance (optional), calculate PCA model using NIPALS, calculate relevant statistics, save/export results

**Technical specifications:**  The aim is to implement NIPALS PCA in several commonly used data science programming languages such as PYTHON, C, C++, C#, JAVA, R, Julia, JavaScript or any other of the participants choice. Most of these languages have a Basic Linear Algebra Subprograms (BLAS) based library for matrix operation that will be used. For example, in C, GNU Scientific language (GSL) is a possible choice and for PYTHON Numpy would be a good choice.

**Impact:** The project will be a vital part of a publication comparing the performance and accuracy of NIPALS PCA to other implementations such as SVD or Eig. The code produced in the project will be made available through GitHub. In addition, the code will be available for BBSR to use in other projects and also increase the participants understanding of PCA.

**Number of participants:** Each implementation in the different languages would require 1-2 persons.

**Programming background:** The participant needs to master the language they choose to use. Prior experience of matrix operations using BLAS, Numpy or GSL would also be beneficial.

## Extended Heatmaps (Team Lead: Jordan Creed)

Many genomic annotations, such as LD and Hi-C are visualized as heatmaps, however current heatmaps only allow for one type of measurement to be plotted in a heatmap. This project would extend current heatmap visualization options in R by creating 3-D heatmaps and allowing users to plot different annotations along the same x-axis. 

**Technical specifications:** This project will primarily use R and R packages such as the tidyverse and rayshader. 

**Impact:** This project will provide an extension of current heatmap visualization in R and will be made available through GitHub. 

**Number of participants:** This project would require at least 3 people including a person working on: combining matrices, and creating static and 3-D visuals. 

**Programming background:** Knowledge of R package creation and current heatmap packages would be beneficial. 

## Extending MoffittFunctions (Team Lead: Jose Laborde)

The goal is to create a MoffittFunctions template for R Markdown that incorporates Bayesian data analyses comparable to the ones that are currently implemented for non-Bayesian analyses.

**Technical specifications:** Participants will need access to GitLab, Rstudio, Rstan, and Bayesian libraries such as: rethinking, bayesplot, rstanarm, and brms.

**Impact:** Enhanced reproducibility and better research practices by providing options for utilizing Bayesian tools that have been incorporated to the MoffittFunctions repo.

**Number of participants:** This project would require at least 3 people including: a person knowledgeable in modifying the MoffittFunctions repo, a person with git abilities who understands the current template, a person with general Bayesian and non-Bayesian statistical knowledge.

**Programming background:** Familiarity with Rstudio, Git and Bayesian analysis.

## Geolocation Services for Moffitt Investigators (Team Lead: Rodrigo Carvajal)

Provide a tool that allows people to upload a list of mailing addresses (including zip codes) or just the zip codes into a web application with the purpose to get back a map with the locations and density.  A more developed implementation would allow to link metadata associated to those locations (i.e. gender, cancer type, insurance status, etc.). Filters could be applied to the metadata.

**Technical specifications:** The front-end should be a JavaScript-based framework.

**Impact:** Moffitt investigators will have available a the web application to generate georeferenced plots.

**Number of participants:** The project would require at least 3 people.

**Programming background:** Familiarity with Java or R (depending of the tool to use).  Java code has been already developed for this purpose. 

## Smoking Cessation Transition Diagrams (Team Lead: Steve Sutton)

In smoking cessation intervention studies, there are measures of smoking status (smoking, abstinent, or missing) at each follow-up assessment. This project would create a SAS Macro or R function that would create figures showing the transitions between assessments based on frequencies. 

**Technical specifications:** Familiarity with SAS or R. 

**Impact:** The final product should generate a figure depicting transitons based off of frequency tables. 

**Number of participants:** 2 or more

**Programming background:** Familiarity with SAS or R. 

## Cloud Platform Dashboard Design (Team Lead: Rachel Howard)
 
Create an Rshiny prototype for the first Google Cloud Platform (GCP) interactive dashboard. A dummy dataset matching the characteristics of the Personalized Medicine curated data mart will be created and stored in Google BigQuery. The app will read data directly from BigQuery and allow for basic cohort building and data visualization (including comparison of survival curves between patient subgroups and individual patient clinical timelines).
 
**Technical specifications:** Participants will need access to R and a Google Cloud account.
 
**Impact:** We will create an initial template for a GCP dashboard that will be used by the Personalized Medicine Clinical Service to facilitate their daily clinical operations.
 
**Number of participants:** 1 or more
 
**Programming background:** Experience with R and/or GCP beneficial but not required.
