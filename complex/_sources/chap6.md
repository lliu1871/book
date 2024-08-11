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

Harmonic functions are functions that satisfy Laplace's equation, i.e.,the sum of second partial derivatives are equal to zero.

````{prf:definition}
Let $G\subset \mathbb{C}$ be a region. A function $u : G \rightarrow \mathbb{R}$ is harmonic in $G$ if it has continuous second partials in $G$ and satisfies the Laplace equation

$$u_{xx} + u_{yy} = 0$$
````

The real and imaginary parts of a complex holomorphic function are harmonic functions. This means that a complex differentiable function can be expressed as a sum of a harmonic function and a conjugate harmonic function.

````{prf:theorem}
Suppose $f = u + iv$ is holomorphic in the region $G$. Then $u$ and $v$ are harmonic in $G$.
````

````{prf:theorem}
Suppose $u$ is harmonic on a simply-connected region $G$. Then there exists a harmonic
function $v$ in $G$ such that $f = u + iv$ is holomorphic in $G$. The function $v$ is called a harmonic conjugate of $u$.
````

````{prf:definition}
Suppose $u$ is harmonic on $\mathbb{C}$. Then $v(x, y) :=\int_0^y u_x(x, t)dt + \int_0^x u_y(t, 0) dt$ is a harmonic conjugate for $u$.
````

A harmonic function is infinitely differentiable.


## Mean value property
There is a close relationship between harmonic and holomorphic functions. The theorems proven for holomorphic functions find analogs in the realm of harmonic functions. Presented here is a harmonic counterpart to Cauchy's Integral Formula.

````{prf:theorem}
Suppose $u$ is harmonic in the region $G$ and $D[w, r]\subset G$. Then
$u(w) =\frac{1}{2\pi} \int_0^{2\pi}u(w + re^{it})dt$
````

The theorem illustrates the mean value property of harmonic functions, affirming that the value of a harmonic function at any point equals the average of its values on the surrounding boundary. This property extends seamlessly to 3D spaces, as articulated in the subsequent theorem.


````{prf:theorem} Mean-value property of harmonic functions
Let $f : \mathbb{R}^3 \rightarrow \mathbb{R}$ be a harmonic function. Given a point
$p \in \mathbb{R}^3$ and a positive number $r>0$, let $S(r)$ be the sphere of radius $r$ centered at $p$. Then

$$
f(p) = \frac{1}{4\pi r^2}\int\int_{S(r)}fd\delta
$$

The right side of this equation is the average value of $f$ on the sphere; the left side is the value of $f$ at the center of the sphere. Notice that the left side doesn't even depend on $r$. 
````

## Maximum and Minimum
Harmonic functions exhibit the maximum principle as another inherent property. This principle asserts that the maximum value of a harmonic function is invariably attained on the boundary of the domain in which the function is defined. Such a property holds significance for understanding the behavior of harmonic functions and aids in their analysis.

Let $G\subset \mathbb{C}$ be a region. The function $u : G \rightarrow \mathbb{R}$ has a **strong relative maximum** at $w \in G$ if there exists a disk $D[w, r]\subset G$ such that $u(z)\le u(w)$ for all $z \in D[w, r]$ and $u(z_0) < u(w)$ for some $z_0 \in D[w, r]$. The definition of a strong relative minimum is analogous.

````{prf:theorem} 
If $u$ is harmonic in the region $G$, then it does not have a strong relative maximum or minimum in $G$.
````

1. If $f$ is harmonic and has a local maximum or minimum, then $f$ is constant.
2. If $f$ is holomorphic and nonzero in the region $G$, then $|f|$ does not have a strong relative
maximum or minimum in $G$.


````{prf:theorem} Maximum principle
If $f$ is harmonic in a bounded solid region, then its absolute maximum and minimum occur on the boundary.
````

Suppose $u$ is harmonic in the bounded region $G$ and continuous on its closure. If $u$ is
zero on $\partial G$ then $u$ is zero in $G$, because maximum and minimum occur on the boundary $\partial G$. 


````{prf:theorem} Uniqueness of harmonic functions
If $f$ and $g$ are harmonic functions and $f = g$ on the surface of a bounded region, then $f = g$ inside the region as well.
````
