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

````{prf:example} 
:label: exp5.1

The followings are statistics as they are some functions of data $X_1,\dots,X_n$
- sample average: $T=\frac{1}{n} \sum X_{i}$
- sample median: $T= median \left(X_{1}, \dots, X_{n}\right)$
- sample maximum: $T=\max \left(X_{1}, \dots, X_{n}\right)$
````

We employ statistics to estimate unknown parameters. A statistic $T$ is a sufficient statistic if the statistician who knows the value of $T$ can do just as good a job of estimating the unknown parameter $\theta$ as the statistician who knows the entire random sample. The formal definition of sufficient statistics is outlined as follows

````{prf:definition} sufficient statistics
:label: def5.1

A statistic $T$ is sufficient for parameter $\theta$ if the conditional distribution of a random sample $X_{1}, \dots, X_{n}$, given $\mathrm{T}$, does not depend on $\theta$, i.e.,

$$
f\left(X_{1}, \dots, X_{n} \mid T, \theta\right)=f\left(X_{1}, \dots, X_{n} \mid T\right)
$$
````

A "good" estimator, which will be formally defined later, should be a function of sufficient statistics. To identify sufficient statistics, we can utilize the factorization theorem.

````{prf:theorem} Factorization theorem
:label: thm5.1

If the probability density function of data $X$ is $f(X \mid \theta)$, then $\mathrm{T}$ is sufficient for $\theta$ if and only if nonnegative functions $g$ and $h$ can be found such that 

$$f(X \mid \theta)=h(x) g(T, \theta)$$

where $h$ is a function of $x$ and $g$ is a function of $T$ and $\theta$.
````

````{prf:example} 
:label: exp5.2

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Bernoulli}(p)$ , find the sufficient statistic for $p$. 

the probability density function of data $f(X|p)$ can be factorized as follows

$$
\begin{equation}
\begin{split}
f\left(X_{1},\dots, X_{n}|p\right) &=\prod p^{x_{i}}(1-p)^{1-x_{i}}\\
&=p^{\sum x_{i}}(1-p)^{n-\sum x_{i}}
\end{split}
\end{equation}
$$ 

Thus, $f(X|p)=h(x)g(T,p)$ where $h(x)\equiv 1$ and $g(T,p)=p^{\sum x_{i}}(1-p)^{n-\sum x_{i}}$. The factorization theorem indicates that $\sum x_{i}$ is the sufficient statistic for $p$.
````

````{prf:example}
:label: exp5.3

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the sufficient statistics for $\mu$ and $\sigma^2$.

The joint density function of $X_{1}, \dots, X_{n}$ is given by

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

Thus, $f(X|\mu,\sigma^2)=h(x)g(T,\mu,\sigma^2)$ where $h(x)\equiv 1$ and $g(T,\mu,\sigma^2)=\left(\frac{1}{\sqrt{2 \pi \sigma^{2}}}\right)^{n} e^{-\frac{\sum_{i=1}^{n} x_{i}^{2}-2 \mu \sum_{i=1}^{n} x_{i}+n \mu^{2}}{2 \sigma^{2}}}$. The factorization theorem indicates that the sufficient statistics for $\left(\mu, \sigma^{2}\right)$ are $\left(\sum_{i=1}^{n} x_{i}, \sum_{i=1}^{n} x_{i}^{2}\right)$.
````

````{prf:example}
:label: exp5.4

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

Thus, $f(X|\lambda)=h(x)g(T,\lambda)$ where $h(x)=\prod_{i=1}^{n} \frac{1}{x_{i}!}$ and $g(T,\lambda)=\lambda^{\sum_{i=1}^{n} x_{i}} e^{-\lambda n}$. The factorization theorem indicates that $\sum_{i=1}^{n} x_{i}$ is the sufficient statistic for $\lambda$.
````

````{prf:example} 
:label: exp5.5

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

Thus, $f(X|\lambda)=h(x)g(T,\lambda)$ where $h(x)\equiv 1$ and $g(T,\lambda)=(\lambda)^{n} e^{-\lambda \sum_{i=1}^{n} x_{i}}$. The factorization theorem indicates that the sufficient statistic for $\lambda$ is $\sum_{i=1}^{n} x_{i}$.
````

````{prf:example}
:label: exp5.6

Let $X_{(1)}, \dots, X_{(n)}$ be the order statistics of a random sample $X_{1}, \dots, X_{n} \sim f(x \mid \theta)$. Given the order statistics, the distribution of data $X_1, \dots, X_n$, i.e., 

$$f\left(X_{1}, \dots, X_{n} \mid X_{(1)}, \ldots, X_{(n)},\theta\right)$$

is a discrete uniform distribution, which does not depend on parameters $\theta$. Thus, the order statistics $X_{(1)}, \dots, X_{(n)}$ are sufficient statistics for parameters $\theta$.
````

