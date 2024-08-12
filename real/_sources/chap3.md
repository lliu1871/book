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

# Chapter 3: The Real Numbers

```{epigraph}
*"Life is a series of natural and spontaneous changes. Don't resist them - that only creates sorrow. Let reality be reality. Let things flow naturally forward in whatever way they like."*

-- Lao Tzu
```

```{seealso}
- [Real number](https://www.britannica.com/science/real-number)
- [Real number](https://en.wikipedia.org/wiki/Real_number)
```

The real number system is an ordered field endowed with two binary operations, + and ⋅, and a total order denoted by $\le$. Moreover, it is a complete ordered field, and any other complete ordered field is isomorphic to it. The completeness of real numbers is frequently expressed through the least upper bound property.

## Ordered sets
````{prf:definition} order
:label: def3.1
An order on a set $S$ is a relation, denoted by <, with the following two properties: (1) If $x,y\in S$, then one and only one of the statements $x<y, x=y, x>y$ is true, (2) if $x,y,z\in S$ and if $x<y$ and $y<z$, then $x<z$.
````

````{prf:definition} ordered set
:label: def3.2
An ordered set is a set in which an order is defined.
````
## Upper bound and lower bound
````{prf:definition} upper bound
:label: def3.3
Suppose that $S$ is an ordered set and $E \subset S$. If there exists a $\mu \in S$ such that $x \le \mu$ for every $x\in E$, then $\mu$ is an upper bound of $E$.
````

````{prf:definition} least uppper bound
:label: least upper bound
An upper bound $\mu$ is the least upper bound, if $\alpha < \mu$ indicates that $\alpha$ is not an upper bound. We write $\mu = \sup E$.
````
````{prf:definition} lower bound
:label: def3.4
Suppose that $S$ is an ordered set and $E \subset S$. If there exists a $\mu \in S$ such that $x \ge \mu$ for every $x\in E$, then $\mu$ is a lower bound of $E$.
````
````{prf:definition} greatest lower bound
:label: def3.5
A lower bound $\mu$ is the , if $\alpha < \mu$ indicates that $\alpha$
is not a lower bound. We write $\mu = \inf E$.
````

````{prf:definition} least upper bound property
:label: def3.6
A set $S$ has the least upper property if and only if every non-empty subset $E\subset S$ with an upper bound has a least upper bound in $S$.
````
````{prf:definition} greatest lower bound property
:label: def3.7
An ordered set $S$ has the greatest lower bound property if and only if it
has the greatest-lower-bound property.
````

## Fields
````{prf:definition} field
:label: def3.8
A field is a set F with two operations, addition and multiplication,
which satisfies the following axioms.
-   Associative laws
-   Commutative laws
-   Distributive laws
-   Existence of Identity
-   Existence of additive inverse
-   Existence of multiplicative inverse
````

````{prf:definition} ordered field
:label: def3.9
A field $F$ is an ordered field if $F$ is an ordered set such that (1)
$x+y < x+z$ if $x,y,z \in F$ and $y<z$, (2) $xy>0$ if $x,y\in F$ and
$x,y>0$.
````

## The Real Field

````{prf:definition} real field
:label: def3.10
There exists an ordered field with the least-upper-bound property, which
contains rational numbers as a subfield.
````

````{prf:theorem} Archimedean Principle
:label: thm3.1 
If $x,y \in \mathbb{R}$ and $x>0$, there is a positive integer $n$ such that $nx>y$.
````

If $x,y \in \mathbb{R}$ and $x<y$, there is a rational number $r$ such that
$x<r<y$.

```{prf:definition} complete
:label: def3.11
An ordered field $F$ is **complete** if for all $S\in F$ whenever $S$ has an upper bound it also has a least upper bound.
````

An ordered field $F$ is complete if and only if it has the LUP. 

The set of real numbers $\mathbb{R}$ is a complete ordered field. That is, if $F$ is a complete ordered field then there is an isomorphism $\phi: F\to \mathbb{R}$ (an isomorphism preserves all the properties of the field including the arithmetic and order properties).

````{prf:theorem}
:label: thm3.2
For every real $x>0$ and every integer $n>0$, there is one and only one positive real $y$ such that $y^n=x$.
````

The **extended real number system** consists of the real field $\mathbb{R}$ and two symbols, $-\infty$ and $+\infty$, such that $-\infty<x<+\infty$ for every $x\in \mathbb{R}$.

```{admonition} Summary
- The set of real numbers is a isomorphically unique complete ordered field
```

