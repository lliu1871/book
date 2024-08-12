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

# Chapter 8: Sequences of functions

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

## Pointwise convergence
````{prf:definition} pointwise convergence
:label: def8.1
$\{f_n\}$ is a sequence of functions defined on
a set $E$. If $\{f_n(x)\}$ converges for every $x\in E$, then we define
a function $f$ by $f(x)=\lim\limits_{n\to \infty} f_n(x)$ for $x\in E$. The function $f$ is the **limit function**.
````

The primary challenge that may arise involves ascertaining whether crucial properties of the functions $f_n$ such as continuity, differentiability, integrability, etc., are maintained under the limit operation. For instance, we aim to determine whether the limit function $f$ derived from the continuous functions ${f_n}$ remains continuous. This involves verifying if $\lim_{t\to x}f(t) = f(x)$, which can be expressed as:

$$
\lim_{t\to x}\lim_{n\to\infty}f_n(t) = \lim_{n\to\infty}\lim_{t\to x}f_n(t)
$$

Similar considerations arise for other fundamental inquiries such as differentiation and integrability. Therefore, the key question revolves around whether the sequence of limit operations is order-independent. As a general rule, interchanging limit operations can impact the final result.


````{prf:example}
:label: exp8.1
Let $s_{m,n}=\frac{m}{m+n}$ for $m=1,2,\dots$ and $n=1,2,\dots$. Then, $\lim_{m\to\infty}\lim_{n\to\infty}s_{m,n}=0$. If we change the order of two limits, we have $\lim_{n\to\infty}\lim_{m\to\infty}s_{m,n}=1$. 
````

````{prf:example}
:label: exp8.2
Let $f_n=\frac{x^2}{(1+x^2)^n}$. Note that $f_n$ are continuous functions. Consider the limit function $f(x)=\sum_{n=0}^{\infty}f_n$. When $x=0$, $f(0)=0$. When $x\ne 0$, $f(x)=1+x^2$. Thus, $f$ is not a continuous function. 
````

Pointwise convergence does not guarantee the ability to interchange the order of limits. We will now introduce a new mode of convergence (uniform convergence) that allows for the exchange of limit operations without altering the outcome.

## Uniform convergence
````{prf:definition} uniform convergence
:label: def8.2
$\{f_n\}$ is a sequence of functions defined on a
set $E$. $\{f_n(x)\}$ is said to converge uniformly on $E$ to a function
$f$ if for every $\epsilon>0$ there is an integer $N$ such that $n\ge N$
implies $|f_n(x)-f(x)|\le \epsilon$ for all $x\in E$.
````
Uniform convergence implies pointwise convergence, but pointwise convergence does not imply uniform convergence.

````{prf:proposition}
:label: pro8.1
$\{f_n(x)\}$ is uniformly convergent if and only if for every $\epsilon>0$ there is an integer $N$ such that $m,n\ge N$ and $x\in E$ implies $|f_n(x)-f_m(x)|\le \epsilon$ for all $x\in E$.
````

````{prf:theorem}
:label: thm8.1
Suppose $|f_n|\le M_n$. If $\sum M_n$ converges, then $\sum f_n$ uniformly converges.
````

### Uniform convergence and continuity
````{prf:theorem}
:label: thm8.2
$f_n$ is a sequence of continuous functions. Suppose $f_n$ converges uniformly to $f$, then $f$ is continuous.
````


````{prf:theorem}
:label: thm8.3
$\{f_n\}$ is a sequence of continuous functions on a compact set $E$,
which converges pointwise to a continuous function $f$. If
$f_n(x)\ge f_{n+1}(x)$ for all $x\in E$, $n=1,2,3...$. Then $f_n\to f$
uniformly.
````

### Uniform convergence and Integration
````{prf:theorem}
:label: thm8.4
$\{f_n\}$ is a sequence of integrable functions on $[a,b]$. If $f_n$
converges uniformly to $f$ on $[a,b]$, then

$$\lim\limits_{n\to \infty}\int_a^b f_nd\alpha = \int_a^b fd\alpha$$
````

### Uniform convergence and Differentiation
````{prf:theorem} 
:label: thm8.5
$\{f_n\}$ is a sequence of functions differentiable on $[a,b]$. If
$\{f'_n\}$ converges uniformly on $[a,b]$, then $\{f_n\}$ converges
uniformly to a function $f$ and
$f'(x)=\lim\limits_{n\to \infty} f'_n(x)$.
````

### Equicontinuous families of functions
It has been demonstrated that every bounded sequence of complex numbers includes a convergent subsequence. This raises the question of whether a similar property holds for sequences of functions. To refine this question, we will introduce two types of boundedness for a sequence of functions.

````{prf:definition}
$\{f_n\}$ is a sequence of functions defined on set $E$. $\{f_n\}$ is **pointwise bounded** if the sequence $\{f_n(x)\}$ is bounded for every $x\in E$, i.e., there exists a finite-valued function $\psi(x)$ defined on $E$ such that $|f_n(x)|\le \psi(x)$ for $x\in E$ and $n=1,2,\dots$.

$\{f_n\}$ is **uniformly bounded** if there exists a constant $M$ such that $|f_n(x)|\le M$ for $x\in E$ and $n=1,2,\dots$.
````

If $\{f_n\}$ is pointwise bounded on $E$ and $E_1$ is a countable subset of $E$, it is always possible to find a subsequence $\{f_{n_k}\}$ such that $\{f_{n_k}\}$ converges for every $x \in E$.

````{prf:theorem}
:label: thm8.6
If $\{f_n\}$ is a pointwise bounded sequence of complex functions on
a countable set $E$, then $\{f_n\}$ as a subsequence $\{f_{n_k}\}$ such that $\{f_{n_k}\}$ converges for every $x \in E$.
````

Nonetheless, in cases where ${f_n}$ constitutes a uniformly bounded sequence of continuous functions defined on a compact set $E$, the existence of a subsequence converging pointwise on $E$ is not guaranteed.
Moreover, every convergent sequence need not contain a uniformly convergent sequence.

````{prf:definition}
:label: def8.
A family $\mathfrak{F}$ of complex functions $f$ defined on a set $E$ in a metric space $X$ is said to be equicontinuous on $E$ if for every $\epsilon > 0$ there exists a $\delta > 0$ such that
$|f(x) - f(y)| < \epsilon$ whenever $d(x, y) < \delta$, $x,y \in E$, and $f\in \mathbb{F}$. Here $d$ denotes the metric of $X$.
````
It is clear that every member of an equicontinuous family is uniformly
continuous.

If $X$ is a metric space, $\mathscr{C}(X)$ is the set of all complex valued, continuous, bounded functions defined on $X$.

````{prf:theorem}
:label: thm8.7
If $K$ is a compact metric space, if $f_n \in \mathscr{C}(K)$ and if ${f_n}$ converges uniformly on $K$, then ${f_n}$ is equicontinuous on $K$.
````

````{prf:theorem}
:label: thm8.8
If K is compact, if $f_n \in \mathscr{C}(K)$ and if ${f_n}$ is
pointwise bounded and equicontinuous on K, then

1. ${f_n}$ is uniformly bounded on K,
2. ${f_n}$ contains a uniformly convergent subsequence.
````
### The Stone-Weierstrass theorem
````{prf:theorem} Stone-Weierstrass theorem
:label: thm8.9
If $f$ is a continuous complex function on
$[a,b]$, there is a sequence of polynomials $P_n$ such that
$\lim\limits_{n\to \infty}P_n(x)=f(x)$ uniformly on $[a,b]$. If $f$ is
real, then $P_n$ may be taken real.
````