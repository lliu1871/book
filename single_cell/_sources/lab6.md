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

# Lab6: scTCR data analysis
Single-cell TCR (T-cell receptor) and BCR (B-cell receptor) sequencing data analysis allows you to study the clonality and diversity of immune cells at the single-cell level. For TCR/BCR analysis, tools like **`Seurat`**, **`scRepertoire`**, and **`vdjtools`** are commonly used to integrate and analyze the sequencing data.

Below is an R workflow that demonstrates how to analyze single-cell TCR/BCR sequencing data using **`scRepertoire`** and **`Seurat`** for integrating V(D)J data with gene expression analysis.

### 1. **Install Required Packages**
You will need **`Seurat`** and **`scRepertoire`** for handling TCR/BCR sequencing data.

```r
# Install necessary Bioconductor and CRAN packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("scRepertoire")
install.packages("Seurat")
install.packages("ggplot2")
install.packages("dplyr")
```

### 2. **Load Required Libraries**

```r
library(Seurat)
library(scRepertoire)
library(ggplot2)
library(dplyr)
```

### 3. **Load and Process TCR/BCR Data**
Assuming you have TCR or BCR sequencing data available in the form of V(D)J clonotypes, here’s how to load and process the data.

- **`scRepertoire`** supports V(D)J data formats from CellRanger (`filtered_contig_annotations.csv`) or 10x Genomics.

```r
# Load the TCR or BCR sequencing data
tcr_data <- read.csv("path_to_filtered_contig_annotations.csv")

# Load metadata for the corresponding single-cell RNA-seq data (if applicable)
metadata <- read.csv("path_to_metadata.csv", row.names = 1)
```

### 4. **Create a Seurat Object (if RNA data is available)**

If you want to integrate TCR/BCR sequencing data with RNA-seq data, you’ll need to create a **Seurat** object from the RNA data.

```r
# Load single-cell RNA-seq data (e.g., from CellRanger output)
rna_data <- Read10X("path_to_rna_data/")

# Create a Seurat object for RNA data
seurat_obj <- CreateSeuratObject(counts = rna_data, meta.data = metadata)

# Inspect the Seurat object
seurat_obj
```

### 5. **Combine TCR/BCR Data with Seurat Object**
You can combine TCR/BCR clonotypes with the RNA data in the Seurat object using **scRepertoire**.

```r
# Combine TCR/BCR clonotype data with Seurat object
seurat_obj <- combineTCR(tcr_data, seurat_obj, cloneCall = "gene", group.by = "sample")
```

### 6. **Quality Control and Clonotype Analysis**
Perform quality control on the TCR/BCR data, filter low-quality cells, and explore the clonotype diversity.

```r
# Filter out low-quality TCR/BCR clonotypes based on your criteria (e.g., number of chains)
tcr_filtered <- tcr_data %>% filter(chain %in% c("TRA", "TRB"))

# Visualize clonotype abundance
clono_abundance <- quantContig(seurat_obj, cloneCall = "gene", scale = TRUE)
clono_abundance

# Plot clonotype distribution across samples
clono_plot <- clonoAbundance(seurat_obj, cloneCall = "gene")
clono_plot
```

### 7. **Clonotype Diversity Analysis**
You can assess the clonotype diversity using various measures, such as Shannon entropy or Simpson's diversity index.

```r
# Calculate Shannon entropy (clonotype diversity)
shannon_diversity <- diversityContig(seurat_obj, cloneCall = "gene", metric = "shannon")
shannon_diversity

# Plot diversity by sample or condition
clonotype_diversity <- clonoDiversity(seurat_obj, cloneCall = "gene", group.by = "sample")
clonotype_diversity
```

### 8. **Visualization of TCR/BCR Data**
You can visualize the TCR/BCR data using UMAP, highlighting clonotypes or cell types.

```r
# Run UMAP on Seurat object (if RNA data is included)
seurat_obj <- RunPCA(seurat_obj, npcs = 30, verbose = FALSE)
seurat_obj <- RunUMAP(seurat_obj, dims = 1:20)

# Plot UMAP colored by clonotype
DimPlot(seurat_obj, group.by = "clonotype")

# Visualize clonotype expansion across clusters
DimPlot(seurat_obj, group.by = "clonotype", label = TRUE, label.size = 5, reduction = "umap")

# Plot clonotype frequency in clusters
clonoFreqPlot(seurat_obj)
```

### 9. **Differential Clonotype Analysis**
You can compare clonotypes between different groups or conditions using differential analysis methods.

```r
# Compare clonotypes between two groups or conditions
clonotype_comparison <- compareClonotypes(seurat_obj, group.by = "sample", cloneCall = "gene")

# Plot the comparison
clonotype_comparison_plot <- plotCompareClonotypes(clonotype_comparison)
clonotype_comparison_plot
```

### 10. **Integrating with Gene Expression Data**
You can integrate TCR/BCR data with single-cell gene expression data to study how specific clonotypes correlate with gene expression profiles.

```r
# Identify markers for specific clonotypes
clonotype_markers <- FindMarkers(seurat_obj, ident.1 = "clonotypeA", ident.2 = "clonotypeB")

# Visualize expression of key genes in clonotypes
FeaturePlot(seurat_obj, features = c("GeneA", "GeneB"), split.by = "clonotype")

# Plot heatmap of gene expression across clonotypes
DoHeatmap(seurat_obj, features = TopFeatures(seurat_obj), group.by = "clonotype")
```

### 11. **TCR/BCR Network Analysis**
Network visualization of clonotypes can help explore the relationships between them.

```r
# Create a network graph of clonotypes
tcr_network <- clonoNetwork(seurat_obj, group.by = "sample", cloneCall = "gene")

# Plot the network
tcr_network_plot <- plotClonoNetwork(tcr_network)
tcr_network_plot
```

### 12. **Saving and Loading Seurat Object**
You can save the Seurat object for future use.

```r
# Save the Seurat object
saveRDS(seurat_obj, file = "seurat_tcr_bcr.rds")

# Load the saved Seurat object
seurat_obj <- readRDS("seurat_tcr_bcr.rds")
```

### Summary
This pipeline provides a basic framework for analyzing single-cell TCR/BCR sequencing data using **`scRepertoire`** and **`Seurat`**. The workflow includes loading and integrating TCR/BCR data with single-cell RNA-seq data, clonotype diversity analysis, visualization, and differential clonotype analysis. The use of **`scRepertoire`** simplifies the process of analyzing immune repertoires, while **`Seurat`** allows for integrated analysis of gene expression and clonotype data.