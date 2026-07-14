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

# Lab7: Spatial transcriptomics data analysis
Spatial transcriptomics (ST) is a cutting-edge technique that combines gene expression data with spatial information, allowing researchers to analyze the spatial context of gene expression within tissues. Analyzing spatial transcriptomics data in R typically involves using tools like **`Seurat`**, **`SpatialExperiment`**, and **`SpatialFeaturePlot`**, among others.

Below is an example workflow in R for analyzing spatial transcriptomics data, using **`Seurat`** and **`STUtility`**.

### 1. **Install Required Packages**
You will need **Seurat**, **STUtility**, and other relevant packages.

```r
# Install the necessary packages from CRAN and Bioconductor
install.packages("Seurat")
install.packages("ggplot2")
install.packages("dplyr")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("SpatialExperiment")
BiocManager::install("STUtility")
```

### 2. **Load Required Libraries**

```r
library(Seurat)
library(STUtility)
library(ggplot2)
library(dplyr)
library(SpatialExperiment)
```

### 3. **Load the Spatial Transcriptomics Data**
Typically, spatial transcriptomics data comes from platforms like 10X Genomics (Visium) and can be processed using the Space Ranger pipeline. You can import spatial data using **Seurat** and **STUtility**.

#### Loading 10x Genomics Spatial Data
You can load data processed by 10x Space Ranger with the following command:

```r
# Load the spatial data from the Space Ranger output
# The `Read10X_Spatial()` function reads both gene expression and spatial coordinates
spatial_data <- Read10X_Spatial(
    data.dir = "path_to_spatial_data",
    filename = "filtered_feature_bc_matrix.h5"
)

# Create a Seurat object for spatial data
seurat_obj <- CreateSeuratObject(counts = spatial_data$`Gene Expression`)

# Add spatial coordinates to the Seurat object
seurat_obj[["spatial"]] <- CreateSpatialImage(image = spatial_data$image, coords = spatial_data$coordinates)

# Inspect the Seurat object
seurat_obj
```

### 4. **Quality Control**
Just like with single-cell RNA-seq, spatial data requires quality control.

```r
# Add QC metrics such as the number of features and counts
seurat_obj <- PercentageFeatureSet(seurat_obj, pattern = "^MT-", col.name = "percent.mt")

# Visualize QC metrics with violin plots
VlnPlot(seurat_obj, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

# Apply filtering to remove low-quality spots
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 500 & nFeature_RNA < 2500 & percent.mt < 5)
```

### 5. **Normalization and Scaling**
Normalize the data to account for technical variability.

```r
# Normalize the data
seurat_obj <- SCTransform(seurat_obj, assay = "RNA", verbose = FALSE)

# Scale the data
seurat_obj <- ScaleData(seurat_obj, features = rownames(seurat_obj))
```

### 6. **Dimensionality Reduction and Clustering**
Perform dimensionality reduction and clustering to identify spatial domains.

```r
# Run PCA for dimensionality reduction
seurat_obj <- RunPCA(seurat_obj, verbose = FALSE)

# Find neighbors and clusters
seurat_obj <- FindNeighbors(seurat_obj, dims = 1:30)
seurat_obj <- FindClusters(seurat_obj, resolution = 0.5)

# Run UMAP for visualization
seurat_obj <- RunUMAP(seurat_obj, dims = 1:30)

# Visualize clusters with UMAP
DimPlot(seurat_obj, reduction = "umap", label = TRUE)
```

### 7. **Spatial Feature Plotting**
Visualize gene expression across spatial coordinates.

```r
# Plot a feature (gene) spatially
SpatialFeaturePlot(seurat_obj, features = c("GeneA"))

# Visualize clusters in the spatial context
SpatialDimPlot(seurat_obj, group.by = "seurat_clusters")
```

### 8. **Integration with Single-cell Data**
If you have single-cell RNA-seq data and wish to integrate it with spatial data, **Seurat** allows you to do this.

```r
# Load single-cell RNA-seq data (if available)
sc_data <- Read10X("path_to_single_cell_data/")

# Create a Seurat object for single-cell data
sc_obj <- CreateSeuratObject(counts = sc_data)

# Normalize and scale the single-cell data
sc_obj <- SCTransform(sc_obj, verbose = FALSE)

# Integrate spatial and single-cell data
anchors <- FindTransferAnchors(reference = sc_obj, query = seurat_obj, normalization.method = "SCT")

# Transfer labels (or cell types) from scRNA-seq to spatial data
seurat_obj <- TransferData(anchorset = anchors, refdata = sc_obj$celltype, prediction.assay = TRUE)

# Visualize the transferred labels in the spatial context
SpatialFeaturePlot(seurat_obj, features = "predicted.celltype")
```

### 9. **Differential Expression Analysis**
You can perform differential expression analysis between different spatial clusters.

```r
# Perform differential expression analysis between clusters
de_genes <- FindMarkers(seurat_obj, ident.1 = "Cluster1", ident.2 = "Cluster2")

# Visualize top differentially expressed genes
head(de_genes)

# Plot top DE genes in spatial context
SpatialFeaturePlot(seurat_obj, features = rownames(de_genes)[1:5])
```

### 10. **Spatially Variable Features**
Identify genes that show spatial variation across the tissue.

```r
# Find spatially variable features
seurat_obj <- FindSpatiallyVariableFeatures(seurat_obj, assay = "SCT", features = VariableFeatures(seurat_obj))

# Visualize top spatially variable genes
top_spatial_genes <- head(SpatiallyVariableFeatures(seurat_obj), 10)
SpatialFeaturePlot(seurat_obj, features = top_spatial_genes)
```

### 11. **Saving and Loading Objects**
You can save your processed Seurat object for future analysis.

```r
# Save the Seurat object
saveRDS(seurat_obj, file = "seurat_spatial.rds")

# Load the saved Seurat object
seurat_obj <- readRDS("seurat_spatial.rds")
```

### Summary
This pipeline provides an overview of the steps involved in analyzing spatial transcriptomics data using **`Seurat`** and **`STUtility`** in R. The workflow covers data loading, quality control, normalization, dimensionality reduction, clustering, spatial feature plotting, and integration with single-cell RNA-seq data. It also includes differential expression and identification of spatially variable features.