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
  display_name: Python 3
  language: python
  name: python3
---


# Chapter 8: RNA-seq analysis

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [RNA-Seq](https://en.wikipedia.org/wiki/RNA-Seq)
```

In general, RNA-SEQ analysis involves three steps to process and analyze short read sequences produced by RNA-seq. In brief, the process is to map and summarize short read sequences, then normalize between samples and perform a statistical test of DE. Further biological insight can be gained by looking for patterns of expression changes within sets of genes and integrating the RNA-seq data with data from other sources.

Several comparisons of RNA-seq and microarray data have now been made.
The results are unanimous: sequencing has higher sensitivity and dynamic
range, coupled with lower technical variation. Furthermore, comparisons
have highlighted strong concordance between microarrays and sequencing
in measures of both absolute and differential expression.

Sequencing gives unprecedented detail about novel transcribed regions,
allele-specific expression, RNA editing and alternative splicing.

## Mapping 

To use RNA-seq data to compare expression between samples, it is
necessary to turn millions of short reads into a quantification of
expression. The first step in this procedure is the read mapping or
alignment. At its simplest, the task of mapping is to find the unique
location where a short read is identical to the reference. However, in
reality the reference is never a perfect representation of the actual
biological source of RNA being sequenced. In addition to sample-specific
attributes such as SNPs and indels (insertions or deletions), there is
also the consideration that the reads arise from a spliced transcriptome
rather than a genome. Furthermore, short reads can sometimes align
perfectly to multiple locations and can contain sequencing errors that
have to be accounted for. Therefore, the real task is to find the
location where each short read best matches the reference, while
allowing for errors and structural variation.

Although research into how best to align reads to a reference is
ongoing, all solutions by necessity involve some compromise between the
computational requirements of the algorithm and the fuzziness allowed in
matching to the reference. Almost all short read aligners use a strategy
of a first pass \'heuristic\' match, which quickly finds a reduced list
of possible locations, followed by thorough evaluation of all candidate
alignments by a complex \'local alignment\' algorithm. Without this
initial heuristic search to reduce the number of potential alignment
locations, performing local alignment of millions of short reads would
be computationally impossible on current hardware.

Current aligners enable fast heuristic matching by using either **hash
tables** or the **Burrows Wheeler transform** (BWT). Hash-table aligners
have the advantage of being easily extendable to detect complicated
differences between read and reference, at the cost of ever increasing
computational requirements. Alternatively, BWT-based aligners can map
reads that closely match the reference very efficiently but are
prohibitively slow once more complex misalignments are considered.

## Summarizing mapping reads

Having obtained genomic locations for as many reads as possible, the
next task is to summarize and aggregate reads over some biologically
meaningful unit, such as exons, transcripts or genes. The simplest and
most common approach counts the number of reads overlapping the exons in
a gene (for example,
\[[32](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3046478/#B32),[34](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3046478/#B34),[45](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3046478/#B45)\]).
However, a significant proportion of reads map to genomic regions
outside annotated exons, even in well-annotated organisms, such as mouse
and human. For example, Pickrell*et
al. *\[[35](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3046478/#B35)\]
found that about 15% of mapped reads were located outside annotated
exons for their Nigerian HapMap samples and these extra-exonic reads
were more likely to be cell-type-specific exons. Similarly,
Figure 2a shows an example of transcription occurring outside annotated
exons in the RNA-binding protein 39 (*RBM39*) gene in LNCaP prostate
cancer cells. Reads from other normal tissue cell types are more limited
to known exons, but also show evidence for transcription outside of
known exons.

## Normalization

### Normalization methods differ for between- and within-library comparisons.

Within-library normalization: Because longer transcripts have higher
read counts (at the same expression level), a common method for
within-library normalization is to divide the summarized counts by the
length of the gene. The widely used RPKM (reads per kilobase of exon
model per million mapped reads) accounts for both library size and gene
length effects in within-sample comparisons.

## Differential expression

The goal of a DE analysis is to highlight genes that have changed significantly in abundance across experimental conditions. In general, this means taking a table of summarized count data for each library and performing statistical testing between samples of interest.

In general, the Poisson distribution forms the basis for modeling
RNA-seq count data. In an early RNA-seq study using a single source of
RNA, goodness-of-fit statistics suggested that the distribution of
counts across lanes for the majority of genes was indeed Poisson
distributed. This has been independently confirmed using a technical
experiment. However, biological variability is not captured well by the
Poisson assumption. Hence, Poisson-based analyses for datasets with
biological replicates will be prone to high false positive rates
resulting from the underestimation of sampling error.

To account for biological variability, the negative binomial
distribution has been used, requiring an additional dispersion parameter
to be estimated. A few variations of negative-binomial-based DE analysis
of count data have emerged, including common dispersion models, sharing
information over all genes using weighted likelihood, empirical
estimation of the mean-variance relationship and an empirical Bayesian
implementation using equivalence classes.

Extensions to the Poisson model to include over-dispersion have also
been proposed, through the generalized Poisson distribution or a
two-stage Poisson model, which tests for differential expression in two
modes depending on the evidence for over-dispersion in the data. Several
tools for either simultaneous transcript discovery and quantification or
alternative isoform expression analysis also perform DE analysis.

## Systems biology: going beyond gene lists

In many cases, creating lists of DE genes is not the final step of the
analysis; further biological insight into an experimental system can be
gained by looking at the expression changes of sets of genes. Many tools
focusing on gene set testing, network inference and knowledge databases
have been designed for analyzing lists of DE genes from microarray
datasets.

However, RNA-seq is affected by biases not present in microarray data.
For example, gene length bias is an issue in RNA-seq data, in which
longer genes have higher counts (at the same expression level). This
results in greater statistical power to detect DE for long and highly
expressed genes. These biases can dramatically affect the results of
downstream analyses, such as testing Gene Ontology (GO) terms for
enrichment among DE genes.

## Detection of alternative splicing

1.  **Aligners** capable of identifying splice sites from sequence reads
    (aka splice aware aligners). These
    include: [TopHat](http://tophat.cbcb.umd.edu/), [MapSplice](http://www.netlab.uky.edu/p/bioinfo/MapSplice), [SpliceMap](http://www.stanford.edu/group/wonglab/SpliceMap/), [HMMsplicer](http://derisilab.ucsf.edu/index.php?software=105), [GSNAP](http://research-pub.gene.com/gmap/), [STAR](https://code.google.com/p/rna-star/), [RUM](http://cbil.upenn.edu/RUM/), [SoapSplice](http://soap.genomics.org.cn/soapsplice.html),
    etc. I saw a nice poster at AGBT13 that indicated that STAR performs
    very well compared to several competitors.

2.  **Transcriptome assemblers** that either perform de novo assembly of
    transcripts from sequence reads or do so with the help of a
    reference assembly (and perhaps even guided by known transcript
    annotations). These
    include: [Cufflinks](http://cufflinks.cbcb.umd.edu/), [Scripture](http://www.broadinstitute.org/software/scripture/), [Trinity](http://trinityrnaseq.sourceforge.net/), [Trans-ABySS](http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss), [GRIT](http://grit-bio.org/),
    etc. Of these, Cufflinks is probably the easiest to use while
    Trinity and Trans ABySS seem to yield impressive results in the
    hands of certain groups (particularly those that developed
    them\...).

3.  **Alternative expression** tools that seek to identify isoform
    expression differences between two or more conditions. These
    include: [Cuffdiff](http://cufflinks.cbcb.umd.edu/manual.html#cuffdiff), [ALEXA-seq](http://www.alexaplatform.org/alexa_seq/), [MISO](http://genes.mit.edu/burgelab/miso/), [SplicingCompass](http://www.ichip.de/software/SplicingCompass.html), [Flux
    Capacitor](http://flux.sammeth.net/capacitor.html), [JuncBASE](http://compbio.berkeley.edu/proj/juncbase/Home.html),[DEXSeq](http://bioconductor.org/packages/2.11/bioc/html/DEXSeq.html), [MATS](http://rnaseq-mats.sourceforge.net/), [SpliceR](http://www.bioconductor.org/packages/2.13/bioc/html/spliceR.html), [FineSplice](http://nar.oxfordjournals.org/content/early/2014/02/25/nar.gku166.full), [ARH-seq](http://nar.oxfordjournals.org/content/early/2014/06/11/nar.gku495.full),
    etc.

## Detection of gene fusion

Fusion genes are identified by selecting all the gene-gene pairs for
which there are at least two or three short read pairs such that one end
aligns to one of the genes and the other to the other.

To identify the exon-exon fusion junction, a database of artificial
splice-site junctions was built by generating all the potential
exon-exon combinations between gene A and gene B and B-A for each pair
of candidate-fusion genes. Short reads that did not align on either the
genome or the transcriptome were aligned against the junction database
in order to locate the exact fusion point, that is, between which exons
the gene fusion takes place. Junctions spanning short reads were
required to align at least 10 bp to one exon.

Here\'s a list of fusion gene detection tools working with RNA-seq data

-   [tophat-fusion](http://tophat.cbcb.umd.edu/fusion_index.html)

-   [chimerascan](http://code.google.com/p/chimerascan/)

-   [deFuse](http://sourceforge.net/apps/mediawiki/defuse/index.php?title=Main_Page)

-   [FusionMap](http://www.omicsoft.com/fusionmap/)

## RNA editing 

RNA editing is a molecular process through which some cells can make
discrete changes to specific nucleotide sequences within a RNA molecule
after it has been generated by RNA polymerase. Occasionally researches
encounter a gene with a sequence of nucleotides that does not match
exactly that in its RNA product: messenger RNA.

[\
REDITOOLS: efficient RNA editing detection by RNA-SE](https://github.com/BioinfoUNIBA/REDItools)

[RADAR: a rigorously annotated database of A-to-I RNA editing](https://pubmed.ncbi.nlm.nih.gov/24163250/)

## Novel transcripts

Alternatively, fusion genes or aberrations in cancer samples can be
detected by finding novel transcripts in RNA-seq data.


