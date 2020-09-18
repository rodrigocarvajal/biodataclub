#install.packages(enrichR)
library(enrichR)

#set the working directory so R knows where to find your data.
setwd("~/Downloads/")

#read in the data; make sure to specify that the first row is the name of the columns (header = TRUE) and to not treat strings as factors (stringsAsFactors = FALSE)
sample_data = read.delim("sample_data.txt", header = TRUE, stringsAsFactors = FALSE)

#get the subset of data that is significantly different between wild type and mutant
sample_data_significant = subset(sample_data, wilcox_padj < 0.05 & log2_ratio > 1)

#perform pathway enrichment using the enrichR library
enrichment = enrichr(genes = sample_data_significant$gene_symbol, databases = c("GO_Biological_Process_2018", "KEGG_2016"))

#look at the top 10 results in the enrichment result for KEGG and GO
head(enrichment$KEGG_2016, 10)
head(enrichment$GO_Biological_Process_2018, 10)

#export the top KEGG enrichment results
top_enrichment = head(enrichment$KEGG_2016, 10)
write.table(x = top_enrichment, file = "KEGG_enrichment_results_2019-03-15.txt", sep = "\t", quote = F, row.names = F)
