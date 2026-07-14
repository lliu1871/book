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

# Chap1: Single Cell Sequencing
##	Introduction 
Single cell sequencing is a cutting-edge technology that enables the analysis of the genetic material within individual cells. Unlike traditional bulk sequencing methods that pool thousands or millions of cells together, masking the variability among them, single cell sequencing captures the unique genomic, transcriptomic, or epigenetic profiles of individual cells. This has revolutionized our understanding of cellular heterogeneity, offering unprecedented insights into how different cells behave within complex tissues and across biological systems.

This technology is crucial in fields like cancer research, where individual tumor cells may exhibit distinct genetic mutations or expression patterns that drive drug resistance or metastasis. In developmental biology, it helps trace the lineage and differentiation of cells, while in immunology, it reveals how immune cells respond to pathogens at a granular level. By isolating and analyzing single cells, researchers can identify rare cell populations, uncover new cell types, and understand the dynamic interactions within tissues.

- Developmental Biology: Understanding cell fate decisions and differentiation pathways.
- Disease Research: Identifying disease-specific cell types and gene expression changes.
- Immunology: Characterizing immune cell subsets and their roles in immune responses.
- Cancer Biology: Understanding tumor heterogeneity and identifying potential therapeutic targets.

Single cell sequencing includes various techniques, such as single cell RNA sequencing (scRNA-seq) to study gene expression, single cell DNA sequencing for genetic variation, and single cell ATAC-seq for chromatin accessibility. These methods provide a comprehensive understanding of how individual cells contribute to the function and dysfunction of tissues and organisms.

Despite its immense potential, single cell sequencing is not without its challenges. These include technical limitations, data analysis complexity, and the need for standardized protocols. However, ongoing advancements in technology and computational methods are addressing these issues, paving the way for even more exciting discoveries in the future.

##	Workflow
The process of single cell sequencing involves several key steps, from isolating individual cells to analyzing their genetic material. Below is an overview of the general workflow:

### Sample Preparation
Tissue Dissociation: If the starting material is a solid tissue, it must first be dissociated into a suspension of individual cells using enzymatic digestion or mechanical disruption.
Cell Sorting: Cells are then isolated from the suspension. Methods include: 1) Fluorescence-Activated Cell Sorting (FACS): Cells are labeled with fluorescent markers and sorted based on their characteristics. 2) Microfluidics: Microfluidic devices capture individual cells in tiny droplets or wells. 3) Magnetic Bead Sorting: Cells are tagged with magnetic beads and separated using a magnetic field.

Viability Check: Ensuring that isolated cells are viable and intact is important to avoid data distortion caused by dead or damaged cells.

### Cell Lysis and Genetic Material Extraction
The selected individual cells are lysed to release their genetic material (RNA, DNA, or both). This must be done carefully to avoid degradation or contamination. Depending on the type of sequencing, either RNA (for transcriptomics) or DNA (for genomics) is extracted from the lysed cells.

### Amplification of Genetic Material
Because single cells contain a tiny amount of genetic material, amplification is necessary. Techniques include: 1) cDNA Synthesis and Amplification: In RNA sequencing (scRNA-seq), reverse transcription is used to convert RNA into complementary DNA (cDNA), which is then amplified using polymerase chain reaction (PCR) or other amplification methods. 2) Whole Genome Amplification (WGA): For DNA sequencing, the entire genome or selected regions are amplified. 3) Amplification is a critical step because low efficiency or bias can impact downstream analysis.
### Library Preparation
The amplified cDNA or DNA is fragmented into smaller pieces, and sequencing adapters are ligated to these fragments. These adapters allow the DNA to bind to the sequencing platform. Barcodes or indices are added to distinguish reads from individual cells. This is crucial when processing thousands of cells simultaneously, as it helps track which reads belong to which cells.
### Sequencing
The prepared libraries are loaded onto a high-throughput sequencing platform (e.g., Illumina, PacBio, or Oxford Nanopore). These platforms generate millions of short reads (or long reads, depending on the technology) from each individual cell. Sufficient sequencing depth is essential to accurately capture the transcriptome or genome of each cell, especially for detecting rare transcripts or mutations.

