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

# Chapter 5: Singularities

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
```
## Classification of singlarities
The **punctured disk** with center $z_0$ and radius $R$ is $\dot{D}[z_0, R] := \{z \in \mathbb{C} : 0<|z-z_0| < R\}$ or $D[z_0, R]\backslash\{z_0\}$.


If $f$ is holomorphic in the punctured disk $\dot{D}[z0, R]$ but not at $z = z_0$,
then $z_0$ is an **isolated singularity** of $f$. The singularity $z_0$ is called

1. **removable** if there exists a function $g$ holomorphic in $D[z_0, R]$ such that $f = g$ in $D[z_0, R]$
2. a **pole** if $\lim_{z\rightarrow z_0} |f(z)| = \infty$
3. **essential** if $z_0$ is neither removable nor a pole.

````{prf:theorem}
Suppose $z_0$ is an isolated singularity of $f$ with Laurent series $f(z) = \sum_{k\in \mathbb{Z}} c_k(z-z_0)^k$, valid in some punctured disk centered at $z_0$. Then
1. $z_0$ is removable if and only if there are no negative exponents (that is, the Laurent series is a power series);
2. $z_0$ is a pole if and only if there are finitely many negative exponents, and the order of the pole is the largest $k$ such that $c_{-k} \ne 0$;
3. $z_0$ is essential if and only if there are infinitely many negative exponents.
````

## Residuals

````{prf:definition}
Suppose $z_0$ is an isolated singularity of $f$ with Laurent series $\sum_{k\in\mathbb{Z}}c_k(z-z_0)^k$. Then $c_{-1}$ is the residue of $f$ at $z_0$, denoted by ${Res}_{z=z_0}(f(z))$ or $Res(f(z), z=z_0)$.
````

We can compute integrals over closed curves by finding the
residues at isolated singularities, and our next theorem makes this precise.


````{prf:theorem} Residue Theorem
Suppose $f$ is holomorphic in the region $G$, except for isolated singularities,
and $\gamma$ is a positively oriented, simple, closed, piecewise smooth path that avoids the singularities
of $f$, and $\gamma \thicksim_G 0$. Then there are only finitely many singularities inside $\gamma$, and

$$\int_{\gamma}f = 2\pi i \sum_{k}{Res}_{z=z_k}(f(z))$$
````

## Argument Principle and Rouché’s Theorem
A function f is **meromorphic** in the region $G$ if $f$ is holomorphic in $G$ except for
poles.

````{prf:theorem} Argument Principle
Suppose $f$ is meromorphic in a region G and $\gamma$ is a positively oriented, simple, closed, piecewise smooth path that does not pass through any zero or pole of f , and $\gamma \thicksim_G 0$. Denote by $Z( f , \gamma)$ the number of zeros of $f$ inside g counted according to multiplicity and by
$P( f , \gamma)$ the number of poles of $f$ inside $\gamma$ counted according to order. Then

$$\frac{1}{2\pi}\int_{\gamma}\frac{f'}{f} = Z(f, \gamma) - P( f , \gamma)$$
````

````{prf:theorem} Rouché’s Theorem
Suppose $f$ and $g$ are holomorphic in a region $G$ and $\gamma$ is a positively
oriented, simple, closed, piecewise smooth path, such that $\gamma \thicksim_G 0$ and $|f (z)| > |g(z)|$ for all $z \in \gamma$. Then

$$Z(f + g, \gamma) = Z(f,\gamma)$$
````

