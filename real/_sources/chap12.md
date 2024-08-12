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

# Chapter 12: The Lebesgue Theory

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Power series](https://en.wikipedia.org/wiki/Power_series)
- [Fourier series](https://en.wikipedia.org/wiki/Fourier_series)
```

*"Life is a book and there are a thousand pages I have not yet read."*

-- Cassandra Clare, *Clockwork Princess*


## Set functions

````{prf:definition}
:label: def11.1
A family $\Omega$ of sets is called a ring (or field) if $A\in \Omega$ and $B\in \Omega$ implies $A\cup B \in \Omega$ and $A - B \in \Omega$. In addition, a ring $\Omega$ is called a $\sigma$-ring if $\cup_{n=1}^{\infty} A_n \in \Omega$ whenever $A_n\in \Omega$ $(n=1,2,...)$.
````


````{prf:definition}
:label: def11.2
We say that $\psi$ is a set function defined on $\Omega$ if $\psi$ assigns to each $A\in \Omega$ a number of the extended real system. The set function $\psi$ is additive if $\psi(A+B)=\psi(A) + \psi(B)$ for $A\cap B = 0$ and $\psi$ is countably additive if $\psi(\cup_{n=1}^{\infty} A_n)=\sum_{n=1}^{\infty} \psi(A_n)$ for $A_j \cap A_i = 0$ ($i\ne j$).
````

## Construction of the Lebesgue measure
````{prf:definition}
:label: def11.3
An interval in $\mathbb{R}^p$ is defined as the set of points $x=(x_1,...,x_p)$ such that $a_i\le x_i \le b_i$. If $A$ is the union of a finite number of intervals, $A$ is said to be an elementary set. If an interval is denoted by $I$, then $A = \cup_{i=1}^n I_i$. We define a set function $m(I) = \prod_{i=1}^n (b_i-a_i)$. If $I_i$ are disjoint intervals, then $m(A) = \sum_{i=1}^n m(I_i)$.
````


- The collection $\Omega$ of all elementary subsets of $\mathbb{R}^p$ is a ring. The set function $m$ is additive on $\Omega$.
- If $A\in \Omega$, $A$ is the union of a finite number of disjoint intervals.


````{prf:definition}
:label: def11.4
A non-negative additive set function $\psi$ on $\Omega$ is said to be regular if for every $\epsilon>0$ and every $A\in \Omega$ there exist sets $F, G\in \Omega$ such that $F$ is closed, $G$ is open, $F\subset A \subset G$, and $\psi(F)+\epsilon \ge \psi(A) \ge \psi(G) - \epsilon$.
````


- $m$ is regular


 Every regular set function can be extended to a countably additive set function on a $\sigma$-ring which contains $\Omega$.


````{prf:definition}
:label: def11.5
Let $\mu$ be a non-negative, additive, finite, regular on $\Omega$ and $A_n$ is a countable open cover of a set $E\in \mathbb{R}^p$ such that $E\subset \cup_{n=1}^\infty A_n$. Define $\mu^*(E) = \inf\sum_{n=1}^\infty \mu(A_n)$. $\mu^*(E)$ is called the outer measure of $E$.
````

````{prf:theorem}
:label: thm11.1
For every $A\in \Omega$, $\mu^*(A) = \mu(A)$. If $E=\cup_{n=1}^\infty E_n$, then $\mu^*(E) \le \sum_{n=1}^\infty \mu^*(E_n)$.
````


- If a sequence $A_n$ of elementary sets such that $A_n\to A$, we say $A$ is finitely $\mu$-measurable  and write $A\in \mathbb{R}_F(\mu)$
- If $E$ is the union of a countable collection of finitely $\mu$-measurable sets, we say that $E$ is $\mu$-measurable and write $E\in \mathbb{R}(\mu)$.
- $\mathbb{R}(\mu)$ is $\sigma$-ring and $\mu^*$ is countable additive on $\mathbb{R}(\mu)$.


 Thus, $\mu$, originally an additive set function defined on a ring $\Omega$, is extended to a countably additive set function on the $\sigma$-ring $\mathbb{R}(\mu)$. If $\mu = m$, it is called Lebesgue measure.

## Measurable spaces
````{prf:definition}
:label: def11.6
A set $X$ is said to be a measure space if there exists a $\sigma$-ring $\mathbb{R}$ of subsets of $X$ and a non-negative countably additive set function $\mu$ on $\mathbb{R}$.
````

````{prf:definition}
:label: def11.7
A function $f$ defined on a measurable space $X$ is said to be a measurable function if the set $\{x: f(x)>a\}$ is measurable for every real $a$.
````


- If $f$ is measurable, then $|f|$ is measurable.
- If $f_n$ is a sequence of measurable functions, then $g = \sup f_n(x)$ and $h=\lim\limits_{n\to \infty} \sup f_n(x)$ are measurable functions.
- If $f$ and $g$ are measurable, then $f+g$, $fg$, $max(f,g)$ and $min(f,g)$ are measurable
- If $f$ is measurable, then $f^+=max(f,0)$ and $f^-= -min(f,0)$ are measurable.
- The limit of a convergent sequence of measurable functions is measurable.


````{prf:definition}
:label: def11.8
A simple function $s$ is a finite linear combination of indicator functions $s(x) = \sum_{i=1}^n C_i I_{(x\in E_i)}$.
````

````{prf:theorem}
:label: thm11.2
$f$ is a real function on $X$. There exists a sequence of simple functions such that $s_n(x)\to f(x)$ as $n\to \infty$, for every $x\in X$. If $f$ is measurable, $\{s_n(x)\}$ can be chosen to be a sequence of measurable functions. If $f\ge0$, $\{s_n(x)\}$ can be chosen to be a sequence of monotonically increasing measurable functions.
````

## Integration

````{prf:definition}
:label: def11.9
If $f$ is a measurable and non-negative, we define $\int_E fd\mu = \sup I_E(s)$, where $\sup$ is taken over all simple measurable functions $s$ such that $0\le s\le f$.
````

````{prf:definition}
:label: def11.10
If $f$ is measurable, then $\int_E fd\mu = \int_E f^+d\mu - \int_E f^-d\mu$. If both integrals on the right side of the equation are finite, we say that $f$ is integrable on $E$ in the Lebesgue sense with respect to $\mu$. 
````

````{prf:theorem} Lebesgue monotone convergence theorme
:label: thm11.3
$\{f_n\}$ is a sequence of monotonically increasing non-negative measurable functions $0\le f_1\le f_2\le ...$ and $f_n\to f$, then $\int_E f_n d\mu \to \int_E fd\mu$.
````

````{prf:theorem} Fatou's theorem
:label: thm11.4
If $f_n$ is a sequence of non-negative measurable functions. If $f=\liminf\limits_{n\to \infty} f_n$, then $\int_E fd\mu \le \liminf\limits_{n\to \infty} \int_E f_nd\mu$.
````

````{prf:theorem} Lebesgue dominated convergence theorem
:label: thm11.5
$f_n$ is a sequence of measurable functions such that $f_n\to f$. If there exists an integrable function $g$ such that $|f_n|\le g$, then $\int_E f_nd\mu \to \int_E fd\mu$.
````

