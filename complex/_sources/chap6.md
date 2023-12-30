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

# Chapter 6: Harmonic functions

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
Let $G\subset \mathbb{C}$ be a region. A function $u : G \rightarrow \mathbb{R}$ is harmonic in $G$ if it has continuous second partials in $G$ and satisfies the Laplace equation

$$u_{xx} + u_{yy} = 0$$
````

Suppose $f = u + iv$ is holomorphic in the region $G$. Then $u$ and $v$ are harmonic in $G$.

````{prf:theorem}
Suppose $u$ is harmonic on a simply-connected region $G$. Then there exists a harmonic
function $v$ in $G$ such that $f = u + iv$ is holomorphic in $G$. The function $v$ is called a harmonic conjugate of $u$.
````

````{prf:definition}
Suppose $u$ is harmonic on $\mathbb{C}$. Then $v(x, y) :=\int_0^y u_x(x, t)dt + \int_0^x u_y(t, 0) dt$ is a harmonic conjugate for $u$.
````

A harmonic function is infinitely differentiable.

We have established an intimate connection between harmonic and holomorphic functions, and so
it should come as no surprise that some of the theorems we proved for holomorphic functions
have analogues in the world of harmonic functions. Here is such a harmonic analogue of Cauchy’s
Integral Formula.

````{prf:theorem}
Suppose $u$ is harmonic in the region $G$ and $D[w, r]\subset G$. Then
$u(w) =\frac{1}{2\pi} \int_0^{2\pi}u(w + re^{it})dt$
````

Let $G\subset \mathbb{C}$ be a region. The function $u : G \rightarrow \mathbb{R}$ has a **strong relative maximum** at $w \in G$ if there exists a disk $D[w, r]\subset G$ such that $u(z)\le u(w)$ for all $z \in D[w, r]$ and $u(z_0) < u(w)$ for some $z_0 \in D[w, r]$. The definition of a strong relative minimum is analogous.

1. If $u$ is harmonic in the region $G$, then it does not have a strong relative maximum or minimum in $G$.
2. If $f$ is holomorphic and nonzero in the region $G$, then $|f|$ does not have a strong relative
maximum or minimum in $G$.
3. Suppose $u$ is harmonic in the bounded region $G$ and continuous on its closure. If $u$ is
zero on $\partial G$ then $u$ is zero in $G$.