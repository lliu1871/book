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

# Chapter 13: Markov Chains

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Markov chains](https://en.wikipedia.org/wiki/Markov_chain)
```

A stochastic process $\{X_{t},t \in T\}$ is a collection of random
variables, in which index $t$ is time. We refer to
$X_{t}$ as the state of the process at time $t$. The set $T$ is called the
index set of the process. When $T$ is a countable set (indexed by
integers), the process is said to be a discrete time process. If $T$ is an
interval of real line, the process is said to be a continuous time
process.

````{prf:example} 13.1
:nonumber:
:label: 13.1
:nonumber:
$X_{t}$ is the total number of customers who have entered a
supermarket by time $t$. This is a discrete state continuous time
stochastic process. $X_{t} = 0,1,\ldots,$ and $t \ge 0$.
````

````{prf:example} 13.2
:nonumber:
:label: 13.2
:nonumber:
$X_{t}$ is the number of individuals in a population in each
generation $t$, i.e., $X_{t} = 0,1,2,\ldots$, and $t = 0, 1, 2, \dots$ This
is a discrete state discrete time stochastic process
````

## Discrete time Markov chains
```{admonition} Markov property
Given the current state $X_{n}$, the future state
$X_{n + 1}$ does not depend on the past states
$(X_{n - 1},\ X_{n - 2},\ldots,X_{0})$, i.e.,
$P\left( X_{n + 1} \middle| X_{n},\ldots,X_{0} \right) = P(X_{n + 1}|X_{n})$.
```

````{prf:definition} Markov chain
:nonumber:
:label: Markov chain

A discrete time Markov chain $\{ X_{n},n = 0,1,2\ldots\}$ is a discrete
state discrete time stochastic process that satisfies Markov property.
````

Suppose that $\{X_{n}\}$ can take on non-negative integers, i.e., the
state space is $\{0, 1, 2, \dots\}$. If $X_{n} = i$, we say that the process
is in state $i$ at time $n$.

```{admonition} How do we define a DTMC?
For a discrete time MC $\{X_{n}\}$, the goal is to find the probability distribution $\pi_n$ of the random variable $X_n$ at time $n$. The DTMC is determined if we know where the chain begins and how the chain moves, i.e., if the initial state $\pi_0$ at time 0 is given and the transition probabilities $P(X_{n+1}|X_n)$ from time $n$ to time $n+1$ is given.

```

### One-step transition probability matrix

The one-step (from time $n$ to time $n+1$) transition probability from state
$i$ to state $j$ is defined as

$$P_{n,n + 1}(ij) = P(X_{n + 1} = j|X_{n} = i)$$

Note that

$$\sum_{j = 0}^{\infty}{P_{n,n + 1}(ij)} = 1$$

If the one-step transition probabilities are independent of time index
$n$, i.e.,

$$P\left( X_{1} \middle| X_{0} \right) = P\left( X_{2} \middle| X_{1} \right) = \ldots = P(X_{n}|X_{n - 1})$$

they are called time homogeneous transition probabilities and denoted by
$P_{ij}$. Note that

$$\sum_{j = 0}^{\infty}P_{ij} = 1$$

We use $P$ to denote the matrix of time homogeneous transition
probabilities $P_{ij}$, where $i, j = 0,1,\dots$. 

$$
P = \begin{pmatrix}
P_{00}\ P_{01}\ P_{02}\ldots \\
P_{10}\ P_{11}\ P_{12}\ldots \\
P_{20}\ P_{21}\ P_{22}\ldots \\
P_{i0}\ P_{i1}\ P_{i2}\ldots \\
\end{pmatrix}
$$

A discrete time Markov chain is determined if the initial state $X_0$ and
homogeneous transition probability matrix are given. The initial state
$X_0$ defines how the chain starts and the transition probability matrix
$P$ determines how the chain moves.

````{prf:example} 13.3
:nonumber:
:label: 13.3
:nonumber:

Suppose that a gene has two alleles $A$ and $a$. The alleles
$A$ and $a$ may mutate to another type in the next generation. The
chance that A mutates to a is α and the chance that a mutates to A is β.
The evolution of alleles $A$ and $a$ over generations is a Markov chain
with one-step transition probabilities

$$P\left( X_{n + 1} = a \middle| X_{n} = A \right) = \alpha$$

$$P\left( X_{n + 1} = A \middle| X_{n} = a \right) = \beta$$

The transition probabilities are independent of time $n$. Thus, they are
time homogeneous transition probabilities. The one-step transition
probability matrix is

$$P = \begin{matrix}
a \\
A \\
\end{matrix} \begin{pmatrix}
1 - \beta & \beta \\
\alpha & 1 - \alpha \\
\end{pmatrix}$$
````

````{prf:example} 13.4
:nonumber:
:label: 13.4
:nonumber:
We consider a population of $N$ individuals. Let $X_{n}$
denote the number of individuals with allele A in generation $n$.
Suppose $X_{0} = k, 0 \leq k \leq N$. Given $X_{i}$ (the number of A in
generation i), $X_{i + 1}\ $has the Binomial $(N, X_i/N)$.
The transition probabilities are independent of time n. Thus, they are
time homogeneous transition probabilities. The one-step transition
probability matrix is given by

$$
P = \begin{pmatrix}
1& 0 & 0 &\ldots  \\
B\left( 0,\frac{1}{N} \right)& B\left( 1,\frac{1}{N} \right)& B\left( 2,\frac{1}{N} \right) & \ldots \\
B\left( 0,\frac{2}{N} \right) & B\left( 1,\frac{2}{N} \right) & B\left( 3,\frac{2}{N} \right) & \ldots \\
0& 0 & \ldots & 1 \\
\end{pmatrix}
$$

where $B\left(i,\frac{j}{N}\right)$ is the probability $P(X = i)$ when $X$ has the
Binomial $(N, p = \frac{j}{N})$.
````


````{prf:example} 13.5
:nonumber:
:label: 13.5
:nonumber:
A gambling model. a gamble either wins \$1 with probability
$p$ or loses \$1 with probability 1-p. if the gambler quits playing either
when he goes broke or he attains a fortune of \$N, the one-step
transition probability $P_{i,i + 1} = p$ and $P_{i,i - 1} = 1 - p$, for
$i = 1,..,N$. In addition, $P_{00} = P_{NN} = 1$. The one-step
transition probability matrix is

$$
P = \begin{pmatrix}
1& 0& 0 & 0 & \dots & 0 \\
1 - p& 0& p& 0 & 0 & \dots \\
0& 1 - p& 0& p & 0 & \dots \\
0& 0& 1 - p& 0& p &\dots \\
0& 0& 0 & 0 & \dots & 1 \\
\end{pmatrix} 
$$
````

```{important}
States 0 and N are called **absorbing states**, because once the process gets into those states it will never get out.
```

````{prf:example} 13.6
:nonumber:
:label: 13.6
:nonumber:
In example 1, if the initial state $P(X_0) = (0.1, 0.9)$ and $\alpha = 0.1$ and
$\beta=0.2$, find $P(X_1)$


The one-step transition probability matrix is 

$$
P = \begin{pmatrix}
0.8\ \ \ 0.2 \\
0.1\ \ \ 0.9 \\
\end{pmatrix}
$$

Next, we find the probability $P(X_1)$

$$
\begin{equation}
\begin{split}
P\left( X_{1} = a \right) &= P\left( X_{1} = a|X_{0} = a \right)P\left( X_{0} = a \right) + P\left( X_{1} = a|X_{0} = A \right)P\left( X_{0} = A \right) \\
&= 0.1*0.8 + 0.9*0.1 = 0.17
\end{split}
\end{equation}
$$

$$
\begin{equation}
\begin{split}
P\left( X_{1} = A \right) &= P\left( X_{1} = A|X_{0} = a \right)P\left( X_{0} = a \right) + P\left( X_{1} = A|X_{0} = A \right)P\left( X_{0} = A \right) \\
&= 0.1*0.2 + 0.9*0.9 = 0.83
\end{split}
\end{equation}
$$
````

We have a matrix representation for the probability distribution of $X_{1}$,

$$P\left( X_{1} \right) = P\left( X_{0} \right)\cdot P$$

In general,

$$P\left( X_{n} \right) = P\left( X_{0} \right)\cdot P^{n}$$

```{code-cell}
p = matrix(c(0.8,0.1,0.2,0.9),2,2)
x_0 = c(0.1,0.9)

x_1 = x_0 %*% p
print(paste("the probability distribution of x_1 is", x_1))

library(expm)
x_10 = x_0 %*% (p %^% 10)
print(paste("the probability distribution of x_10 is",x_10))
```
### Limiting probability distribution
Another major goal of the Markov chain theory is to find the limiting
probabilities $\lim_{n \rightarrow \infty}{P(X_{n})}$, as time $n$ goes to
infinity.

````{prf:theorem}
If the Markov chain is ergodic (irreducible, aperiodic, and
positive recurrent), limiting probabilities $\pi$ exist and satisfy the
equations

$$
\begin{equation}
\begin{cases}
\pi = \pi P \\  
\sum_{i=1}^{n}\pi_{i} = 1
\end{cases}
\end{equation}
$$
````

```{code-cell}
library(expm)
print(paste("the probability for time = 10", round(x_0 %*% (p %^% 10),5)))
print(paste("the probability for time = 20", round(x_0 %*% (p %^% 20),5)))
print(paste("the probability for time = 30", round(x_0 %*% (p %^% 30),5)))
print(paste("the probability for time = 40", round(x_0 %*% (p %^% 40),5)))
print(paste("the probability for time = 50", round(x_0 %*% (p %^% 50),5)))
print(paste("the probability for time = 60", round(x_0 %*% (p %^% 60),5)))
```

Note that once the chain reaches the limiting probability distribution, it will stay in
the limiting probability distribution. Thus, the limiting probability distribution is also
called the stationary distribution.

```{code-cell}
x_lim = x_0 %*% (p %^% 60)
print(paste("the limit probability is",round(x_lim,5)))
print(paste("the probability after one more move is", round(x_lim %*% p,5)))
```

For irreducible finite state discrete time Markov chain, the ergodic
conditions are always satisfied. Thus, we can find the limiting
probabilities by solving the equations

$$
\begin{equation}
\begin{cases}
\pi = \pi P \\  
\sum_{i=1}^{n}\pi_{i} = 1
\end{cases}
\end{equation}
$$


````{prf:example} 13.7
:nonumber:
:label: 13.7
:nonumber:

Consider a Markov chain of two alleles (a, A) with the one-step
transition probability $P=\begin{pmatrix}
0.2 & 0.8 \\
0.1 & 0.9 \\
\end{pmatrix}$  What are the limiting probabilities of a and A?

From the theorem, we know that the limiting probabilities, $\pi_{a}$ and
$\pi_{A}$, must satisfy the following equations,

$$\pi_{a} = {0.2\pi}_{a} + 0.1\pi_{A}$$

$$\pi_{A} = {0.8\pi}_{a} + 0.9\pi_{A}$$

$$\pi_{a} + \pi_{A} = 1$$

Thus, $\pi_{a} = \frac{1}{9}$ and $\pi_{A} = \frac{8}{9}$. In addition,
if the Markov chain starts with the limiting probabilities, i.e.,
$P( X_{0}) = \left(\frac{1}{9},\frac{8}{9}\right)$, then
$P( X_{n}) = \left(\frac{1}{9},\frac{8}{9}\right)$ for all $n$.
````

```{code-cell}
x = matrix(c(0.2,0.1,0.8,0.9),2,2)
eigen(t(x))
print(paste("the limiting probability is", eigen(t(x))$vectors[,1]/sum(eigen(t(x))$vectors[,1])))
```

## Continuous time Markov chains


````{prf:definition} continuous time Markov chain
:nonumber:
:label: CTMC

A continuous time Markov chain $\{ X_{t}\}$ is a discrete
state continuous time stochastic process that satisfies Markov property.
````

```{admonition} Markov property for continuous times
For all $s,t \geq 0$, and nonnegative integers $i, j$,

$$P\left( X_{t + s} = j \middle| X_{s} = i,\ X_{u},\ 0 \leq u \leq s \right) = P(X_{t + s} = j|X_{s} = i)$$
```

Suppose $\{ X_{t},t \geq 0\}$ is a continuous time stochastic process
taking on values in the set of nonnegative integers {0, 1, 2, ...}.

In addition, if $P\left( X_{t + s} = j \middle| X_{s} = i \right)$ is
independent of $s$, the continuous time Markov chain is said to have
stationary or homogeneous transition probabilities, denoted by $P_{ij}(t)$,
the probability of transition from state $i$ to state j in time t.

### Finite state space 

Suppose there are $n$ states. The transition probabilities $P_{ij}(t)$ can be represented by a $n\times n$ matrix
$P(t)$. Given the transition probability matrix $P(t)$, the probability distribution $\pi_t$ of
$X_{t}$ is equal to the initial probability $\pi_0$ at time 0 multiplied by the transition probability matrix $P(t)$,

$$
\pi_t = \pi_0P(t)
$$ 

The transition probability matrix $P(t)$ can be derived from the
transition rate matrix $Q$. The transition rate matrix $Q$ is
equivalent to the one-step transition probability matrix in the discrete
time Markov chain. In other words, the continuous time Markov chain is
determined by the initial state $\pi_0$ and the transition rate
matrix $Q$.

From Kolmogorov backward equations, the transition probability matrix
$P(t)$ satisfies the differential equation

$$\frac{\partial P(t)}{\partial t} = QP(t)$$

The solution to this differential equation is

$$P(t) = e^{Qt}$$

````{prf:theorem}
:nonumber:
The limiting probabilities
$\pi_\infty=\lim_{t \rightarrow \infty}{P\left( X_{t} = j \middle| X_{0} = i \right)}$,
if exist, are independent of the initial state $X_{0}$, and must satisfy the equation 

$$\pi_\infty Q = 0$$
````

From the theorem, the limiting probabilities $\pi_\infty$, if exist, can be
found by solving the equations 

$$
\begin{equation} 
\begin{cases}
\pi_\infty Q = 0 \\ 
\sum_{j}^{}\pi_{j} = 1
\end{cases}
\end{equation}
$$
