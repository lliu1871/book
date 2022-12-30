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

# Chapter 4: Multiple random variables

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Multivariate probability distributions](https://en.wikipedia.org/wiki/Multivariate_random_variable)
```
## Discrete cases
Considering two discrete random variables $X$ and $Y$ with a joint probability mass function (pmf) $P(X=x, Y=y)$ or simply $P(x,y)$.

````{prf:example}
:nonumber:
The joint pmf can be represented by a table. The following table indicates $P(X=1,Y=0)=0.1$, $P(X=1,Y=1)=0.3$, $P(X=2,Y=0)=0.2$, $P(X=2,Y=1)=0.4$. The total probability is $0.1+0.2+0.3+0.4=1$.

|     |X=1  |X=2 |
| --- | --- | --- |
| Y=0 |0.1  | 0.2  |
| Y=1 |0.3  | 0.4  |
| | | |
````

````{prf:definition} marginal pmf
:label: marginal
The marginal pmf of $X$ is

$$
P(X = x)=\sum_{y} P(X=x, Y=y)
$$
````

The marginal pmf of $Y$ is

$$
P(y)=\sum_{x} P(x, y)
$$


The conditional probability

$$
P(x \mid y)=\frac{P(x, y)}{P(y)}
$$

````{prf:definition}
:label: joint_expectation
The expectation of a function of $X$ and $Y$ is defined as

$$
E(g(x, y))=\sum_{x} \sum_{y} g(x, y) P(x, y)
$$
````

The conditional expectation of $X$ given $Y$ is

$$
E(X \mid Y=y)=\sum_{x} x P(x \mid y)
$$

````{prf:example}
:nonumber:
The joint pmf of two random variables $X$ and $Y$ is given in the following table

$$
\begin{array}{|l|l|l|l|l|}
\hline & Y=0 & Y=1 & Y=2 & Y=3 \\
\hline X=1 & 0.1 & 0.1 & 0.1 & 0.2 \\
\hline X=2 & 0.2 & 0.1 & 0.1 & 0.1 \\
\hline
\end{array}
$$

The marginal pmf of $X$ is $P(X=1)=0.5$ and $P(X=2)=0.5$.

$$
\begin{array}{|l|l|l|}
\hline x & 1 & 2 \\
\hline p & 0.5 & 0.5\\
\hline
\end{array}
$$

The marginal pmf of $Y$ is $P(Y=0)=0.3, P(Y=1)=0.2, P(Y=2)=0.2$, $P(Y=3)=0.3$.

$$
\begin{array}{|l|l|l|l|l|}
\hline y & 0 & 1 & 2 & 3 \\
\hline p & 0.3 & 0.2 & 0.2 & 0.3 \\
\hline
\end{array}
$$

The expectation of $X$ is $E(X)=1 * 0.5+2 * 0.5=1.5$

The expectation of $Y$ is $E(Y)=0 * 0.3+1 * 0.2+2 * 0.2+3 * 0.3=1.5$ 

The conditional distribution of $X$ given $Y=1$ is $P(X=1 \mid Y=1)=\frac{1}{3}$ and $P(X=2 \mid Y=1)=\frac{2}{3}$

The conditional expectation of $X$ given $Y=1$ is $E(X \mid Y=1)=1 * \frac{1}{3}+2 * \frac{2}{3}=\frac{5}{3}$.
````

## Continuous cases

### 1. Joint, marginal, conditional densities
Let $f(x, y)$ be the joint density function of two continuous random variables $X$ and $Y$. The marginal density of $X$ is given by

$$
f(X=x)=\int_{-\infty}^{\infty} f(x, y) d y
$$

The marginal density of $Y$ is given by

$$
f(Y=y)=\int_{-\infty}^{\infty} f(x, y) d x
$$

The condition density of $X$ given $Y=y$ is given by

$$
f(X=x \mid Y=y)=\frac{f(x, y)}{f(y)}
$$

### 2. Joint probabilities and expectations
We use the double integral to calculate the joint probability $P(x<a, y<b)$.

$$
P(x<a, y<b)=\int_{-\infty}^{a} \int_{-\infty}^{b} f(x, y) d x d y
$$

The expection of a function of random variables $X$ and $Y$

$$
E(g(x, y))=\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} g(x, y) f(x, y) d x d y
$$

The conditional expectation of $X$ given $Y=y$ is

$$
E(X \mid Y=y)=\int_{-\infty}^{\infty} x f(x \mid y) d x
$$

```{important}
Note that $E(X \mid Y)$ is a function of $Y$. Thus, $E(X \mid Y)$ is a random variable. But $E(X)$ is a constant. In addition,

$$
E(X)=E_{Y}(E(X \mid Y))
$$

and

$$
\operatorname{var}(X)=\operatorname{var}_{Y}(E(X \mid Y))+E_{Y}(\operatorname{var}(X \mid Y))
$$
```

### 3. Covariance and correlation
The covariance of $X_{1}$ and $X_{2}$ is defined as

$$
\operatorname{cov}(X 1, X 2)=E((X 1-u 1)(X 2-u 2))
$$

When $X_{1}=X_{2}$, the covariance of $X_{1}$ and $X_{2}$ is

$$
E\left(\left(X_{1}-u_{1}\right)\left(X_{1}-u_{1}\right)\right)=E\left[\left(X_{1}-u_{1}\right)^{2}\right]=\operatorname{var}\left(X_{1}\right)
$$

- variance is a special case of covariance
- Covariance could be any real number, but variance must be non-negative.

The correlation of $X_{1}$ and $X_{2}$ is given by

$$
\operatorname{corr}(X 1, X 2)=\frac{E((X 1-u 1)(X 2-u 2))}{\sqrt{\operatorname{var}(X 1)} \sqrt{\operatorname{var}(X 2)}}
$$

- Correlation is the standardized covariance
- $-1 \leq$ correlation $\leq 1$


## Independent random variables

If two random variables $X_{1}$ and $X_{2}$ are independent of each other, their joint density function is the product of two marginal densities $f(X_1)$ and $f(X_2)$,

$$
f\left(X_{1}, X_{2}\right)=f\left(X_{1}\right) f\left(X_{2}\right)
$$

The joint density of $n$ independent random variables $(X_1,\dots,X_n)$ is the product of $n$ marginal densities,

$$
f\left(X_{1},\dots, X_{n}\right)=\prod_{i=1}^nf\left(X_{i}\right)
$$

````{prf:example}
:nonumber:
$\left(X_{1}, X_{2}, \ldots, X_{n}\right) \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$. The joint density function of $X_{1}, X_{2}, \ldots, X_{n}$ is

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1}, X_{2}=x_{2}, \ldots, X_{n}=x_{n} \mid \mu, \sigma^{2}\right) &= \prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \mu, \sigma^{2}\right)\\
&= \prod_{i=1}^{n} \frac{1}{\sqrt{2 \pi \sigma^{2}}} e^{-\frac{\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}} \\
& =\left(\frac{1}{\sqrt{2 \pi \sigma^{2}}}\right)^{n} e^{-\frac{\sum_{i=1}^{n}\left(x_{i}-\mu\right)^{2}}{2 \sigma^{2}}}
\end{split}
\end{equation}
$$
````

```{important}
The joint density function of data $\left(X_1,\dots,X_n\right)$ is also called the **likelihood** function. The likelihood function measures the likelihood of the observed data $\left(X_1,\dots,X_n\right)$ given the parameters. When we estimate the parameter values from data, we choose the parameter values such that they can maximize the likelihood of the observed data; this is called "maximum likelihood estimate"
```

````{prf:example}
:nonumber:

$X_{1}, X_{2}, \ldots, X_{n} \sim \operatorname{Poisson}(\lambda)$. The joint density function is

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1}, X_{2}=x_{2}, \ldots, X_{n} = x_{n} \mid \lambda\right) &=\prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right)\\
 &=\prod_{i=1}^{n} \lambda^{x_{i}} e^{-\lambda} / x_{i} ! \\
& =\lambda^{\sum_{i=1}^{n} x_{i}} e^{-\lambda n} \prod \frac{1}{x_{i}!}
\end{split}
\end{equation}
$$
````

````{prf:example}
:nonumber:

$X_{1}, X_{2}, \ldots, X_{n} \sim \operatorname{Exponential}(\lambda)$. The joint density function is

$$
\begin{equation}
\begin{split}
f\left(X_{1}=x_{1}, X_{2}=x_{2}, \ldots, X_{n}=x_{n} \mid \lambda\right) &= \prod_{i=1}^{n} f\left(X_{i}=x_{i} \mid \lambda\right)\\
&=\prod_{i=1}^{n} \lambda e^{-\lambda x_{i}}\\
&=(\lambda)^{n} e^{-\lambda \sum_{i=1}^{n} x_{i}}
\end{split}
\end{equation}
$$
````

## The sum of independent random variables

The sum of independent random variables is an important statistic in statistical inference. To understand its statistical properties, it is of great interest to find its probability distribution. Here, we demonstrate an elegant way of deriving the probability distribution of the sum of independent random variables. 

### 1. Discrete cases
Recall that if a discrete random variable $X$ take values of nonnegative integers, the probability generating function (PGF) of $X$ is defined as

$$
G(t)=E\left(t^{X}\right)=\sum_{x=0}^{\infty} t^{x} p(x)
$$

```{tip}
We can find probabilities by differentiating PGF.

$$
\begin{array}{r}
G(t=0)=p(0) \\
G^{\prime}(t=0)=p(1) \\
G^{\prime \prime}(t=0)=p(2)
\end{array}
$$
```

We can show that

1. The probability generating function for the binomial distribution is $(1-p+pt)^{n}$
2. The probability generating function for the Poisson distribution is $e^{\lambda(t-1)}$

````{prf:theorem}
Let $X_{1}, X_{2}, \ldots, X_{n}$ be independent discrete random variables with the probability generating functions $G_{1}(t), \ldots, G_{n}(t)$. Then, the probability generating function of $S_{n}=\sum_{i=1}^{n} X_{i}$ is given by

$$
G_{s_{n}}(t)=\prod_{i=1}^{n} G_{i}(t)
$$
````

If $X_{1},\ldots, X_{n}$ are identically and independently distributed (iid) with the same probability distribution, then the PGF of their sum is given by

$$
G_{S_{n}}(t)=(G(t))^{n}
$$

````{prf:example}
:nonumber:
$X_{1}, X_{2}, \ldots, X_{n} \sim \operatorname{Poisson}(\lambda)$ and $G(t)=e^{\lambda(t-1)}$

$$
G_{s_{n}}(t)=(G(t))^{n}=e^{n \lambda(t-1)}
$$

Thus, $S_{n}$ is a Poisson random variable with mean $\lambda^{*}=n \lambda$.
````

````{prf:example}
:nonumber:
$X_{1}, X_{2}, \ldots, X_{n} \sim \operatorname{Bernoulli}(\lambda), G(t)=(1-p)+p t$

$$
G_{S_{n}}(t)=(G(t))^{n}=(1-p+p t)^{n}
$$

Thus, the sum $S_{n}$ follows a Binomial distribution with parameters $(n, p)$.
````

### 2. Continuous cases
The PGF cannot be applied to the continuous random variables, because the continuous random variables do not have point probabilities. Instead, we will use the moment generating function to derive the probability distribution of the sum.

Let $X_{1}, X_{2}, \ldots, X_{n}$ be independent random variables with moment generating functions $M_{1}(t), \ldots, M_{n}(t)$. Then, the moment generating function of $S_{n}=\sum_{i=1}^{n} X_{i}$ is given by

$$
M_{S_{n}}(t)=\prod_{i=1}^{n} M_{i}(t)
$$

In addition, if $X_{1}, X_{2}, \ldots, X_{n}$ have the same probability distribution, then the MGF of the sum is given by

$$
M_{S_{n}}(t)=(M(t))^{n}
$$

```{tip}
We can show that

1. The moment generating function for the normal distribution is $e^{u t+\sigma^{2} t^{2} / 2}$

2. The moment generating function for the exponential distribution is $(1-t / \lambda)^{-1}$

3. The moment generating function for the gamma distribution is $(1-t / \alpha)^{-\beta}$
```

````{prf:example} 1
:nonumber:
Given a random sample $X_{1}, \dots, X_{n} \sim \operatorname{Normal}\left(\mu, \sigma^{2}\right)$, find the probability distribution of the sum $S_{n}=\sum_{i=1}^{n} X_{i}$.

Since $X_i's$ have the same normal distribution with the MGF $M(t)=e^{u t+\sigma^{2} t^{2} / 2}$, the MGF of the sum $S_{n}$ is 

$$M_{S_{n}}(t)=(M(t))^{n}=\left(e^{u t+\sigma^{2} t^{2} / 2}\right)^{n}=\left(e^{nut+n\sigma^{2} t^{2} / 2}\right)$$ 

Thus, the sum $S_{n}$ follows the normal distribution with mean $n \mu$ and variance $n \sigma^{2}$
````

````{prf:example} 2
:nonumber:
Given a random sample $X_{1}, \dots, X_{n} \sim \exp (\lambda)$, find the probability distribution of the sum $S_{n}=\sum_{i=1}^{n} X_{i}$.

Since $X_i's$ have the same exponential distribution with the MGF $M(t)=(1-t / \lambda)^{-1}$, the MGF of the sum $S_{n}$ is 

$$M_{S_{n}}(t)=(M(t))^{n}=(1-t / \lambda)^{-n}$$

Thus, $S_{n}$ follows the Gamma distribution with $\alpha=\lambda$ and $\beta=n$.
````

Alternatively, we may find the CDF of the statistic.

````{prf:example} 3
:nonumber:
Find the distribution of $\max \left\{X_{1}, X_{2}, \ldots, X_{n}\right\}$

$P\left(X_{\max } \leq a\right)=P\left(X_{1} \leq a, X_{2} \leq a, \ldots, X_{n} \leq a\right)=\prod P\left(X_{i} \leq a\right)=(F(a))^{n}$. Thus, the probability density function is $f\left(X_{\max }=a\right)=n(F(a))^{n-1} f(a)$
````


## Mutivariate probability distributions

### 1. Multinomial distribution

The multinomial distribution is an extension of the binomial distribution. In the Binomial distribution, there are two possible outcomes. But the multinomial distribution is dealing with multiple $(>2)$ outcomes.

Suppose the proportions of $A, C, G, T$ in the genome are $p_{A}, p_{c}, p_{G}, p_{T}$. We select $n$ nucleotides at random from the genome. Let $X_{A}, X_{C}, X_{G}, X_{T}$ be the number of $A$, $C, G, T$, respectively. $X_{A}, X_{C}, X_{G}, X_{T}$ are random variables and the sum of $X_{A}, X_{C}, X_{G}$, $X_{T}$ is $n .\left\{X_{A}, X_{C}, X_{G}, X_{T}\right\}$ follow the multinomial distribution with joint probability mass function

$$
P\left(X_{A}=x_{A}, X_{C}=x_{C}, X_{G}=x_{G}, X_{T}=x_{T}\right)=\frac{n !}{x_{A} ! x_{C} ! x_{G} ! x_{T} !}\left(p_{A}\right)^{x_{A}}\left(p_{C}\right)^{x_{C}}\left(p_{G}\right)^{x_{G}}\left(p_{T}\right)^{x_{T}}
$$

where $x_{A}+x_{C}+x_{G}+x_{T}=n$ and $p_{A}+p_{C}+p_{G}+p_{T}=1$

It can be shown that the marginal distribution of $X_{A}$ is the $\operatorname{Binomial}\left(n, P_{A}\right)$. Thus, $E\left(X_{A}\right)=$ $nP_{A}$.

### 2. Multivariate normal distribution
The multivariate normal density function is given by

$$
f_{\mathbf{x}}\left(x_{1}, \ldots, x_{n}\right)=\frac{1}{\sqrt{(2 \pi)^{k}|\mathbf{\Sigma}|}} \exp \left(-\frac{1}{2}(\mathbf{x}-\boldsymbol{\mu})^{T} \boldsymbol{\Sigma}^{-1}(\mathbf{x}-\boldsymbol{\mu})\right)
$$

where $\Sigma$ is the covariance matrix and $\mu$ is the mean vector.

- The marginal distribution of $X_{i}$ is normal $\left(\mu_{i}, \sigma_{i}^{2}\right)$.
- The conditional distribution of $X_{i}$ given $X_{j}$ for $j \neq i$ is normal
- Any linear combination of $X_1,\dots, X_n$, i.e., $\sum_{i=1}^na_iX_i$ follows the normal distribution with mean $\sum_{i=1}^na_i\mu_i$ and variance $a^{t}\Sigma a$ where $a=(a_1,\dots,a_n)$ and $a^t$ is the transpose of the vector $a$.