############################################################################################
## Using IntNMF on (i) Simulated data and (ii) Real data from TCGA glioblastoma studies 
## 
## Date: June 18, 2021 
############################################################################################

## InterSIM
library(InterSIM)
library(IntNMF)

rm(list=ls())
###---------------------------------------------------------------------------------
### 1. Simulation of multiple types of 'omic data
###---------------------------------------------------------------------------------
#prop <- c(0.65,0.35)
#prop <- c(0.30,0.40,0.30)
prop <- c(0.20,0.30,0.27,0.23)
#prop <- c(0.20,0.25,0.10,0.30,0.15)
#prop <- c(0.15,0.20,0.10,0.25,0.15,0.10,0.05)
effect <- 2.0

sim.D <- InterSIM(n.sample = 100,
					cluster.sample.prop = prop,
					delta.methyl = effect,
					delta.expr = effect,
					delta.protein = effect,
					p.DMP = 0.2,
					p.DEG = NULL, # proportion of DE mRNA, if NULL (default) mRNAs mapped by DE CpGs will be selected   
					p.DEP = NULL, # proportion of DE protein, if NULL (default) proteins mapped by DE mRNAs will be selected
					sigma.methyl = NULL, # Covariance structure of methylation data, if NULL precomputed values will be used   
					sigma.expr = NULL, # Covariance structure mRNA data, if NULL precomputed values will be used
					sigma.protein = NULL, # Covariance structure Protein data, if NULL precomputed values will be used
					cor.methyl.expr = NULL, # Correlation between methylation and mRNA, if NULL precomputed values will be used
					cor.expr.protein = NULL, # Correlation between mRNA and protein, if NULL precomputed values will be used
					do.plot = TRUE, # TRUE to generate heatmap, default is FALSE
					sample.cluster = TRUE, # For visualization purpose only
					feature.cluster = TRUE)
sim.methyl <- sim.D$dat.methyl
sim.expr <- sim.D$dat.expr
sim.protein <- sim.D$dat.protein
true.cluster.assignment <- sim.D$clustering.assignment
head(true.cluster.assignment)


## Visualization using T-Distributed Stochastic Neighbor Embedding (t-SNE)
# 1. Maaten, L. Van Der, 2014. Accelerating t-SNE using Tree-Based Algorithms. Journal of Machine
#    Learning Research, 15, p.3221-3245.
# 2. van der Maaten, L.J.P. & Hinton, G.E., 2008. Visualizing High-Dimensional Data Using t-SNE.
#    Journal of Machine Learning Research, 9, pp.2579-2605.

library(Rtsne)
library(rgl) #  3D Visualization Using OpenGL

k <- length(unique(true.cluster.assignment$cluster.id)) 
cols = 1:k
names(cols) = sort(unique(true.cluster.assignment$cluster.id))

dd <- sim.expr  
Dist <- dist(dd)
tsne <- Rtsne(Dist, initial_dims = 10, check_duplicates = FALSE, pca = F, perplexity=15, theta=0.5, dims=2, is_distance=TRUE)
head(tsne$Y)
dim(tsne$Y)
d.plot <- tsne$Y

windows(width=5, height=5)
plot(d.plot, xlab="tSNE 1",ylab="tSNE 2",pch=16,main="")
for (i in 1:k)
	{
	dd <- d.plot[true.cluster.assignment$cluster.id==i,]
	points(dd, col=cols[i],pch=16,cex=1.2)
	}

###---------------------------------------------------------------------------------
### 2. Using IntNMF on the simulated data
###---------------------------------------------------------------------------------
rm(list=ls())
library(IntNMF)

#prop <- c(0.65,0.35)
#prop <- c(0.30,0.40,0.30)
prop <- c(0.20,0.30,0.27,0.23)
effect <- 2.5

sim.D <- InterSIM(n.sample=100, cluster.sample.prop=prop, delta.methyl=effect, delta.expr=effect, delta.protein=effect, 
			p.DMP=0.25, p.DEG=NULL, p.DEP=NULL, do.plot=F, sample.cluster=T, feature.cluster=T)
dat1 <- sim.D$dat.methyl
dat2 <- sim.D$dat.expr
dat3 <- sim.D$dat.protein
true.cluster.assignment <- sim.D$clustering.assignment

## Make all data positive by shifting to positive direction.
## Also rescale the datasets so that they are comparable. 
if (!all(dat1>=0)) dat1 <- pmax(dat1 + abs(min(dat1)), .Machine$double.eps) 
dat1 <- dat1/max(dat1)   
if (!all(dat2>=0)) dat2 <- pmax(dat2 + abs(min(dat2)), .Machine$double.eps) 
dat2 <- dat2/max(dat2)
if (!all(dat3>=0)) dat3 <- pmax(dat3 + abs(min(dat3)), .Machine$double.eps) 
dat3 <- dat3/max(dat3)
# The function nmf.mnnals requires the samples to be on rows and variables on columns.
dat1[1:5,1:5]
dat2[1:5,1:5]
dat3[1:5,1:5]
dat <- list(dat1,dat2,dat3)
		
