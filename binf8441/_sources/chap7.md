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


# Chapter 7: Multiple tests

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Multiple tests problems](https://en.wikipedia.org/wiki/Multiple_comparisons_problem)
```

Statistical analysis may involve multiple tests. Although the $\alpha$ level (Type I error) of each test is 0.05, the overall $\alpha$ level is much greater than 0.05 when multiple tests are involved. Therefore, correction is needed in order to control the overall $\alpha$ at the level of 5%. 

## Bonferroni correction

Suppose there are $k$  tests and they are independent of each other. Let $R_i$ be the rejection region for the test $i$. The overall type I error, the probability of at least one test rejecting the null hypothesis, is given by

$$
\begin{equation}
\begin{split}
P(\cup_{i=1}^kR_i) &= 1- P(\overline{\cup_{i=1}^kR_i})\\
&= 1- P(\cap_{i=1}^k\bar{R_i})\\ 
&= 1-\prod_{i=1}^kP(\bar{R_i}) \\
&= 1-\prod_{i=1}^k\left(1-P(R_i)\right)\\ 
&= 1-\prod_{i=1}^k(1-\alpha)\\ 
&= 1-(1-\alpha)^k \approx 1-(1-k\alpha) = k\alpha
\end{split}
\end{equation}
$$

The overall $\alpha$-level $\theta = k\alpha$ where $\alpha$ is the $\alpha$ level of each test. Or $\alpha = \frac{\theta}{k}$. 

```{admonition} Bonferroni correction
If the overall $\alpha$ level is 0.05, then the Bonferroni correction for individual tests is

 $$\alpha = \frac{0.05}{k}$$ 
```

```{code-cell}
pvalues <- c(.002, .005, .015, .113, .222, .227, .454, .552, .663, .751)
result = p.adjust(pvalues,method="bonferroni")
print(paste("adjusted pvalues:",result))
```

If $k$ is large, the $\alpha$ level for each test is extremely small, making it very difficult to reject the null hypothesis for each test. Bonferroni correction is too conservative.

## False discovery rate 
The above section indicates that it is difficult to control the overall type I error. In this section, we introduce a new criterion, false discovery rate, to perform the tests.

````{prf:definition} false discovery rate
:nonumber:
:label: fdr
:nonumber:

Let $W$ be the number of wrong rejections among a total of $Y$ rejections. False discovery rate is equal to the expectation of $\frac{W}{Y}$, i.e.,

$$FDR = E\left(\frac{W}{Y}\right)$$
````
In practise, it is difficult to calculate FDR. The Benjamin--Hochberg procedure (BH step-up procedure) is a numerical approach to control the false discovery rate at the level of $\alpha$ (typically, $\alpha=0.05$). 

The BH procedure works as follows: calculate the pvalue for each test and
re-order them from the minimum to the maximum $P_{(1)},\dots, P_{(n)}$. 

1. For a given $\alpha$, find the largest $k$ such that $P_{(k)} \leq \frac{k}{n}\alpha$
2. Reject the null hypothesis (i.e. declare positive discoveries) for the re-ordered hypotheses $H_{(i)}$ for $i = 1, \dots, k$.

````{prf:example} 7.1
:nonumber:
:label: 7.1
:nonumber:

We would like to know if any of the three genes are associated with cancer. We collected the gene expression level data from the normal group (50 people) and the cancer group (50 people). We performed the two-sample t-test for three genes and their pvalues are pvalue1 = 0.03, pvalue2 = 0.01, pvalue3 = 0.06, and the number of tests $n=3$.

Thus, $P_{(1)} = 0.01, P_{(2)} = 0.03, P_{(3)} = 0.06$. We want to control the FDR at the level of 0.05, i.e., $\alpha = 0.05$. 

1. Find the largest $k$ such that $P_{(k)} \le \frac{k}{n}\alpha$. We first try $k = 3$, but $P_{(3)} > 0.05$. Then, we try $k = 2$ and $P_{(2)} < 2*0.05/3$. Thus, $k=2$.
2. We reject the null hypothesis for the first two tests, and conclude that gene1 and gene2 are significantly associated with cancer. 
````

```{code-cell}
pvalues <- c(.002, .005, .015, .113, .222, .227, .454, .552, .663, .751)
result = p.adjust(pvalues,method="BH")
print(paste("adjusted pvalues:",result))
```