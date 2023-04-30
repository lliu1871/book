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


# Lab 4: BLAST

## Preparation
- Download BLAST (ncbi-blast-2.13.0+.dmg for Mac and ncbi-blast-2.13.0+-win64.exe for Windows) at https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ and install it on your laptop
- The manual is available at https://www.ncbi.nlm.nih.gov/books/NBK279690/
- Install an R package “ape” by typing install.packages("ape") in R
- Install an R package “seqinr” by typing install.packages("seqinr") in R

## FASTA format

FASTA format is used to represent molecular sequences. The first line begins with **>** and describes the sequence, while the following lines are the sequence.

```{admonition} Example DNA sequence in FASTA format

\>gi|23423|ref|NM_23542.0| Homo sapiens protein \
ATGAATCGATACGATAGCTAGCTATCGATGCA \
GATCAGAGAGGGGCTTTAGCTAGCTAAGCTAG 
```

```{admonition} Example protein sequence in FASTA format
\>MCHU - Calmodulin - Human, rabbit, bovine, rat, and chicken \
ADQLTEEQIAEFKEAFSLFDKDGDGTITTKELGTVMRSLGQNPTEAELQDMINEVDADGNGTID \
FPEFLTMMARKMKDTDSEEEIREAFRVFDKDGNGYISAAELRHVMTNLGEKLTDEEVDEMIREA \
DIDGDGQVNYEEFVQMMTAK* 
```

## Blast GenBank online

The query sequence in FASTA format is given below


```{admonition} \>Sequence3a 
TAACCTACGGGTGGCCGCAGTGGGGAATATTGCACAATGGACACAAGTCTGATGCAGCGACGC\
CGCGTGGGGGATGAAGGCTTTCGGGTTGTAAACTCCTTTCAGTACAGAAGAAGCATTTTTGTG\
ACGGTATGTGCAGAAGAAGCGCCGGCTAACTACGTGCCAGCAGCCGCGGTAATACGTAGGGCG\
CGAGCGTTGTCCGGAATTATTGGGCGTAAAGAGCTCGTAGGCGGTTTGTTGCGCCTGCTGTG
```

Navigate to the main BLAST page (https://blast.ncbi.nlm.nih.gov/Blast.cgi). Select the appropriate type of BLAST for your sequence. Paste the query sequence into the box. Click the “BLAST” button and wait for the results.

Once the results are displayed, notice there are three main headings: Graphic Summary, Descriptions, and Alignments.

## Blast remotely against GenBank

Save the sequence3a in a file called lab4_test.fa or download the file [lab4_test.fa](https://book.phylolab.net/binf8441/data/lab4_test.fa). We may run the following command line to blast remotely against GenBank. Please make sure to specify the full path of blastn. 

```{code}
blastn -query lab4_test.fa -out lab4_result.txt -remote -db nt
```

We may get the IDs of the first 100 significant sequences in R. 
```{code-cell}
data=scan("https://book.phylolab.net/binf8441/data/lab4_result.txt",what="character",sep="\n")
index = grep("Sequences producing",data)
ngeneid = 100
geneid = rep("",ngeneid)
for(i in 1:ngeneid){
    x=data[index+i]
    geneid[i] = unlist(strsplit(x,split=" "))[1]
}
print("The geneid of the first 100 significant sequences include")
geneid
```

We can retrieve the DNA sequences using the gene IDs we received above.

```{code-cell}
library(ape)
ngeneid = 2 #to save time we only retrieve the first 2 sequences
seq=rep("",ngeneid)
names(seq)=geneid[1:ngeneid]
for(i in 1:ngeneid){
    seq[i] = read.GenBank(geneid[i])
    Sys.sleep(5) #if too many request, the server will identify it as a spam. here we wait 5 seconds after each request
}
print(paste("The first sequence is", seq[1]))
```
Save the sequences in a file
```{code-cell}
write.dna(seq,"seq.fas",format="fasta")
```

## Generate a local blast database

The Blast package includes a program **makeblastdb**. We first download and unzip the zebra finch chromosome 1 [Taeniopygia_guttata.bTaeGut1_v1.p.dna.primary_assembly.1.fa.gz](https://book.phylolab.net/binf8441/data/Taeniopygia_guttata.bTaeGut1_v1.p.dna.primary_assembly.1.fa.gz). A local blast database is constructed by typing the following command line in Terminal (Mac) or the command window (type CMD in Windows). Please make sure to specify the full path of **makeblastdb**.

```{code}
~/Bin/ncbi-blast-2.10.0+/bin/makeblastdb -in Taeniopygia_guttata.bTaeGut1_v1.p.dna.primary_assembly.1.fa -dbtype nucl -out Taeniopygia_guttata
```

Note that we may run the third party programs such as blast in R using the R function **system()**.

```{code-cell}
 try(system(paste("c://Users/liuliang_2/bin/blast-2.10.0+/bin/makeblastdb.exe -in Taeniopygia_guttata.bTaeGut1_v1.p.dna.primary_assembly.1.fa -dbtype nucl -out Taeniopygia_guttata")))
```

## Blast against the local database
Download the input file [lab4_query_local.txt](https://book.phylolab.net/binf8441/data/lab4_query_local.txt) and run the following command line in Terminal (Mac) or the command window (type CMD in Windows).

```{code}
blastn -query lab4_query_local.txt -db Taeniopygia_guttata -out resultfile -max_target_seqs 5
```

## Exercise
For each query sequence in the file lab4_query_local, write R code to blast remotely against GenBank and save the sequences of the first 50 significant alignments to a file. Since there are 10 query sequences in the file lab4_query_local, your R code should generate 10 output files. Explain the sequences in each output file.


