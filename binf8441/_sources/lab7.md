---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: R
  language: R
  name: ir
---


# Lab 7: Multiple tests
We generate gene expression data for 4 genes

```{code-cell}
data = data.frame(group=c(rep(0,10),rep(1,10)), 
                  gene1 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=2.2, sd=1)), 
                  gene2 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=0.2, sd=1)), 
                  gene3 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=0.2, sd=1)), 
                  gene4 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=2.2, sd=1)))
data
```

## Bonferroni correction
```{code-cell}
numtest = 4
pvalue = 1:numtest
for(i in 1:numtest){
    pvalue[i] = t.test(data[,i+1] ~ data[,1])$p.value
}

print("the Bonferroni adjusted pvalues")
pvalue*numtest
```


## False Discovery Rate (FDR)
To perform the FDR analysis in R, we need to install the package **fuzzySim** by typing **install.packages("fuzzySim")** in R.

```{code-cell}
library(fuzzySim)
data = data.frame(group=c(rep(0,10),rep(1,10)), 
                  gene1 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=2.2, sd=1)), 
                  gene2 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=0.2, sd=1)), 
                  gene3 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=0.2, sd=1)), 
                  gene4 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=2.2, sd=1)))
data

FDR(data = data, sp.cols = 1, var.cols = 2:5, family = "gaussian")
```


## Microarray gene expression analysis

To analyze gene expression data, we need to install Bioconductor packages. To install Bioconductor packages, type the following in an R command window:

```{code}
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("affy","limma","arrays"))

```

1. We first import data from the package **arrays**.

```{code-cell}
library(affy)   # Affymetrix pre-processing
library(limma)  # two-color pre-processing; differential
                  # expression
                
## import "phenotype" data, describing the experimental design
phenoData <- read.AnnotatedDataFrame(system.file("extdata", "pData.txt", package="arrays"))
celfiles <- system.file("extdata", package="arrays")
```

2. RMA normalization for microarray expression data

```{code-cell}
eset <- justRMA(phenoData=phenoData, celfile.path=celfiles)
```

3. Identify differentially expressed genes
```{code-cell}
combn <- factor(paste(pData(phenoData)[,1], pData(phenoData)[,2], sep = "_"))
design <- model.matrix(~combn) # describe model to be fit

fit <- lmFit(eset, design)  # fit each probeset to model
efit <- eBayes(fit)        # empirical Bayes adjustment
topTable(efit, coef=2)      # table of differentially expressed probesets
```
