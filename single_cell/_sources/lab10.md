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

# Lab10: Single-cell metabolomics data analysis
Single-cell metabolomics is the study of metabolic profiles at the individual cell level. This type of data allows researchers to understand cellular metabolism, heterogeneity, and the role of metabolites in various cellular processes. Although single-cell metabolomics is not as widespread as other single-cell omics (like RNA-seq), there are tools available to analyze metabolomics data in R, primarily using existing general-purpose bioinformatics tools.

Here's a general workflow for analyzing single-cell metabolomics data in R, integrating tools like **Seurat**, **MetaboAnalystR**, and **ggplot2**.

### 1. **Install Required Packages**
You will need to install and load some specific packages such as **Seurat**, **MetaboAnalystR**, and **ggplot2** for visualizations.

```r
# Install necessary packages
install.packages("Seurat")
install.packages("ggplot2")
install.packages("dplyr")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

# Install MetaboAnalystR for metabolomics-specific functions
BiocManager::install("MetaboAnalystR")
```

### 2. **Load Required Libraries**

```r
library(Seurat)
library(MetaboAnalystR)  # For metabolomics-specific analysis
library(ggplot2)
library(dplyr)
```

### 3. **Load Single-Cell Metabolomics Data**
Metabolomics data is usually presented in a matrix format with metabolites as features (rows) and cells or samples as observations (columns). The data may come from mass spectrometry (MS) or nuclear magnetic resonance (NMR) techniques.

```r
# Load your single-cell metabolomics data (usually in a matrix format)
# Here 'sc_metabolomics_data.csv' should be a CSV file with metabolites as rows and cells as columns
sc_metabolomics_data <- read.csv("path_to_your_sc_metabolomics_data.csv", row.names = 1)

# Convert data to a Seurat object for downstream analysis
seurat_obj <- CreateSeuratObject(counts = sc_metabolomics_data)

# Inspect the Seurat object
seurat_obj
```

### 4. **Quality Control**
Perform basic quality control on the data to remove low-quality cells or metabolites.

```r
# Visualize QC metrics such as the number of detected metabolites and total metabolite counts
VlnPlot(seurat_obj, features = c("nFeature_RNA", "nCount_RNA"))

# Filter out cells with low metabolite detection
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 200 & nFeature_RNA < 2500)
```

### 5. **Normalization**
Metabolomics data often varies in scale and may require normalization to reduce batch effects and variations between cells.

```r
# Normalize the metabolomics data using log normalization
seurat_obj <- NormalizeData(seurat_obj, normalization.method = "LogNormalize", scale.factor = 10000)

# Scale the data (optional, depends on the downstream analysis)
seurat_obj <- ScaleData(seurat_obj)
```

### 6. **Dimensionality Reduction**
Perform dimensionality reduction techniques like PCA or UMAP to visualize the metabolomics data.

```r
# Run PCA for dimensionality reduction
seurat_obj <- RunPCA(seurat_obj, features = rownames(seurat_obj))

# Visualize PCA results
DimPlot(seurat_obj, reduction = "pca")

# Run UMAP for better visualization
seurat_obj <- RunUMAP(seurat_obj, dims = 1:10)

# Visualize UMAP clusters
DimPlot(seurat_obj, reduction = "umap", group.by = "Sample")
```

### 7. **Clustering**
Cluster the single cells based on their metabolite profiles.

```r
# Find neighbors and clusters based on metabolomics data
seurat_obj <- FindNeighbors(seurat_obj, dims = 1:10)
seurat_obj <- FindClusters(seurat_obj, resolution = 0.5)

# Visualize clusters in UMAP space
DimPlot(seurat_obj, reduction = "umap", label = TRUE)
```

### 8. **Differential Metabolite Expression**
Identify metabolites that are differentially expressed between clusters or conditions.

```r
# Find markers that define each cluster (differential metabolite expression)
cluster_markers <- FindMarkers(seurat_obj, ident.1 = 0, ident.2 = 1)

# View top differentially expressed metabolites
head(cluster_markers)

# Visualize metabolite expression levels using Violin plots
VlnPlot(seurat_obj, features = c("Metabolite1", "Metabolite2"))
```

### 9. **Pathway Enrichment Analysis**
Use **MetaboAnalystR** to perform pathway enrichment analysis on the significant metabolites. 

```r
# Prepare the data for pathway analysis
mSet <- InitDataObjects("conc", "pathway", FALSE)

# Load your metabolomics data into MetaboAnalystR
mSet <- Read.TextData(mSet, "path_to_your_significant_metabolites.csv", "rowu", "disc")

# Normalize the data within MetaboAnalystR
mSet <- NormalizeData(mSet, norm.method = "LogNorm", trans.method = "Log")

# Perform pathway enrichment analysis
mSet <- PerformPathwayAnalysis(mSet, "hsa", "current")

# Visualize pathway results
PlotPathSummary(mSet)
```

### 10. **Heatmap Visualization**
Generate heatmaps to visualize metabolite expression patterns across clusters.

```r
# Create a heatmap of top differentially expressed metabolites
DoHeatmap(seurat_obj, features = head(rownames(cluster_markers), n = 20))

# Adjust visualization for better interpretation
```

### 11. **Save and Load Seurat Object**
Save your analysis to avoid re-running steps.

```r
# Save the Seurat object for later use
saveRDS(seurat_obj, file = "seurat_metabolomics.rds")

# Load the Seurat object
seurat_obj <- readRDS("seurat_metabolomics.rds")
```

### Summary
This workflow demonstrates how to analyze single-cell metabolomics data using **Seurat** and **MetaboAnalystR** in R. It includes steps for data loading, quality control, normalization, dimensionality reduction, clustering, differential metabolite expression, pathway enrichment analysis, and visualizations. This pipeline provides a comprehensive framework for understanding cellular metabolism at the single-cell level.