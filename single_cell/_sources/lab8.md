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

# Lab8: Single-cell multi-omics data analysis
Single-cell multi-omics data analysis involves the simultaneous analysis of multiple types of data from the same cell, such as gene expression (RNA-seq), chromatin accessibility (ATAC-seq), and protein expression (CITE-seq). This integrative approach provides a more comprehensive understanding of cellular states and mechanisms.

Here's a basic workflow in R for single-cell multi-omics data analysis, focusing on RNA and ATAC integration using the **Seurat** package. This example also touches on CITE-seq analysis, integrating protein and RNA data.

### 1. **Install Required Packages**
You’ll need **Seurat**, **Signac**, and other necessary packages.

```r
# Install Seurat and Signac from CRAN and Bioconductor
install.packages("Seurat")
install.packages("ggplot2")
install.packages("dplyr")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Signac")  # For ATAC-seq analysis
BiocManager::install("biovizBase")
```

### 2. **Load Required Libraries**
Load the necessary packages for RNA-seq and ATAC-seq data analysis using Seurat and Signac.

```r
library(Seurat)
library(Signac)  # For ATAC-seq data analysis
library(ggplot2)
library(dplyr)
```

### 3. **Load Single-Cell RNA-seq Data**
Load RNA-seq data into a **Seurat** object.

```r
# Load RNA-seq data (e.g., from CellRanger output)
rna_data <- Read10X("path_to_rna_data/")

# Create a Seurat object for RNA data
seurat_obj <- CreateSeuratObject(counts = rna_data)

# Inspect the Seurat object
seurat_obj
```

### 4. **Load Single-Cell ATAC-seq Data**
Use **Signac** to load and process ATAC-seq data.

```r
# Load ATAC-seq data (e.g., from 10X Genomics output)
atac_data <- Read10X("path_to_atac_data/")

# Create a Seurat object for ATAC-seq data
# You can optionally provide the cell metadata
atac_obj <- CreateSeuratObject(counts = atac_data, assay = "ATAC")

# Add ATAC metadata (e.g., nucleosome signal, TSS enrichment)
atac_obj <- NucleosomeSignal(atac_obj)
atac_obj <- TSSEnrichment(atac_obj)

# Inspect the ATAC-seq object
atac_obj
```

### 5. **Perform Quality Control (QC)**
Run QC steps for both RNA and ATAC data, filtering out low-quality cells.

#### RNA Quality Control
```r
# Add mitochondrial gene percentage and RNA QC metrics
seurat_obj <- PercentageFeatureSet(seurat_obj, pattern = "^MT-", col.name = "percent.mt")

# Visualize QC metrics with violin plots
VlnPlot(seurat_obj, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"))

# Filter low-quality RNA cells
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
```

#### ATAC Quality Control
```r
# ATAC-seq quality metrics: fragment length, nucleosome signal, and TSS enrichment
VlnPlot(atac_obj, features = c("nucleosome_signal", "TSS.enrichment"), ncol = 2)

# Filter cells based on nucleosome signal and TSS enrichment
atac_obj <- subset(atac_obj, subset = nucleosome_signal < 4 & TSS.enrichment > 2)
```

### 6. **Normalization**
Normalize both RNA and ATAC data.

#### RNA Normalization
```r
# Normalize RNA data using SCTransform
seurat_obj <- SCTransform(seurat_obj, verbose = FALSE)
```

#### ATAC Normalization
```r
# Perform term frequency-inverse document frequency (TF-IDF) normalization on ATAC-seq data
atac_obj <- RunTFIDF(atac_obj)

# Run Singular Value Decomposition (SVD) on the ATAC-seq data
atac_obj <- FindTopFeatures(atac_obj, min.cutoff = 'q0')
atac_obj <- RunSVD(atac_obj)
```

### 7. **Dimensionality Reduction**
Run PCA or other dimensionality reduction methods on both RNA and ATAC data.

#### RNA PCA
```r
# Run PCA on RNA data
seurat_obj <- RunPCA(seurat_obj, verbose = FALSE)
```

#### ATAC LSI (Latent Semantic Indexing)
```r
# Run LSI (Latent Semantic Indexing) on ATAC data
atac_obj <- RunLSI(atac_obj)
```

### 8. **Integration of RNA and ATAC Data**
Integrate RNA and ATAC data by finding anchors between them and transferring features.

```r
# Transfer anchors from RNA to ATAC
transfer_anchors <- FindTransferAnchors(
    reference = seurat_obj,
    query = atac_obj,
    reduction = 'cca'
)

# Map RNA features onto the ATAC object
atac_obj <- TransferData(anchorset = transfer_anchors, refdata = seurat_obj$RNA, query = atac_obj)
```

### 9. **Joint UMAP Visualization**
After integrating, visualize the RNA and ATAC data together in a UMAP plot.

```r
# Integrate RNA and ATAC data using UMAP
combined_obj <- RunUMAP(transfer_anchors, dims = 1:30)

# Visualize UMAP of the integrated data
DimPlot(combined_obj, group.by = c("RNA", "ATAC"))
```

### 10. **CITE-seq: RNA and Protein Data Integration**
If you have CITE-seq data (RNA + protein), you can also integrate it into this multi-omics analysis.

```r
# Load protein (CITE-seq) data
protein_data <- Read10X("path_to_protein_data/")

# Add protein data to the Seurat object as an assay
seurat_obj[["Protein"]] <- CreateAssayObject(counts = protein_data)

# Normalize protein data
seurat_obj <- NormalizeData(seurat_obj, assay = "Protein")

# Scale protein data
seurat_obj <- ScaleData(seurat_obj, assay = "Protein")
```

### 11. **Cluster Cells**
Perform clustering of the integrated multi-omics data.

```r
# Perform clustering on the combined RNA and ATAC data
combined_obj <- FindNeighbors(combined_obj, dims = 1:30)
combined_obj <- FindClusters(combined_obj, resolution = 0.5)

# Visualize clusters
DimPlot(combined_obj, group.by = "seurat_clusters")
```

### 12. **Differential Expression**
Perform differential expression analysis across clusters in both RNA and ATAC data.

#### RNA Differential Expression
```r
# Find marker genes for RNA clusters
rna_markers <- FindMarkers(seurat_obj, ident.1 = "Cluster1", ident.2 = "Cluster2")

# Visualize top RNA markers
head(rna_markers)
```

#### ATAC Differential Accessibility
```r
# Find differentially accessible regions for ATAC clusters
atac_markers <- FindMarkers(atac_obj, ident.1 = "Cluster1", ident.2 = "Cluster2")

# Visualize top ATAC markers
head(atac_markers)
```

### 13. **Saving and Loading Seurat Objects**
Save your Seurat object for future use.

```r
# Save the Seurat object
saveRDS(combined_obj, file = "combined_multiomics.rds")

# Load the Seurat object
combined_obj <- readRDS("combined_multiomics.rds")
```

### Summary
This R pipeline demonstrates how to analyze single-cell multi-omics data by integrating RNA, ATAC-seq, and optionally CITE-seq data using the **Seurat** and **Signac** packages. It includes steps for data loading, quality control, normalization, dimensionality reduction, integration, clustering, and visualization. This provides a comprehensive framework for analyzing multi-modal single-cell data.