## Single Cell Techniques
Single cell sequencing encompasses a variety of techniques designed to analyze the genetic material, transcriptomic activity, or epigenetic modifications of individual cells. Each technique serves different purposes, offering detailed insights into cell-to-cell variability. Below are some of the most used single cell sequencing techniques:
### Single cell RNA Sequencing (scRNA-seq)
This technique measures gene expression at the single cell level, providing a snapshot of the transcriptome. RNA from individual cells is captured, reverse-transcribed into complementary DNA (cDNA), and then sequenced using common platforms - 10x Genomics Chromium, Smart-seq2, Drop-seq, and Fluidigm C1. scRNA-seq can identify cell types, cell states, and responses to stimuli. Used extensively in cancer, developmental biology, and immunology.
### Single cell DNA Sequencing
This technique analyzes the genomic DNA of individual cells, allowing the detection of genetic mutations, structural variants, and copy number variations. Whole-genome or targeted DNA regions are amplified (using techniques like Multiple Displacement Amplification or PCR) and sequenced. Studying somatic mutations in cancer, genetic heterogeneity in populations, and lineage tracing in developmental studies.
### Single cell ATAC Sequencing (scATAC-seq)
This technique profiles chromatin accessibility at the single cell level to identify regulatory regions of the genome. Tn5 transposase is used to fragment open chromatin regions, which are then sequenced. Understanding gene regulatory networks, identifying transcription factor binding sites, and analyzing cell differentiation or reprogramming.
### Single cell Whole-Genome Bisulfite Sequencing (scWGBS)
This technique measures DNA methylation patterns across the entire genome of individual cells. Genomic DNA is treated with bisulfite to convert unmethylated cytosines to uracils. The treated DNA is then sequenced. Epigenetic profiling of single cells, such as studying methylation heterogeneity in cancer or during development.
### Single cell Exome Sequencing
This technique focuses on the sequencing of the protein-coding regions (exons) of the genome in individual cells. Genomic DNA is enriched for exonic regions (using hybrid capture methods) and then sequenced. Identifying mutations that affect protein-coding regions in diseases like cancer or rare genetic disorders.
### Single cell Chromatin Immunoprecipitation Sequencing (scChIP-seq)
This technique profiles histone modifications or other DNA-associated proteins in individual cells to understand gene regulation. Chromatin from single cells is immunoprecipitated with antibodies targeting specific histone modifications or DNA-binding proteins. The bound DNA fragments are then sequenced. Mapping epigenetic changes and understanding how chromatin structure influences gene expression in different cell types.
### Single cell TCR/BCR Sequencing (scTCR-seq / scBCR-seq)
This technique analyzes the diversity and clonality of T-cell receptors (TCRs) or B-cell receptors (BCRs) in individual immune cells. The V(D)J recombination sequences of TCRs or BCRs are amplified and sequenced to identify the specific immune receptor sequences in single cells. Studying immune responses, tracking T-cell and B-cell clonal expansions, and monitoring immune diversity in diseases like cancer or autoimmune disorders.
### Spatial Transcriptomics
This technique combines single cell RNA sequencing with spatial context, enabling researchers to map gene expression in tissues while maintaining information about the location of each cell. Tissue sections are laid on specialized slides, and barcoded probes capture spatially localized RNA for sequencing. Understanding tissue organization and how different cell types interact in contexts such as tumor microenvironments, brain architecture, or tissue development.
### Single cell Multi-Omics
This technique simultaneously measures multiple molecular features, such as gene expression (RNA), chromatin accessibility (ATAC), or protein levels, from the same single cell. CITE-seq combines scRNA-seq with surface protein marker detection using oligonucleotide-labeled antibodies. scNMT-seq integrates measurements of RNA, DNA methylation, and chromatin accessibility in single cells. It provides a more comprehensive view of cellular states by integrating multiple layers of biological information.
### Single cell Proteomics (scProteomics)
This technique measures protein levels in individual cells to analyze protein expression and post-translational modifications. Mass spectrometry or antibody-based methods such as CyTOF (Cytometry by Time-of-Flight) are used to profile protein expression in single cells. Exploring functional outcomes of gene expression, studying signaling pathways, and characterizing immune cells.
### Single cell Metabolomics
This technique profiles the metabolite content of individual cells to understand metabolic heterogeneity. Mass spectrometry-based approaches are adapted for single cell analysis to measure metabolites in tiny quantities. Studying cellular metabolism in cancer, immune cell activation, and metabolic disorders.

