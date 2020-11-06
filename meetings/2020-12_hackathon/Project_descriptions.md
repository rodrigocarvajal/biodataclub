# Hackathon Projects 2020

## User-friendly simulation software for cluster analysis (Team Lead: Naomi Brownstein)
The goal of this project is to create an R package to simulate clusters for evaluation of algorithms for cluster analysis. The aim is to enable to R users to easily simulate and visualize high-dimensional data from one or more clusters. 

Impact: The package will be used for simulations to finish a manuscript evaluating clusterability methods on high dimensional data. Existing R packages for simulating clusters from Gaussian or other data contained errors, were too restrictive, were not user-friendly, were not easily scaled to high dimensions, or have been archived. (Examples: ClusterSim, MixSim, ClusterGeneration) Cluster analysis is studied theoretically in computer science and statistics and used in countless applications, such as genetics and cancer. The package from this project will be posted on github and submitted to CRAN. If possible, a brief documentation paper with examples could also be written during or after the Hackathon to help users incorporate the package into their planned analyses. The package has the potential to become widely used (and paper widely cited) among the numerous authors who create new clustering algorithms. Finally, this project will enhance participants’ knowledge of cluster analysis and clusterability.

**Technical specifications:** The R package should have options such the number of observations in each cluster, the number of features, cluster means and variances, or other parameters to control the distributions of the clusters. While the participants can choose the specific structure of the package, it may be easiest to start with and/or focus on multivariate Gaussian clusters (e.g. leveraging existing functions/packages such as rnorm, mvrnorm, mvtnorm, or simstandard). (A recently archived R package that inspired this project is clusterlab.) 

**Programming background:** Familiarity with R. While not required, it would be highly beneficial if at least one member of the team has experience creating an R package. 

## Utilization of target lesion heterogeneity to assess treatment efficacy (Team Lead: Dung-Tsa Chen)
Background: Recent studies have discovered several unique tumor response subgroups, such as mixed response, oligometastasis, and pseudo-progression. Patients in these subgroups often need special clinical attention to tailor treatment due to inconsistent reactions to drugs. These subtypes have a distinctive property, lesion heterogeneity in diverse tumor growth patterns between lesions. Determination of the subtypes requires high resolution of lesion level measurement data and makes the use of Response Evaluation Criteria for Solid Tumors (RECIST) less practical, a standard tool to assess treatment effect in oncology clinical trials. RECIST has helped advance cancer treatment, such as chemotherapy, targeted therapy, immunotherapy, or the combination. It uses various criteria to evaluate treatment efficacy. One primary measurement is target lesion. The target lesion is measured for its size at each CT scan. The sum of all target lesions is then used to determine treatment effectiveness. However, studies have raised various issues regarding RECIST being applied for incorrect determination of response, which resulted in premature termination of therapy and imprecise efficacy. One key limitation of RECIST is the use of sum of all target lesion sizes for clinical decision-making. This approach uses naïve assumption of lesion homogeneity and therefore seriously hinders its ability in evaluating individual lesion variability of tumor growth in an individual patient. Many studies attempted to reform RECIST, but their methodology still relied on RECIST’s aggregated sum to describe patient treatment response.

Data: A total of 110 target lesions in 36 late stage lung cancer patients treated with immunotherapy from a research protocol at Moffitt Cancer Institute (MCC20369). Tumor measurements of these lesions were derived per RECIST from CT scans for data analysis. Distribution of CT scans were 50% with 3 scans (n=18), and 50% with 4 scans or more (n=18). For lesion frequency per patient, there were 33% patients with 2 lesions (n=12), 33% patients with 3 lesions (n=12), 28% patients with 4 lesions (n=10), and 6% patients with 5 lesions (n=2).

Hypothesis: Utilization of lesion heterogeneity leads to effective tailored treatment strategies.

**Technical specifications:** basic R, statistical and/or machine learning approaches to identify and classify lesion heterogeneity
 
**Programming background:** R and R markdown/Shiny

## R Shiny application for the visualization of immunofluorescence spatial data (Team Lead: Brooke Fridley)
Multiplex immunofluorescence (IF) microscopy combined with automated image analysis is a novel and increasingly used technique that allows for the assessment and visualization of the tumor immune microenvironment (TIME). In addition to discrimination between immune cell types, both tumor and stromal cells can be identified to aid in the characterization of the TIME. Recently, application of this new technology to existing tissue microarrays (TMAs) or whole tissue sections from large cancer epidemiology studies has been used to characterize immune cells in cancer patients with enhanced reproducibility and accuracy. 

**Technical specifications:** In this proposed project, we will develop an R Shiny application that will allow users to upload spatial IF data for individual cores. The application will then generate interactive figures displaying individual markers, immune phenotypes, spatial and summary information using plotly. The generated figure will show which cells are positive for particular marker/phenotype(s), draw borders a specific cell components  and highlight cells within a certain radius and provide information on the proportions of certain markers/cell types. The application will also calculate spatial statistics such as Ripley’s K or Besag’s L (time permitting). 

