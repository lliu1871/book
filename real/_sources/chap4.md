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

# Chapter 4: Sequences and Series

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Sequence](https://en.wikipedia.org/wiki/Sequence)
```

A sequence is a set of indexed elements. For example, a sequence of numbers $\{a_1,a_2,a_3,...\}$ or a sequence of functions $\{f_1(x), f_2(x), f_3(x),...\}$. We are interested in the pattern and convergnece properties of a sequence. A formal definition of a sequence is to consider a sequence as a function.

````{prf:definition} sequence
:label: def4.1
A sequence in a metric space $(X,d)$ is a function $a : \mathbb{N} \rightarrow X$.
````

## Convergent sequences

````{prf:definition} convergence of a sequence of numbers
:label: def4.2
A sequence $\{p_n\}$ in a metric space $(X,d)$ converges to a
point $p \in X$ if for every $\epsilon>0$, there is an integer $N$ such that $n \ge N$ implies $d(p_n, p) < \epsilon$. We write $\lim\limits_{n\to \infty}p_n=p$. The point $p$ is the **limit** of $\{p_n\}$.
````
````{prf:remark}
:label: rem4.1
The definition is applicable for any metric space. For example, $\mathbb{R}$ and $\mathbb{R}^k$ are metric spaces. 
````

### Properties
This definition implies that a sequence of numbers converges to a point $c$ if the neighborhood of the point $c$ covers all but finitely many elements of the sequence.

````{prf:proposition}
:label: pro4.1
A sequence $\{p_n\}$ converges to a point $p\in X$ if and only if every neighborhood of $p$ contains $p_n$ for all but finitely many $n$.
````
-   If $\{p_n\}$ converges, then its limit is **unique**.
-   If $\{p_n\}$ converges, then $\{p_n\}$ is **bounded**.
-   If $p$ is a limit point of $X$, then there is a sequence $\{p_n\}$ in $X$ such that $p = \lim\limits_{n\to \infty}p_n$.

````{prf:proposition}
:label: pro4.2
Let $\{a_n\}$ and $\{b_n\}$ be two sequences in a metric space $(X,d)$ and $c\in \mathbb{R}$ is a real number. If $a_n\to a$ and $b_n\to b$, then $a_n+b_n\to a+b$ and $ca_n\to ca$ .
````

````{prf:theorem} convergence of a sequence of vectors
:label: thm4.1
A sequence of vectors $X_n=(x_{1,n},...,x_{k,n})$ in $\mathbb{R}^k$ converges to a vector $X=(x_1,...,x_k)$ in $\mathbb{R}^k$ if and only if
$\lim\limits_{n\to \infty} x_{j,n} = x_j$ for $1\le j \le k$.
````

````{prf:corollary}
:label: cor4.1
$X_n$ and $Y_n$ are two sequences of vectors in $\mathbb{R}^k$ and $a_n$ is a
sequence of real numbers. Suppose $X_n \to X$, $Y_n \to Y$, and
$a_n \to a$, then $X_n + Y_n \to X+Y$, $X_n \cdot Y_n \to X\cdot Y$, and $a_nX_n \to aX$.
````

````{prf:theorem} Comparison Theorem
:label: thm4.2
If $x_n \to x$ and $y_n \to y$ and $x_n \le y_n$ for
$n \ge N_0$ then $x \le y$.
````

````{prf:theorem} Squeeze Theorem
:label: thm4.3
Suppose $\{x_n\}$, $\{y_n\}$ and $\{z_n\}$ are real sequences. If $x_n \to x$ and $y_n \to x$ and $x_n \le z_n \le y_n$ for all $n\in \mathbb{N}$ then $z_n \to x$ as
well. If $x_n \to 0$ and $\{y_n\}$ is bounded then $x_ny_n \to 0$ as well.
````

## Monotone sequences
````{prf:definition}
:label: def4.3
A sequence an is increasing, if $a_n\le a_{n+1}$ for all $n \ge N$.
A sequence an is decreasing, if $a_n\ge a_{n+1}$ for all $n \ge N$.
A sequence is a monotone sequence if it is either an increasing sequence or a decreasing sequence.
````

````{prf:theorem}
:label: thm4.4
A bounded monotone sequence converges.
````


## Subsequences

````{prf:definition} subsequence
:label: def4.4
Given a sequence $\{p_n\}$, consider a sequence $\{n_k\}$ of positive
integers such that $n_1<n_2<n_3...$. Then the sequence $\{p_{n_i}\}$ is
called a subsequence of $\{p_n\}$. If $\{p_{n_i}\}$ converges, its limit
is called a subsequential limit of $\{p_n\}$.
````

- $\{p_n\}$ converges $p$ if and only if every subsequence of
$\{p_n\}$ converges to $p$.
- If $\{p_n\}$ is a sequence in a compact metric space $X$, then some subsequence of $\{p_n\}$ converges to a point of $X$.

````{prf:proposition}
:label: pro4.
Every sequence has a monotone subsequence.
````

````{prf:proof}
Given $\{x_n\}$ say $x_m$ is a “peak” if $x_n \le x_m$ for all $n > m$.

Case 1: $\{x_n\}$ has infinitely many peaks. List them: $x_{m_1} , x_{m_2} , \dots$ This is decreasing subsequence.

Case 2: $\{x_n\}$ has finitely many peaks. Let $x_{n_1}$ be past the last peak. This point is not a peak so there is a $n_2 > n_1$ so that $x_{n_2} > x_{n_1}$ . But $x_{n_2}$ is not a peak either
so there is a $n_3 > n_2$ so that $x_{n_3} > x_{n_2}$ . Continuing in this inductively gives an increasing sequence.
````

````{prf:theorem} Bolzano-Weierstrass
:label: thm4.5
Every bounded sequence contains a convergent subsequence.
````

The subsequential limits of $\{p_n\}$ in a metric space $X$ form a
closed subset of $X$.

## Cauchy sequences

````{prf:definition} Cauchy sequence
:label: def4.5
A sequence $\{p_n\}$ in a metric space $X$ is said to be a Cauchy
sequence if for every $\epsilon>0$ there is an integer $N$ such that
$d(p_n,p_m)<\epsilon$ if $n\ge N$ and $m\ge N$.
````

-   In any metric space $X$, every convergent sequence is a Cauchy
    sequence.
-   If $X$ is a compact metric space, then every Cauchy sequence is a
    convergent sequence.
-   In $\mathbb{R}^k$, every Cauchy sequence converges.

````{prf:definition} contractive sequence
:label: def4.6
A sequence $x_n$ is contractive if there is a $c \in (0,1)$ such that
$|x_{k+1}-x_k|\le c|x_k - x_{k-1}|$ for all $k>1$. $c$ is called the contraction constant.
````
````{prf:theorem} sequence contraction theorem
:label: thm4.6
If a sequence is contractive, then it converges.
````

````{prf:definition} completeness
:label: def4.7
A metric space in which every Cauchy sequence converges is said to be
complete.
````


````{prf:definition} set diameter
:label: def4.8
$E$ is a subset of a metric space $X$. Let $S$ be the set of $d(p,q)$
with $p,q\in E$. The $\sup S$ is called diameter of $E$.
````

````{prf:theorem} convergence of a sequence of sets
:label: thm4.7
If $k_n$ is a sequence of compact sets in a metric space $X$ such that
$k_{n+1}\subset k_n$ and if $\lim_{n\to \infty} d(k_n)=0$, where $d(k_n)$
is the diameter of set $k_n$, then $\cap_1^{\infty}k_n$ consists of
exactly one point.
````

## Upper and lower limits
Checking the convergence of a sequence can be challenging due to the dependence of the convergence definition on the point to which it converges. To address this challenge, the introduction of upper and lower limits can be helpful. These limits always exist in a complete space, and the sequence converges if the upper and lower limits are equal to each other.

````{prf:definition} limit inferior and superior
:label: def4.9
The limit inferior and superior of a sequence $x_n$ is defined by
$\liminf\limits_{x \to \infty} x_n = \lim\limits_{n \to \infty} \bigg(\inf\limits_{m>n}x_m\bigg)$
and $\limsup\limits_{x \to \infty} x_n = \lim\limits_{n \to \infty} \bigg(\sup\limits_{m>n}x_m\bigg)$.
````

If the sequence $\{x_n\}$ consists of real numbers, then both the limit superior, $\limsup\limits_{n\to \infty }x_{n}$, and the limit inferior, $\liminf\limits_{n\to \infty }x_{n}$, always exist, as real numbers form a complete set.

The limit superior of the sequence $x_{n}$ is the smallest real number $b$ such that, for any positive real number $\varepsilon$, there exists a natural number $N$ such that $x_{n}<b+\varepsilon$ for all $n>N$. In other words, any number larger than the limit superior serves as an eventual upper bound for the sequence, and only a finite number of elements in the sequence exceed $b+\varepsilon$.

The limit inferior of the sequence $x_{n}$ is the largest real number $b$ such that, for any positive real number $\varepsilon$, there exists a natural number $N$ such that $x_{n}>b-\varepsilon$ for all $n>N$. In other words, any number below the limit inferior serves as an eventual lower bound for the sequence, and only a finite number of elements in the sequence are less than $b-\varepsilon$.

````{prf:theorem}
Let $\{x_n\}$ be a sequence.
1. There are subsequences of $\{x_n\}$ converging to $\liminf\limits_{n\to \infty }x_{n}$ and $\limsup\limits_{n\to \infty }x_{n}$.
2. If $\alpha$ is an accumulation point of $\{x_n\}$, then $\liminf\limits_{n\to \infty }x_{n} \le \alpha \le \limsup\limits_{n\to \infty }x_{n}$.
3. $\liminf\limits_{n\to \infty }x_{n} = \limsup\limits_{n\to \infty }x_{n}$ iff $\{x_n\}$ converges.
````

````{prf:definition} subsequenctial limit of a sequence
:label: def4.10
A real number $\eta$ is a subsequential limit of a sequence $(x_{n})$ if
there exists a strictly increasing sequence of natural numbers $(n_{k})$
such that $\eta =\lim\limits_{k\to \infty }x_{n_{k}}$.
````

If $E\subset {\overline {\mathbb {R} }}$ is the set of all subsequential
limits of $(x_{n})$, then $\limsup\limits_{n\to \infty }x_{n}=\sup E$
and $\liminf\limits_{n\to \infty }x_{n}=\inf E.$

## Series

````{prf:definition} series
:label: def4.11
Given a sequence $\{a_n\}$, the sequence of partial sums
$s_n=\sum_{k=0}^n a_k$ is called a series.
````

````{prf:theorem} Cauchy
:label: thm4.8
A series $\sum_{k=0}^{\infty} a_k$ converges if and only if for every
$\epsilon>0$ there is an integer $N$ such that $|\sum_{k=n}^m a_k|\le \epsilon$ if $m\ge n\ge N$.
````

-   If $\sum_{k=0}^{\infty} a_k$ converges, then
    $\lim\limits_{n\to \infty} a_n = 0$.

-   A series of non negative terms converges if and only if the series
    is bounded.

-   If $|a_n| \le c_n$ for $n\ge N_0$ where $N_0$ is some fixed integer,
    and if $\sum_{n=0}^{\infty} c_n$ converges, then
    $\sum_{n=0}^{\infty} a_n$ converges.

````{prf:theorem} root test
:label: thm4.9
Given $\sum_{n=0}^{\infty} a_n$, let $\alpha=\limsup\limits_{n\to \infty} \sqrt[n]{|a_n|}$. Then, $\sum_{n=0}^{\infty} a_n$ converges if $\alpha<1$.
````

````{prf:theorem} ratio test
:label: thm4.10
$\sum_{n=0}^{\infty} a_n$ converges if $\limsup\limits_{n\to \infty} |a_{n+1}/a_n|<1$.
````

-   If $\sum_{n=0}^{\infty} a_n = A$ and $\sum_{n=0}^{\infty} b_n = B$,
    then $\sum_{n=0}^{\infty}(a_n+b_n) = A+B$ and
    $\sum_{n=0}^{\infty} (ca_n) = cA$.

````{prf:definition} power series
The series $\sum_{n=0}^{\infty} c_n z^n$, where $\{c_n\}$ and $\{z_n\}$
are complex numbers, is called a power series.
````

The series $\sum_{n=0}^{\infty} c_n z^n$ converges if $|z|<\frac{1}{\limsup\limits_{n\to \infty} \sqrt[n]{|c_n|}}$.

The partial sums $A_n$ of $\sum_{n=0}^{\infty} a_n$ is a bounded sequence and $b_0\ge b_1\ge...$ with $b_n \to 0$. Then $\sum b_na_n$ converges.

````{prf:definition} absoluate convergence
:label: def4.12
A series $\sum_{n=0}^{\infty} a_n$ is said to converge absolutely if the
series $\sum_{n=0}^{\infty} |a_n|$ converges.
````

````{prf:theorem}
:label: thm4.11
The series $\sum_{n=0}^{\infty} a_n$ converges absolutely to $A$ and the
series $\sum_{n=0}^{\infty} b_n$ converges to $B$. Then the series
$\sum_{n=0}^{\infty} c_n$ converges to $AB$, in which
$c_n=\sum_{k=0}^n a_kb_{n-k}$.
````

````{prf:theorem}
:label: thm4.12
If $\sum_{n=0}^{\infty} a_n$ is a series of complex numbers which converges absolutely, then every rearrangement of $\sum_{n=0}^{\infty} a_n$ converges to the same sum.
````

