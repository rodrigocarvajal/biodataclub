# Reliability and Validity Exercises
# Bio Data Club
# September 2021

# set random number seed
set.seed(1)

# TS True Score

TS = c(-3,-2,-1.5,-1,-.5,.5,1,1.5,2,3)

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