````{prf:theorem}
:label: thm5.2
If $z$ is a one-to-one function and $T$ is a sufficient statistic for $\theta$, then $z(T)$ is a sufficient statistic for $z(\theta)$. 
````
````{prf:example}
:label: exp5.7

In {prf:ref}`exp5.5`, the sufficient statistic for $\lambda$ is $\sum_{i=1}^{n} x_{i}$. Suppose we want to find the sufficient statistic for $2\lambda$. Because $z(y)=2y$ is a one-to-one function, by {prf:ref}`thm5.2`, the sufficient statistic for $2\lambda$ is $2\sum_{i=1}^{n} x_{i}$. 
````

## Unbiased estimator
````{prf:definition} unbiased estimator
:label: def5.2

An estimator $\hat{\theta}$ of $\theta$ is unbiased if and only if $E(\hat{\theta})=\theta$.
````

````{prf:example}
:label: exp5.8

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

As an exercise, show that $\left(X_{1}+X_{2}\right) / 2$ is another unbiased estimator of $\mu$.

````{prf:example}
:label: exp5.9

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
:label: thm5.3

Given a random sample $X_{1}, \dots, X_{n}$ generated from a population with mean $\theta$, the sample average $\bar{X}$ is an unbiased estimator of the population mean $\theta$.
````

## Mean squared errors

We introduce the mean squared error (MSE) to evaluate the performance of an estimator $\hat{\theta}$ of $\theta$. A good estimator should have a small MSE.

$$MSE = E\left[(\hat{\theta}-\theta)^{2}\right]$$

````{prf:theorem}
:label: thm5.4

The MSE is the sum of the bias and variance. 

$$
E\left[(\hat{\theta}-\theta)^{2}\right]=(E(\hat{\theta})-\theta)^{2}+\operatorname{var}(\hat{\theta})
$$
````

````{prf:proof}
We show it by definition

$$
\begin{equation}
\begin{split}
E\left[(\hat{\theta}-\theta)^2\right] &= E\left[(\hat{\theta}-E(\hat{\theta})+E(\hat{\theta})-\theta)^{2}\right]\\
&=E\left[(\hat{\theta}-E(\hat{\theta}))^2\right] + E\left[(E(\hat{\theta})-\theta)^2\right] + 2E(\hat{\theta}-E(\hat{\theta}))(E(\hat{\theta})-\theta)\\
&=E\left[(\hat{\theta}-E(\hat{\theta}))^2\right] + (E(\hat{\theta})-\theta)^2 + 2(E(\hat{\theta})-E(\hat{\theta}))(E(\hat{\theta})-\theta)\\
&= var(\hat{\theta}) + (E(\hat{\theta})-\theta)^2
\end{split}
\end{equation}
$$
````

```{important}
If we only consider unbiased estimators, i.e., $(E(\hat{\theta})-\theta)^{2}=0$, then we choose the estimator with the minimum variance.
```

## Method of moments
According to the law of large numbers, the sample average serves as a reliable estimator for the population average. Hence, we can utilize $\frac{1}{n} \sum_{i=1}^{n} x_{i}$ to estimate $\hat{E(X)}$ (i.e., the first moment), and $\frac{1}{n} \sum_{i=1}^{n} x_{i}^{2}$ to estimate $\hat{E\left(X^{2}\right)}$ (i.e., the second moment), and $\frac{1}{n} \sum_{i=1}^{n} x_{i}{ }^{k}$ to estimate $\hat{E\left(X^{k}\right)}$ (i.e., the $k^{th}$ moment). This method of using sample averages to estimate moments is known as the **method of moments**.

````{prf:example} 
:label: exp5.10

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the moment estimators of the parameters $\mu$ and $\sigma^2$.

Because $E(X)=\mu$, the parameter $\mu$ is the population mean. Thus, the moment estimate of $\mu$ is the sample average 

$$\hat{\mu} = \frac{1}{n} \sum_{i=1}^{n} x_{i}$$ 

In addition, $\operatorname{var}(X)=E\left(X^{2}\right)-E(X)^{2}$. The moment estimate of the population mean $E(X)$ is the sample average $\bar{X}$. Similarly, the moment estimate of the population average $E\left(X^{2}\right)$ is the sample average of $x^2$, i.e., $\hat{E\left(X^{2}\right)} = \frac{1}{n}\sum_{i=1}^{n} x_{i}^{2}$. Thus, the moment estimate of the variance $\sigma^2$ is given by

$$
\hat{\sigma^2} = \frac{1}{n} \sum_{i=1}^{n} x_{i}^{2}-\bar{x}^{2}=\frac{1}{n} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}
$$
````


## Maximum likelihood estimator

