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

# Chapter 11: The Riemann mapping theorem

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
A family (i.e., a set) $F$ of homomorphic functions defined
on a region $\Omega$­ is called normal if every sequence of functions in
$F$ has a subsequence locally uniformly convergent in ­$\Omega$
````

````{prf:theorem} 
A family $F$ of functions homomorphic on a region $\Omega$­ is
normal if and only if it is locally equibounded.
````

Here **locally equibounded** means that for each compact subset $E$ of $\Omega$
there is a constant $K_E$ such that $|f(z)| < K_E$ for every $f \in F$ and
$z \in E$.

````{prf:definition} equicontinuous
A family $F$ of complex valued functions defined
in a complex region $\Omega$­ is called locally equicontinuous if for every $\epsilon > 0$
and compact subset $E$ of $\Omega$­ there is a $\delta > 0$ such that $|f(z)-f(w)| < \epsilon$
for every $f \in F$ and all $z, w \in E$ satisfying $|z-w| < \delta$.
````

````{prf:theorem} Arzela-Ascoli
Suppose $f_1, f_2, \dots$ is a sequence of
complex-valued functions defined on a region ­ $\Omega\subset \mathbb{C}$, and assume the
sequence is locally equibounded and equicontinuous in $\Omega$­. Then there is
a locally uniformly convergent subsequence.
````

````{prf:theorem} Riemann mapping theorem 
Given a simply connected
region ­$\Omega$ which is not the entire complex plane $\mathbb{C}$ and a point
$z_0 \in \Omega$, there is precisely one univalent conformal map $f$ of $\Omega$­ onto the
unit disk such that $f(z_0) = 0$ and $f'(z_0) > 0$.
````
Note that Liouville’s theorem shows that it is not possible to map
the entire plane $\mathbb{C}$ conformally onto the unit disk; the only bounded
entire functions are the constants.

