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


# Lab 11: Bootstrap

Suppose $x_1, \ldots, x_{10} \sim \operatorname{Normal}\left(\mu, \sigma^2\right)$. Let $\hat{\mu}$ be an estimator of $\mu$. It could be the sample mean, sample median, maximum likelihood estimator, or any point estimator. We will calculate $\operatorname{var}(\hat{\mu})$ using bootstrap samples.

```{code-cell}
data = rnorm(10, mean=4, sd=2)
sample_median = median(data)
sample_median
```

## Parametric bootstrap:
We estimate the unknown parameters, $\hat{\mu}_{MLE}=\bar{x}$ and $\widehat{\sigma^2}_{MLE}=$ sample variance
```{code-cell}
mu_hat = mean(data)
var_hat = var(data)
```

Generate $k$ bootstrap samples from the $Normal(\hat{\mu}_{MLE}, \widehat{\sigma^2}_{MLE})$
```{code-cell}
k=100
bootstrap_sample = matrix(0, nrow=10, ncol=k)
for(i in 1:k){
  bootstrap_sample[,i] = rnorm(10, mean=mu_hat, sd=sqrt(var_hat))
}
```
Calculate $\hat{\mu}$, i.e., the sample median for each bootstrap sample, $\left\{\widehat{\mu_1}, \ldots, \widehat{\mu_k}\right\}$

```{code-cell}
sample_median = 1:k
for(i in 1:k){
  sample_median[i] = median(bootstrap_sample[,i])
}
sample_median
```

Calculate the sample variance $S^2$ of $\left\{\widehat{\mu_1}, \ldots, \widehat{\mu_k}\right\}$, i.e., $\frac{1}{k-1} \sum_{i=1}^k\left(\widehat{\mu_i}-\widehat{\mu}\right)^2$ and $\operatorname{var}(\hat{\mu}) \approx S^2$

```{code-cell}
var(sample_median)
```

## Nonparametric bootstrap
We generate bootstrap samples by resampling the original data with replacement.

```{code-cell}
bootstrap_sample = matrix(0, nrow=10, ncol=k)
for(i in 1:k){
  bootstrap_sample[,i] = sample(data,10,replace=T)
}
```

We calculate the sample median for each bootstrap sample
```{code-cell}
sample_median = 1:k
for(i in 1:k){
  sample_median[i] = median(bootstrap_sample[,i])
}
sample_median
```
We calculate the sample variance $S^2$ of $\left\{\widehat{\theta_1}, \ldots, \widehat{\theta_k}\right\}$, i.e., $\frac{1}{k-1} \sum_{i=1}^k\left(\widehat{\theta_t}-\widehat{\theta}\right)^2$ and $\operatorname{var}(\hat{\theta}) \approx S^2$


```{code-cell}
var(sample_median)
```


## Building bootstrap phylogenetic trees
We build a distance phylogenetic tree using the DNA alignment in test.phy.

```{code-cell}
library(phybase)
data = read.dna.seq("./data/lab15_primates.phy",format="phylip")
seq = data$seq
d = dist.dna(seq)
rownames(d) = data$name
plot(nj(d))
```
We generate 100 nonparametric boostrap samples, i.e., resampling columns of the DNA alignment with replacement. Then, we build a tree for each bootstrap sample.

```{code-cell}
ncol = dim(seq)[2]
nbootstrap = 100
bootstrap_tree = rep("",nbootstrap)

for(i in 1:nbootstrap){
  columns = sample(1:ncol,ncol,replace=T)
  bootstrap_sample = seq[,columns]
  d = dist.dna(bootstrap_sample)
  rownames(d) = data$name
  bootstrap_tree[i] = write.tree(nj(d))
}

trees = read.tree(text=bootstrap_tree)
trees

plot(trees[1])
plot(trees[2])
plot(trees[3])
plot(trees[4])
```

