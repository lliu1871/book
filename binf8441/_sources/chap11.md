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

# Chapter 11: Bootstrap

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Bootstrapping](https://en.wikipedia.org/wiki/Bootstrapping_(statistics))
```

Monte Carlo simulation assumes that the underlying probability distribution is given. If the probability distribution is not given, we can estimate the probability distribution from data and use the estimated distribution to generate data.

````{prf:definition} Bootstrapping
:nonumber:
:label: bootstrapping
:nonumber:

Bootstrapping is a resampling technique for estimating the distribution (or expectations) of any statistic of interest. 
````

## Parametric bootstrap
The probability distribution is given up to the parameter values. For example, the probability distribution is Normal$(\mu, \sigma^2)$. We first use data to estimate the unknown parameters, and then generate bootstrap samples from Normal$(\hat{\mu}, \hat{\sigma^2})$, where the unknown parameters are replaced by their estimates.  

Note that the structure (size, table, number of subsamples) of bootstrap samples should look exactly the same as the original data. If the original data contains two samples, each bootstrap sample should contain two sample. If the original data consist of 23 observations, each bootstrap sample should consist of 23 observations. If the original data is a table (or a matrix), each bootstrap sample should be a table (or a matrix).

````\{prf:example\} 11.1
:nonumber:
:label: 11.1
:nonumber:
We want to estimate the average weight of all UGA students. We take a sample of 10 students and their weights are (125.2028, 128.9885, 131.3598, 126.8757, 128.8428, 128.8664, 133.3717, 131.3412, 132.6467, 130.6033). The sample average is 129.81. Here, we want to calculate the variance of the sample average.

Parametric bootstrap: Suppose the probability distribution of weights of all UGA students is Normal$(\mu,\sigma^{2})$.

1) We first estimate the parameters $\mu$ and $\sigma^2$. The population mean $\mu$ is estimated by the sample average, which is 129.81. The population variance $\sigma^2$ is estimated by the sample variance is 6.49. 

2) 100 bootstrap samples of size 10 are generated from the normal distribution with $\mu=129.81$ and $\sigma^{2}=6.49$.

3) For each bootstrap sample, we calculate the sample average. We get 100 averages $\left(\overline{x_{1}}, \ldots, \overline{x_{100}}\right)$ 

4) The variance of the sample average is approximated by the sample variance of $\left(\overline{x_{1}}, \ldots, \overline{x_{100}}\right)$
````

```{code-cell}
nbootstrap = 1000
ave = 1:nbootstrap

for(i in 1:nbootstrap){
  x = rnorm(10, mean=129.81, sd=sqrt(6.49))
  ave[i] = mean(x)
}

print(paste("the variance of the sample average is",var(ave)))
```

````\{prf:example\} 11.2
:nonumber:
:label: 11.2
:nonumber:

Comparing two Packing Machines. In a packing plant, a machine packs cartons with jars. It is supposed that a new machine will pack faster on the average than the machine currently used. To test that hypothesis, the times it takes each machine to pack ten cartons are recorded. The results, in seconds, are shown in the following table

$$
\begin{array}{|l|l|l|l|l|l|l|l|l|l|}
\hline new & 42.1 & 41.3 & 42.4 & 43.2 & 41.8 & 42.7 & 43.8 & 42.5 & 43.1 & 44.0 \\
\hline old & 41.0 & 41.8 & 42.8 & 42.3 & 42.7 & 43.6 & 43.3 & 43.5 & 41.7 & 44.1 \\
\hline
\end{array}
$$

$\mathrm{H}_{0}: \mu_{1}=\mu_{2}$ vs $\mathrm{H}_{1}: \mu_{1} \neq \mu_{2}$

Test-stat: $t=\overline{x_{1}}-\overline{x_{2}}$

Rejection region: we reject the null hypothesis if $t>a$ or $t<b$, where a is the 97.5% quantile and $b$ is the 2.5% quantile of the null distribution of the test statistic $t$.

We use parameter bootstrap to approximate the null distribution of the test statistic $t$.

1. Suppose the underlying probability distribution is Normal$(\mu,\sigma^{2})$. We first estimate the unknown parameters $\mu$ and $\sigma^2$. Under $\mathrm{H}_{0}$, two samples are from the same normal distribution. Thus, $\mu$ is estimated by the overall average of all observations in the two samples, which is 42.68. If we assume equal variance, then $\sigma^{2}$ is estimated by the sample variance of all observations in the two samples, which is 0.8. For unequal variances $\left(\sigma_{1}^{2}, \sigma_{2}^{2}\right)$, two variances are estimated by the sample variance of each sample.

2. Generate 100 bootstrap samples. Each bootstrap sample consists of two samples $x$ and $y$. The 10 observations in the $x$ sample are generated from Normal$(\mu=42.68,\sigma^2=0.8$. Similarly, 10 observations in the $y$ sample are generated from the same normal distribution, because under the null hypothesis two samples are from the same distribution. 

3. For each bootstrap sample, we calculate the test statistic $t$. Now, we have 100 test statistics $\left(t_{1}, \ldots, t_{100}\right)$

4. The 97.5% quantile of the null distribution of the test statistic $t$ is approximated by the 97.5% quantile of $\left(t_{1}, \ldots, t_{100}\right)$. Similarly, the 2.5% quantile of the null distribution of the test statistic t is approximated by the 2.5% quantile of $\left(t_{1}, \ldots, t_{100}\right)$

5. We reject the null if the observed test statistic calculated from the original data is greater than the 97.5% quantile or less than the 2.5% quantile of the null distribution
````

```{code-cell}
new = c(42.1 , 41.3 , 42.4 , 43.2 , 41.8 , 42.7 , 43.8 , 42.5 , 43.1 , 44.0)
old = c(41.0 , 41.8 , 42.8 , 42.3 , 42.7 , 43.6 , 43.3 , 43.5 , 41.7 , 44.1)

# estimate mu and variance
mu = mean(c(new,old))
va = var(c(new,old))

print(paste("the estimate of mu is", mu))
print(paste("the estimate of variance is", va))

# approximate the null distribution of the test statistic t
teststat = mean(new)-mean(old)
nbootstrap = 1000
t_bootstrap = 1:nbootstrap

for(i in 1:nbootstrap){
  x = rnorm(10, mean = mu, sd = sqrt(va))
  y = rnorm(10, mean = mu, sd = sqrt(va))
  t_bootstrap[i] = mean(x)-mean(y)
}

# find the 2.5% and 97.5% quantile
critical_value = quantile(t_bootstrap, p=c(0.025,0.975))
print(paste("the 2.5% quantile:", critical_value[1]))
print(paste("the 97.5% quantile:",critical_value[2]))
print(paste("test statistic:",teststat))

if(teststat < critical_value[1] | teststat>critical_value[2]){
  print("We reject the null hypothesis")
}else{
  print("We cannot reject the null hypothesis")
}

```

## Nonparametric bootstrap 
Nonparametric bootstrap samples are generated by resampling the original data with replacement, pretending the original data is the "population".


````\{prf:example\} 11.3
:nonumber:
:label: 11.3
:nonumber:
We want to estimate the average weight of all UGA students. We take a sample of 10 students and their weights are (125.2028, 128.9885, 131.3598, 126.8757, 128.8428, 128.8664, 133.3717, 131.3412, 132.6467, 130.6033). The sample average is $129.81$. Here, we want to calculate the variance of the sample average.

Nonparametric bootstrap samples are generated by resampling the original data with replacement

1) 100 bootstrap samples of size 10 by resampling the original data set with replacement

2) For each bootstrap sample, we calculate the sample average. We have 100 averages $\left(\overline{x_{1}}, \ldots, \overline{x_{100}}\right)$

3) The variance of the sample average is approximated by the sample variance of $\left(\overline{x_{1}}, \ldots, \overline{x_{100}}\right)$
````

```{code-cell}
data = c(125.2028,128.9885,131.3598,126.8757, 128.8428,128.8664,133.3717,131.3412,132.6467,130.6033)
nbootstrap = 1000
ave = 1:nbootstrap

for(i in 1:nbootstrap){
  x = sample(data, 10, replace=TRUE)
  ave[i] = mean(x)
}

print(paste("the variance of the sample average is",var(ave)))
```


````\{prf:example\} 11.4
:nonumber:
:label: 11.4
:nonumber:

Comparing two Packing Machines. In a packing plant, a machine packs cartons with jars. It is supposed that a new machine will pack faster on the average than the machine currently used. To test that hypothesis, the times it takes each machine to pack ten cartons are recorded. The results, in seconds, are shown in the following table

$$
\begin{array}{|l|l|l|l|l|l|l|l|l|l|}
\hline new & 42.1 & 41.3 & 42.4 & 43.2 & 41.8 & 42.7 & 43.8 & 42.5 & 43.1 & 44.0 \\
\hline old & 41.0 & 41.8 & 42.8 & 42.3 & 42.7 & 43.6 & 43.3 & 43.5 & 41.7 & 44.1 \\
\hline
\end{array}
$$

$\mathrm{H}_{0}: \mu_{1}=\mu_{2}$ vs $\mathrm{H}_{1}: \mu_{1} \neq \mu_{2}$

Test-stat: $t=\overline{x_{1}}-\overline{x_{2}}$

We use nonparametric bootstrap to approximate the null distribution of the test statistic $t$.
Under $\mathrm{H}_{0}$, two samples are generated from the same population. Thus, the pooled sample is treated as the "population" and we generate bootstrap samples from the pooled sample with replacement.

1) The pooled sample consists of 20 observations. Each bootstrap sample has a $x$ sample and a y sample. The x sample is generated by selecting 10 numbers at random from the 20 observations in the pooled sample. The y sample is generated by selecting 10 numbers at random from the 20 observations in the pooled sample.

2) For each bootstrap sample, we calculate the test statistic t. Thus, we have 100 test statistics $\left(t_{1}, \ldots, t_{100}\right)$

3) The $97.5 \%$ quantile of the null distribution of the test statistic $\mathrm{t}$ is approximated by the sample $97.5 \%$ quantile of $\left(t_{1}, \ldots, t_{100}\right)$. Similarly, the $2.5 \%$ quantile of the null distribution of the test statistic t is approximated by the sample $2.5 \%$ quantile of $\left(t_{1}, \ldots, t_{100}\right)$

4) We reject $\mathrm{H}_{0}$, if the observed test statistic calculated from the original data is $>$ the $97.5 \%$ quantile of the null distribution or $<$ the $2.5 \%$ quantile of the null distribution 
````

```{code-cell}
new = c(42.1 , 41.3 , 42.4 , 43.2 , 41.8 , 42.7 , 43.8 , 42.5 , 43.1 , 44.0)
old = c(41.0 , 41.8 , 42.8 , 42.3 , 42.7 , 43.6 , 43.3 , 43.5 , 41.7 , 44.1)

all = c(new,old)

# approximate the null distribution of the test statistic t
teststat = mean(new)-mean(old)
nbootstrap = 1000
t_bootstrap = 1:nbootstrap

for(i in 1:nbootstrap){
  x = sample(all, 10, replace=TRUE)
  y = sample(all, 10, replace=TRUE)
  t_bootstrap[i] = mean(x)-mean(y)
}

# find the 2.5% and 97.5% quantile
critical_value = quantile(t_bootstrap, p=c(0.025,0.975))
print(paste("the 2.5% quantile:", critical_value[1]))
print(paste("the 97.5% quantile:",critical_value[2]))
print(paste("test statistic:",teststat))

if(teststat < critical_value[1] | teststat>critical_value[2]){
  print("We reject the null hypothesis")
}else{
  print("We cannot reject the null hypothesis")
}

```
