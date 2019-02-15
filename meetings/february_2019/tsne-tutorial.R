require("Rtsne")
require("irlba")
require("rjson")

### Example t-SNE computation

    # Adapting from https://www.analyticsvidhya.com/blog/2017/01/t-sne-implementation-r-python/

    # The MNIST handwritten digits 0-9
    # 10k images with 784 pixels each

    mnist.data <- read.csv(file.choose())
    labels <- mnist.data$label
    mnist.data$label <- as.factor(mnist.data$label)
    
    colors=rainbow(length(unique(mnist.data$label)))
    names(colors)=unique(mnist.data$label)


    # Barnes-Hut tSNE without PCA
    # default theta = 0.5
    tsne.mnist <- Rtsne(mnist.data[,-1], dims=2, perplexity=30, 
                        pca = FALSE, verbose=TRUE, max_iter=500)
    
    plot(tsne.mnist$Y, t='n', main="tsne")
    text(tsne.mnist$Y, labels=mnist.data$label, col=colors[mnist.data$label])

    # Barnes-Hut tSNE with PCA
    # default theta = 0.5
    tsne.mnist <- Rtsne(mnist.data[,-1], dims=2, perplexity=30, initial_dimensions = 50,
                        pca = FALSE, verbose=TRUE, max_iter=500)
    
    plot(tsne.mnist$Y, t='n', main="tsne")
    text(tsne.mnist$Y, labels=mnist.data$label, col=colors[mnist.data$label])
    

    # compute first 200 PCs and then
    #     assemble the parts for interactive tsne
    mnist.pcs <- as.data.frame(prcomp_irlba(mnist.data[,-1], n = 200)$x)
    mnist.covs <- data.frame(label=mnist.data$label)
    mnist.discreteCovs <- list("label")
    mnist.continuousCovs <- list()
    
    mnist <- list(pcs = mnist.pcs,
                  covs = mnist.covs,
                  discreteCovs = mnist.discreteCovs,
                  continuousCovs = mnist.continuousCovs)
    json <- rjson::toJSON(mnist)
    write(json, file="data/mnist.json")
    
    # go to http://zc:3838/apps/interactive-tsne/
    


### DNA genotypes

    # Original data is large with over 400k dimensions . Will use precomputed PCA scores
  
    load("data/ecla.tsne.tutorial.rds")
    
    # this loads three objects
    #     ecla.pcs, ecla.discreteCovs, and ecla.continousCovs
    
    ecla <- list(pcs=ecla.pcs, 
                      covs = ecla.covs,
                      discreteCovs = ecla.discreteCovs, 
                      continuousCovs = ecla.continuousCovs)
    
    json <- rjson::toJSON(ecla)
    write(json, file="data/ecla.json")
    
    
    # go to http://zc:3838/apps/interactive-tsne/
    

### scRNA-seq
    
    # Original data is large with 31k features . Will use precomputed PCA scores
    
    load("data/uvmice.tsne.tutorial.rds")
  
    uvmice <- list(pcs=uvmice.pcs, 
                      covs = uvmice.covs,
                      discreteCovs = uvmice.discreteCovs, 
                      continuousCovs = uvmice.continuousCovs)
    
    json <- rjson::toJSON(uvmice)
    write(json, file="data/uvmice.json")
  