Single cell sequencing techniques have transformed our ability to study complex biological systems at an unprecedented resolution. By analyzing the genetic, epigenetic, transcriptomic, proteomic, and metabolomic profiles of individual cells, researchers can gain deeper insights into cellular diversity, developmental processes, disease mechanisms, and immune responses. Each technique is tailored to explore different aspects of cellular biology, and together, they provide a powerful toolkit for advancing personalized medicine and precision biology.
## Data analysis
The analysis of single cell sequencing data involves examining gene expression, genetic variation, and epigenetic modifications at the individual cell level. This provides insights into cellular diversity within tissues or populations. Below are the key steps in single cell sequencing data analysis:
### Data Preprocessing
Quality Control (QC): Assessing raw data for quality. This includes filtering low-quality reads, cells with low gene counts, or high mitochondrial gene content.
Read Alignment: Aligning sequencing reads to a reference genome using tools like STAR, Cell Ranger, or Kallisto.
UMI Counting: Unique Molecular Identifiers (UMIs) are used to avoid PCR duplicates and count the actual number of transcripts per cell.
Toolkits for QC in Single-Cell Sequencing include 1) Seurat (R): One of the most widely used tools for scRNA-seq, which includes built-in functions for QC, normalization, and visualization. 2) Scanpy (Python): Provides a comprehensive pipeline for QC, clustering, and analysis of single-cell RNA-seq data. 3) Cell Ranger (10x Genomics): A common tool for processing raw sequencing data, including initial QC and filtering.
### Normalization
Library Size Normalization: Corrects for differences in sequencing depth across cells, typically using methods like CPM (counts per million) or log normalization. Scaling: Data is scaled to bring all cells onto a comparable range of gene expression values.
### Dimensionality Reduction
Principal Component Analysis (PCA): Reduces data dimensionality while preserving variance in gene expression across cells. t-SNE or UMAP: Further reduces dimensions to visualize high-dimensional data in 2D or 3D spaces, highlighting cell clusters.
### Clustering
Cell Type Clustering: Grouping cells into clusters based on similar gene expression profiles using algorithms like k-means, Louvain, or Leiden. These clusters may represent different cell types or states.
Marker Gene Identification: Identifying genes uniquely or highly expressed in particular clusters, which can help label cell types.
Differential Gene Expression (DGE)
Comparing Conditions: Identifying genes that are differentially expressed between clusters, cell types, or experimental conditions. Tools such as DESeq2, edgeR, or MAST are often used for DGE analysis.
### Trajectory Inference
Pseudotime Analysis: Reconstructing developmental or differentiation trajectories of cells over time using methods like Monocle or Slingshot.
Integration and Batch Correction
Multi-Dataset Integration: When analyzing multiple datasets (e.g., from different experiments or platforms), methods like Seurat’s CCA or Harmony are used to integrate and correct for batch effects.
### Functional Analysis
Gene Set Enrichment Analysis (GSEA): Identifying biological pathways and processes that are enriched within cell clusters or in response to experimental conditions.
Regulatory Network Inference: Inferring gene regulatory networks to understand how genes interact across different cell types.
### Visualization
Heatmaps: Visualizing gene expression patterns across cells or clusters.
Cell Type/Cluster Maps: Visual representations like UMAP or t-SNE plots, with color-coding for clusters or cell types.
Trajectory Plots: Depicting the pseudotime trajectory of cells.
### Interpretation and Biological Insights
Cell Type Annotation: Using known marker genes or databases, clusters are annotated with specific cell types (e.g., immune cells, neuronal cells).

Pathway Analysis: Investigating biological pathways or networks active in different cell types or under various conditions.
Integration with Other Data: Single cell sequencing data can be integrated with other omics data (e.g., proteomics or epigenomics) to provide a more comprehensive view of cell function.

## Popular Tools and Pipelines
The popular tools for single cell sequencing data analysis include 1) Seurat (R) for comprehensive single cell analysis. 2) Scanpy (Python) for large-scale data analysis. 3) Monocle for trajectory inference. 4) Cell Ranger for initial data processing (alignment, barcode assignment, UMI counting).

Single cell sequencing provides high-resolution insights into complex tissues and is commonly used in areas such as developmental biology, cancer research, and immunology.
