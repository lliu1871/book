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

# Chapter 2: Complex Functions

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
```

## Mobius transformations
````{prf:definition}
A linear fractional transformation is a function of the form
$f (z) = \frac{az + b}{cz + d}$ where $a, b, c, d \in \mathbb{C}$. If $ad - bc \ne 0$ then $f$ is called a Möbius1 transformation.
````

1. Möbius transformations are conformal
2. Möbius transformations are entire
3. every linear fractional transformation is a composition of translations, dilations, and inversions.
4. Möbius transformations map circles and lines into circles and lines.

## Stereographic projection
The stereographic projection of $S^2$ to $\hat{\mathbb{C}}$ from $N$ is the map $\psi: S^2 \rightarrow \hat{\mathbb{C}}$ defined as follows. For any point $P \in S^2 \{N\}$, as the z-coordinate of $P$ is strictly less than 1, the line through N and P intersects $\mathbb{C}$ in exactly one point $Q$. Define $\psi(P) := Q$. We also declare that $\psi(N) := \infty$.

The stereographic projection $\psi$ takes the set of circles in $S^2$ bijectively to the set of circles
in $\hat{\mathbb{C}}$, where for a circle $\gamma\subset S^2$ we have $\infty \in \psi(\gamma)$ (that is, $\psi(\gamma)$ is a line in $\mathbb{C}$) if and only if $N\in \gamma$.


## Exponential and Trigonometric functions
````{prf:definition}
The complex exponential function is $exp : \mathbb{C} \rightarrow \mathbb{C}$, defined for $z = x + iy$ as
$\exp(z) := e^x (\cos y + i \sin y) = e^xe^{iy}$.
````

$\sin z := \frac{1}{2i} (\exp(iz) - \exp(-iz))$

$\cos z := \frac{1}{2} (\exp(iz) + \exp(-iz))$




## Logarithms and Complex exponentials
````{prf:definition}
Given a region $G$, any continuous function $Log : G \rightarrow \mathbb{C}$ that satisfies $\exp(\log z) = z$ is a branch of the logarithm (on G).
````

````{prf:definition}
Let $Arg z$ denote the unique argument of $z \ne 0$ that lies in $(-\pi, \pi]$ (the principal
argument of z). Then the principal logarithm is the function $Log : \mathbb{C} \setminus \{0\} \rightarrow \mathbb{C}$ defined through
$\log(z) := ln |z| + i Arg(z)$.
````

