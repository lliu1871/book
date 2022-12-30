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


# Chapter 7: Multiple tests

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Multiple tests problems](https://en.wikipedia.org/wiki/Multiple_comparisons_problem)
```

Statistical analysis may involve multiple tests. Although the $\alpha$ level of each test is 0.05, the overall $\alpha$ level is much greater than 0.05 when multiple tests are involved. Therefore, correction is needed in order to control the overall $\alpha$ at the level of 5%. 

## Bonferroni correction

Suppose there are $k$  tests and they are independent of each other. Let $R_i$ be the rejection region for the test $i$. The overall type I error is given by

$$
\begin{equation}
\begin{split}
P(\cup_{i=1}^kR_i) &= 1- P(\bar{\cup_{i=1}^kR_i})\\
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

If $k$ is large, the $\alpha$ level for each test is extremely small, making it very difficult to reject the null hypothesis for each test. Bonferroni correction is too conservative.

## False discovery rate 
The above section indicates that it is difficult to control the overall type I error. In this section, we introduce a new criterion, false discovery rate, to perform the tests.

````{prf:definition} false discovery rate
:label: fdr
:nonumber:

Let $W$ be the number of wrong rejections among a total of $Y$ rejections. False discovery rate is equal to the expectation of $\frac{W}{Y}$, i.e.,

$$FDR = E\left(\frac{W}{Y}\right)$$
````
In practise, it is difficult to calculate FDR. The Benjamin--Hochberg procedure (BH step-up procedure) is a numerical approach to control the false discovery rate. 

The BH procedure works as follows: calculate the pvalue for each test and
re-order them from the minimum to the maximum $P_1,\dots, P_n$.

1. For a given $\alpha$, find the largest $k$ such that $P(k) \leq \frac{k}{n}\alpha$
2. Reject the null hypothesis (i.e. declare positive discoveries) for the hypotheses $H_i$ for $i = 1, \dots, k$.

````{prf:example}
:nonumber:

We would like to know if any of the three genes are associated with cancer. We collected the gene expression level data from the normal group (50 people) and the cancer group (50 people). We performed the two-sample t-test for three genes and their pvalues are pvalue1 = 0.03, pvalue2 = 0.01, pvalue3 = 0.06.

Thus, $P_1 = 0.01, P_2 = 0.03, P_3 = 0.06$. We want to control FDR at the level of 0.05, i.e., $\alpha = 0.05$. 

1. Find the largest $k$ such that $P_k \le \frac{k}{n}\alpha$. We first try $k = 3$, but $P_3 > 0.05$. Then, we try $k = 2$ and $P_2 < 2*0.05/3$. Thus, $k=2$.
2. We reject the null hypothesis for the first two tests, and conclude that gene1 and gene2 are significantly associated with cancer. 
````
