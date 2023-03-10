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

# Chapter 5: Estimation theory

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Estimation theory](https://en.wikipedia.org/wiki/Probability_theory)
```

## Sufficient statistics

A statistic is a function $T=g\left(X_{1}, \dots, X_{n}\right)$ of the random sample $X_{1}, \dots, X_{n}$ generated from a probability distribution with density $f(X \mid \theta)$. 

````\{prf:example\} 5.1
:nonumber:
:label: 5.1
:nonumber:
:label: chap5_1
The followings are statistics, 
- sample average: $T=\frac{1}{n} \sum X_{i}$
- sample median: $T= median \left(X_{1}, \dots, X_{n}\right)$
- sample maximum: $T=\max \left(X_{1}, \dots, X_{n}\right)$
````

We use statistics to estimate unknown parameters. $\mathrm{T}$ is a sufficient statistic if the statistician who knows the value of $\mathrm{T}$ can do just as good a job of estimating the unknown parameter $\theta$ as the statistician who knows the entire random sample. 

````{prf:definition} sufficient statistics
:nonumber:
:label: sufficient
A statistic $\mathrm{T}$ is sufficient for parameter $\theta$ if the conditional distribution of a random sample $X_{1}, \dots, X_{n}$, given $\mathrm{T}$, does not depend on $\theta$, i.e.,

$$
f\left(X_{1}, \dots, X_{n} \mid T, \theta\right)=f\left(X_{1}, \dots, X_{n} \mid T\right)
$$
````


````{prf:theorem} Factorization theorem
:nonumber:
If the probability density function of data $X$ is $f(X \mid \theta)$, then $\mathrm{T}$ is sufficient for $\theta$ if and only if nonnegative functions $g$ and $h$ can be found such that 

$$f(X \mid \theta)=h(x) g(T, \theta)$$
````

If $z(x)$ is a one-to-one function and $\mathrm{T}$ is a sufficient statistic, then $z(T)$ is a sufficient statistic. For example, if the statistic $\mathrm{T}$ is sufficient, then $\mathrm{2T}$ is also a sufficient statistic.

````\{prf:example\} 5.2
:nonumber:
:label: 5.2
:nonumber:
:label: chap5_2
Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Bernoulli}(p)$ , find the sufficient statistic for $p$. 

$$
\begin{equation}
\begin{split}
f\left(X_{1},\dots, X_{n}|p\right) &=\prod p^{x_{i}}(1-p)^{1-x_{i}}\\
&=p^{\sum x_{i}}(1-p)^{n-\sum x_{i}}
\end{split}
\end{equation}
$$ 

Thus the sufficient statistic for $p$ is $\sum x_{i}$.
````

````\{prf:example\} 5.3
:nonumber:
:label: 5.3
:nonumber:
:label: chap5_3

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the sufficient statistics for $\mu$ and $\sigma^2$.

The joint density function of $X_{1}, \dots, X_{n}$ is

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1}, \dots, X_{n}=x_{n} \mid \mu, \sigma^{2}\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \mu, \sigma^{2}\right)\\
&=\prod_{i=1}^{n} \frac{1}{\sqrt{2 \pi \sigma^{2}}} e^{-\frac{\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}} \\
& =\left(\frac{1}{\sqrt{2 \pi \sigma^{2}}}\right)^{n} e^{-\frac{\sum_{i=1}^{n}\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}}\\
&=\left(\frac{1}{\sqrt{2 \pi \sigma^{2}}}\right)^{n} e^{-\frac{\sum_{i=1}^{n} x_{i}^{2}-2 \mu \sum_{i=1}^{n} x_{i}+n \mu^{2}}{2 \sigma^{2}}}
\end{split}
\end{equation}
$$

Thus, the sufficient statistics for $\left(\mu, \sigma^{2}\right)$ are $\left(\sum_{i=1}^{n} x_{i}, \sum_{i=1}^{n} x_{i}^{2}\right)$.
````

````\{prf:example\} 5.4
:nonumber:
:label: 5.4
:nonumber:
:label: chap5_4

Given a random sample $X_{1},\dots, X_{n} \sim$ Poisson $(\lambda)$, find the sufficient statistic for $\lambda$.

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1}, \dots, X_{n}=x_{n} \mid \lambda\right) &= \prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right)\\
&=\prod_{i=1}^{n} \frac{1}{x_{i}!}\lambda^{x_{i}} e^{-\lambda} \\
&=\lambda^{\sum_{i=1}^{n} x_{i}} e^{-\lambda n} \prod_{i=1}^{n} \frac{1}{x_{i}!}
\end{split}
\end{equation}
$$

Thus, the sufficient statistic for $\lambda$ is $\sum_{i=1}^{n} x_{i}$.
````

````\{prf:example\} 5.5
:nonumber:
:label: 5.5
:nonumber:
:label: chap5_5

Given a random sample $X_{1}, \dots, X_{n} \sim$ Exponential $(\lambda)$, find the sufficient statistic for $\lambda$

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1}, \dots, X_{n}=x_{n} \mid \lambda\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right)\\
&=\prod_{i=1}^{n} \lambda e^{-\lambda x_{i}}\\
&=(\lambda)^{n} e^{-\lambda \sum_{i=1}^{n} x_{i}}
\end{split}
\end{equation}
$$ 

Thus, the sufficient statistic for $\lambda$ is $\sum_{i=1}^{n} x_{i}$.
````

````\{prf:example\} 5.6
:nonumber:
:label: 5.6
:nonumber:
:label: chap5_6

Let $X_{(1)}, \dots, X_{(n)}$ be the order statistics of a random sample $X_{1}, \dots, X_{n} \sim f(x \mid \theta)$. Given the order statistics, the distribution of data $X_1, \dots, X_n$, i.e., 

$$f\left(X_{1}, \dots, X_{n} \mid X_{(1)}, \ldots, X_{(n)},\theta\right)$$

is a discrete uniform distribution, which does not depend on parameters $\theta$. Thus, the order statistics $X_{(1)}, \dots, X_{(n)}$ are sufficient statistics for parameters $\theta$.
````

## Unbiased estimator
````{prf:definition} unbiased estimator
:nonumber:
:label: unbiased
An estimator $\hat{\theta}$ is unbiased if and only if $E(\hat{\theta})=\theta$.
````

````\{prf:example\} 5.7
:nonumber:
:label: 5.7
:nonumber:
:label: chap5_7

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, the sample average $\bar{X}=\frac{1}{n}\sum_{i=1}^nX_i$ is an unbiased estimator of $\mu$.

$$ 
\begin{equation}
\begin{split}
E(\bar{X}) &= E(\frac{1}{n}\sum_{i=1}^nX_i)\\
&= \frac{1}{n}\sum_{i=1}^nE(X_i)\\
&= \frac{1}{n}n\mu = \mu
\end{split}
\end{equation}
$$
````

$\left(X_{1}+X_{2}\right) / 2$ is another unbiased estimator of $\mu$.

````\{prf:example\} 5.8
:nonumber:
:label: 5.8
:nonumber:
:label: chap5_8

Given a random sample $X_{1}, \dots, X_{n} \sim$ Exponential $(\lambda)$, the sample average is an unbiased estimator of $\lambda$.

$$ 
\begin{equation}
\begin{split}
E(\bar{X}) &= E(\frac{1}{n}\sum_{i=1}^nX_i)\\
&= \frac{1}{n}\sum_{i=1}^nE(X_i)\\
&= \frac{1}{n}n\lambda = \lambda
\end{split}
\end{equation}
$$
````

````{prf:theorem}
:nonumber:
Given a random sample $X_{1}, \dots, X_{n}$, the sample average $\bar{X}$ is an unbiased estimator of the population mean $\theta$.
````

## Mean squared errors

We introduce the mean squared error (MSE) to evaluate the performance of an estimator. A good estimator should have a small MSE.

$$MSE = E\left[(\hat{\theta}-\theta)^{2}\right]$$

````{prf:theorem}
:nonumber:

The MSE is the sum of the bias and variance. 

$$
E\left[(\hat{\theta}-\theta)^{2}\right]=(E(\hat{\theta})-\theta)^{2}+\operatorname{var}(\hat{\theta})
$$
````

If we only consider unbiased estimators, i.e., $(E(\hat{\theta})-\theta)^{2}=0$, then we choose the estimator with the minimum variance.

## Method of moments
By the law of large numbers, the sample average is a good estimator of the population average. Thus, we can use 

- $\hat{E(X)}=\frac{1}{n} \sum_{i=1}^{n} x_{i}$ 
- $\hat{E\left(X^{2}\right)}=\frac{1}{n} \sum_{i=1}^{n} x_{i}^{2}$
- $\hat{E\left(X^{k}\right)}=\frac{1}{n} \sum_{i=1}^{n} x_{i}{ }^{k}$


````\{prf:example\} 5.9
:nonumber:
:label: 5.9
:nonumber:
:label: chap5_9

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the moment estimators of the parameters $\mu$ and $\sigma^2$.

Because $E(X)=\mu$, the parameter $\mu$ is the population mean. Thus, the moment estimate of $\mu$ is the sample average 

$$\hat{\mu} = \frac{1}{n} \sum_{i=1}^{n} x_{i}$$ 

In addition, $\operatorname{var}(X)=E\left(X^{2}\right)-E(X)^{2}$. The moment estimate of the population mean $E(X)$ is the sample average $\bar{X}$. Similarly, the moment estimate of the population average $E\left(X^{2}\right)$ is the sample average of $x^2$, i.e., $\hat{E\left(X^{2}\right)} = \frac{1}{n}\sum_{i=1}^{n} x_{i}^{2}$. Thus, the moment estimate of the variance $\sigma^2$ is 

$$
\hat{\sigma^2} = \frac{1}{n} \sum_{i=1}^{n} x_{i}^{2}-\bar{x}^{2}=\frac{1}{n} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}
$$
````


## Maximum likelihood estimator

Let $X_{1}, \dots, X_{n}$ is a random sample generated from a discrete probability distribution with the probability mass function $P(x \mid \theta)$. We want to estimate parameter $\theta$. 

````{prf:definition} likelihood
:nonumber:
:label: likelihood
:nonumber:

The joint probability mass function 

$$P\left(X_{1}, \dots, X_{n} \mid \theta\right)=\prod_{i=1}^{n} P\left(X_{i} \mid \theta\right)$$ 

is also called the likelihood function. The likelihood function represents the probability (or likelihood) of the observed data $X_{1}, \dots, X_{n}$, given a certain value of $\theta$.
````

Suppose that $\theta$ can take on three values $1, 2 ,3$.

$$P\left(X_{1}, \dots, X_{n} \mid \theta=1\right)=0.3$$

$$P\left(X_{1}, \dots, X_{n} \mid \theta=2\right)=0.4$$

$$P\left(X_{1}, \dots, X_{n} \mid \theta=3\right)=0.1$$

```{admonition} Intuition
We estimate $\theta$ by the value that can maximize the likelihood of the observed data $X_{1}, \ldots, X_{n}$. This is called the maximum likelihood estimator of $\theta$. Thus, $\hat{\theta}=2$.
```

For continuous random variables, the likelihood function is the joint density function of data.The maximum likelihood estimator is the value of parameter that can maximize the likelihood function.


````\{prf:example\} 5.10
:nonumber:
:label: 5.10
:nonumber:
:label: chap5_10

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the MLE of the population mean $\mu$, assuming the variance $\sigma^2$ is given. 

We first find the likelihood function which is just the joint density function of $X_{1}, \dots, X_{n}$

$$
\begin{equation}
\begin{split}
L(\mu) = f\left(X_{1}=x_{1},\dots, X_{n}=x_{n} \mid \mu, \sigma^{2}\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \mu, \sigma^{2}\right) \\
&=\prod_{i=1}^{n} \frac{1}{\sqrt{2 \pi \sigma^{2}}} e^{-\frac{\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}} \\
&=\left(\frac{1}{\sqrt{2 \pi \sigma^{2}}}\right)^{n} e^{-\frac{\sum_{i=1}^{n}\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}}
\end{split}
\end{equation}
$$

Next, we find the loglikelihood because the loglikelihood has the same maximizor and it is easier to find the maximizor of the loglikelihood function.

$$
log(L(\mu)) = -\frac{n}{2}log\left(2 \pi \sigma^{2} \right) - \frac{\sum_{i=1}^{n}\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}
$$

To maximize the loglikelihood function, we take the first derivate and set it to be 0

$$
\frac{\partial log(L(\mu)) }{\mu} = \frac{2\sum_{i=1}^{n}\left(x_{i}-\mu\right)}{2 \sigma^{2}} = 0 
$$

Solving the equation, we find $\mu = \frac{1}{n}\sum_{i=1}^n x_i$. Thus, the maximum likelihood estimate of $\mu$ is the sample average, i.e., $\hat{\mu}_{MLE} = \frac{1}{n}\sum_{i=1}^n x_i$.

````

````\{prf:example\} 5.11
:nonumber:
:label: 5.11
:nonumber:
:label: chap5_11

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Poisson}(\lambda)$, find the maximum likelihood estimate of the parameter $\lambda$.

We first find the likelihood function which is just the joint density function of $X_{1}, \dots, X_{n}$.

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1},\dots, X_{n}=x_{n} \mid \lambda\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right) \\
&=\prod_{i=1}^{n} \lambda^{x_{i}} e^{-\lambda} \frac{1}{x_{i}!} \\
&=\lambda^{\sum_{i=1}^{n} x_{i}} e^{-\lambda n} \prod_{i=1}^{n}\frac{1}{x_{i}!} 
\end{split}
\end{equation}
$$

Next, we find the loglikelihood because the loglikelihood has the same maximizor and it is easier to find the maximizor of the loglikelihood function.

$$
log(L(\lambda)) = \sum_{i=1}^{n}x_{i}log(\lambda) - n\lambda - log\left(\prod_{i=1}^{n}\frac{1}{x_{i}!}  \right)
$$

To maximize the loglikelihood function, we take the first derivate and set it to be 0

$$
\frac{\partial log(L(\lambda)) }{\lambda} = \frac{1}{\lambda}\sum_{i=1}^{n}x_{i}-n = 0 
$$

Solving the equation, we find $\lambda = \frac{1}{n}\sum_{i=1}^n x_i$. Thus, the maximum likelihood estimate of $\lambda$ is the sample average, i.e., $\hat{\lambda}_{MLE} = \frac{1}{n}\sum_{i=1}^n x_i$.

````

````\{prf:example\} 5.12
:nonumber:
:label: 5.12
:nonumber:
:label: chap5_12

Given a random sample $X_{1}, \dots, X_{n} \sim$ Exponential $(\lambda)$, find the maximum likelihood estimate of the parameter $\lambda$.

We first find the likelihood function which is just the joint density function of $X_{1}, \dots, X_{n}$.

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1},\dots, X_{n}=x_{n} \mid \lambda\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right)\\
&=\prod_{i=1}^{n} \frac{1}{\lambda} e^{-\frac{x_{i}}{\lambda}} \\
& =\lambda^{-n} e^{-\frac{\sum_{i=1}^{n} x_{i}}{\lambda}}
\end{split}
\end{equation}
$$

Next, we find the loglikelihood because the loglikelihood has the same maximizor and it is easier to find the maximizor of the loglikelihood function.

$$
log(L(\lambda)) = -nlog(\lambda) - \frac{\sum_{i=1}^{n}x_{i}}{\lambda}
$$

To maximize the loglikelihood function, we take the first derivate and set it to be 0

$$
\frac{\partial log(L(\lambda)) }{\lambda} = -\frac{n}{\lambda}+\frac{\sum_{i=1}^{n}x_{i}}{\lambda^2} = 0 
$$

Solving the equation, we find $\lambda = \frac{1}{n}\sum_{i=1}^n x_i$. Thus, the maximum likelihood estimate of $\lambda$ is the sample average, i.e., $\hat{\lambda}_{MLE} = \frac{1}{n}\sum_{i=1}^n x_i$.
````


## Confidence intervals
````{prf:definition} confidence interval
:nonumber:
:label: confidence_interval
:nonumber:
An interval $[a,b]$ is said to be the $\alpha \%$ ($0\le \alpha \le 100$) confidence interval for the parameter $\theta$, if $P(a<\theta<b) = \alpha \%$.
````
We hope to find an interval with a high confidence level. The confidence level increases as the interval gets wider. However, the interval becomes useless if it is too wide, even thought the confidence level is very high. For example, $[-\infty,\infty]$ is a 100% confidence interval because we are 100% sure that the parameter value is between $-\infty$ and $\infty$, but this interval does not provide any useful information about the parameter.

```{important}
We would like to construct the 95% confidence interval.
``` 

````\{prf:example\} 5.13
:nonumber:
:label: 5.13
:nonumber:
:label: chap5_13

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the 95% confidence interval $[a, b]$ such that $P(a \leq \mu \leq b)=0.95$. 


The sample average $\bar{x}$ has the normal distribution with mean $\mu$ and variance $\sigma^{2} / n$. Thus, $\frac{\sqrt{n}(\bar{x}-\mu)}{\sigma}$ has a standard normal distribution. 

$$P\left(-2 \leq \frac{\sqrt{n}(\bar{x}-\mu)}{\sigma} \leq 2\right)=0.95$$

and 

$$
P\left(\bar{x}-\frac{2 \sigma}{\sqrt{n}} \leq \mu \leq \bar{x}+\frac{2 \sigma}{\sqrt{n}}\right)=0.95
$$

Thus, the 95% confidence interval for $\mu$ is $\left[\bar{x}-\frac{2 \sigma}{\sqrt{n}}, \bar{x}+\frac{2 \sigma}{\sqrt{n}}\right]$, in which the population standard deviation $\sigma$ can be replaced by its maximum likelihood estimate - the sample standard deviation $\hat{\sigma} = \sqrt{\frac{1}{n-1}\sum_{i=1}^n\left(x_i-\bar{x}\right)^2}$.
````

The above example can be generalized to the construction of 95% CI for any parameter using its maximum likelihood estimate, as demonstrated by the following theorem.

````{prf:theorem}
:nonumber:

If the sample size is large, the 95% CI for a parameter $\theta$ is

$$
\left[\hat{\theta}_{MLE}-2sd\left(\hat{\theta}_{MLE}\right), \hat{\theta}_{MLE}+2sd\left(\hat{\theta}_{MLE}\right)\right]
$$
````

Note that confidence intervals are random variables. Different samples generate different confidence intervals. Thus, the $95 \%$ confidence interval is interpreted as on average $95 \%$ of confidence intervals covers true $\mu$. It is not correct to say that the probability that $\mu$ is in the interval is $0.95$.

## Convergence Theorems

````{prf:definition} convergence almost surely
:label: 5.5
:nonumber:
To say that a sequence $\left\{X_{n}\right\}$ of random variables converges almost surely towards $X$ if 

$$P\left(\lim_{n \rightarrow \infty} X_{n}=X\right)=1$$
````

````{prf:definition} convergence in probability
:label: 5.6
:nonumber:
A sequence $\left\{X_{n}\right\}$ of random variables converges in probability towards the random variable $X$ if for all $\varepsilon>0$, 

$$\lim_{n \rightarrow \infty} P\left(\left|X_{n}-X\right| \leq \varepsilon\right)=1$$
````

````{prf:definition} convergence in distribution
:label: 5.7
:nonumber:
A sequence $\left\{X_{n}\right\}$ of random variables is said to converge in distribution to a random variable $X$ if 

$$\lim _{n \rightarrow \infty} F_{n}(x)=F(x)$$

where $F_{n}(x)$ is the probability distribution function of $X_{n}$.
````

Convergence a.s $\Rightarrow$ Convergence in probability $\Rightarrow$ convergence in distribution. But the reverse is not correct. 

````{prf:proposition} Markov inequality
If $X$ is a non-negative random variable and $a>0$, then $P(X \geq a) \leq \frac{E(X)}{a}$. 
````
````{prf:proposition} Chebyshev's inequality
$P(|X-u| \geq d) \leq \frac{\sigma^{2}}{d^2}$
````

These inequalities are satisfied for all probability distributions. When the underlying probability distribution is given, we can exactly calculate $P(|X-u| \geq d)$; then there is no need to find the upper limit given by the Chebyshev's inequality.

````{prf:theorem} The weak Law of large numbers
:nonumber:

The sample average converges in probability to the population mean as the sample size $n$ goes to infinity, regardless of the underlying probability distribution.


$$
\bar{X} \stackrel{\text { in prob }}{\longrightarrow} \mu \text { as } n \rightarrow \infty
$$
````

````{prf:theorem} Central Limit Theorem
:nonumber:

The sample average converges in distribution to a normal random variable $X$, regardless of the underlying probability distribution

$$
\bar{X} \stackrel{\text { in distribution }}{\longrightarrow} X \text { as } n \rightarrow \infty
$$
````

## Simulation

Simulation is a procedure of drawing samples from the population using computers. If the population (or the probability distribution) is given, generating random numbers from the given probability distribution is equivalent to repeating real experiments in the lab to collect multiple samples.

```{tip}
Due to the law of large numbers, simulation-based numerical approaches are able to approximate expectations and probabilities using sample averages or proportions.
```

Example: Suppose $X$ is a normal $\left(\mu=1, \sigma^{2}=1\right)$ random variable. To calculate $E(\log (X))$, we can simulate 1000 random numbers from normal $\left(\mu=1, \sigma^{2}=1\right)$ and use the sample average of $\left(\log \left(X_{1}\right), \ldots, \log \left(X_{1000}\right)\right)$ to approximate $E(\log (X))$.

