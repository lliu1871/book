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
:nonumber:
:label: random_variable

A random variable $X: \Omega\rightarrow E$ is a measurable function from a set $\Omega$ of outcomes to some set $E$ of numbers.
````

1. A random variable is a mapping from outcomes to numbers

2. A random variable can take on different values, each with a probability.

The probability distribution of a random variable $X$ is a list of all possible values of $X$ and corresponding probabilities.

````{prf:example} 2.1
:nonumber:
:label: 2.1

In an experiment of flipping a fair coin, there are two possible outcomes - head or tail. Define a random variable $X=0$ for head and $X=1$ for tail. Then, $P(X=0)=P(head)=0.5$ and $P(X=1)=P(tail)=0.5$. The probability distribution of $X$ is represented by the following table.

| $x$ | 0 | 1 |
| --- | --- | --- |
| $p$ | 0.5| 0.5|
|  |  |  |

````

## Discrete random variables
The possible values of a discrete random variable $X$ are countable (often integers). Each value of $X$ has a probability measure $0 \leq p \leq 1$, and the total probability must be 1 .

````{prf:definition} probability mass function
:nonumber:
:label: mass_function


The probability mass function (PMF) of a discrete random variable $X$ is defined as $P(X=a)$.
````

````{prf:definition} cumulative distribution function
:nonumber:
:label: cumulative


The cumulative distribution function (CDF) of a discrete random variable $X$ is defined as $P(X \leq a)$.
````

````{prf:example} 2.2
:nonumber:
:label: 2.2


The probability mass function of a discrete random variable $X$ is given in the following table.

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

The cumulative probability function is given by

$$
F(a)=\begin{equation}
\begin{cases}
0 & \text { if } a<1 \\
0.2 & \text { if } 1 \leq a<2 \\
0.8 & \text { if } 2 \leq a<3 \\
1 & \text { if } a \geq 3
\end{cases}
\end{equation}
$$
````

```{code-cell}
par(mfrow=c(2,1))
barplot(c("1"=0.2,"2"=0.6,"3"=0.2),col="brown",main="probability mass function")
plot(ecdf(c(rep(1,2),rep(2,6),rep(3,2))),col="brown",main="cumulative distribution function")
```

## Expectations
````{prf:definition} expectation
:nonumber:
:label: expectation

For a discrete random variable $X$, the expectation of a function $g(X)$ of $X$ is defined as 

$$E(g(X))=\sum_{x} g(x) P(x)$$
````

````{prf:example} 2.3
:nonumber:
:label: 2.3

The probability mass function of a discrete random variable $X$ is given in the following table.

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

$E(\log (X))=\sum_{x} \log (x) P(x)=\log (1) * 0.2+\log (2) * 0.6+\log (3) * 0.2=0.6356$
````

```{code-cell}
x = 1:3
p = c(0.2,0.6,0.2)
result=sum(log(x)*p)
print(paste("the expectation is",result))
```

````{prf:definition} mean
:nonumber:
:label: mean

For a discrete random variable $X$, the mean of $X$ is defined as 

$$E(X)=\sum_{x} x P(x)$$
````

````{prf:example} 2.4
:nonumber:
:label: 2.4

The probability mass function of a discrete random variable $X$ is given in the following table.

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

$E(X)=\sum_{x} x P(x)=1 * 0.2+2 * 0.6+3 * 0.2=2$
````

```{code-cell}
x = 1:3
p = c(0.2,0.6,0.2)
result = sum(x*p)
print(paste("the mean is",result))
```
The mean $E(X)$ of a random variable $X$ represents the **center** of the population. The variance of the random variable $X$ is defined as the average squared distance between each point and the center of the population. The variance represents the **spread** of the population.

````{prf:definition} variance
:nonumber:
:label: variance

For a discrete random variable $X$, the variance of $X$ is defined as 

$$\operatorname{var}(X)=\left.E\left\{(X-E(X))^{2}\right\}\right)=\sum_{x}(x-E(X))^{2} P(x)$$
````
- $sd(X) = \sqrt{var(X)}$

````{prf:example} 2.5
:nonumber:
:label: 2.5

