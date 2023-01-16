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

# Lab 2: Generating random numbers

## Discrete probability distributions

In this lab, we will generate random numbers from a probability distribution. We begin with a discrete probability distribution.

| x |1 |2 |3 |
| --- | --- | --- | --- |
| p| 1/3| 1/3|1/3 |
|||||

The R function *sample()* can be used to generate random numbers from a discrete probability distribution. For example, the following code will randomly pick a number from (1,2,3) without replacement

```{code-cell}
sample(x=1:3, size = 1, replace=FALSE, prob = c(1/3,1/3,1/3))
```

To select two numbers at random from (1,2,3) without replacement, we do

```{code-cell}
sample(x=1:3, size = 2, replace=FALSE, prob = c(1/3,1/3,1/3))
```

To select two numbers at random from (1,2,3) with replacement, we do

```{code-cell}
sample(x=1:3, size = 1, replace=TRUE, prob = c(1/3,1/3,1/3))
```

```{admonition} Exercise 1
Flipping a fair coin 5 times and then we count the number of heads. Suppose head is 1 and tail is 0. Because it is a fair coin, the probability distribution of X is

|x| 0| 1|
| ---|---|---|
|p| 0.5| 0.5|
||||
```

```{code-cell}
outcome = sample(x=c(0,1), size = 5, replace=TRUE, prob=rep(0.5,2))
outcome
print(paste("The count of heads is", sum(outcome)))
```

```{admonition} Exercise 2
We repeat the above experiment 1000 times and we would like to see how the number of heads varies across 1000 experiments.
```

```{code-cell}
nsim = 1000
result = rep(0,nsim)
for(i in 1:nsim){
    outcome = sample(x=c(0,1), size = 5, replace=TRUE, prob=rep(0.5,2))
    result[i] = sum(outcome)
}
table(result)
barplot(table(result))
```
Alternative, we may simulate random numbers from the binomial distribution with $n=5$ and $p=0.5$.

```{code-cell}
result = rbinom(1000,size=5,p=0.5)
table(result)
barplot(table(result))
```

```{admonition} Exercise 3
Given a DNA sequence AGCCCGGGTTTACCCTTGGGAAAATTGCCCCAGTGACCCCT, 
1. calculate the proportion of A, C, G, T.
2. Use R to randomly select a nucleotide from the DNA sequence
3. Now we want to select 10 nucleotides without replacement. Then calculate the sample proportions of A, C, G, T among the 10 selected nucleotides and compare them with the population proportions of A, C, G, T in the DNA sequence.
4. Let's select 100 nucleotides and calculate the sample proportions.
```

```{code-cell}
seq = "AGCCCGGGTTTACCCTTGGGAAAATTGCCCCAGTGACCCCT"
x = unlist(strsplit(seq,split=""))

#proportions of A, C, G, T
sum(x=='A')/length(x)
sum(x=='C')/length(x)
sum(x=='G')/length(x)
sum(x=='T')/length(x)

#select a nucleotide
position=sample(1:length(x),size=1)
x[position]

#sample 10 nucleotides without replacement
position = sample(1:length(x),size=10)
data = x[position]
data
print("the proportions of A, C, G, T in the sample of 10 nucleotides")
sum(data=='A')/10
sum(data=='C')/10
sum(data=='G')/10
sum(data=='T')/10

#sample 100 nucleotides with replacement
position = sample(1:length(x),size=100,replace=TRUE)
data = x[position]
print("the proportions of A, C, G, T in the sample of 100 nucleotides")
sum(data=='A')/100
sum(data=='C')/100
sum(data=='G')/100
sum(data=='T')/100
```

To generate a random number from the binomial distribution

```{code-cell}
rbinom(n=10, size=5, prob=0.5)
```

to generate a random number from the Poisson distribution
```{code-cell}
rpois(n=10, lambda=3.5)
```

## Continuous probability distributions

We may generate a random number from an interval [a, b] using the R function **runif()**. For example, we may generate a random number between 0 and 2,

```{code-cell}
runif(1, min=0, max=2)
```

Or generate 10 random numbers from the interval [2, 10]

```{code-cell}
runif(10, min=2, max=10)
```

We may generate 10 random numbers from the normal distribution with mean = 4.5 and variance = 2 and then calculate the sample average.

```{code-cell}
data = rnorm(10, mean=4.5, sd=sqrt(2))
data
print(paste("the sample average:",mean(data)))
```

## Dealing with sequence files
The R function **scan()** can read text files into R. FASTA format: A sequence record in a FASTA format consists of a single-line description (sequence name), followed by line(s) of sequence data. The first character of the description line is a greater-than (">") symbol. To read FASTA file test.fasta, the R code is

```{code-cell}
x = scan("https://book.phylolab.net/binf8441/data/lab2_test.fasta", what="character",sep="\n")
```

Then, we count the number of sequences in the file. In addition, what is the length of those sequences. Also, calculate the proportion of A, C, G, T in each sequence.

```{code-cell}
#count the number of >
index = grep(">",x)
nseq = length(index)
print(paste("the number of sequences:",nseq))

#get sequences
seq=rep("",length(index))
for(i in 1:length(index)){
    if(i < length(index)){
        seq[i] = paste(x[(index[i]+1):(index[i+1]-1)],collapse="",sep="")
    }else{
        seq[i] = paste(x[(index[i]+1):length(x)],collapse="",sep="")
    }
}

#sequence length
seqlength = nchar(seq[1])
print(paste("the sequence length is",seqlength))

#proportions
prop = matrix(0,nrow=nseq,ncol=4)
row.names(prop) = paste("seq",1:nseq,sep="")
for(i in 1:nseq){
    s = unlist(strsplit(seq[i],split=""))
    prop[i,] = c(sum(s=='a'), sum(s=='c'), sum(s=='g'), sum(s=='t'))/seqlength
}
print("the proportions of a, c, g, t in each sequence")
prop
```