Let $X_{1}, \dots, X_{n}$ be a random sample generated from a discrete probability distribution with the probability mass function $P(x \mid \theta)$, where $\theta$ is the unknown parameter.  

````{prf:definition} likelihood
:label: def5.3

The joint probability mass function 

$$P\left(X_{1}, \dots, X_{n} \mid \theta\right)=\prod_{i=1}^{n} P\left(X_{i} \mid \theta\right)$$ 

is also called the likelihood function. The likelihood function represents the probability (or likelihood) of the observed data $X_{1}, \dots, X_{n}$, given a certain value of $\theta$.
````

Suppose that $\theta$ can assume three values, namely, $1, 2, 3$. For each of these values, we can evaluate the probability of the observed data $X_{1}, \dots, X_{n}$, i.e., 

$$P\left(X_{1}, \dots, X_{n} \mid \theta=1\right)=0.3$$

$$P\left(X_{1}, \dots, X_{n} \mid \theta=2\right)=0.4$$

$$P\left(X_{1}, \dots, X_{n} \mid \theta=3\right)=0.1$$

With this information, how do we estimate the parameter $\theta$?

```{admonition} Intuition
We estimate $\theta$ by identifying the value that maximizes the likelihood of the observed data. This is referred to as the **maximum likelihood estimator** of $\theta$. Therefore, $\hat{\theta}=2$ because $\theta=2$ maximizes the probablity $P\left(X_{1}, \dots, X_{n} \mid \theta\right)$ of data.
```

In the case of continuous random variables, the likelihood function corresponds to the joint density function of the data. The maximum likelihood estimator is determined by the value of the parameter that maximizes this likelihood function.


````{prf:example}
:label: exp5.11

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the MLE of the population mean $\mu$, assuming the variance $\sigma^2$ is given. 

The first step is to determine the likelihood function, which is the joint density function of $X_{1}, \dots, X_{n}$.

$$
\begin{equation}
\begin{split}
L(\mu) = f\left(X_{1}=x_{1},\dots, X_{n}=x_{n} \mid \mu, \sigma^{2}\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \mu, \sigma^{2}\right) \\
&=\prod_{i=1}^{n} \frac{1}{\sqrt{2 \pi \sigma^{2}}} e^{-\frac{\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}} \\
&=\left(\frac{1}{\sqrt{2 \pi \sigma^{2}}}\right)^{n} e^{-\frac{\sum_{i=1}^{n}\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}}
\end{split}
\end{equation}
$$

Subsequently, we calculate the log-likelihood because it shares the same maximizer as the likelihood function and is generally more convenient for optimization.

$$
log(L(\mu)) = -\frac{n}{2}log\left(2 \pi \sigma^{2} \right) - \frac{\sum_{i=1}^{n}\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}
$$

To maximize the loglikelihood function, we take the first derivate and set it to be 0,

$$
\frac{\partial log(L(\mu)) }{\partial \mu} = \frac{2\sum_{i=1}^{n}\left(x_{i}-\mu\right)}{2 \sigma^{2}} = 0 
$$

Solving the equation, we find $\mu = \frac{1}{n}\sum_{i=1}^n x_i$. Thus, the maximum likelihood estimate (MLE) of $\mu$ is the sample average, i.e., $\hat{\mu}_{MLE} = \frac{1}{n}\sum_{i=1}^n x_i$.

````

````{prf:example}
:label: exp5.12

Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Poisson}(\lambda)$, find the maximum likelihood estimate of the parameter $\lambda$.

The first step is to determine the likelihood function, which is the joint density function of $X_{1}, \dots, X_{n}$.

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1},\dots, X_{n}=x_{n} \mid \lambda\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right) \\
&=\prod_{i=1}^{n} \lambda^{x_{i}} e^{-\lambda} \frac{1}{x_{i}!} \\
&=\lambda^{\sum_{i=1}^{n} x_{i}} e^{-\lambda n} \prod_{i=1}^{n}\frac{1}{x_{i}!} 
\end{split}
\end{equation}
$$

Next, we calculate the log-likelihood function,

$$
log(L(\lambda)) = \sum_{i=1}^{n}x_{i}log(\lambda) - n\lambda - log\left(\prod_{i=1}^{n}\frac{1}{x_{i}!}  \right)
$$

To maximize the loglikelihood function, we take the first derivate and set it to be 0,

$$
\frac{\partial log(L(\lambda)) }{\partial\lambda} = \frac{1}{\lambda}\sum_{i=1}^{n}x_{i}-n = 0 
$$

Solving the equation, we find $\lambda = \frac{1}{n}\sum_{i=1}^n x_i$. Thus, the maximum likelihood estimate of $\lambda$ is the sample average, i.e., $\hat{\lambda}_{MLE} = \frac{1}{n}\sum_{i=1}^n x_i$.

````

````{prf:example}
:label: exp5.13

