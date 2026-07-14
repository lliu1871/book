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

# Lab9: Single-cell proteomics data analysis
Single-cell proteomics data analysis involves studying the protein expression of individual cells. With advances in mass spectrometry and antibody-based techniques, it's possible to measure the proteomic profiles at the single-cell level. For analyzing single-cell proteomics data in R, tools like **Seurat**, **flowCore**, and **CyTOF** packages can be used, depending on the type of data. Below is a general workflow for analyzing single-cell proteomics data in R, using **Seurat** and other common packages.

### 1. **Install Required Packages**
You’ll need packages such as **Seurat** (for general single-cell analysis), **flowCore** (for flow cytometry or CyTOF data), and other relevant libraries.

```r
# Install necessary packages
install.packages("Seurat")
install.packages("ggplot2")
install.packages("dplyr")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("flowCore")   # For flow cytometry/CyTOF data
BiocManager::install("CyTOF")      # For CyTOF data analysis
```

### 2. **Load Required Libraries**

```r
library(Seurat)
library(flowCore)  # For handling FCS files from flow cytometry or CyTOF
library(CyTOF)     # For advanced CyTOF proteomics analysis
library(ggplot2)
library(dplyr)
```

### 3. **Load Single-Cell Proteomics Data**

Proteomics data from single-cell experiments like CyTOF or flow cytometry is often stored in FCS (Flow Cytometry Standard) files. Here, we'll use **flowCore** to load FCS data.

#### Load FCS data:

```r
# Load FCS data using flowCore
fcs_file <- "path_to_fcs_file.fcs"
fcs_data <- read.FCS(fcs_file, transformation = FALSE)

# Convert to data frame for visualization
proteomics_df <- as.data.frame(exprs(fcs_data))

# Preview the data
head(proteomics_df)
```

### 4. **Convert Proteomics Data into Seurat Object**

You can convert the proteomics data into a **Seurat** object for downstream analysis.

```r
# Create a Seurat object from proteomics data (counts or expression)
seurat_obj <- CreateSeuratObject(counts = proteomics_df)

# Add metadata (optional)
seurat_obj$Sample <- "Sample1"
```

### 5. **Quality Control**

Perform quality control to filter out low-quality cells or protein markers.

```r
# Visualize some QC metrics like total protein counts and feature detection
VlnPlot(seurat_obj, features = c("nFeature_RNA", "nCount_RNA"))

# Filter cells based on the number of detected proteins
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 200 & nFeature_RNA < 5000)
```

### 6. **Normalization**

Since proteomics data can have varying scales of expression, normalization is necessary.

```r
# Normalize the data using a global scaling method (LogNormalize)
seurat_obj <- NormalizeData(seurat_obj, normalization.method = "LogNormalize", scale.factor = 10000)

# Scale the data (mean-center the expression for each protein)
seurat_obj <- ScaleData(seurat_obj)
```

### 7. **Dimensionality Reduction**

Reduce the dimensionality of the proteomics data using PCA, UMAP, or other methods.

```r
# Perform PCA for dimensionality reduction
seurat_obj <- RunPCA(seurat_obj, features = rownames(seurat_obj))

# Visualize the PCA results
DimPlot(seurat_obj, reduction = "pca", group.by = "Sample")
```

### 8. **Clustering**

Cluster the cells based on protein expression data.

```r
# Find neighbors and clusters
seurat_obj <- FindNeighbors(seurat_obj, dims = 1:10)
seurat_obj <- FindClusters(seurat_obj, resolution = 0.5)

# Visualize the clusters
DimPlot(seurat_obj, reduction = "umap", label = TRUE)
```

### 9. **Protein Expression Analysis**

Analyze the expression of specific proteins across the identified clusters.

```r
# Visualize protein expression levels
FeaturePlot(seurat_obj, features = c("Protein1", "Protein2"))

# Find markers that define clusters
cluster_markers <- FindMarkers(seurat_obj, ident.1 = 0, ident.2 = 1)

# View top markers
head(cluster_markers)
```

### 10. **Differential Protein Expression Analysis**

Perform differential expression analysis between clusters or conditions.

```r
# Identify differentially expressed proteins between two clusters
de_proteins <- FindMarkers(seurat_obj, ident.1 = "Cluster1", ident.2 = "Cluster2")

# Visualize the top differentially expressed proteins
VlnPlot(seurat_obj, features = head(rownames(de_proteins), n = 5))
```

### 11. **Visualize Protein Expression in Clusters**

Create heatmaps or violin plots to visualize protein expression across clusters.

```r
# Heatmap of top differentially expressed proteins
DoHeatmap(seurat_obj, features = head(rownames(de_proteins), n = 20))

# Violin plot for selected proteins
VlnPlot(seurat_obj, features = c("Protein1", "Protein2"), group.by = "seurat_clusters")
```

### 12. **Saving and Loading Seurat Objects**

Save the Seurat object for future use.

```r
# Save the Seurat object
saveRDS(seurat_obj, file = "seurat_proteomics.rds")

# Load the Seurat object
seurat_obj <- readRDS("seurat_proteomics.rds")
```

### Summary

This pipeline demonstrates how to analyze single-cell proteomics data using **Seurat** and related R packages. The workflow includes steps for loading FCS data, creating Seurat objects, performing quality control, normalization, dimensionality reduction, clustering, and differential expression analysis. This approach provides a comprehensive framework for exploring single-cell proteomics data in R.