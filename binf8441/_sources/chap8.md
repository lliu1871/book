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
<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2023-01-01T04:58:18.908Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;cEu5igzNmqGU--JUJIgs\&quot; version=\&quot;20.7.4\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;C5RBs43oDa-KdzZeNtuy\&quot; name=\&quot;Page-1\&quot;&gt;7Vrbdps6EP0ar5U+NIuLufixjp30nDZZOU3atI8yyKBGICLk2PTrjwQCgyEEp8ZO3L4k0ljoMnv2jGZgoJ8FqwsKIv+SuBAPNMVdDfTJQNPUoT7k/4QkySTW0MgEHkWuHLQW3KBfUAoVKV0gF8aVgYwQzFBUFTokDKHDKjJAKVlWh80Jrq4aAQ/WBDcOwHXpHXKZn0ltzVrLP0Lk+fnKqjnKfglAPlieJPaBS5YlkT4d6GeUEJa1gtUZxEJ5uV7u/knu8Od78+Lf/+IH8HX86fbq2/tssvNtHimOQGHIdju1lk39CPBC6kuelSW5AilZhC4UkygDfeyzAPOmyps/IWOJBBwsGOEiQplPPBIC/JmQSI6bk5DJYarow9D9IIDl/Rkmzn0mOkcYyzV4T463eS9mlNwX2IkJCiDEYAxmEI+Bc++lGz0jmFD+U0hCKKZyuTHIs6w3N11Lxx11KzGIyYI6sGWcLk0cUA+2zWdm48T+SnYqkbuAJICMJnwAhRgw9Fg1ZiA54RXj1rjzhoR+CzPQa2YQ+1xd6frAjVtsQuCx9BGDNxFIFbPkbqRqJ2X8+RHHHgZxLNF7Btw5N4oc0YGmz20HOk7xWOmXmW0MDWVrOB8hZXDVCkD+qyL9YJL7CelAlmunouaewi85lKHSE2bDGmY/YBtSR8lejjJNvovJTo2Rlgt+pAKFQyQFk1WxOdFLyr1rSBFHBFIp3LFDMOsO4ZJcOdGHs8cpTr7djen86/xCl877eYcg7S83tc7+Qc50TVDISkPIfB7zfVUCRz4mN/08Iia5RVvVZbKzyac2rLrY+csN3agZ+hWp2fnzpvKmmdC/UTaOs7YzSrU3o9yVLZk1WwpAFKHQqztOnwSzRfx8eKsGLG4j5yBAWGjkI8SPkCEHNARBgJEX8o7DARWup8k8+JJiZ/rEXPduU3Pkzr8WHKHqGtBqCo4j09KB2WNwtKoOQrMbYuOwITYaO4iNjc40D85t99ptPUajT2jwHSXTaGTPDmlsdaSxqh3yclnHYhEK1nHN/r1f5hSqcWik7e9+2cwh+4/gkKptc0E7FIfyXVYDV1pL4X9+LkKHIRLyJkYzCuSCr4BRPCTZ7rCJUbY2080+g5JmVTO2odYQlfS9MupVEKqSMunllOk9z5n0QrJ9zrQTkrYlR89yVB39Jkm7ZUCG2lsG1Hb8kuHIsKlwJ5CG0dQNUDiHXOFck7/H/hcGxRo1uxrAkxQebSSeXWsuZl8MrqcPB2HwCrHvpXZW7jBkb81b0clp2zdD1VFHihr7Yehog6HZAXpjqFan6Bu/LD0NXgeQrT3dldo2WYLC4Xplwl2eOCQSGwkXwQzS+N2xOErtqQBV9pTmPj1lbv9HToiGDLxZHft6vdO2yxIWIaEBwOgXyNIGE/PNj2eUtzzRWiLmI5FOxCCIMEyp8+X606XYXCjuGw8LEDKEYRuDlK0Z1Dlb2D2DDN2oMkgZnRrdOGQZPcGmvo7rRu9Xh863+4OSSK2H+Mk0JQTASYw4R/i8Cr9hxHGaiZ9Mphcx9N4VnLmCXrZNTZmhkAQIiDVPhGK/ZA/PQHIDH7L2ZBrDh6Oh19DWTqsE04x6iNJMo04vu7d0vP4G9RD0KvLxolO6z7ck4r3TMv9a51la7qu63Lx6/br3F8WXoKgfFMV6bcxF87ScwbifxGIncBVRGMdpvcODYevHDm/q9m4YVdeoNrjG/dY5GsrNEWD+EiSVgHccsUnXNtSvHFz99e+xhMGLxBWyJaH3fwIKTS+R94vCqIZCvAgCQIu06Tg0v1FlNbq+J+nt7b1WN/9DhPS+Q7PWOTTv69Vj6zafrh4oM+6VIKzUC0QKc3t5mTUWUQRpVjWgompwLMwxtM2sRrcbywZ2Q15jWafbFw54d/3BeVa8Xn+2r0//Bw==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

