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

# Chapter 2: Topology

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Naive set theoy](https://www.britannica.com/science/set-theory#ref24026)
- [Axiom set theory](https://www.britannica.com/science/set-theory/Axiomatic-set-theory)
- [History of set Theory](https://en.wikipedia.org/wiki/Set_theory)
```

## Euclidean spaces

````{prf:definition} Euclidean space
:label: def2.1
For each positive integer $k$, $\mathbb{R}^k$ is the set of all ordered $k$-tuples $\mathbf{x}=(x_1,...,x_k)$, where $x_1,...,x_k$ are real numbers. The elements of $\mathbb{R}^k$ are called vectors. For two vectors $\mathbf{x}$ and $\mathbf{y}$, we define

-   addition: $\mathbf{x}$+$\mathbf{y}=(x_1+y_1,...,x_k+y_k)$.
-   scalar multiplication: $a\mathbf{x}=(ax_1,...,ax_k)$.
-   inner product:
    $\mathbf{x} \cdot \mathbf{y} = \sum_{i=1}^{k} x_iy_i$.
-   norm: $\|\mathbf{x}\| = (\mathbf{x} \cdot \mathbf{x})^{1/2}$.

The vector space $\mathbb{R}^k$ equipped with the inner product and norm is
called Euclidean $k$-space.
````
Suppose $\mathbf{x}, \mathbf{y}, \mathbf{z} \in \mathbb{R}^k$ and $a$ is real. Then

-   $\|\mathbf{x}\|\ge0$
-   $\|\mathbf{x}\| = 0$ if and only if $\mathbf{x}=0$
-   $\|a\mathbf{x}\| = |a|\|\mathbf{x}\|$
-   $\|\mathbf{x}\cdot \mathbf{y}\| \le \|\mathbf{x}\|\|\mathbf{y}\|$
-   $\|\mathbf{x}+\mathbf{y}\| \le \|\mathbf{x}|+\|\mathbf{y}\|$
-   $\|\mathbf{x}-\mathbf{z}\| \le \|\mathbf{x}-\mathbf{y}\|+\|\mathbf{y}-\mathbf{z}\|$

## Metric spaces
````{prf:definition}
A set $\Omega$ is said to be a metric space if with any two elements
$x,y\in \Omega$ there is associated a real number $d(x,y)$, called the
distance from $x$ to $y$, such that

1. $d(x,y) > 0$ for $x \ne y$ and
$d(x,x)=0$.
2. $d(x,y)=d(y,x)$
3. $d(x,z) \le d(x,y)+d(y,z)$ for any
$z\in \Omega$.
````

````{prf:definition} neighborhood
:label: def2.2
A neighborhood of a point $p$ is a set $N_r(p)$ consisting of all points $q$ such that $d(p,q)<r$ for some $r>0$. The number $r$ is called the radius of $N_r(p)$.
````

````{prf:definition} interior point
:label: def2.3
A point $p$ is an interior point of $E$, if there is a neighborhood $N$ of $p$ such that $N\subset E$.
````

````{prf:definition} open set
:label: def2.4
A set $E$ is open if every point of $E$ is an interior point of $E$.
````

- A point $p$ is a **limit point** of the set $E$ if every neighborhood of $p$ contains a point $q \ne p$ such that $q\in E$.
- If $p\in E$ is not a limit point of $E$, then $p$ is called an **isolated point** of $E$.
- A set $E$ is **closed** if every limit point of $E$ is a point of $E$.
- A set $E$ is **perfect** if $E$ is closed and every point of $E$ is a limit point of $E$.
- $E$ is **bounded** if there is a real number $M$ and a point $p$ such that $d(p,q)<M$ for all $q\in E$.
- $E$ is dense in $X$ if every point of $X$ is a limit point of $E$ or a point of $E$.
- A set $E \subset \mathbb{R}^k$ is **convex** if $\lambda x + (1-\lambda)y \in E$, whenever $x,y\in E$ and $0<\lambda<1$.

````{prf:theorem}
:label: thm2.1
Every neighborhood is an open set.
````

Every neighborhood of a limit point of $E$ contains infinitely many points of $E$.

````{prf:theorem}
:label: thm2.2
A set $E$ is open if and only if its complement is closed.
````

- The union of any collection of open sets is open.
- The intersection of any finite collection of open sets is open.
- The intersection of any collection of closed sets is closed.
- The union of any finite collection of closed sets is closed.

Suppose $Y \subset X$. A subset $E$ is open relative to $Y$ if and only if $E=Y\cap G$ for some open subset $G$ of $X$.

## Compact sets
````{prf:definition} open cover
:label: def2.5
An open cover of a set $E$ in a metric space $\Omega$ is a collection of open subsets $\{G_\alpha\}$ of $\Omega$ such that
$E\subset \cup_\alpha G_\alpha$.
````

````{prf:definition} compact
:label: def2.6
A subset $X$ of a metric space $\Omega$ is compact if every open cover of $X$ contains a finite subcover.
````

- Suppose $E \subset Y \subset Z$. Then $E$ is compact relative to $Y$ if and only if $E$ is compact relative to $Z$.
- Compact subsets of metric spaces are closed.
- Closed subsets of compact sets are compact.

````{prf:theorem}
:label: thm2.3
If a set $E$ in $\mathbb{R}^k$ has one of the following three properties, then it has the other two, (1) $E$ is closed and bounded, (2) $E$ is compact, (3) Every infinite subset of $E$ has a limit point in $E$.
````

````{prf:theorem} Weierstrass
:label: thm2.4
Every bounded infinite subset of $\mathbb{R}^k$ has a limit point in $\mathbb{R}^k$.
````

If $E$ is a non-empty perfect set in $\mathbb{R}^k$, then it is uncountable.

The cantor set is a non-empty perfect set. Thus, it is uncountable, but its measure is 0.

## Connected sets
````{prf:definition} separated set
:label: def2.7
Two subsets $A$ and $B$ of a metric space $X$ are said to be separated if both $A\cap \bar{B}$ and $\bar{A} \cap B$ are empty.
````
````{prf:definition} connected set
:label: def2.8
A set $E$ is said to be connected if $E$ is not a union of two nonempty separated sets.
````

````{prf:theorem}
:label: thm2.5
A subset $E$ of the real line is connected if and only if it has the following property: if $x,y\in E$ and $x<z<y$, then $z\in E$.
````