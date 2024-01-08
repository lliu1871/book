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

# Lab 15: Phylogenetic tree reconstruction

## Preparation
- Install the R package phybase hosted at [Github](https://github.com/lliu1871/phybase). The **devtools** package provides **install_github()** that enables installing R packages from GitHub. 

```{code}
    install.packages("devtools")
    library(devtools)
    install_github("lliu1871/phybase") 
```
- Download Phylip at https://evolution.genetics.washington.edu/phylip/getme-new1.html 
- Download RAxML at https://cme.h-its.org/exelixis/web/software/raxml/index.html 
- Download Figtree (tree visualization) at https://github.com/rambaut/figtree/releases 
- Install the python package **dendropy** at https://dendropy.org/
- [WebPhy](https://bioinformatics.phylolab.net/)

## Data files
Download the data files ([lab15_primates.nex](https://book.phylolab.net/binf8441/data/lab15_primates.nex) and [lab15_primates.phy](https://book.phylolab.net/binf8441/data/lab15_primates.phy)) of DNA alignments in Phylip and Nexus format. You may convert a format to another format in R using the packages **ape** and **phybase**. 

```{code-cell}
library(phybase)
data = read.dna.seq("https://book.phylolab.net/binf8441/data/lab15_primates.nex")
write.dna.seq(data$seq, data$name, file="primates.phy", format="phylip")
```

## Distance methods
1.	Given the DNA alignments, calculate the pairwise distances in phylip using the subroutine **dnadist** (read the [instruction](https://evolution.genetics.washington.edu/phylip/doc/dnadist.html))
2.	Reconstructing the UPGMA and NJ trees from pairwise distances in phylip using the subroutine **neighbor** (read the [instruction](https://evolution.genetics.washington.edu/phylip/doc/neighbor.html))
3.	Performing the bootstrap analysis using the subroutine **seqboot** (read the [instruction](https://evolution.genetics.washington.edu/phylip/doc/seqboot.html))
4.	building a consensus tree from the bootstrap trees using the subroutine **consense** (read the [instruction](https://evolution.genetics.washington.edu/phylip/doc/consense.html))

## Parsimony methods
Given the DNA alignments, find the most parsimonious tree in phylip using the subroutine **dnapars** (read the [instruction](https://evolution.genetics.washington.edu/phylip/doc/dnapars.html))

## Maximum likelihood 
Find the maximum likelihood tree using **RAxML** with the command line 
```{code}
raxmlHPC.exe  -p7635673  -s primates.phy  -mGTRGAMMA -n outputfile
```
Perform the bootstrap analysis with 100 replicates
```{code}
raxmlHPC.exe   -b14635  -p7635673 -N100  -s primates.phy -mGTRGAMMA -n outputfile
```
Build the majority rule consensus tree from bootstrap trees
```{code}
raxmlHPC.exe   -J MRE  -z bootstraptreefile  -mGTRGAMMA  -n outputfile
```

## Summarizing bootstrap trees
The python program **sumtrees.py**, which is available in the package dendropy, can build a majority rule consensus tree from a set of trees. The command line is

```{code}
sumtrees.py -f 0 -o output.con.tre -p  input_treefile --to-phylip  --no-summary-metadata
```

## Tree distance
Calculate tree distances using the R function **dist.topo()** in **ape**

```{code-cell}
library(phybase)
trees = read.tree("https://book.phylolab.net/binf8441/data/lab15_trees.tre")
dist.topo(trees)
```



