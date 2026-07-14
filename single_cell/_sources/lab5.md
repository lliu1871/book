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

# Lab5: scChIP-seq data analysis
Single-cell chromatin immunoprecipitation sequencing (scChIP-seq) is used to profile DNA-protein interactions at a single-cell level, providing insights into transcription factor binding sites, histone modifications, and other chromatin-associated features. While most scChIP-seq analysis relies on specialized tools like **SCALE**, **CisTopic**, or **SnapATAC**, you can use R for downstream processing, quality control, and visualization.

Here’s a basic R workflow for single-cell ChIP-seq data analysis, which assumes you’ve already performed preprocessing steps (like peak calling) using tools such as **MACS2**.

### 1. **Install Required Packages**
You will need packages like **Signac**, **Seurat**, and **DiffBind** to handle ChIP-seq data analysis in R.

```r
# Install Bioconductor and CRAN packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Signac")
BiocManager::install("DiffBind")
BiocManager::install("GenomicRanges")

install.packages("Seurat")
install.packages("ggplot2")
install.packages("dplyr")
```

### 2. **Load Required Libraries**
Load the necessary libraries for data handling, normalization, and visualization.

```r
library(Signac)
library(Seurat)
library(DiffBind)
library(GenomicRanges)
library(ggplot2)
library(dplyr)
```

### 3. **Load the Peak Data**
Assuming you have ChIP-seq peak data (in BED or count matrix format) and metadata for the cells, you can create a **Seurat** or **Signac** object to handle the data.

```r
# Load peak counts (e.g., from MACS2 peak calling)
peak_counts <- Read10X("path_to_peak_count_matrix")

# Load metadata (e.g., cell barcodes, sample information)
metadata <- read.csv("path_to_metadata.csv", row.names = 1)

# Create a Seurat object
chip_obj <- CreateSeuratObject(
  counts = peak_counts,
  assay = 'peaks',
  meta.data = metadata
)

# View the Seurat object
chip_obj
```

### 4. **Quality Control**
Perform quality control by filtering low-quality cells based on various metrics such as fragment counts and peak coverage.

```r
# Filter based on the number of detected peaks
chip_obj <- subset(chip_obj, subset = nFeature_peaks > 500 & nFeature_peaks < 25000)

# Add additional QC metrics (if needed)
chip_obj$percent_mito <- PercentageFeatureSet(chip_obj, pattern = "^MT-")

# Visualize QC metrics
VlnPlot(chip_obj, features = c("nFeature_peaks", "nCount_peaks", "percent_mito"), ncol = 3)
```

### 5. **Normalization**
Normalize the peak counts across cells to account for varying library sizes.

```r
# Perform TF-IDF normalization (Term Frequency–Inverse Document Frequency)
chip_obj <- RunTFIDF(chip_obj)

# Find the top variable features
chip_obj <- FindTopFeatures(chip_obj, min.cutoff = 'q0')
```

### 6. **Dimensionality Reduction and Clustering**
To explore the data, you can perform dimensionality reduction and clustering to identify distinct chromatin states or cell types.

```r
# Run Singular Value Decomposition (SVD) for dimensionality reduction
chip_obj <- RunSVD(chip_obj)

# Run UMAP for visualization
chip_obj <- RunUMAP(chip_obj, reduction = 'lsi', dims = 2:30)

# Find neighbors and clusters
chip_obj <- FindNeighbors(chip_obj, reduction = 'lsi', dims = 2:30)
chip_obj <- FindClusters(chip_obj, resolution = 0.5)

# Visualize clusters using UMAP
DimPlot(chip_obj, reduction = 'umap', label = TRUE)
```

### 7. **Differential Peak Analysis**
To find differentially bound regions between groups or clusters, you can use **DiffBind**.

```r
# Create a DiffBind object
dba <- dba(sampleSheet = "path_to_sample_sheet.csv")

# Count the reads for peaks across samples
dba <- dba.count(dba, summits = 250)

# Perform differential binding analysis
dba_contrast <- dba.contrast(dba, categories = DBA_CONDITION, minMembers = 2)
dba_analysis <- dba.analyze(dba_contrast)

# View the results
dba.show(dba_analysis, bContrasts = TRUE)
```

### 8. **Peak Calling (Optional)**
If you haven’t done peak calling yet, you can call peaks for each cell using **MACS2** or another external tool and then import them into R.

```bash
# Example peak calling using MACS2 (command line)
macs2 callpeak -t fragments.bed -f BED -g hs -n sample_name --outdir output_dir --nomodel --shift -100 --extsize 200 -B --SPMR
```

### 9. **Visualization of Chromatin States**
Visualize the distribution of specific features, such as chromatin accessibility or transcription factor binding.

```r
# Plot a feature (e.g., a specific peak or gene region)
FeaturePlot(chip_obj, features = c("peakA", "peakB"))

# Plot heatmap for peak intensity across clusters
DoHeatmap(chip_obj, features = TopFeatures(chip_obj))
```

### 10. **Motif Enrichment Analysis**
You can perform motif analysis to identify transcription factors that bind to specific regions.

```r
# Run motif enrichment analysis using ChromVAR
chip_obj <- RunChromVAR(chip_obj)

# Visualize motif activities
VlnPlot(chip_obj, features = "motif1", group.by = "seurat_clusters")
```

### 11. **Save and Load Seurat/Signac Objects**
You can save the object for future analysis.

```r
# Save the Seurat object
saveRDS(chip_obj, file = "chip_obj.rds")

# Load the object
chip_obj <- readRDS("chip_obj.rds")
```

### Summary
This pipeline outlines a workflow for analyzing single-cell ChIP-seq data using **Signac**, **Seurat**, and **DiffBind** in **R**. The steps include loading data, quality control, normalization, dimensionality reduction, clustering, differential peak analysis, and motif enrichment. For peak calling, you can integrate external tools like **MACS2** or use preprocessed peak data from public databases.