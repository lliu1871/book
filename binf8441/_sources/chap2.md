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

# Chapter 2: Discrete random variables

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Discrete probability distribution](https://www.cuemath.com/data/discrete-probability-distribution/)
```

## Random variables
````{prf:definition} random variable
:label: random_variable
A random variable $X: \Omega\rightarrow E$ is a measurable function from the set of possible outcomes $\Omega$ to some set $E$.
````

1. A random variable is a mapping from outcomes to real numbers

2. A random variable can take on different values, each with an associated probability.

The probability distribution of the random variable $x$ is a list of all possible values of $x$ and corresponding probabilities.

````{prf:example}
In an experiment of flipping a fair coin, there are two possible outcomes - head or tail. Define a random variable $X=0$ for head and $X=1$ for tail. Then, $P(X=0)=P(head)=0.5$ and $P(X=1)=P(tail)=0.5$. The probability distribution of $X$ is represented by the following table.

| $x$ | 0 | 1 |
| --- | --- | --- |
| $p$ | 0.5| 0.5|
|  |  |  |

````

## Discrete random variables
The possible values of a discrete random variable $X$ are countable (often integers). Each value of $X$ has a probability measure $0 \leq p \leq 1$, and the total probability must be 1 .

````{prf:definition} probability mass function
:label: mass_function
The probability mass function (PMF) of a discrete random variable $X$ is defined as $P(X=a)$.
````

````{prf:definition} cumulative distribution function
:label: cumulative
The cumulative distribution function (CDF) of a discrete random variable $X$ is defined as $P(X \leq a)$.
````

````{prf:example}
The probability mass function of a discrete random variable $X$ is given in the following table.

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

The cumulative probability function is given by

$$
F(a)=\left\{\begin{array}{c}
0 \quad \text { if } a<1 \\
0.2, \text { if } 1 \leq a<2 \\
0.8, \text { if } 2 \leq a<3 \\
1, \text { if } a \geq 3
\end{array}\right.
$$
````

## Expectations
````{prf:definition} expectation
:label: expectation
For a discrete random variable $X$, the expectation of a function $g(X)$ of $X$ is defined as 

$$E(g(X))=\sum_{x} g(x) P(x)$$
````

````{prf:example}
$E(\log (X))=\sum_{x} \log (x) P(x)=\log (1) * 0.2+\log (2) * 0.6+\log (3) * 0.2=0.6356$
````

````{prf:definition} mean
:label: mean
For a discrete random variable $X$, the mean of $X$ is defined as 

$$E(X)=\sum_{x} x P(x)$$
````

````{prf:example}
$E(X)=\sum_{x} x P(x)=1 * 0.2+2 * 0.6+3 * 0.2=2$
````

````{prf:definition} variance
:label: variance
For a discrete random variable $X$, the variance of $X$ is defined as 

$$\operatorname{var}(X)=\left.E\left\{(X-E(X))^{2}\right\}\right)=\sum_{x}(x-E(X))^{2} P(x)$$
````

````{prf:example}
$\operatorname{var}(x)=(1-2)^{2} * 0.2+(2-2)^{2} * 0.6+(3-2)^{2} * 0.2=0.4$
````

1. $E(a X+b)=a E(X)+b$

2. $\operatorname{var}(a X+b)=a^{2} E(X)$

3. $\operatorname{var}(X)=E\left(X^{2}\right)-(E(X))^{2}$

````{prf:definition} moment generating function
:label: moment_generating_function
Definition: For a discrete random variable $X$, the moment generating function of $X$ is defined as 

$$E\left(e^{t X}\right)=\sum_{x} e^{t x} P(x)$$
````

````{prf:example}
The moment generating function is $M(t) = E\left(e^{t X}\right)=0.2 e^{t}+0.6 e^{2 t}+0.2 e^{3 t}$
````

````{prf:theorem} $E(X) = \frac{\partial M(t)}{\partial t}|_{t=0}$
$$
\begin{equation}
\begin{split}
\frac{\partial M(t)}{\partial t} &= \frac{\partial \sum_{x} e^{t x} P(x)}{\partial t} \\
                                 &= \sum_{x} \frac{\partial  e^{t x} }{\partial t}P(x) \\
                                 &= \sum_{x} xe^{t x}P(x) 
\end{split}
\end{equation}
$$

When $t=0$, $\sum_{x} xe^{t x}P(x) = \sum_{x} xP(x) = E(X)$. Thus, $E(X) = \frac{\partial M(t)}{\partial t}|_{t=0}$.
````

The $r^{th}$ moment of a discrete probability distribution is defined as $E\left(X^{r}\right)=$ $\sum_{x} x^{r} P(x)$. Note that the first moment is $E(X)$.

````{prf:definition} probability generating function
:label: prob_gen_function
For a discrete random variable, the probability generating function is defined as 

$$E\left(t^{X}\right)=\sum_{x} t^{x} P(x)$$
````

## Discrete probability distributions
### Bernoulli random variable 
The random variable $X$ denotes the outcome of flipping a coin one time
- The probablity mass function is given by $P(X=x)=p^{x}(1-p)^{1-x}$, for $x=0,1$. 
- The expectation of $X$ is $E(X)=p$
- The variance is $\operatorname{var}(X)=p(1-p)$.

### Binomial random variable
The random variable $X$ denotes the number of heads when flipping a coin $n$ times.
- The probability mass function is $P(X=x)=\left(\begin{array}{l}
n \\x \end{array}\right) p^{x}(1-p)^{n-x}$ for $x=0,1, \ldots, n$.
- The expectation is $E(X)=np$ 
- The variance is $\operatorname{var}(X)=np(1-p)$.

### Geometric random variable
The random variable $X$ denotes the number of failures before observing the first success
- The probability mass function is $P(X=x)=p(1-p)^{x-1}$, for $x=1,2, \ldots$. 
- The expectation is $E(X)=\frac{1}{p}$
- The variance is $\operatorname{var}(X)=\frac{1-p}{p^{2}}$

### Negative binomial random variable
The random variable $X$ denotes the number of failures before observing the $r^{th}$ success. Let $p$ be the probability of a success and $r$ is the predefined number of successes. 
- The probability mass function is $P(X=x)=\left(\begin{array}{c}x+r-1 \\ x\end{array}\right)(1-p)^{x} p^{r}$, 
- $E(X)=\frac{p r}{1-p}$
- $\operatorname{var}(X)=\frac{pr}{(1-p)^{2}}$

### Discrete uniform random variable

- $P(X=x)=\frac{1}{n}$, for $x=a 1, a 2, \ldots$, an
- $E(X)=\sum a_{i} * \frac{1}{n}=\frac{1}{n} \sum a_{i}$ 
- $\operatorname{var}(x)=\sum\left(a_{i}-\bar{a}\right)^{2} * \frac{1}{n}$

### Poisson random variable
The random variable $X$ denotes the number of events during a fixed period of time.
- $P(X=x)=e^{-\lambda} \lambda^{x} / x !$, for $x=0,1, \ldots$
- $E(X)=\lambda$
- $\operatorname{var}(X)=\lambda$ 


## Transformation

````{prf:example}
The probability mass function of a discrete random variable $X$ is given in the following table.

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

What is the probability distribution of $X^{2}$ ?

|  $x$ | 1    | 4    | 9    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |
````

````{prf:example}
The probability mass function of a discrete random variable $X$ is given in the following table

|  $x$ | -1    | 0    | 1    |
| --- | --- | --- | --- |
| $p(x)$ | 0.4  | 0.2  | 0.4  |
|  |  |  |  |

What is the probability distribution of $X^{2}$ ?
|  $x$ | 0    | 1    |
| --- | --- | --- |
| $p(x)$ | 0.2  | 0.8  |
|  |  |  |
````