The probability mass function of a discrete random variable $X$ is given in the following table.

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

$\operatorname{var}(X)=(1-2)^{2} * 0.2+(2-2)^{2} * 0.6+(3-2)^{2} * 0.2=0.4$
````
```{code-cell}
x = 1:3
p = c(0.2,0.6,0.2)
average = sum(x*p)
variance = sum((x-average)^2*p)
print(paste("variance is",variance))
```

````{prf:theorem}
:nonumber:
1. $E(a X+b)=a E(X)+b$
2. $\operatorname{var}(a X+b)=a^{2} var(X)$
3. $\operatorname{var}(X)=E\left(X^{2}\right)-(E(X))^{2}$

Proof:

$$
\begin{equation}
\begin{split}
E(aX+b) &= \sum_x(ax+b)P(x) \\
&= \sum_xaxP(x)+\sum_xbP(x) \\
&= a\sum_xxP(x)+b\sum_xP(x) \\
&= aE(X)+b
\end{split}
\end{equation}
$$

$$
\begin{equation}
\begin{split}
var(aX+b) &= E[(ax+b-(aE(x)+b))^2]\\
& = E[a^2(x-E(x))^2]\\
& = a^2E[(x-E(x))^2]\\
& = a^2var(X)
\end{split}
\end{equation}
$$

$$
\begin{equation}
\begin{split}
var(X) &= E[(x-E(x))^2] \\
&= E(x^2-2xE(x)+(E(x))^2)\\
&=E(x^2)-2E(x)E(x)+(E(x))^2\\
&=E\left(X^{2}\right)-(E(X))^{2}
\end{split}
\end{equation}
$$

````

````{prf:example} 2.6
:nonumber:
:label: 2.6

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

Let $Y = 3X+6$. Find $E(Y)$, $var(Y)$, and $E(Y^2)$

We know that $E(X) = 2$ and $var(X) = 0.4$. Thus, 

$$E(Y)=E(3X+6)=3E(X)+6 = 12$$
and 

$$var(Y)=var(3X+6)=9var(X) = 3.6$$

and 

$$E(Y^2)=var(Y)+\left(E(X)\right)^2=3.6+144=147.6$$
````

````{prf:definition} moment generating function
:nonumber:
:label: moment_generating_function


Definition: For a discrete random variable $X$, the moment generating function of $X$ is defined as 

$$E\left(e^{t X}\right)=\sum_{x} e^{t x} P(x)$$
````

````{prf:example} 2.7
:nonumber:
:label: 2.7

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

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

The $r^{th}$ moment of a discrete probability distribution is defined as $E\left(X^{r}\right)=\sum_{x} x^{r} P(x)$. Note that the first moment is $E(X)$. It can be shown that $E(X^r)=\frac{\partial^r M(t)}{\partial t^r}|_{t=0}$


````{prf:example} 2.8
:nonumber:
:label: 2.8

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

$$
\begin{equation}
\begin{split}
E(X) &= \frac{\partial M(t)}{\partial t}|_{t=0}\\
& = (0.2 e^{t}+0.6 e^{2 t}+0.2 e^{3 t})'|_{t=0} \\
& = (0.2 e^{t}+0.6*2e^{2 t}+0.2*3e^{3 t})|_{t=0} \\
& = 0.2+1.2+0.6 = 2 
\end{split}
\end{equation}
$$

````

````{prf:definition} probability generating function
:nonumber:
:label: prob_gen_function


For a discrete random variable, the probability generating function is defined as 

$$E\left(t^{X}\right)=\sum_{x} t^{x} P(x)$$
````

````{prf:example} 2.9
:nonumber:
:label: 2.9

|  $x$ | 1    | 2    | 3    |
| --- | --- | --- | --- |
| $p(x)$ | 0.2  | 0.6  | 0.2  |
|  |  |  |  |

The probability generating function is $E\left(t^{X}\right)=0.2t+0.6t^2+0.2t^3$
````

