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

# Chapter 7: Power Series

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
A power series centered at $z_0$ is a series of the form $\sum_{k=0}^{\infty}c_k(z-z_0)^k$
where $c_0, c_1, \dots \in \mathbb{C}$.
````
The geometric series $\sum_{k=0}^{\infty}z^k=\frac{1}{1-z}$ converges absolutely for $|z| < 1$ and uniformly for $|z|\le r$, for any fixed $r < 1$. The geometric series diverges for $|z|>1$.

Given a power series, there exists a real number $R\ge 0$ or $R = \infty$, such
that
1. it converges absolutely for $|z- z_0| < R$
2. it converges absolutely and uniformly for $|z - z_0|\le r$, for any $r < R$
3. it diverges for $|z-z_0| > R$

The number $R$ is called the **radius of convergence** of the power series. The open disk $D[z_0, R]$ in which the power series converges absolutely is the region of convergence. (If $R = \infty$ then this is $\mathbb{C}$.)

````{prf:theorem}
If $\lim_{k\rightarrow \infty}\sqrt[k]{c_k}$ exists then the radius of convergence of the power series equals 

$$
\begin{equation}
  R =
    \begin{cases}
      \infty & \text{if $\lim_{k\rightarrow \infty}\sqrt[k]{c_k}=0$}\\
      \frac{1}{\lim_{k\rightarrow \infty}\sqrt[k]{c_k}} & \text{otherwise}\\
    \end{cases}       
\end{equation}
$$
````
Suppose the power series has radius of convergence $R > 0$. Then the series represents a function that is continuous on $D[z_0, R]$.

Suppose the power series $\sum_{k=0}^{\infty}c_k(z-z_0)^k$ has radius of convergence $R > 0$ and $\gamma$ is a piecewise smooth path in $D[z_0, R]$. Then

$$\int_{\gamma}\sum_{k=0}^{\infty}c_k(z-z_0)^k dz = \sum_{k=0}^{\infty}c_k \int_{\gamma}(z-z_0)^k dz $$