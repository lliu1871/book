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

# Chapter 1: Discrete time Markov chains

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
```
A discrete time Markov chain $\{X_t; t=0, 1, \dots\}$ is completed determined by the one-step transition probability matrix $P$ and the probability distribution $\pi_0$ of $X_0$ at time $0$.


## Transition probability matrix
````{prf:theorem}
Let $P_{ij}^n$ be the transition probability that the process transits from state $i$ to state $j$ at the nth transition. We have

$$P_{ij}^n = \sum_{k=0}^\infty P_{ik}^rP_{kj}^{n-r}$$
````

## Irreducible
````{prf:definition}
A Markov chain is irreducible if for any two states $i$ and $j$ there exists an integer $n>0$ such that $P_{ij}^n > 0$. Otherwise, the state $i$ is transient.
````

## Periodic

## Recurrent
````{prf:definition}
Let $f_{ii}^n$ be the first return probability. A state $i$ is recurrent if $\sum_{n=1}^\infty f_{ii}^n=1$
````

```{admonition} Binomial formula
The product of two polynomial functions $K_a(x)=\sum_{i=0}^\infty a_ix^i$ and $K_b(x)=\sum_{i=0}^\infty b_ix^i$ is given by

$$K_a(x)K_b(x) = \sum_{i=0}^\infty c_ix^i$$

where $c_i = \sum_{i=0}^n a_ib_{n-i}$.
```

Let $F_{ij}(s) = \sum_{n=0}^\infty f_{ij}^ns^n$ and $P_{ij}(s) = \sum_{n=0}^\infty P_{ij}^ns^n$ for $|s|<1$, where $f_{ij}^0 = 0$ and $P_{ij}^0=1$. We know that $P_{ij}^n = \sum_{k=0}^n f_{ij}^kP_{jj}^{n-k}$. Thus,

$$F_{ii}(s)P_{ii}(s) = P_{ii}(s)-1$$

and

$$F_{ij}(s)P_{ij}(s) = P_{ij}(s)$$

````{prf:theorem}
A state $i$ is recurrent if and only if $\sum_{n=1}^\infty P_{ii}^n = \infty$
````

- If two states $i$ and $j$ commute, i.e., $i\leftrightarrow j$, and $i$ is recurrent, then $j$ is recurrent
- Let $Y_n = I_{X_n=i}$. The expected number of returns to the state $i$ is $E(\sum_{n=1}^\infty Y_n) = \sum_{n=1}^\infty E(Y_n) = \sum_{n=1}^\infty P_{ii}^n$

````{prf:theorem}
Let $Q_{ii}$ be the probability of returning infinitely often to state $i$. Then the state $i$ is recurrent or transient according to $Q_{ii} = 1$ or 0, respectively.  
````

## Limiting probabilities
Consider a recurrent aperiodic irreducible Markov chain. The expected time of the first return to the state $i$, or the mean recurrent time, is $m_i = \sum_{n=1}^\infty nf_{ii}^n$. Then we have

$$\lim_{n\rightarrow \infty} P_{ji}^n = \lim_{n\rightarrow \infty} P_{ji}^n = \frac{1}{m_i}$$


````{prf:definition}
If the limiting probabilities $\pi_\infty>0$ for all states in the recurrent class, it is called positive recurrent or **strongly ergodic**. If $\pi_\infty = 0$ for all states in the recurrent class, it is called null recurrent or **weakly ergodic**.
````

````{prf:theorem} Ergodic theorem
In a positive recurrent aperiodic class, the limiting probabilities $\pi_\infty$ satisfy the following equations

$$
\begin{equation}
\begin{cases}
\pi_\infty = \pi_\infty P\\
\sum\pi_\infty = 1
\end{cases}
\end{equation}
$$

````

## Absorbing probabilities
Let $T$ be the set of all transient states. We first calculate the probablity $x_i^n$ that starting from a transient state $i\in T$, the process stays in the transient state $T$ for the next $n$ transitions,

$$x_i^n = \sum_{j\in T} P_{ij}x_j^{n-1}$$

where $x_i^1 = \sum_{j\in T} P_{ij}$. We can show that $x_i^\infty = 0$, i.e., the absorbing probablity from a transient state into a recurrent class is 1. 

Let $\pi_i(C)$ be the absorbing probability of the process, starting from an transient state $i\in T$, entering an aperiodic recurrent class $C$. The absorbing probabilities must satisfy the following systematic equation.

$$\pi_i(C) = \pi_{C}^1 + \sum_{j\in T}P_{ij}\pi_j(C)$$

````{prf:theorem}
The limiting probability that a transient state $i\in T$ transits to a recurrent state $j\in C$ is given by 

$$\lim_{n\rightarrow \infty} P_{ij}^n = \pi_i(C)\pi_\infty(j)$$
````