## Discrete probability distributions
### Bernoulli random variable 
The random variable $X$ denotes a random event with only two possible outcomes. For example, flipping a coin one time, we may have a head or a tail. The outcome of an exam could be a success or a failure. 
- The probablity mass function is given by $P(X=x)=p^{x}(1-p)^{1-x}$, for $x=0,1$. 
- The expectation of $X$ is $E(X)=p$
- The variance is $\operatorname{var}(X)=p(1-p)$

```{code-cell}
par(mfrow=c(2,1))
barplot(c("0"=0.5,"1"=0.5),col="brown",main="Bernoulli probability mass function")
plot(ecdf(c(0,1)),col="brown",main="Bernoulli cumulative distribution function")
```

````{prf:example} 2.10
:nonumber:
:label: 2.01

The proportions of A, C, G, T in a genome are 25%, 25%, 25%, 25%, respectively. We randomly select two nucleotides. Let $X$ be the count of A. Find the probability distribution of $X$.

Let $X_1$ denote the outcome of the first selection and $X_2$ be the outcome of the second selection. Both $X_1$ and $X_2$ are Bernoulli random variables with $p=0.25$. Let "A=1" and "not A = 0". Then, $X = X_1 + X_2$.

To find the probability distribution of $X$, we first figure out the possible values that $X$ may take and then find the corresponding probabilities. It is trivial that $X = 0, 1, 2$. Next, we find the corresponding probabilies,

$P(X=0) = P(X_1=0 \text{ and } X_2=0) = P(X_1=0)P(X_2=0) = 0.75^2=0.5625$

$$
\begin{equation}
\begin{split}
P(X=1) &= P(X_1=0\text{ and } X_2=1) + P(X_1=1\text{ and } X_2=0) \\
& = P(X_1=0)P(X_2=1) + P(X_1=1)P(X_2=0) \\
& = 0.25*0.75+0.75*0.25=0.375
\end{split}
\end{equation}
$$

$P(X=2) = P(X_1=1\text{ and } X_2=1) = 0.25^2=0.0625$

Thus, the probability distribution of $X$ is given in the table

|  $x$ | 0    | 1    | 2    |
| --- | --- | --- | --- |
| $p(x)$ | 0.5625  | 0.375  | 0.0625  |
|  |  |  |  |

````

### Binomial random variable
The Binomial random variable $X$ denotes the number of successes in $n$ trials where each trial may have two possible outcomes - success or failure. For example, the number of heads when flipping a coin $n$ times.
- The probability mass function is $P(X=x)=\left(\begin{array}{l}
n \\x \end{array}\right) p^{x}(1-p)^{n-x}$ for $x=0,1, \ldots, n$.
- The expectation is $E(X)=np$ 
- The variance is $\operatorname{var}(X)=np(1-p)$.

```{code-cell}
par(mfrow=c(2,1))
p = dbinom(0:5,5,0.5)
names(p) = 0:5
barplot(p,col="brown",main="Binomial probability mass function")
plot(ecdf(sample(0:5,size=10000,replace=TRUE, prob=p)),col="brown",main="Binomial cumulative distribution function")
```

````{prf:example} 2.11
:nonumber:
:label: 2.11

The length of a genome is 1 million base pairs with 26% A, 24% C, 25% G, and 25% T. What is the probability that there is a segment in the genome that exactly matches the short read of 5 nucleotides ACCTT? What is the expected number of such segments in the genome?

The probability is $P(ACCTT)=P(A)P(C)P(C)P(T)P(T)=0.26*0.24*0.24*0.25*0.25=0.000936$. Thus, the expected number of ACCTT is $10^6*0.000936=936$.
````
### Geometric random variable
The random variable $X$ denotes the number of failures before observing the first success
- The probability mass function is $P(X=x)=p(1-p)^{x}$, for $x=0,1,2, \ldots$. 
- The expectation is $E(X)=\frac{1-p}{p}$
- The variance is $\operatorname{var}(X)=\frac{1-p}{p^{2}}$


```{code-cell}
par(mfrow=c(2,1))
p = dgeom(0:10,0.2)
names(p) = 0:10
barplot(p,col="brown",main="Geometric probability mass function")
plot(ecdf(sample(0:10,size=10000,replace=TRUE, prob=p)),col="brown",main="Geometric cumulative distribution function")
```
````{prf:example} 2.12
:nonumber:
:label: 2.12