**Programming background:** The development of the R shiny application will be done utilizing GitHub and git via Dr. Fridley’s GitHub page to ensure reproducibility and rigor. Dr. Fridley will be involved to provide an overview of the project and organization; Ms. Jordan Creed and Dr. Chris Wilson will work with participants in the development of the R Shiny application.  Participants will only need a basic knowledge of R/Rstudio and/or R Shiny.

## Pipeline for Apple HealthKit data (Team Lead: Brian Gonzalez)
Studies and clinical teams increasingly desire to pull Apple HealthKit data in order to collect patient-generated health data (PGHD). These data could be used to surveil for patients about to experience significant toxicity (e.g., by detecting a drop-off in number of steps taken per day), for monitoring change in PGHD after treatment, or for trials testing the efficacy of behavioral interventions. Pulling data from Apple HealthKit could help simplify data collection, as HealthKit could serve as a way to harmonize data from multiple sources (e.g., Fitbit, Garmin, Apple Watch) before they’re sent to Moffitt.

**Technical specifications:** HealthKit data can be exported as an XML file and parsed into a human-readable format with libraries from most popular languages. 

**Programming background:** No language is required, but experience in visualizing longitudinal data, programming with R, or working with cloud services (e.g. Google Cloud Platform) is a plus.

## Visualizing catchment area alignment with consent and biospecimen availability (Team Lead: Travis Gerke)
Create an interactive web report that shows consent status (e.g. to TCC) and specimen availability by key demographic variables (e.g. aggregate counts by race/ethnicity, county of residence). Filters which highlight Moffitt’s key catchment area opportunities will be available. Aggregate counts will be curated from HRI backend database tables.
 
Impact: The final report will be accessible to Moffitt team members on the intranet as a web link (deployed via internal GitLab Pages server). The format of the report will be readily extensible to similar research reporting / dashboarding needs. 

**Technical specifications:** R/SQL, Shiny, ggplotting of `sf` or similar R-based geography objects

**Programming background:** Familiarity with R and R markdown/Shiny

## Demo application for facilitated LIMS reporting (Team Lead: Fredrik Pettersson)
The process for time reporting using the LIMS system is not very well suited for our daily workflow with room for improvement to increase efficiency, remove frustration and to provide transparency and overview. I propose a project to greatly facilitate reporting and interactive visualization of LIMS entries by design and implementation of an interactive web application with an associated API. The goal will be to develop a standalone and modular application for demonstrating a streamlined procedure to stakeholders. The application will be developed with future integration with CICPT and Labvantage in mind either as a microservice, reusable web components or through API. The most immediately useful functionality would be the ability to export data in .csv format for subsequent import to other systems.

Impact: An improved workflow for LIMS entry would save many hours per week in BBSR alone. Features will be implemented with the aim to be integrated in upcoming CICPT version. A successful implementation would serve as a compelling case to initialize a dialogue on the possibility to integrate with Labvantage in a safe and streamlined manner.

**Technical specifications:**
- MongoDB to store entries
- Authentication using AD and/or KeyCloak
- GraphQL API
- Vue javascript frontend  
- Summary plots using D3 and plotly

**Programming background:** Familiarity with web development, either backend or frontend.  

## BERT-based Moffitt Pub+Grant Abstract Search (Team Lead: Phillip Szepietowski)
Overview: Build a tool that will take in a search phrase and return a ranked list of Moffitt publication and grant proposal abstracts that are similar to that phrase.
 
Impact: Researchers can use the tool to identify past/current/future projects that are similar in nature to their input search phrase and allow them to connect with other researchers that are working (or that have worked) on related projects/ideas to facilitate collaboration and to help the sharing of perspective and experience among colleagues.
 
We will utilize Moffitt's MARCENE database which includes both historical and current Moffitt publication and grant abstracts. Search phrases will be compared with abstracts from the past five years and the tool will return a ranked list of the most similar abstracts/projects, along with author/contributor lists and perhaps any relevant related links. 

The similarity will be measured using a pertained BioBERT model which maps sentences into a high-dimensional real vector space. Within this space, we can compare the search phrase with the abstracts and return abstracts that have the most overlap with the search phrase (measured by an aggregated cosine-similarity score).
 
**Technical specifications:** 
- Python for processing text and modeling with BERT (using a pertained BioBERT model from the Huggingface library https://huggingface.co/gsarti/biobert-nli). 
- Data will be stored either in raw json or MongoDB. 
- Frontend/UI is language agnostic, could be built directly in Python, Javascript, R.  Potentially to be implemented as a Flask app or within a Jupyter notebook framework.
 
**Programming background:** 
- Familiarity with Python is preferred but not required.
- Web-development experience helpful.