RNA-seq involves sequencing RNA molecules to determine their structure and identify which genes are being expressed in a cell or tissue. Numerous computational approaches have been developed to process and analyze short read sequences produced by RNA-seq techniques. Short reads are mapped to the reference genome and quantified into copy numbers (exon, coding region, etc.). After normalization, the counts (copy numbers) are used to identify signicant genes by the differential expression (DE) analysis. Further biological insight is gained by pathway and gene network analyses. In comparison with microarray, RNA-seq has higher sensitivity and lower technical variation. More importantly, RNA-seq can discover novel transcribed regions, allele-specific expression, RNA editing and alternative splicing.

## Mapping 

One common task in RNA-seq analysis is mapping the reads produced by the sequencing machine back to the reference genome or transcriptome to determine which genes are being transcribed and to quantify their expression levels. There are several tools available for mapping RNA-seq reads to a reference genome or transcriptome, including:

- HISAT2
- TopHat
- STAR
- Subread
- Bowtie

These tools align the reads to the reference using various algorithms and heuristics, such as indexing the reference and using dynamic programming to find the best alignment for each read. The output of the mapping step is a set of alignments in a standardized format, such as BAM or SAM, which can then be processed further to identify differentially expressed genes, alternative splicing events, and other features of interest.

The process of read mapping, also known as alignment, involves identifying the unique location in a reference where a short read sequence matches. However, in practice, the reference may not be an exact representation of the RNA being sequenced due to sample-specific variations such as single nucleotide polymorphisms (SNPs) and insertions or deletions (indels). Additionally, reads may come from spliced transcripts rather than a genome, and may contain sequencing errors or align perfectly to multiple locations. Therefore, the goal of read mapping is to find the best match for each short read in the reference, taking into account these potential errors and variations.

Most short read aligners use a two-step approach: first, they use a fast heuristic algorithm to identify a list of potential alignment locations, and then they use a more computationally intensive local alignment algorithm to evaluate all of the candidate alignments. Fast heuristic matching is implemented in current aligners which either utilize hash tables or the Burrows Wheeler transform (BWT). Hash-table aligners are able to detect intricate discrepancies between the read and reference. On the other hand, BWT-based aligners are able to efficiently map reads that closely match the reference, but struggle to handle more complex misalignments and may become slow in these cases.

## Normalization

Longer transcripts have higher read counts. To correct for this, between and within sample normalization is often performed to normalize the read counts for each gene within (or between) a sample to the total number of reads obtained from that sample. This can be done using methods such as **upper quartile normalization**, or **TMM** (trimmed mean of M-values) normalization, or **RPKM** (reads per kilobase of exon model per million mapped reads), a widely used method for within-sample normalization. 

## Differential expression

differential expression analysis is a method used to identify changes in gene expression between two or more groups of samples. It involves quantifying the abundance of RNA molecules in each sample, and then comparing the results to determine which genes are differentially expressed between the groups. There are several methods for performing differential expression analysis, including **edgeR**, **DESeq2**, and **limma**. These methods typically involve testing for statistical significance using tools such as the t-test or ANOVA, and correcting for multiple testing using techniques such as Bonferroni correction or false discovery rate (FDR) control. It is important to carefully design the experiment and choose appropriate statistical methods to ensure accurate results.