Given a random sample $X_{1}, \dots, X_{n} \sim$ Exponential $(\lambda)$, find the maximum likelihood estimate of the parameter $\lambda$.

The first step is to find the likelihood function, which is the joint density function of $X_{1}, \dots, X_{n}$.

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1},\dots, X_{n}=x_{n} \mid \lambda\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right)\\
&=\prod_{i=1}^{n} \frac{1}{\lambda} e^{-\frac{x_{i}}{\lambda}} \\
& =\lambda^{-n} e^{-\frac{\sum_{i=1}^{n} x_{i}}{\lambda}}
\end{split}
\end{equation}
$$

Next, we find the loglikelihood function,

$$
log(L(\lambda)) = -nlog(\lambda) - \frac{\sum_{i=1}^{n}x_{i}}{\lambda}
$$

To maximize the loglikelihood function, we take the first derivate and set it to be 0

$$
\frac{\partial log(L(\lambda)) }{\partial\lambda} = -\frac{n}{\lambda}+\frac{\sum_{i=1}^{n}x_{i}}{\lambda^2} = 0 
$$

Solving the equation, we find $\lambda = \frac{1}{n}\sum_{i=1}^n x_i$. Thus, the maximum likelihood estimate of $\lambda$ is the sample average, i.e., $\hat{\lambda}_{MLE} = \frac{1}{n}\sum_{i=1}^n x_i$.
````


## Confidence intervals
````{prf:definition} confidence interval
:label: def5.4

An interval $[a,b]$ is said to be the $\alpha \%$ ($0\le \alpha \le 100$) confidence interval for the parameter $\theta$, if $P(a\le \theta\le b) = \alpha \%$.
````
We hope to find an interval with a high confidence level. The confidence level increases as the interval gets wider. However, the interval becomes useless if it is too wide, even thought the confidence level is very high. For example, $[-\infty,\infty]$ is a 100% confidence interval because we are 100% sure that the parameter value is between $-\infty$ and $\infty$, but this interval does not provide any useful information about the parameter.

```{important}
We would like to construct the 95% confidence interval.
``` 

````{prf:example} 
:label: exp5.14

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
:label: thm5.5

If the sample size is large, the 95% CI for a parameter $\theta$ is

$$
\left[\hat{\theta}_{MLE}-2sd\left(\hat{\theta}_{MLE}\right), \hat{\theta}_{MLE}+2sd\left(\hat{\theta}_{MLE}\right)\right]
$$
````

Note that confidence intervals are random variables. Different samples generate different confidence intervals. Thus, the $95 \%$ confidence interval is interpreted as on average $95 \%$ of confidence intervals covers true $\mu$. It is not correct to say that the probability that $\mu$ is in the interval is $0.95$.

## Convergence Theorems

````{prf:definition} convergence almost surely
:label: def5.5

To say that a sequence $\left\{X_{n}\right\}$ of random variables converges almost surely towards $X$ if 

$$P\left(\lim_{n \rightarrow \infty} X_{n}=X\right)=1$$
````

````{prf:definition} convergence in probability
:label: def5.6

A sequence $\left\{X_{n}\right\}$ of random variables converges in probability towards the random variable $X$ if for every $\varepsilon>0$, 

$$\lim_{n \rightarrow \infty} P\left(\left|X_{n}-X\right| \leq \varepsilon\right)=1$$
````

````{prf:definition} convergence in distribution
:label: def5.7

A sequence $\left\{X_{n}\right\}$ of random variables is said to converge in distribution to a random variable $X$ if 

$$\lim _{n \rightarrow \infty} F_{n}(x)=F(x)$$

where $F_{n}(x)$ is the probability distribution function of $X_{n}$.
````

Convergence a.s $\Rightarrow$ Convergence in probability $\Rightarrow$ convergence in distribution. But the reverse is not correct. 

````{prf:theorem} Markov inequality
:label: thm5.6
If $X$ is a non-negative random variable and $a>0$, then $P(X \geq a) \leq \frac{E(X)}{a}$. 
````
````{prf:proposition} Chebyshev's inequality
$P(|X-u| \geq d) \leq \frac{\sigma^{2}}{d^2}$
````

These inequalities are satisfied for all probability distributions. When the underlying probability distribution is given, we can exactly calculate $P(|X-u| \geq d)$; then there is no need to find the upper limit given by the Chebyshev's inequality.

````{prf:theorem} The weak Law of large numbers
:label: thm5.7

The sample average converges in probability to the population mean as the sample size $n$ goes to infinity, regardless of the underlying probability distribution.


$$
\bar{X} \stackrel{\text { in prob }}{\longrightarrow} \mu \text { as } n \rightarrow \infty
$$
````

````{prf:theorem} Central Limit Theorem
:label: thm5.8

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

