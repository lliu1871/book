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
  display_name: R
  language: R
  name: ir
---

# Chapter 2: Banach spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Banach space](https://en.wikipedia.org/wiki/Banach_space)
```

````{prf:definition} Norm
A norm on a (real or complex) vector space $X$ is a real-valued function on $X$ whose value at an $𝑥∈𝑋$ is denoted by $\|𝑥\|$, which has the properties 
1. $\|𝑥\|\ge 0$ 
2. $\|𝑥\|=0$ if and only if $𝑥=0$ 
3. $\|𝑥+𝑦\|\le \|𝑥\|+\|𝑦\|$ 
````

- A norm on a vector space $X$ defines a metric $d$ on $X$ which is given by $𝑑(𝑥,𝑦)=\|𝑥−𝑦\|$.
- The norm is a continuous map from $X$ to $\mathbb{R}$.

````{prf:definition} normed space
A normed space $(𝑋,\|∙\|)$ is a vector space $X$ equipped with a norm.
````

````{prf:definition} Banach space
A Banach space is a complete normed space
````
- A subspace $Y$ of a Banach space $X$ is complete if and only if the set $Y$ is closed in $X$.

````{prf:definition} Schauder basis
If a normed space $X$ contains a sequence $\left\{e_1, \ldots, e_n\right\}$ with the property that for every $x \in X$ there is a unique sequence of scalars $\left\{a_n\right\}$ such that as $n \rightarrow$ $\infty$,

$$
\| x-\sum_{i=1}^n a_i e_i\| \rightarrow 0
$$

then $\left\{e_1, \ldots, e_n\right\}$ is called a Schauder basis (or basis) for $\mathrm{X}$
````
The series $\sum_{i=1}^{\infty} a_i e_i$ is called the expansion of $x$ with respect to $\left\{e_1, \ldots, e_n\right\}$ and we write

$$
x=\sum_{i=1}^{\infty} a_i e_i
$$


## Finite dimensional normed spaces
Every finite dimensional subspace Y of a normed space X is complete. In particular, every finite dimensional normed space is complete
Every finite dimensional subspace Y of a normel1 space X is closed in X

### Equivalent norms
A norm $\|\cdot\|$ on a vector space $X$ is said to be equivalent to a norm $\|\cdot\|_0$ on $\mathrm{X}$ if there are positive numbers $\mathrm{a}$ and $\mathrm{b}$ such that for all $x \in X$ we have

$$
a\| x\|_0 \leq\| x\| \leq b\| x\|_0
$$

Equivalent norms on $\mathrm{X}$ define the same topology for $\mathrm{X}$
On a finite dimensional vector space $X$, any norm $\|\cdot\|$ is equivalent to any other norm $\|\cdot \|_0$

## Compactness
````{prf:definition} compact metric space
A metric space X is said to be compact if every sequence in X has a convergent subsequence
````
A subset M of X is said to be compact if M is compact considered as a subspace of X, that is, if every sequence in M has a convergent subsequence whose limit is an element of M

A compact subset M of a metric space is closed and bounded, but converse is false
In a finite dimensional normed space X, any subset M c X is compact if and only if M is closed and bounded

Let X and Y be metric spaces and 𝑇:𝑋→𝑌 continuous mapping. Then the image of a compact subset M of X under T is compact


A continuous mapping T of a compact subset M of a metric space X into ℝ assumes a maximum and a minimum at some points of M


## Riesz Lemma
The Riesz lemma is the Banach-space substitute for one aspect of orthogonality in Hilbert apces. In a Hilbert spaces $Y$, given a non-dense subspace $X$, there is $y \in Y$ with $|y|=1$ and $\inf_{x \in X}|x-y|=1$, by taking $y$ in the orthogonal complement to $X$. Of course, this device is unavailable more generally.


````{prf:theorem} Riesz Lemma
For a non-dense subspace $X$ of a Banach space $Y$, given $r<1$, there is $y \in Y$ with $|y|=1$ and $\inf _{x \in X}|x-y| \geq r$.
````

````{prf:proof}
Take $y_1$ not in the closure of $X$, and put $R=\inf _{x \in X}\left|x-y_1\right|$. Thus, $R>0$. For $\varepsilon>0$, let $x_1 \in X$ be such that $\left|x_1-y_1\right|<R+\varepsilon$. Put $y=\left(y_1-x_1\right) /\left|x_1-y_1\right|$, so $|y|=1$. And

$$
\begin{gathered}
\inf _{x \in X}|x-y|=\inf _{x \in X}\left|x+\frac{x_1}{\left|x_1-y_1\right|}-\frac{y_1}{\left|x_1-y_1\right|}\right|=\inf _{x \in X}\left|\frac{x}{\left|x_1-y_1\right|}+\frac{x_1}{\left|x_1-y_1\right|}-\frac{y_1}{\left|x_1-y_1\right|}\right| \\
=\frac{\inf _{x \in X}\left|x-y_1\right|}{\left|x_1-y_1\right|} \geq \frac{R}{R+\varepsilon}
\end{gathered}
$$

By choosing $\varepsilon>0$ small, $R /(R+\varepsilon)$ can be made arbitrarily close to 1 .
````

```{code-cell}
library(plotrix)
plot(-2:2,-2:2,type="n",asp=1,xlab="",ylab="")
draw.circle(0,0,1,border="brown")
segments(-2,0,2,0)
segments(0,-2,0,2)
segments(sqrt(2)/2,0,sqrt(2)/2,sqrt(2)/2,col="red")
segments(0.5,0,sqrt(2)/2,sqrt(2)/2,col="blue")
x = sqrt(2)/2-0.5
y = sqrt(2)/2
segments(0,0,x/sqrt(x^2+y^2),y/sqrt(x^2+y^2),col="blue")
segments(x/sqrt(x^2+y^2),0,x/sqrt(x^2+y^2),y/sqrt(x^2+y^2),col="red")
text(0.8,0.3,label="R")
```

Riesz's lemma guarantees that for any given $0<\alpha<1$, every infinite-dimensional normed space contains a sequence $x_1, x_2, \ldots$ of (distinct) unit vectors satisfying $\left\|x_n-x_m\right\|>\alpha$ for $m \neq n$; or stated in plain English, these vectors are all separated from each other by a distance of more than $\alpha$ while simultaneously also all lying on the unit sphere. Such an infinite sequence of vectors cannot be found in the unit sphere of any finite dimensional normed space (just consider for example the unit circle in $\mathbb{R}^2$ ).
This sequence can be constructed by induction. Start by picking any element $x_1$ from the unit sphere. Pick $x_n$ from the unit sphere such that $d\left(x_n, Y_{n-1}\right)>\alpha$ for a constant $0<\alpha<1$, where $Y_{n-1}$ is the linear span of $\left\{x_1, \ldots, x_{n-1}\right\}$ and $d\left(x_n, Y\right)=\inf _{y \in Y}\left\|x_n-y\right\|$.
Clearly $x_1, x_2, \ldots$ contains no convergent subsequence and the non-compactness of the unit ball follows.


## Linear operators
````{prf:definition}
$X$ and $Y$ are vector spaces over the same field. The mapping $T: X \rightarrow Y$ is a linear operator if for all $x, y \in X$ and scalars $a$, $T(x+y)=Tx+Ty$ and $T(ax)=aTx$.
````

The null space (i.e., kernal) of $T$ is the set of all $x \in X$ such that $T x=0$, denoted by $\kappa(T)$

- The range $Y$ of $T$ is a vector space, and $\operatorname{dim} X \geq \operatorname{dim} Y$
- The null space is a vector space

````{prf:theorem}
Let $X, Y$ be vector spaces. Let $T: X \rightarrow Y$ be a linear operator. The inverse $T^{-1}: Y \rightarrow X$ exists if and only if $Tx=0$ indicates $x=0$
````

- If $T^{-1}$ exists, then $T^{-1}$ is a linear operator
- If $\operatorname{dim} X<\infty$, then the inverse $T^{-1}$ exists if and only - If $\operatorname{dim} X=\operatorname{dim} Y$

### Bounded linear operators
````{prf:definition} bounded linear operator
Let $X$ and $Y$ be normed spaces and $T: X \rightarrow Y$ a linear operator. The operator $T$ is said to be bounded if there is a real number $c$ such that for all $x \in X$,

$$
\| T x\| \leq c\| x\|
$$
````

- If a normed space $X$ is finite dimensional, then every linear operator on $X$ is bounded

````{prf:definition} norm of a bounded linear operator
If $T: X \rightarrow Y$ is a bounded linear operator, then we define the norm of T by

$$
\|T\|=\sup _{x \in X} \frac{\|T x\|}{\|x\|}
$$
````

Let $T$ be a bounded linear operator as defined. Then

$$
\| T\|=\sup _{x \in X, \|x\|=1}\| T x \|
$$


````{prf:definition} continuity
Let $T: X \rightarrow Y$ be any operator, not necessarily linear, where $X$ and $Y$ are normed spaces. The operator $T$ is continuous at an $x_0 \in X$ if for every $\epsilon>0$ there is a $\delta>0$ such that for all $x \in X$ satisfying ||$x-x_0||<\delta$,

$$
\|Tx-Tx_0 \|<\epsilon
$$  

$T$ is continuous if it is continuous at every $x \in X$
````

- A linear operator $T$ is continuous if and only if it is bounded
- If $T$ is continuous at a single point, it is continuous at all points

- Let $T$ be a bounded linear operator. Then $x_n \rightarrow x$ implies $T x_n \rightarrow T x$ 
- Let $\mathrm{T}$ be a bounded linear operator. The null space $\mathrm{N}(T)$ is closed 
- $T_1$ and $T_2$ are bounded linear operators. Then $\|T_1 T_2\|\leq\| T_1\|\ \|T_2\|$

### Extension of a linear operator
````{prf:definition}
Two operators are equal, $T_1=T_2$, if they have the same domain $X$ and $T_1 x=$ $T_2 x$ for all $x \in X$.
````

The restriction of an operator $T: X \rightarrow Y$ to a subset $B \subset X$ is denoted by $T|_B$, and is defined by $\left.T\right|_Bx=Tx$ for all $x \in B$.

````{prf:definition}
An extension of $T$ to a set $M \supset X$ is an operator $\tilde{T}: M \rightarrow Y$ such that $\left.\tilde{T}\right|_Xx=T x$ for all $x\in X$.
````

````{prf:theorem}
Let $T: D(T) \rightarrow Y$ be a bounded linear operator where the domain $D(T)$ is a subset of a normed space and $Y$ is a Banach space. Then $T$ has an extension 

$$\tilde{T}: \overline{D(T)} \rightarrow Y$$

where $\tilde{T}$ is a bounded linear operator with a norm $\|\tilde{T}\|=\| T \|$
````

## Linear functionals
````{prf:definition} linear functional
Let $V$ be a vector space over a field $\mathbb{F}$. A linear functional on $V$ is a linear map $T: V \rightarrow \mathbb{F}$. 
````


Let $L(V, \mathbb{F})$ be the set of all linear functionals on $V$. The set $L(V, \mathbb{F})$ forms a vector space, because $\alpha f_1+\beta f_2 \in L(V, \mathbb{F})$ for all $\alpha, \beta \in \mathbb{F}$ and all $f_1, f_2 \in L(V, \mathbb{F})$. Also, there is a unique linear functional on $V$, called the zero functional, which sends everything in $V$ to zero.

Let $X$ be a normed space over a field $\mathbb{F}$. A bounded linear functional $f$ is a linear operator $X \rightarrow \mathbb{F}$, and there exists a real number $c$ such that for all $x \in$ $X,|f(x)| \leq c\| x\|$.

````{prf:definition}
The norm of a bounded linear function $f$ is

$$
\|f\|=\sup _{x \in D(f), x \neq 0} \frac{|f(x)|}{\|x\|}
$$
````

## Dual space

````{prf:definition} dual space
Let $V$ be a vector space over a field $\mathbb{F}$. The algebraic dual space of $V$, denoted by $V^*$, is the space of all linear functionals on $V$, i.e., $V^*:=L(V, \mathbb{F})$.
````

Let $\left(v_1, \ldots, v_n\right)$ be a basis of the $n$-dimensional vector space $V$. For each $i=1, \ldots n$, define a linear functional $f_i: V \rightarrow \mathbb{F}$ by setting 

$$f_i\left(v_j\right)=\left\{\begin{array}{l}0, i \neq j \\ 1, i=j\end{array}\right.$$

Then $\left(f_1, \ldots, f_n\right)$ is a basis of $V^*$, called the **dual basis** of $\left(v_1, \ldots, v_n\right)$.

- If a vector space $V$ is finite-dimensional, then $\dim V=\dim V^*$
- If $f(v)=0$ for all $f \in V^*$, then $v=0$

````{prf:definition} second dual space
The algebraic dual $(X^*)^*$ of $X*$, whose elements are the linear functionals defined on $X^*$. We denote $(X^*)^*$ by $X^{**}$ and call it the second algebraic dual space of $X$.

````

### Isomorphism
````{prf:definition} isomorphism
Isomorphism is a bijective mapping of $X$ onto $\tilde{X}$ which preserves the structure of the space.
````

For example, an isomorphism $T$ of a metric space $X=(X, d)$ onto a metric space $\tilde{X}=$ $(\tilde{X}, \tilde{d})$ is a bijective mapping which preserves distance, that is, for all $x, y \in X$, $d(x, y)=\tilde{d}(T x, T y)$.


- An isomorphism T of a vector space onto a metric space is a bijective mapping which preserves two operations - addition and scalar multiplication
- An isomorphism is said to be **natural** if it can be written down without the choice of a basis
- If a vector space $X$ is isomorphic with a subspace of a vector space $Y$, we say that $X$ is **embeddable** in $Y$

### Canonical mapping of $V$ into $V^*$

Suppose $g$ is a function defined on $V^*$ by setting $g(f)=g_x(f)=f(x)$ for a $x \in V$. Then $g$ is a linear functional, i.e., $g \in V^{* *}$.

````{prf:definition}
To each $x \in V$ there corresponds a $g \in V^{* *}$. This defines a mapping $C: V \rightarrow$ $V^{* *}$, which is called the canonical mapping of $V$ into $V^{* *}$
````


The canonical mapping $C: V \rightarrow V^{* *}$ is injective, because the null space contains only the zero functional i.e., $f=0$. Since $C$ is linear, it is an isomorphism of $X$ onto the range $R(C) \subset V^{* *}$. Thus, $V$ is embeddable in $V^{**}$.

````{prf:definition} reflexive
If the canonical mapping $C: V \rightarrow V^{* *}$ is surjective (hence bijective), so that $R(C)=V^{* *}$, then $V$ is said to be algebraically reflexive.
````

The vector space $B(X, Y)$ of all bounded linear operators from a normed space $X$ into a normed space $Y$ is itself a normed space with norm defined by $\|T\|=\sup _{x \in X, \|x\|=1}\|T x\|$. If $Y$ is a Banach space, then $B(X, Y)$ is a Banach space.

Let $X$ be a normed space. Then the set of all bounded linear functionals on $X$ constitutes a normed space with norm defined by

$$
\|f\|=\sup _{x \in X, \| x\|=1}|f(x)|
$$

which is called the dual space of $X$ and is denoted by $X^{\prime}$. The dual space $X'$ of a normed space $X$ is a Banach space (whether or not $X$ is)
