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

# Lab4: scWES data analysis

Single-cell exome sequencing (scWES) focuses on the analysis of protein-coding regions (exons) at the single-cell level. Analyzing single-cell exome sequencing data in **R** generally requires preprocessing steps like variant calling, quality control, and identifying somatic mutations or copy number variations (CNVs). Though tools like **Seurat** and **Signac** are not typically used for scWES, tools such as **VarScan**, **GATK**, and **Mutect2** for variant calling are often combined with R-based analysis for downstream exploration and visualization.

Here’s a basic workflow for analyzing single-cell exome sequencing data in R:

### 1. **Install Required Packages**
You will need various R packages for data visualization, variant analysis, and annotation.

```r
# Install necessary Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("VariantAnnotation")
BiocManager::install("GenomicRanges")
BiocManager::install("maftools")
BiocManager::install("ComplexHeatmap")

# Install other useful packages
install.packages("ggplot2")
install.packages("dplyr")
```

### 2. **Load Required Libraries**

```r
library(VariantAnnotation)
library(GenomicRanges)
library(maftools)
library(ComplexHeatmap)
library(ggplot2)
library(dplyr)
```

### 3. **Load the Variant Data**
Once variant calling is done using external tools like **VarScan**, **GATK**, or **Mutect2**, you can load the resulting VCF (Variant Call Format) files into R for further analysis.

```r
# Load the VCF file
vcf_file <- "path_to_your_vcf_file.vcf"
vcf <- readVcf(vcf_file, "hg19")  # Replace 'hg19' with the reference genome you used

# View the structure of the VCF file
vcf
```

### 4. **Basic Exploration of Variants**

You can explore the types of variants (SNPs, insertions, deletions, etc.) and their locations.

```r
# Get the ranges of the variants
granges <- rowRanges(vcf)

# Summarize variant types
variant_summary <- table(VariantType(vcf))
print(variant_summary)

# Visualize the distribution of variant types
barplot(variant_summary, main = "Distribution of Variant Types", col = "blue")
```

### 5. **Filter Variants**
You may want to filter variants based on quality metrics like depth of coverage, variant allele frequency, or functional impact.

```r
# Filter by quality metrics (e.g., depth of coverage, variant allele frequency)
min_depth <- 10
vcf_filtered <- vcf[geno(vcf)$DP > min_depth]

# View the filtered VCF
vcf_filtered
```

### 6. **Annotation of Variants**
Annotate the variants with functional information (e.g., whether they are synonymous or nonsynonymous, impact on protein function, etc.) using databases like **Ensembl** or **Annovar**.

```r
# Annotate variants using VariantAnnotation
# Requires annotation database or external tools like snpEff, VEP, or ANNOVAR
library(ensemblVEP)
vep_anno <- ensemblVEP(vcf_filtered)

# Summarize annotation types
summary(vep_anno)
```

### 7. **Copy Number Variation (CNV) Analysis**
CNVs are crucial for scWES analysis, and tools like **facets** or **CopywriteR** are often used for CNV calling. You can visualize CNVs in R after calling them externally.

```r
# If you have CNV data, you can plot the copy number profile
# Load CNV data (assuming you have it as a data frame)
cnv_data <- read.table("path_to_cnv_data.txt", header = TRUE)

# Visualize CNV data
ggplot(cnv_data, aes(x = position, y = log2_ratio, color = sample)) +
  geom_point() +
  labs(title = "Copy Number Variations", x = "Genomic Position", y = "Log2 Copy Ratio")
```

### 8. **Visualization of Mutations**

You can use **maftools** to analyze and visualize mutations in scWES data. It can handle mutation annotation files (MAF) or VCF files.

```r
# Convert VCF to MAF using maftools
maf <- vcf2maf(vcf_filtered)

# Summarize mutations
maf_summary <- summary(maf)
print(maf_summary)

# Visualize mutation summary with maftools
plotmafSummary(maf)
```

### 9. **Heatmap for Mutation Burden Across Cells**

You can create heatmaps to visualize mutation burden or variant frequency across individual cells.

```r
# Prepare matrix of variant allele frequencies (or mutation burden) for each cell
variant_matrix <- as.matrix(geno(vcf_filtered)$AF)  # Assuming you have allele frequency info in AF field

# Create a heatmap of mutation burden across cells
Heatmap(variant_matrix, name = "Allele Frequency", show_row_names = FALSE, show_column_names = TRUE,
        col = colorRamp2(c(0, 1), c("white", "red")),
        cluster_rows = TRUE, cluster_columns = TRUE)
```

### 10. **Saving and Exporting Data**

You may want to save your processed data for later use.

```r
# Save the filtered VCF object
saveRDS(vcf_filtered, "filtered_vcf.rds")

# Load the saved object
vcf_filtered <- readRDS("filtered_vcf.rds")
```

### Summary

This basic R pipeline provides steps for loading and analyzing single-cell exome sequencing (scWES) data using tools like **VariantAnnotation**, **maftools**, and **ComplexHeatmap**. It covers variant filtering, annotation, visualization of mutation profiles, and detection of CNVs. The pipeline assumes that preprocessing steps like alignment and variant calling have been completed externally, using tools like **VarScan**, **GATK**, or **Mutect2**.