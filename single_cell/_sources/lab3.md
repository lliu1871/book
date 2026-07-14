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

# Lab3: scWGBS data analysis

Analyzing single-cell whole-genome bisulfite sequencing (scWGBS) data in **R** involves some specialized tools. One of the main R packages used for methylation analysis is **methylKit**. Below is a basic pipeline for scWGBS data analysis using **methylKit**, **bsseq**, and **methylSig**. This pipeline includes steps for data loading, quality control, methylation calling, and differential methylation analysis.

## 1. **Install Required Packages**

First, you need to install the necessary R packages for scWGBS analysis.

```r
# Install Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("methylKit")
BiocManager::install("bsseq")
BiocManager::install("methylSig")

# Other useful packages
install.packages("ggplot2")
install.packages("dplyr")
```

## 2. **Load Required Libraries**

```r
library(methylKit)
library(bsseq)
library(methylSig)
library(ggplot2)
library(dplyr)
```

## 3. **Load the Data**

You can load scWGBS data in various formats such as `.bam` files, `.cov` files, or even bedgraph files. If you already have methylation calls from a previous step, you can directly use them. Below is an example using `.cov` files, which contain methylation information (cytosine count data).

```r
# Load methylation data from .cov files (example format: chr, position, strand, methCount, unmethCount)
file.list <- list("sample1.cov", "sample2.cov", "sample3.cov")

# Load the data into methylKit objects
meth <- methRead(file.list,
                 sample.id = list("sample1", "sample2", "sample3"),
                 assembly = "hg19", 
                 treatment = c(0, 1, 1), 
                 context = "CpG",
                 pipeline = "bismarkCov")

# Check the object
meth
```

## 4. **Quality Control**

For scWGBS data, quality control steps are crucial to remove low-quality cells or regions with insufficient coverage.

```r
# Filter out bases with low read coverage (<10 reads)
meth_filtered <- filterByCoverage(meth, lo.count = 10, lo.perc = NULL, hi.count = NULL, hi.perc = 99.9)

# Normalize coverage across samples (optional)
meth_norm <- normalizeCoverage(meth_filtered)

# Visualize methylation statistics
getMethylationStats(meth_filtered[[1]], plot = TRUE, both.strands = FALSE)
```

## 5. **Unite Methylation Calls Across Cells**

Next, we combine the methylation information across all samples (cells) at common CpG sites.

```r
# Combine methylation data across samples
meth_united <- unite(meth_norm, destrand = TRUE)

# View the first few rows
head(meth_united)
```

## 6. **Differential Methylation Analysis**

For scWGBS data, it is common to identify differentially methylated cytosines (DMCs) or differentially methylated regions (DMRs) across different conditions or cell populations.

```r
# Perform differential methylation analysis between groups (e.g., condition 0 vs 1)
diff_meth <- calculateDiffMeth(meth_united)

# View the top differentially methylated cytosines (DMCs)
head(diff_meth)

# Get DMCs with q-value < 0.01
dmcs <- getMethylDiff(diff_meth, qvalue = 0.01, difference = 25)

# View the DMCs
head(dmcs)
```

## 7. **Visualizing Differential Methylation**

Visualize the results to explore differentially methylated sites or regions between samples.

```r
# Plot distribution of methylation percentage differences
plot(density(dmcs$meth.diff), main = "Differential Methylation", xlab = "Methylation Difference")

# Create a methylation heatmap
library(pheatmap)
meth_matrix <- percMethylation(meth_united)
pheatmap(meth_matrix, cluster_rows = TRUE, cluster_cols = TRUE, show_rownames = FALSE, show_colnames = TRUE)
```

## 8. **Regional Analysis (DMRs)**

To identify differentially methylated regions (DMRs), you can group nearby CpGs and assess methylation differences across larger genomic regions.

```r
# Find DMRs (regions with at least 3 CpGs and a methylation difference > 25%)
dmrs <- calculateDiffMeth(meth_united, overdispersion = TRUE, window.size = 1000, step.size = 100)

# Get DMRs with q-value < 0.01
dmrs_sig <- getMethylDiff(dmrs, qvalue = 0.01, difference = 25)

# Visualize DMRs
head(dmrs_sig)
```

## 9. **Using bsseq for Single-Cell Methylation Data**

**bsseq** is another package commonly used for bisulfite sequencing data. It’s particularly useful for smoothing methylation data and calling DMRs.

```r
# Load data into bsseq object
bs_obj <- read.bismark("sample1.cov", sampleNames = "sample1")

# Perform smoothing to reduce noise in scWGBS data
bs_obj <- BSmooth(bs_obj)

# Visualize the smoothed methylation levels
plot(bs_obj)
```

## 10. **Saving and Loading Methylation Objects**

You can save and reload your methylation analysis objects for future use.

```r
# Save methylation object
saveRDS(meth_united, "meth_united.rds")

# Load methylation object
meth_united <- readRDS("meth_united.rds")
```

## Summary

This R pipeline provides a basic framework for analyzing single-cell whole-genome bisulfite sequencing (scWGBS) data using **methylKit**, **bsseq**, and other tools. Key steps include loading methylation data, performing quality control, uniting methylation calls, conducting differential methylation analysis, and visualizing results. Further extensions of this pipeline could include regional analysis (DMRs), integrating multi-omics data, or performing functional annotation.