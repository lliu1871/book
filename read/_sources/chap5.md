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

# Chapter 5: Continuity

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Continuous function](https://en.wikipedia.org/wiki/Continuous_function)
```


*"There are only two ways to live your life. One is as though nothing is
a miracle. The other is as though everything is a miracle."*

-- Albert Einstein, *Source of this quote*

## Limits of Functions
````{prf:definition}
:label: def5.1
Let $X$ and $Y$ be metric spaces. Suppose $E\subset X$, $f$ maps $E$
into $Y$ and $p$ is a limit point of $E$, we write
$\lim\limits_{x\to p} f(x) = q$ if there is a point $q$ such that for
every $\epsilon>0$ there exists a $\delta>0$ such that
$d_Y(f(x),q)<\epsilon$ for all points $x\in E$ for which
$0<d_X(x,p)<\delta$.
````

-   $\lim\limits_{x\to p} f(x) = q$ if and only if $f(x_n)\to q$ for
    every sequence $\{x_n\}$ which converges to $p$.
-   If $f$ has a limit, then the limit is unique.

````{prf:theorem}
:label: thm5.1
If $\lim\limits_{x\to p} f(x) = A$ and $\lim\limits_{x\to p} g(x) = B$, then
$\lim\limits_{n\to p} (f(x)+g(x)) = A+B, \lim\limits_{n\to p} (f(x)g(x)) = AB, \lim\limits_{n\to p} (f(x)/g(x)) = A/B$ if $B\ne 0$.
````

## Continuous functions
````{prf:definition}
:label: def5.2
Let $X$ and $Y$ be metric spaces. Suppose $E\subset X$, $f$ maps $E$
into $Y$ and $p$ is a point of $E$. Then $f$ is continuous at $p$ if for
every $\epsilon>0$ there exists a $\delta>0$ such that
$d_Y(f(x),f(p))<\epsilon$ for all points $x\in E$ for which
$0<d_X(x,p)<\delta$.
````

````{prf:definition}
:label: def5.3
If $f$ is continuous at every point of $E$, then $f$ is said to be continuous on $E$.
````

-   If $f$ and $g$ are continuous functions, then $g\circ f$ is
    continuous.

````{prf:theorem}
A mapping $f$ of a metric space $X$ into a metric space $Y$ is
continuous if and only if $f^{-1}(v)$ is open for every open set $v$ in Y.
````

````{prf:theorem}
:label: thm5.2
Let $f_1(x),...,f_k(x)$ be real functions on a metric space $X$.
$f=(f_1(x),...,f_k(x))$ is a mapping of $X$ into $R^k$. Then $f$ is
continuous if and only if each of the functions $f_1(x),...,f_k(x)$ is
continuous. If $f$ and $g$ are continuous mapping of $X$ into $R^k$,
then $f+g$ and $f\cdot g$ are continuous on X.
````

## Continuity and Compactness
````{prf:definition}
:label: def5.4
A mapping $f$ of a set $E$ into $R^k$ is said to be bounded if there is
a real number $M$ such that $|f(x)|\le M$ for all $x\in E$.
````

````{prf:theorem}
:label: thm5.3
A continuous mapping of a compact set is compact.
````

````{prf:theorem}
:label: thm5.4
If $f$ is a continuous mapping of a compact metric space $X$, then
$f(X)$ is closed and bounded.
````

````{prf:theorem}
:label: thm5.5
$f$ is a continuous real function on a compact metric space $X$. Let $M=\sup\limits_{p\in X}f(p)$ and $m=\inf\limits_{p\in X}f(p)$. Then there exist points $p,q\in X$ such that $f(p)=M$ and $f(q)=m$.
````

````{prf:theorem}
:label: thm5.6
$f$ is a continuous 1-1 mapping of a compact metric space $X$ onto a metric space $Y$. Then the inverse mapping $f^{-1}(f(x))=x$ is a continuous mapping.
````

## Uniformly continuous
````{prf:definition}
:label: def5.5
$f$ is a continuous mapping of a metric space $X$ into a metric space
$Y$. $f$ is said to be uniformly continuous on $X$ if for every
$\epsilon>0$ there is a $\delta>0$ such that $d_Y(f(p)-f(q))<\epsilon$
for all $p,q\in X$ for which $d_X(p,q)< \delta$.
````

````{prf:theorem}
:label: thm5.7
If $f$ is a continuous mapping of a compact metric space $X$ into a metric space $Y$, then $f$ is uniformly continuous on $X$.
````

## Continuity and Connectness
````{prf:theorem}
:label: thm5.8
$f$ is a continuous mapping of a metric space $X$ into a metric space
$Y$. If $E$ is a connected subset of $X$, then $f(E)$ is connected.
````

````{prf:theorem} Intermediate value theorem
:label: thm5.9
$f$ is a continuous real function on an interval $[a,b]$. If $f(a)<c<f(b)$, then there exists a
point $x\in (a,b)$ such that $f(x)=c$.
````

## Monotonic functions
````{prf:definition}
:label: def5.6
$f$ is a real function on $(a,b)$. $f$ is said to be monotonically
increasing if $a<x<y<b$ implies $f(x)\le f(y)$.
````

````{prf:theorem}
:label: thm5.10
If $f$ is monotonically increasing on $(a,b)$, then $f(x+)$ and $f(x-)$
exist at every point of $x\in (a,b)$, and

$$\sup\limits_{a<t<x}f(t) = f(x-) \le f(x) \le f(x+) = \inf\limits_{x<t<b} f(t)$$
````

````{prf:theorem}
:label: thm5.11
If $f$ is monotonic on $(a,b)$, then the set of points of $(a,b)$ at
which $f$ is discontinuous is at most countable.
````

```{admonition} Summary
1. A function $f: X\to Y$ is continuous if and only if the inverse image $f^{-1}(A)$ of an open set $A\subset Y$ is open.
2. A continuous mapping of a compact set is compact.
3. A continuous mapping of a connected set is connected.
```