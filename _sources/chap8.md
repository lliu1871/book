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

# Chapter 8: Taylor Series

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
```

Suppose $f(z) = \sum_{k\ge 0}c_k(z-z_0)^k$ has radius of convergence $R > 0$. Then $f$ is holomorphic
in $D[z_0, R]$. Moreover, $f'(z) = \sum_{k\ge 1}kc_k(z-z_0)^{k-1}$ for any $z \in D[z_0, R]$, and the radius of convergence of this power series is also $R$.

Suppose $f(z) = \sum_{k\ge 0}c_k(z-z_0)^k$ has a positive radius of convergence. Then
$c_k = \frac{f^{(k)}(z_0)}{k!}$.

If $\sum_{k\ge 0}c_k(z-z_0)^k$ and $\sum_{k\ge 0}d_k(z-z_0)^k$ are two power series that both converge to the same function on an open disk centered at $z_0$, then $c_k = d_k$ for all $k\ge 0$.

````{prf:theorem}
Suppose $f$ is a function holomorphic in $D[z_0, R]$. Then $f$ can be represented as a power
series centered at $z_0$, with a radius of convergence $R$: $f(z) = \sum_{k\ge 0}c_k(z-z_0)^k$ with 

$$c_k = \frac{1}{2\pi i}\int_{\gamma}\frac{f(w)}{(w-z_0)^{k+1}dw}$$

where $\gamma$ is any positively oriented, simple, closed, piecewise smooth path in $D[z_0, R]$ for which $z_0$ is inside $\gamma$.
````

````{prf:definition}
For a region $G\subseteq \mathbb{C}$ and a point $z0 \in G$, we define the distance of $z_0$ to $\partial G$, the boundary of $G$, as the greatest lower bound of $\{|z- z_0| : z\in \partial G\}$. If this set is empty, we define the distance of $z_0$ to $\partial G$ to be $\infty$.
````

Suppose $f$ is holomorphic in $D[w, R]$ and $|f(z)|\le M$ for all $z \in D[w, R]$. Then $|f^{(k)}(w)| \le \frac{k!M}{R^k}$.

````{prf:definition} Analytic
Let $f : G \rightarrow \mathbb{C}$ and $z_0 \in G$. If there exist $R > 0$ and $c_0, c_1, c_2, \dots \in \mathbb{C}$ such that the power series $\sum_{k\ge 0}c_k(z-z_0)^k$ converges in $D[z_0, R]$ and agrees with $f(z)$ in $D[z_0, R]$, then $f$ is analytic at $z_0$. We call $f$ analytic
in $G$ if $f$ is analytic at each point in $G$.
````

For any region G, the class of all analytic functions in G coincides with the class of all
holomorphic functions in G.