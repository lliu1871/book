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

# Chapter 9: Laurent Series

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
```

````{prf:definition}
A Laurent series centered at $z_0$ is a double series of the form $\sum_{k\in \mathbb{Z}}c_k(z-z_0)^k$
````

````{prf:theorem}
Suppose $f$ is a function that is holomorphic in $A := \{z \in \mathbb{C} : R_1 < |z - z_0| < R^2\}$.
Then $f$ can be represented in $A$ as a Laurent series centered at $z_0$, $f(z)=\sum_{k\in \mathbb{Z}}c_k(z-z_0)^k$ with

$$
c_k = \frac{1}{2\pi i}\int_{C[z_0,r]}\frac{f(w)}{(w-z_0)^{k+1}dw}
$$

where $R_1<r<R_2$.
````

This theorem, naturally, has several corollaries that have analogues in the world of Taylor
series. Here are two samples:

If $\sum_{k\in \mathbb{Z}}c_k(z-z_0)^k$ and $\sum_{k\in \mathbb{Z}}d_k(z-z_0)^k$ are two Laurent series that both converge, for $R_1 < |z - z_0| < R_2$, to the same function, then $c_k = d_k$ for all $k \in \mathbb{Z}$.

If G is a region, $z_0 \in G$, and $f$ is holomorphic in $G \backslash \{z_0\}$, then $f$ can be expanded into
a Laurent series centered at $z_0$ that converges for $0 < |z - z_0| < R$ where $R$ is at least the distance of $z_0$ to $\partial G$.

````{prf:theorem}
Suppose f is a function that is holomorphic in $A := \{z \in \mathbb{C} : R_1 < |z - z_0| < R^2\}$,
with Laurent series $f(z)=\sum_{k\in \mathbb{Z}}c_k(z-z_0)^k$. If $\gamma$ is any simple, closed, piecewise smooth path in $A$, such that $z_0$ is inside $\gamma$, then

$$
\int_{\gamma}f(z)dz = 2\pi i c_{-1}
$$
````