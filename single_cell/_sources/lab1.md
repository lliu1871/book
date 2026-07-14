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

# Lab1: scRNA-seq data analysis

Here's a basic R pipeline for single-cell RNA sequencing (scRNA-seq) data analysis using the popular **Seurat** package. This guide covers the essential steps, including data loading, quality control, normalization, clustering, and visualization.

## 1. **Install Required Packages**
First, you need to install the **Seurat** package and any other dependencies.

```r
# Install Seurat
install.packages('Seurat')     # Install Seurat from CRAN
# Alternatively, you can install the development version from GitHub
devtools::install_github("satijalab/seurat", ref = "develop")

# Install other necessary packages
install.packages("dplyr")      # For data manipulation
install.packages("ggplot2")    # For visualization
```

## 2. **Load Libraries**
```{code-cell}
library(Seurat)
library(dplyr)
library(ggplot2)
```

## 3. **Load the Data**
You can load your scRNA-seq data in various formats, such as a count matrix or using data from 10x Genomics.

```r
# Example for 10x Genomics data
# Load the count matrix directly from the directory
sc_data <- Read10X(data.dir = "path_to_your_data/")

# Create a Seurat object
seurat_obj <- CreateSeuratObject(counts = sc_data, project = "scRNAseq_Project", min.cells = 3, min.features = 200)
```

## 4. **Quality Control (QC)**
In this step, we calculate mitochondrial gene content and filter out poor-quality cells.

```r
# Calculate the percentage of mitochondrial genes
seurat_obj[["percent.mt"]] <- PercentageFeatureSet(seurat_obj, pattern = "^MT-")

# Visualize QC metrics
VlnPlot(seurat_obj, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

# Filter out cells based on QC metrics
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
```

## 5. **Normalization**
Use the `LogNormalize` method to normalize the gene expression counts in each cell.

```r
seurat_obj <- NormalizeData(seurat_obj, normalization.method = "LogNormalize", scale.factor = 10000)
```

## 6. **Find Variable Features**
Identify the highly variable genes that are important for downstream analyses like clustering.

```r
# Find variable features (genes)
seurat_obj <- FindVariableFeatures(seurat_obj, selection.method = "vst", nfeatures = 2000)

# Plot top 10 most variable genes
top10 <- head(VariableFeatures(seurat_obj), 10)
VariableFeaturePlot(seurat_obj) + LabelPoints(points = top10, repel = TRUE)
```

## 7. **Scaling the Data**
Scale the data so that each gene has a mean of 0 and a variance of 1.

```r
# Scale the data
seurat_obj <- ScaleData(seurat_obj, features = rownames(seurat_obj))
```

## 8. **Perform PCA**
Run Principal Component Analysis (PCA) to reduce the dimensionality of the data.

```r
# Run PCA
seurat_obj <- RunPCA(seurat_obj, features = VariableFeatures(object = seurat_obj))

# Visualize PCA results
VizDimLoadings(seurat_obj, dims = 1:2, reduction = "pca")
DimPlot(seurat_obj, reduction = "pca")
```

## 9. **Find Neighbors and Clusters**
Find the nearest neighbors and perform clustering on the cells.

```r
# Find the neighbors
seurat_obj <- FindNeighbors(seurat_obj, dims = 1:10)

# Perform clustering
seurat_obj <- FindClusters(seurat_obj, resolution = 0.5)

# Visualize the clusters in a 2D plot (PCA or UMAP)
DimPlot(seurat_obj, reduction = "pca", group.by = "seurat_clusters")
```

## 10. **UMAP / t-SNE for Visualization**
Use UMAP (Uniform Manifold Approximation and Projection) or t-SNE (t-distributed Stochastic Neighbor Embedding) for visualization in low-dimensional space.

```r
# Run UMAP
seurat_obj <- RunUMAP(seurat_obj, dims = 1:10)

# Visualize UMAP
DimPlot(seurat_obj, reduction = "umap")
```

## 11. **Find Marker Genes for Each Cluster**
Find differentially expressed genes (markers) for each cluster.

```r
# Find marker genes
cluster_markers <- FindAllMarkers(seurat_obj, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)

# View the top markers for each cluster
head(cluster_markers)

# Visualize top markers for specific clusters
FeaturePlot(seurat_obj, features = c("GeneA", "GeneB"))
```

## 12. **Save and Load Seurat Objects**
Once analysis is complete, you may want to save and reload your Seurat object.

```r
# Save Seurat object
saveRDS(seurat_obj, file = "seurat_obj.rds")

# Load Seurat object
seurat_obj <- readRDS(file = "seurat_obj.rds")
```

## Summary
This pipeline provides a step-by-step guide for analyzing scRNA-seq data, including data loading, QC, normalization, clustering, and visualization. It offers a basic structure that can be extended with more advanced analyses like trajectory inference, differential expression, and integration with other omics data.