# Find optimum number of clusters for the data
opt.k <- nmf.opt.k(dat=dat, n.runs=5, n.fold=5, k.range=2:6, result=TRUE, make.plot=TRUE, progress=TRUE)
# Find clustering assignment for the samples
fit <- nmf.mnnals(dat=dat, k=4, maxiter=200, st.count=20, n.ini=5, ini.nndsvd=TRUE, seed=TRUE) 
table(fit$clusters)	
fit$clusters[1:10]

## Adjusted rand index between true and IntNMF assigned cluster membership
adjustedRandIndex(fit$clusters,true.cluster.assignment$cluster.id)

## Cluster Purity
ClusterPurity(ComputedClusters=fit$clusters, TrueClasses=true.cluster.assignment$cluster.id)

## Cluster Entropy
ClusterEntropy(ComputedClusters=fit$clusters, TrueClasses=true.cluster.assignment$cluster.id)


###---------------------------------------------------------------------------------
### 3. Using IntNMF on the real data on TCGA glioblastoma studies 
###---------------------------------------------------------------------------------
rm(list=ls())
library(RColorBrewer)
library(InterSIM)
library(IntNMF)

# Read example data, TCGA studies on glioblastoma
load("C:/Users/pchalise/Desktop/MoffittCancerCenterBioDataClub_18June2021/gbm.rda")
#str(gbm)
d1 <- dat1 <- gbm$cn
d2 <- dat2 <- gbm$methylation
d3 <- dat3 <- gbm$exp
rownames(d1) <- rownames(dat1) <- substr(rownames(dat1),1,12) 
rownames(d3) <- rownames(dat3) <- substr(rownames(dat3),1,12) 
dat1[1:5,1:5];dat2[1:5,1:5];dat3[1:5,1:5]
class(dat1);class(dat2);class(dat3)
all(rownames(dat1)==rownames(dat2))
all(rownames(dat1)==rownames(dat3))

## Make the data non-negative by shiftig towards positive direction
if (!all(dat1>=0)) dat1 <- pmax(dat1 + abs(min(dat1)), .Machine$double.eps) # shift the data to make all entries positive
if (!all(dat2>=0)) dat2 <- pmax(dat2 + abs(min(dat2)), .Machine$double.eps) 
if (!all(dat3>=0)) dat3 <- pmax(dat3 + abs(min(dat3)), .Machine$double.eps) 
dat1 <- dat1/max(dat1)   # Globally rescale data to avoid potential overflow/underflow
dat2 <- dat2/max(dat2)
dat3 <- dat3/max(dat3)
dat <- list(dat1,dat2,dat3)
SS <- c(mean(dat1^2),mean(dat2^2),mean(dat3^2))
SS 
weight <- max(SS)/SS
weight

### Integrative clustering is carried out in two steps
### Step 1: Find optimum number of clusters,k
### Step 2: Using optimum k, find the cluster-membership for samples

### Step 1: Find Optimum number of clusters, k
opt.k <- nmf.opt.k(dat=dat,n.runs=30,n.fold=5,k.range=2:8,result=T,wt=weight)
### Step 2: Use optimum k = 3 and find cluster membership 
fit <- nmf.mnnals(dat=dat,k=3,maxiter=200,st.count=30,n.ini=30,ini.nndsvd=TRUE,seed=TRUE,wt=weight) 

### Assign cluster membership using W
cluster.mem.nmf <- fit$clusters
table(cluster.mem.nmf)	
dim(fit$convergence)								

# Image plot of consensus matrix
dd <- fit$consensus
dd <- dd[names(sort(cluster.mem.nmf)),names(sort(cluster.mem.nmf))]
aheatmap(dd,col="Greys",Rowv=NA, Colv=NA)

## Convergence check
plot(1:nrow(fit$convergence),fit$convergence[,4],type="l",lwd=2, col="red",main="Convergence",xlab="iter",ylab="Relative error")
abline(h=0,col="blue")

## Cluster membership data  
cluster.mem.nmf <- sort(cluster.mem.nmf)
covariates <- data.frame(intNMF.cluster=cluster.mem.nmf)
covariates$intNMF.cluster <- as.factor(covariates$intNMF.cluster)
head(covariates)

## Heatmap
d1 <- t(d1[rownames(covariates),])
d2 <- t(d2[rownames(covariates),])
d3 <- t(d3[rownames(covariates),])
all(rownames(covariates)==colnames(d1))
all(rownames(covariates)==colnames(d2))
all(rownames(covariates)==colnames(d3))

windows(width=12, height=14)
par(mfrow=c(3,1))
hmcol <- colorRampPalette(c("blue","deepskyblue","white","orangered","red3"))(100)
ann.color <- list(NMF.cluster=c("gray30","chartreuse3","deeppink"))
aheatmap(d1,col=hmcol,annCol=covariates,annColors=ann.color,Rowv=F, Colv=NA, labRow=NA, labCol=NA,annLegend=T,legend=T,fontsize=8,
		cexRow=1.2,main="CNV")
aheatmap(d2,col=hmcol,annCol=covariates,annColors=ann.color,Rowv=F, Colv=NA, labRow=NA, labCol=NA,annLegend=T,legend=T,fontsize=8,
		cexRow=1.2,main="Methylation")
aheatmap(d3,col=hmcol,annCol=covariates,annColors=ann.color,Rowv=F, Colv=NA, labRow=NA, labCol=NA,annLegend=T,legend=T,fontsize=8,
		cexRow=1.2,main="Expression")