The length of a genome is 1 million base pairs with 26% A, 24% C, 25% G, and 25% T. We are scanning nucleotides from the left end to the right end of the genome. Let $X$ be the number of nucleotides until observing the first $A$. What is the probability $P(X=2)$? Find $E(X)$.

$X$ is a geometric random variable with the PMF $p(1-p)^{x}$ where $p=0.26$. Thus, $P(X=2)=0.26*(1-0.26)^2=0.142376$. The expectation $E(X) = \frac{1-p}{p}=\frac{1-0.26}{0.26} = 2.846154$
````
### Negative binomial random variable
The random variable $X$ denotes the number of failures before observing the $r^{th}$ success. Let $p$ be the probability of a success and $r$ is the predefined number of successes. 
- The probability mass function is $P(X=x)=\left(\begin{array}{c}x+r-1 \\ x\end{array}\right)p^{r}(1-p)^{x}$, 
- $E(X)=\frac{r(1-p)}{p}$
- $\operatorname{var}(X)=\frac{r(1-p)}{p^{2}}$

```{code-cell}
par(mfrow=c(2,1))
p = dnbinom(0:25,5,0.5)
names(p) = 0:25
barplot(p,col="brown",main="Negative binomial probability mass function")
plot(ecdf(sample(0:25,size=10000,replace=TRUE, prob=p)),col="brown",main="Negative binomial cumulative distribution function")
```

````{prf:example} 2.13
:nonumber:
:label: 2.13

Suppose $X$ is a negative bionomial random variable with $p=0.4$ and $r=2$. Find $E(X^2)$

We first find $E(X) = \frac{r(1-p)}{p} = \frac{2*0.6}{0.4}=3$ and $var(x)=\frac{r(1-p)}{p^2}=\frac{2*0.6}{0.4^2}=7.5$. Thus, $E(X^2) = var(X) + (E(X))^2 = 7.5+3^2=16.5$.

````

### Discrete uniform random variable

- $P(X=x)=\frac{1}{n}$, for $x=a 1, a 2, \ldots$, an
- $E(X)=\sum a_{i} * \frac{1}{n}=\frac{1}{n} \sum a_{i}$ 
- $\operatorname{var}(X)=\sum\left(a_{i}-\bar{a}\right)^{2} * \frac{1}{n}$

```{code-cell}
par(mfrow=c(2,1))
p = rep(1/4,4)
names(p) = 1:4
barplot(p,col="brown",main="Discrete uniform probability mass function")
plot(ecdf(1:4),col="brown",main="Discrete uniform cumulative distribution function")
```

### Poisson random variable
The random variable $X$ denotes the number of random events during a fixed period of time.
- $P(X=x)=e^{-\lambda} \lambda^{x} / x !$, for $x=0,1, \ldots$
- $E(X)=\lambda$
- $\operatorname{var}(X)=\lambda$ 

```{code-cell}
par(mfrow=c(2,1))
p = dpois(0:10, 0.5)
names(p) = 0:10
barplot(p,col="brown",main="Poisson probability mass function")
plot(ecdf(sample(0:10,size=10000,replace=TRUE, prob=p)),col="brown",main="Poisson cumulative distribution function")
```

````{prf:example} 2.14
:nonumber:
:label: 2.14

The length of a genome is 1 million base pairs with 26% A, 24% C, 25% G, and 25% T. Let $X$ be the number of segments in the genome that exactly matches the short read of 5 nucleotides ACCTT. Find the probability distribution of $X$.

We have found the probability of a segment ACCTT, $P(ACCTT)=0.000936$, and $E(X) = 10^6*0.000936 = 936$. Here, $X$ is the number of random events (the segment ACCTT) in a genome. Thus, $X$ is a Poisson random variable with $\lambda = E(X) = 936$.

````

## Transformation

````{prf:example} 2.15
:nonumber:
:label: 2.15

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

````{prf:example} 2.16
:nonumber:
:label: 2.16


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
