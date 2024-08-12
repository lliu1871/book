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

# Chapter 1: Metric spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Metric space](https://en.wikipedia.org/wiki/Metric_space)
```
````{prf:definition}
A metric space is a pair $(𝑋,𝑑)$, where $𝑋$ is a set and $d$ is a metric on $𝑋$ (or distance function on $𝑋$), that is, a function defined on $𝑋\times 𝑋$ such that for all $𝑥,𝑦,𝑧\in 𝑋$ we have: 
1. $𝑑(𝑥,𝑦)\ge 0$ and $𝑑(𝑥,𝑦)=0$ if and only if $𝑥=𝑦$ 
2. $𝑑(𝑥,𝑦)=𝑑(𝑦,𝑥)$ 
3. $𝑑(𝑥,𝑦)\le 𝑑(𝑥,𝑧)+𝑑(𝑦,𝑧)$
````

## Subspace
````{prf:definition}
A subspace $(𝑌,\tilde{𝑑})$ of a metric space $(𝑋,𝑑)$ is obtained if we take a subset $𝑌\subset 𝑋$, and restrict $𝑑$ to $𝑌×𝑌$. The metric on $Y$ is the restriction $\tilde{𝑑} = 𝑑|_{𝑌\times 𝑌}$, where $\tilde{𝑑}$ is called metric induced on $Y$ by $d$.
````

## Inequality
If $p>1$ and $\frac{1}{p}+\frac{1}{q}=1$, the Holder inequality is given by

$$
\sum_{j=1}^{\infty}\left|\xi_j \eta_j\right| \leq\left(\sum_{j=1}^{\infty}\left|\xi_j\right|\right)^p\left(\sum_{j=1}^{1 / p}\left|\xi_j\right|\right)^q
$$

The Minkowski inequality is given by

$$
\left(\sum_{j=1}^{\infty}\left|\xi_j+\eta_j\right|^p\right)^{1 / p} \leq\left(\sum_{j=1}^{\infty}\left|\xi_j\right|^p\right)^{\frac{1}{p}}+\left(\sum_{j=1}^{\infty}\left|\xi_j\right|^p\right)^{1 / p}
$$

## Topology

````{prf:definition} Open Balls
Given a point $x_0 \in X$ and a real number $r>0$, an open ball is the set $B\left(x_0, r\right)=\left\{x: d\left(x, x_0\right)<r\right\}$

A closed ball is the set $\tilde{B}\left(x_0, r\right)=\left\{x: d\left(x, x_0\right) \leq r\right\}$

The sphere is the set $S\left(x_0, r\right)=\left\{x: d\left(x, x_0\right)=r\right\}$
````

A subset $M$ of a metric space $X$ is said to be **open** if it contains a ball about each of its points. A subset $K$ of $X$ is said to be **closed** if its complement $\bar{K}$ is open.

````{prf:definition} Neighborhoods
- An open ball $B\left(x_0, r\right)=\left\{x: d\left(x, x_0\right)<\epsilon\right\}$ of radius $\epsilon$ is often called an $\epsilon$ neighborhood of $x_0$
- A neighborhood of $x_0$ we mean any subset of $\mathrm{X}$ which contains an $\epsilon$ neighborhood of $x_0$
````

- Suppose $(𝑋,𝑑)$ is a Metric space. We call $𝑥_0$ an interior point of a set $𝑀⊂𝑋$ if 𝑀 is a neighborhood of $𝑥_0$  
- The interior of a set $𝑀⊂𝑋$ is the set of all interior points of $𝑀$, denoted by $𝐼𝑛𝑡(𝑀)$ 
- Interior of a set $M$ is an open set

````{prf:definition} closure
A point $𝑥_0$ of $𝑋$ (which mayor may not be a point of $𝑀$) is called an accumulation point of $𝑀⊂𝑋$ (or limit point of $𝑀$) if every neighborhood of $𝑥_0$ contains at least one point $𝑦\in 𝑀$ distinct from $𝑥_0$

The set consisting of the points of $𝑀$ and the accumulation points of $𝑀$ is called the closure of $𝑀$ and is denoted by $\bar{𝑀}$, which is the smallest closed set containing $M$
````

- A subset $M$ of a metric space $X$ is said to be **dense** in $X$ if $\bar{𝑀} = X$
- A space is said to be **separable** if it has a countable subset which is dense in $X$

## Completeness

````{prf:definition} convergence
A sequence $\left\{x_n\right\}$ in a metric space $X=(X, d)$ is said to converge if there is an $x \in X$ such that $\lim _{n \rightarrow \infty} d\left(x_n, x\right)=0 . \mathrm{x}$ is called the limit of the sequence and we write $\lim _{n \rightarrow \infty} x_n=x$ or simply $x_n \rightarrow x$

````

````{prf:definition} Bounded sets
Suppose $X=(X, d)$ is a metric space. The diameter of a set $M \subset X$ is

$$
\delta(M)=\sup _{x, y \in M} d(x, y)
$$

A nonempty subset $M \subset X$ is bounded if its diameter is finite
A sequence in $x$ is bounded if the corresponding point set is bounded in $X$
A convergent sequence in $X$ is bounded and its limit is unique
If $x_n \rightarrow x$ and $y_n \rightarrow y$ in $X$, then $d\left(x_n, y_n\right) \rightarrow d(x, y)$

````

````{prf:definition} Cauchy sequence
A sequence $x_k$ in a metric space is said to be Cauchy if and only if for every given $\epsilon>$ 0 there is an $N$ such that $\left|x_m-x_n\right|<\epsilon$ for all $m, n>N$
````
Every convergent sequence in a metric space is a Cauchy sequence. But not every Cauchy sequence converges.


````{prf:definition} completeness
A space $X$ is said to be complete if every Cauchy sequence converges
````

- $\mathbb{R}$ and $\mathbb{C}$ are complete metric spaces
- Let $M$ be a nonempty subset of a metric space $(\mathrm{X}, \mathrm{d})$ and $\bar{M}$ its closure. Then $x \in \bar{M}$ if and only if there is a sequence $x_n$ in $M$ such that $x_n \rightarrow x$.
- $M$ is closed if and only if the situation $x_n \in M$ and $x_n \rightarrow x$ implies that $x \in M$
- A subspace $M$ of a complete metric space $X$ is itself complete if and only if the set $M$ is closed in $X$

````{prf:definition} Isometry
Let $X=(X, d)$ and $\tilde{X}=(\tilde{X}, \tilde{d})$ be metric spaces. A mapping T of $X$ into $\tilde{X}$ is said to be isometric or an isometry if T preserves distances, that is, if for all $x, y \in X$,

$$
d(x, y)=\tilde{d}(T x, T y)
$$
````
The space $X$ is said to be isometric with the space $X$ if there exists a bijective isometry of $X$ onto $\tilde{X}$. The spaces $X$ and $\tilde{X}$ are then called **isometric spaces**.

````{prf:theorem} completion of a metric space
For a metric space $X=(X, d)$ there exists a complete metric space $\hat{X}=(\hat{X}, \hat{d})$ which has a subspace $W$ that is isometric with $X$ and is dense in $\hat{X}$. This space $\hat{X}$ is unique except for isometries, that is, if $\tilde{X}$ is any complete metric space having a dense subspace $W$ isometric with $X$, then $\tilde{X}$ and $\hat{X}$ are isometric

````