```{admonition} A list of methods for DE analysis
- DEGseg, assuming Poisson with a dispersion parameter
- edgeR, baySeq, DEseq, assuming negative binomial with additional dispersion parameters
```

## Detection of alternative splicing

1.  Aligners identifying splice sites from sequence reads
    (aka splice aware aligners): [TopHat](http://tophat.cbcb.umd.edu/), [MapSplice](http://www.netlab.uky.edu/p/bioinfo/MapSplice), [SpliceMap](http://www.stanford.edu/group/wonglab/SpliceMap/), [HMMsplicer](http://derisilab.ucsf.edu/index.php?software=105), [GSNAP](http://research-pub.gene.com/gmap/), [STAR](https://code.google.com/p/rna-star/), [RUM](http://cbil.upenn.edu/RUM/), [SoapSplice](http://soap.genomics.org.cn/soapsplice.html),
    etc. 

2.  Transcriptome assemblers: [Cufflinks](http://cufflinks.cbcb.umd.edu/), [Scripture](http://www.broadinstitute.org/software/scripture/), [Trinity](http://trinityrnaseq.sourceforge.net/), [Trans-ABySS](http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss), [GRIT](http://grit-bio.org/).

3.  Alternative expression tools identify isoform
    expression: [Cuffdiff](http://cufflinks.cbcb.umd.edu/manual.html#cuffdiff), [ALEXA-seq](http://www.alexaplatform.org/alexa_seq/), [MISO](http://genes.mit.edu/burgelab/miso/), [SplicingCompass](http://www.ichip.de/software/SplicingCompass.html), [Flux
    Capacitor](http://flux.sammeth.net/capacitor.html), [JuncBASE](http://compbio.berkeley.edu/proj/juncbase/Home.html),[DEXSeq](http://bioconductor.org/packages/2.11/bioc/html/DEXSeq.html), [MATS](http://rnaseq-mats.sourceforge.net/), [SpliceR](http://www.bioconductor.org/packages/2.13/bioc/html/spliceR.html), [FineSplice](http://nar.oxfordjournals.org/content/early/2014/02/25/nar.gku166.full), [ARH-seq](http://nar.oxfordjournals.org/content/early/2014/06/11/nar.gku495.full),
    etc.

## Detection of gene fusion

Fusion genes are detected by looking for pairs of genes that have at least two or three short read pairs where one end aligns with one gene and the other end aligns with the other gene. To identify the specific point where the genes fuse (the exon-exon junction), a database of potential exon-exon combinations between the two genes is created. Short reads that do not align to either the genome or transcriptome are then aligned against this junction database to determine the exact location of the fusion point. The alignment must span at least 10 base pairs with one exon in order to be considered a valid fusion gene.
A list of fusion gene detection tools

```{admonition} A list of methods for gene fusion detection
-   [tophat-fusion](http://tophat.cbcb.umd.edu/fusion_index.html)
-   [chimerascan](http://code.google.com/p/chimerascan/)
-   [deFuse](http://sourceforge.net/apps/mediawiki/defuse/index.php?title=Main_Page)
-   [FusionMap](http://www.omicsoft.com/fusionmap/)
```

## RNA editing 

RNA editing is a process in which certain cells can modify specific nucleotide sequences within an RNA molecule after it has been synthesized by RNA polymerase. This can sometimes result in a gene having a sequence of nucleotides that does not exactly match the sequence of the corresponding messenger RNA.

```{admonition} A list of methods for RNA editing
[REDITOOLS: efficient RNA editing detection by RNA-SE](https://github.com/BioinfoUNIBA/REDItools)
[RADAR: a rigorously annotated database of A-to-I RNA editing](https://pubmed.ncbi.nlm.nih.gov/24163250/)
```


