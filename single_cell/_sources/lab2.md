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

# Lab2: scATAC-seq data analysis

Here's a basic pipeline for analyzing single-cell ATAC sequencing (scATAC-seq) data using **R**. We will use the **Signac** package, which extends the capabilities of **Seurat** for the analysis of single-cell chromatin data, specifically scATAC-seq data.

## 1. **Install Required Packages**
First, install the necessary packages, including **Signac** and **Seurat**.

```r
# Install Signac and Seurat
install.packages("Seurat")
install.packages("Signac")
install.packages("ggplot2")
install.packages("dplyr")

# Or use devtools to install from GitHub if necessary
# devtools::install_github("timoast/signac")
```

## 2. **Load Required Libraries**
```r
library(Signac)
library(Seurat)
library(ggplot2)
library(dplyr)
```

## 3. **Load and Preprocess Data**
Assuming you're using 10x Genomics data, start by loading the fragment and peak data. If you have your data in a different format, adjust accordingly.

```r
# Load metadata and count matrices
metadata <- read.csv("path_to_metadata.csv", row.names = 1)
peak_counts <- Read10X_h5("path_to_peak_matrix.h5")

# Create a Seurat object with the peak counts
atac_obj <- CreateSeuratObject(
  counts = peak_counts,
  assay = 'peaks',
  project = 'scATAC',
  min.cells = 10,
  meta.data = metadata
)

# View the object
atac_obj
```

## 4. **Add Fragment File Information**
To perform certain analyses like calculating TSS enrichment or nucleosome signal, you need to load the fragment file.

```r
# Load the fragment file
fragments <- "path_to_fragments.tsv.gz"
atac_obj <- SetFragments(atac_obj, file = fragments)
```

## 5. **Quality Control**
Next, calculate important QC metrics, such as nucleosome signal, transcription start site (TSS) enrichment, and mitochondrial percentage.

```r
# Calculate nucleosome signal
atac_obj <- NucleosomeSignal(atac_obj)

# Calculate TSS enrichment
atac_obj <- TSSEnrichment(atac_obj, fast = FALSE)

# Add mitochondrial percentage as metadata (if mitochondrial peaks are available)
atac_obj$mito_percentage <- PercentageFeatureSet(atac_obj, pattern = "^MT-")

# Visualize QC metrics
VlnPlot(atac_obj, features = c("nCount_peaks", "nFeature_peaks", "TSS.enrichment", "nucleosome_signal"), ncol = 4)

# Filter out low-quality cells based on QC metrics
atac_obj <- subset(atac_obj, subset = nCount_peaks < 100000 & nCount_peaks > 500 & nucleosome_signal < 2 & TSS.enrichment > 2)
```

## 6. **Normalization**
Normalize the peak count data to make cells comparable.

```r
# Perform TF-IDF normalization (Term Frequency–Inverse Document Frequency)
atac_obj <- RunTFIDF(atac_obj)

# Find the top variable features
atac_obj <- FindTopFeatures(atac_obj, min.cutoff = 'q0')

# Run SVD for dimensionality reduction (using the top features)
atac_obj <- RunSVD(atac_obj)
```

## 7. **Dimensionality Reduction**
Perform dimensionality reduction using Latent Semantic Indexing (LSI), a common method for scATAC-seq data.

```r
# Run UMAP on the first few dimensions from SVD
atac_obj <- RunUMAP(atac_obj, reduction = 'lsi', dims = 2:30)

# Visualize the UMAP plot
DimPlot(atac_obj, reduction = 'umap', group.by = 'seurat_clusters')
```

## 8. **Clustering**
Perform clustering on the LSI-reduced data to identify distinct cell populations.

```r
# Find neighbors and clusters
atac_obj <- FindNeighbors(atac_obj, reduction = 'lsi', dims = 2:30)
atac_obj <- FindClusters(atac_obj, resolution = 0.5)

# Visualize clusters
DimPlot(atac_obj, reduction = 'umap', label = TRUE)
```

## 9. **Peak Calling (Optional)**
If you have raw fragment data and need to call peaks, you can use **MACS2** for peak calling. However, peak calling typically happens before creating the Seurat object.

```r
# Example peak calling using MACS2 (run this on the command line, not in R)
# macs2 callpeak -t fragments.tsv.gz -f BED -g hs -n sample_name --outdir output_dir --nomodel --shift -100 --extsize 200 -B --SPMR
```

## 10. **Marker Gene/Peak Identification**
You can find differentially accessible peaks or genes for each cluster.

```r
# Find marker peaks
cluster_markers <- FindMarkers(atac_obj, ident.1 = 0, ident.2 = 1)

# View top markers
head(cluster_markers)

# Plot specific markers
FeaturePlot(atac_obj, features = c("peakA", "peakB"))
```

## 11. **Link Peaks to Genes (Cicero or Co-Accessibility)**
To link peaks to genes, you can use **Cicero** or other co-accessibility tools. Here’s a basic workflow using Cicero.

```r
# Install Cicero
install.packages("cicero")

# Load Cicero library
library(cicero)

# Preprocess the Seurat object for Cicero
cicero_obj <- make_cicero_cds(atac_obj, reduced_coordinates = Embeddings(atac_obj, "umap"))

# Run Cicero to link peaks to genes
peak_gene_links <- run_cicero(cicero_obj, "hg19")

# View peak-gene links
head(peak_gene_links)
```

## 12. **Save and Load Seurat Objects**
You can save your Seurat object for future use.

```r
# Save Seurat object
saveRDS(atac_obj, file = "atac_obj.rds")

# Load Seurat object
atac_obj <- readRDS("atac_obj.rds")
```

## Summary
This pipeline covers the essential steps for analyzing scATAC-seq data in R using **Signac** and **Seurat**, including quality control, normalization, dimensionality reduction, clustering, and marker identification. You can extend this analysis by adding peak-to-gene linkages, motif analysis, or other multi-omics integration techniques.