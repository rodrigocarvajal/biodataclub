# Reliability and Validity Exercises
# Bio Data Club
# September 2021

# set random number seed
set.seed(1)

# TS True Score

TS = c(-3,-2,-1.5,-1,-.5,.5,1,1.5,2,3)

#To change the sample size run these lines
#Setting TS by hand above was just to establish a true score with a convenient distribution
#sampleSize = 100
#TS = rnorm(sampleSize)

# Adjusted TS for the five point scaling

adjTS = (5/6)*(TS+3)

Q1 = round(adjTS + rnorm(10))
Q2 = round(adjTS + rnorm(10))
Q3 = 6-round(adjTS + rnorm(10))

for (i in 1:length(adjTS))
 {
 	if (Q1[i] < 1) {Q1[i]=1}
 	if (Q2[i] < 1) {Q2[i]=1}
 	if (Q3[i] < 1) {Q3[i]=1}
 	if (Q1[i] > 5) {Q1[i]=5}
 	if (Q2[i] > 5) {Q2[i]=5}
 	if (Q3[i] > 5) {Q3[i]=5}
 }

SubjectID = c(1:10)

dataset=as.data.frame(cbind(SubjectID, Q1, Q2, Q3))

install.packages("ltm",dependencies=TRUE)
library(ltm)

# calculate Cronbachs alpha using the items as originally presented
cronbach.alpha(dataset,CI=TRUE)

# go back and do what should have been done at first: review the correlations of the variables
cor(dataset[,c(2:4)])

# reverse code Q3
# this is a bad idea - it would be better to have created a new variable name
dataset$Q3 = 6-dataset$Q3
cor(dataset[,c(2:4)])
cronbach.alpha(dataset,CI=TRUE)

# latent variable modeling
install.packages("lavaan",dependencies=TRUE)
library("lavaan")

# strictly parallel model
# specify the model
model.parallel <- '
 trueScore =~ v1*Q1 + v1*Q2 + v1*Q3
 Q1 ~~ v1*Q1
 Q2 ~~ v1*Q2
 Q3 ~~ v1*Q3 
'
# fit the model
fit.parallel <- cfa(model.parallel,data=dataset)
summary(fit.parallel,fit.measures=TRUE)
# examine the residuals
resid(fit.parallel)
# examine the modification indices
modindices(fit.parallel)

# tau equivalent model
# specify the model
model.tauEquivalent <- '
 trueScore =~ v1*Q1 + v1*Q2 + v1*Q3
'

# fit the model
fit.tauEquivalent <- cfa(model.tauEquivalent,data=dataset)
summary(fit.tauEquivalent,fit.measures=TRUE)
# examine the residuals
resid(fit.tauEquivalent)
modindices(fit.tauEquivalent)

install.packages("tidyverse")
library("tidyverse")
library("readxl")
### This will change depending on your setting
setwd("/Users/OUConline/Desktop/NerdyTest")

datafile = as.data.frame(read_excel("NPAS data edited.xlsx", sheet="NPAS-data", range="A1:Z953"))

round(cor(datafile),2)

NPAS.model.parallel <- '
 trueScore =~ v1*Q1+v1*Q2+v1*Q3+v1*Q4+v1*Q5+v1*Q6+v1*Q7+v1*Q8+v1*Q9+v1*Q10+v1*Q11+v1*Q12+v1*Q13+v1*Q14 +v1*Q15+v1*Q16+v1*Q17+v1*Q18+v1*Q19+v1*Q20+v1*Q21+v1*Q22+v1*Q23+v1*Q24+v1*Q25+v1*Q26
   Q1 ~~ v1*Q1
   Q2 ~~ v1*Q2
   Q3 ~~ v1*Q3
   Q4 ~~ v1*Q4
   Q5 ~~ v1*Q5
   Q6 ~~ v1*Q6
   Q7 ~~ v1*Q7
   Q8 ~~ v1*Q8
   Q9 ~~ v1*Q9
  Q10 ~~ v1*Q10
  Q11 ~~ v1*Q11
  Q12 ~~ v1*Q12
  Q13 ~~ v1*Q13
  Q14 ~~ v1*Q14
  Q15 ~~ v1*Q15
  Q16 ~~ v1*Q16
  Q17 ~~ v1*Q17
  Q18 ~~ v1*Q18
  Q19 ~~ v1*Q19
  Q20 ~~ v1*Q20
  Q21 ~~ v1*Q21
  Q22 ~~ v1*Q22
  Q23 ~~ v1*Q23
  Q24 ~~ v1*Q24
  Q25 ~~ v1*Q25
  Q26 ~~ v1*Q26'

cronbach.alpha(datafile,CI=TRUE)

NPAS.model.tauEquivalent <- '
 trueScore =~ v1*Q1+v1*Q2+v1*Q3+v1*Q4+v1*Q5+v1*Q6+v1*Q7+v1*Q8+v1*Q9+v1*Q10+v1*Q11+v1*Q12+v1*Q13+v1*Q14 +v1*Q15+v1*Q16+v1*Q17+v1*Q18+v1*Q19+v1*Q20+v1*Q21+v1*Q22+v1*Q23+v1*Q24+v1*Q25+v1*Q26'

fit.NPAS.parallel <- cfa (model=NPAS.model.parallel, data=datafile)
summary(fit.NPAS.parallel,fit.measures=TRUE)

fit.NPAS.tauEquivalent <- cfa(model=NPAS.model.tauEquivalent, data=datafile)
summary(fit.NPAS.tauEquivalent,fit.measures=TRUE)

# the code below can be used to do principal components analysis
# for long measures this can be a good way to begin to identify subscales
# for confirmation using lavaan

#fit.NPAS.pca <- princomp(datafile,cor=TRUE)
#summary(fit.NPAS.pca)
#loadings(fit.NPAS.pca)
#plot(fit.NPAS.pca,type="lines")
#biplot(fit.NPAS.pca)

# the following questions all have to do with
# interests in science or technical matters

cronbach.alpha(datafile[,c(1,7,8,14)],CI=TRUE)

NPAS.tech.parallel <- '
 techScore  =~ v1*Q1 + v1*Q7 + v1*Q8 + v1*Q14
        Q1  ~~ v1*Q1
        Q7  ~~ v1*Q7
        Q8  ~~ v1*Q8
        Q14 ~~ v1*Q14
'
NPAS.tech.tauEquivalent <- '
 techScore  =~ v1*Q1 + v1*Q7 + v1*Q8 + v1*Q14'

fit.NPAS.tech.parallel <- cfa(model=NPAS.tech.parallel,data=datafile) 
summary(fit.NPAS.tech.parallel, fit.measures=TRUE)

fit.NPAS.tech.tauEquivalent <- cfa(model=NPAS.tech.tauEquivalent,data=datafile)
summary(fit.NPAS.tech.tauEquivalent,fit.measures=TRUE)
modindices(fit.NPAS.tech.tauEquivalent)

cor(datafile[,c(1,7,8,14)])

NPAS.tech.tauEquivalent2 <- '
 techScore  =~ v1*Q1 + v1*Q7 + v1*Q8 + v1*Q14
 Q1~~Q8
 Q7~~Q8
 Q7~~Q14'
fit.NPAS.tech.tauEquivalent2 <- cfa(model=NPAS.tech.tauEquivalent2,data=datafile)
summary(fit.NPAS.tech.tauEquivalent2,fit.measures=TRUE)

