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

# Chapter 1: Limit

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```


[Grégoire de Saint-Vincent](https://en.wikipedia.org/wiki/Gr%C3%A9goire_de_Saint-Vincent) gave the first definition of limit of a geometric series in his book [Opus Geometricum](https://books.google.com/books?id=-dA-AAAAcAAJ&printsec=frontcover#v=onepage&q&f=false) 
> The terminus of a progression is the end of the series, which none progression can reach, even not if she is continued in infinity, but which she can approach nearer than a given segment.

Many important concepts (continuity, derivative, integral, etc.) in calculus and mathematical analysis are based on the definition of limit.

````{prf:definition} limit of a sequence
:nonumber:
:label: limit_sequence
Let $x_i$ be a sequence of real numbers. A real number $L$ is the limit of $x_i$ if for every real number $\epsilon > 0$, there exists a natural number $N$ such that for all $n > N$, we have $|a_n − L| < \epsilon$. If $L$ exists, we write 

$$\lim_{n\rightarrow \infty}a_n=L$$
````

```{code-cell}
:tags: ["hide-input"]

from sympy.plotting import plot 
from sympy.plotting import plot3d_parametric_line 
from sympy import * 
x=Symbol('x') 
plot3d_parametric_line(cos(x), sin(x), x, (x, -5, 5))
```

A sequence is a special mapping $f: \mathbb{N}\rightarrow \mathbb{R}$ from natural numbers to real numbers. The definition of limit for a sequence can be generalized to an arbitrary function $f: \mathbb{R} \rightarrow \mathbb{R}$.

````{prf:definition}  limit of a function
:label: def1.2
:nonumber:
 A real function $f(x)$ converges to $L$ as $x\rightarrow a$ if for every $\epsilon>0$ there is a $\delta>0$ such that whenever $|x-a|<\delta$ then $|f(x)-L|<\epsilon$. 
 ````

**Infinite Limit** : We say $\lim_{x \rightarrow a} f(x)=\infty$ if we can make $f(x)$ arbitrarily large (and positive) by taking $x$ sufficiently close to a (on either side of $a$) without letting $x=a$. There is a similar definition for $\lim_{x \rightarrow a} f(x)= -\infty$ except we make $f(x)$ arbitrarily large and negative.

**Limit at Infinity** : We say $\lim_{x \rightarrow \infty} f(x)=L$ if we can make $f(x)$ as close to $L$ as we want by taking $x$ large enough and positive. There is a similar definition for $\lim_{x \rightarrow -\infty} f(x)=L$ except we require that $x$ is large and negative.

````{prf:definition} right and left hand limit
:label: def1.3
:nonumber:
Right hand limit : $\lim_{x \rightarrow a^{+}} f(x)=L$. This has
the same definition as the limit except it requires $x>a$.

Left hand limit : $\lim_{x \rightarrow a^{-}} f(x)=L$. This has the same definition as the limit except it requires $x<a$. 
````

In the definition, "approach to a" is described by the distance $|x-a|$ regardless how it approaches to $a$. In fact, $x$ may approach to $a$ from above (right hand limit) or from bottom (left hand limit). The limit of a sequence does not depend on how the sequence approaches to the limit.

````{prf:theorem}
:label: thm1.1
$\lim_{x \rightarrow a} f(x)=L$ if and only if $\lim_{x \rightarrow a^{+}} f(x)=\lim_{x \rightarrow a^{-}} f(x)=L$
````

If $\lim_{x \rightarrow a^{+}} f(x) \neq \lim_{x \rightarrow a^{-}} f(x)$, then the limit $\lim_{x \rightarrow a} f(x)$ does not exist.

## Properties
```{important}
The limit, if exists, is unique. The limit is a tail property of a sequence. If a sequence has a limit, it is bounded. 
```

Let $\Omega$ be a set of all funtions that have a limit at $x=a$. If $f,g\in \Omega$, we have

1. $\lim_{x \rightarrow a}[c f(x)]=c \lim_{x \rightarrow a} f(x)$

2. $\lim_{x \rightarrow a}\left[\frac{f(x)}{g(x)}\right]=\frac{\lim_{x \rightarrow a} f(x)}{\lim_{x \rightarrow a} g(x)}$ provided $\lim_{x \rightarrow a} g(x) \neq 0$

3. $\lim_{x \rightarrow a}[f(x) \pm g(x)]=\lim_{x \rightarrow a} f(x) \pm \lim_{x \rightarrow a} g(x)$

4. $\lim_{x \rightarrow a}[f(x)]^{n}=\left[\lim_{x \rightarrow a} f(x)\right]^{n}$
5. $\lim_{x \rightarrow a}[\sqrt[n]{f(x)}]=\sqrt[n]{\lim_{x \rightarrow a} f(x)}$
6. $\lim_{x \rightarrow a}[f(x) g(x)]=\lim_{x \rightarrow a} f(x) \lim_{x \rightarrow a} g(x)$


````{prf:theorem} L'Hospital's Rule
:label: thm1.2
If $\lim_{x \rightarrow a} \frac{f(x)}{g(x)}=\frac{0}{0}$ or $\lim_{x \rightarrow a} \frac{f(x)}{g(x)}=\frac{\pm \infty}{\pm \infty}$, then 

$$\lim_{x \rightarrow a} \frac{f(x)}{g(x)}=\lim_{x \rightarrow a} \frac{f^{\prime}(x)}{g^{\prime}(x)}$$

where $a$ is a number, $\infty$ or $-\infty$ 
````

