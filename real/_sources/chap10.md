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

# Chapter 10: Functions of several variables

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

## Linear transformations
````{prf:definition} linear combination
:label: def10.1
A set $X\subset R^n$ is a vector space if $x+y\in X$ and $cx\in X$ for all $x,y\in X$ and for all scalars $c$. If $x_1,...,x_k\in X$ and $c_1,...,c_k$ are scalars, the vector $c_1x_1+...+c_kx_k$ is called a **linear combination** of $x_1,...,x_k\in X$. If $S\subset R^n$ and $E$ is the set of all linear combinations of elements of $S$, we say that $S$ spans $E$ or that $E$ is the span of $S$. Every span is a vector space. 
````

````{prf:definition} independent vectors
:label: def10.2
The vectors $\{x_1,...,x_k\}$ are said to be independent if $c_1x_1+c_2x_2+...+c_kx_k=0$ implies $c_1=c_2...=c_k=0$.
````

````{prf:definition} basis
:label: def10.3
An independent subset of a vector space $X$ which spans $X$ is called a basis of $X$.
````

````{prf:definition} linear transformation
:label: def10.4
A mapping $A$ of a vector space $X$ into a vector space $Y$ is said to be linear transformation if $A(x_1+x_2)=A(x_1)+A(x_2)$ and $A(cx)=cA(x)$ for all $x,x_1,x_2\in X$ and all scalars $c$.
````

````{prf:definition} linear operator
:label: def10.5
Linear transformation of $X$ into $X$ is called linear operators on $X$. If $A$ is a linear operator on $X$ which is 1-1 and onto $X$, we say that $A$ is invertible.
````

````{prf:definition} norm of a linear transformation
:label: def10.6
The norm $\|A\|$ of a linear transformation $A$ is defined as the sup of all numbers $|Ax|$, where $x$ ranges over all vectors in $R^n$ with $|x|\le 1$.
````


- $|Ax|\le \|A\||x|$
- $\|A\| < \infty$ and $A$ is a uniformly continuous mapping of $R^n$ into $R^m$.
- If $A$ and $B$ are linear transformations and $c$ is a scalar, then $\|A+B\| \le \|A\|+\|B\|$, \|cA\|=|c|\|A\|. With the distance between $A$ and \|B\| defined as $\|A-B\|$, $L(R^n, R^m)$ is a metric space. 
- $\|AB\|\le \|A\|  \|B\|$.

## Differentiation of multivariate functions
Consider a vector-valued function $\mathbf{f}=(f_1,...,f_k)$ mapping
$[a,b]$ into $\mathbb{R}^m$. $\mathbf{f}'(x)$ is the derivative at $x$ if there exists a point $\mathbf{f}'(x)$ in $\mathbb{R}^k$ such that

$$\lim\limits_{h\to 0}\frac{|\mathbf{f}(x+h)-\mathbf{f}(x)-\mathbf{f}'(x)h|}{|h|}=0$$


````{prf:definition} derivative of multivariate functions
:label: def10.7
Suppose $E$ is an open subset of $\mathbb{R}^n$, $\mathbf{f}$ is a mapping of $E$ into $\mathbb{R}^m$, and $\mathbf{x}\in E$. If there
exists a linear transformation $\mathbf{A}$ of $\mathbb{R}^n$ into $\mathbb{R}^m$ such that

$$\lim\limits_{\mathbf{h}\to 0}\frac{|\mathbf{f}(\mathbf{x}+\mathbf{h})-\mathbf{f}(\mathbf{x})-\mathbf{A}\mathbf{h}|}{|\mathbf{h}|}=0$$

then we say that $\mathbf{f}$ is differentiable at $\mathbf{x}$ and write $\mathbf{f}'(x)=\mathbf{A}$. If $\mathbf{f}$ is differentiable at eveary $\mathbf{x}\in E$, we say that $\mathbf{f}$ is differentiable in $E$.
````

````{prf:theorem}
:label: thm10.1
$f$ is a continuous mapping of $[a,b]$ into $\mathbb{R}^k$ and
$f$ is differentiable in $(a,b)$. Then there exists
$x\in (a,b)$ such that $|f(b)-f(a)| = |f'(x)|(b-a)$.
````

The derivative defined is often called the differential
of $\mathbf{f}$ at $\mathbf{x}$, or the total derivative of $\mathbf{f}$ at $\mathbf{x}$, to distinguish it from the partial derivatives that will occur later.


````{prf:theorem} chain rule
:label: thm10.2
Suppose $\mathbf{f}$ is a mapping of an open subset $E\subset \mathbf{R}^n$ into $\mathbf{R}^m$ and $\mathbf{g}$ is a mapping of an open subset $W\subset \mathbf{R}^k$ into an open subset of $E$. Suppose $\mathbf{f}$ is differentiable at a point $\mathbf{g(x_0)}\in E$ and $\mathbf{g}$ is differentiable at the point $x_0\in W$. Then, the function $F$ defined as $\mathbf{F}=\mathbf{f}\circ \mathbf{g}$ is a mapping of $W$ into $\mathbf{R}^m$, and it is differentiable at $x_0$ and 

$$\mathbf{F}'=\mathbf{f}'(g(x_0))\mathbf{g}'(x_0)$$
````


## Contraction 
````{prf:definition} 
:label: def10.8
Let $(X,d)$ be a metric space, and $\phi$ maps $X$ into $X$. If there is a number $c < 1$ such that for all $x, y \in X$,

$$ d(\phi(x), \phi(y)) \le d(x, y),$$

then $\phi$ is said to be a contraction of $X$ into $X$.
````

````{prf:theorem} 
:label: thm10.3
If X is a complete metric space, and if $\phi$ is a contraction of X
into X, then there exists one and only one x E X such that $\phi(x) = x$.
````

## The inverse function theorem
````{prf:theorem} 
:label: thm10.4
Suppose $\mathbf{f}$ is a $\mathscr{C}'$-mapping of an open set $E \subset \mathbb{R}^n$ into $\mathbb{R}^n$, $\mathbf{f}'$
is invertible for some $a \in E$, and $b = \mathbf{f}(a)$. Then
1. there exist open sets $U,V\subset\mathbb{R}^n$ such that $a \in U$, $b \in V$, $\mathbf{f}$ is one-to-one on $U$, and $f(U) = V$;
2. if $\mathbf{g}$ is the inverse of $\mathbf{f}$ [which exists, by 1], defined in $V$ by $g(f(\mathbf{x})) = \mathbf{x}$ for all $\mathbf{x}\in U$, then $\mathbf{g} \in\mathscr{C}'(V)$ and $\mathbf{g}'(\mathbf{y})=(\mathbf{f}'(\mathbf{x}))^{-1}$.
````

````{prf:theorem} 
:label: thm10.5
$\mathbf{f}$ is a $\mathscr{C}'$-mapping of an open set $E \in \mathbb{R}^n$ into $\mathbb{R}^n$ and if $\mathbf{f}'(\mathbf{x})$ is invertible for every $\mathbf{x}\in E$, then $\mathbf{f}(W)$ is an open subset of $\mathbb{R}^n$ for every open set $W\subset E$. In other words, $\mathbf{f}$ is an **open mapping** of $E$ into $\mathbb{R}^n$.
````

## The implicit function theorem
Every $A \in L(R^{n+m}, R^n)$ can be split into two linear transformations $A_x$ and $A_y$, defined by 

$$A_xh = A(h, 0), A_yk = A(0, k)$$ 

for any $h\in\mathbb{R}^n, k \in \mathbb{R}^m$. Then $A_x\in L(\mathbb{R}^n), A_y\in L(\mathbb{R}^m, \mathbb{R}^n)$, and

$$A(h, k) = A_x h + A_yk.$$

````{prf:theorem}
If $A \in L(R^{n+m}, R^n)$ and if $A_x$ is invertible, then there corresponds to every $k \in R^m$ a unique $h \in R^n$ such that $A(h, k) = 0$. This $h$ can be computed from $k$ by the formula

$$h = -(A_x)^{-1}A_yk.$$
````


````{prf:theorem} The implicit function theorem
:label: thm10.6
Let $\mathbf{f}$ be a $\mathscr{C}'$-mapping of an open set $E \subset \mathbb{R}^{n+m}$ into $\mathbb{R}^m$, such
that $\mathbf{f}(a, b) = 0$ for some point $(a, b) \in E$.
Put $A = \mathbf{f}'(a, b)$ and assume that $A_x$ is invertible.
Then there exist open sets $U\subset \mathbb{R}^{n+m}$ and $W \subset \mathbb{R}^m$, with $(a, b) \in U$ and $b\in W$, having the following property:
1. To every $y\in W$ corresponds a unique $x$ such that
$(x, y) \in U$ and $\mathbf{f}(x, y) = 0$.
2. If this $x$ is defined to be $\mathbf{g}(y)$, then $\mathbf{g}$ is a $\mathscr{C}'$-mapping of $W$ into $\mathbb{R}^n$, $\mathbf{g}(b) = a$,
$\mathbf{f}(\mathbf{g}(y), y) = 0$ for all $y \in W$, and $\mathbf{g}'(b) = -(A_x)^{-1}A_y$
````

````{prf:example}
:label: exp10.
Consider the mapping $\mathbf{f} = (f_1,f_2)$ of
$R^5$ into $R^2$ given by

$f_1(x_1, x_2, y_1, y_2, y_3) = 2e^x_1 + x_2y_1 - 4y_2 + 3$\
$f_2(x_1, x_2, y_1, y_2, y_3) = x_2\cos x_1 - 6x_1 + 2y_1 - y_3$

If $a = (0, 1)$ and $b = (3, 2, 7)$, then $\mathbf{f}(a, b) = 0$.
With respect to the standard bases, 

$\mathbf{f}'=\begin{bmatrix} 2e^x_1& y_1& x_2& -4& 0\\-x_2\sin x_1-6& \cos x_1& 2& 0& -1\end{bmatrix}$

Thus, $\mathbf{f}'(a,b) = \begin{bmatrix}2&3&1&-4&0\\-6& 1& 2& 0& -1\end{bmatrix}$. Hence, $A_x = \begin{bmatrix} 2&3\\-6&1\end{bmatrix}$ and $A_y=\begin{bmatrix}1&-4&0\\2& 0& -1\end{bmatrix}$. 
We have $(A_x)^{-1}=\frac{1}{20}\begin{bmatrix}1&-3\\6&2\end{bmatrix}$. Thus, $\mathbf{g}'(3,2,7)=-\frac{1}{20}\begin{bmatrix}1&-3\\6&2\end{bmatrix}\begin{bmatrix}1&-4&0\\2& 0& -1\end{bmatrix}=\begin{bmatrix}1/4&1/5&-3/20\\-1/2& 6/5& 1/10\end{bmatrix}$.
````

## The rank theorem
````{prf:definition} 
:label: def10.9
Suppose $X$ and $Y$ are vector spaces, and $A \in L(X, Y)$. The null space of $A$, $\mathscr{N}(A)$, is the set of all $x \in X$ at which $Ax = 0$. 
````
- $\mathscr{N}(A)$ is a vector space in $X$.
- the range of $A$, $\mathscr{R}(A)$, is a vector space in Y.
- The rank of $A$ is defined to be the dimension of $\mathscr{R}(A)$.

````{prf:definition} projection
Let $X$ be a vector space. An operator $P\in L(X)$ is said to be a projection in $X$ if $P^2 = P$.
````

- If $P$ is a projection in $X$, then every $x \in X$ has a unique representation of the form $x=x_1+x_2$, where $x_1 \in \mathscr{R}(P)$ and $x_2 \in \mathscr{N}(P)$.
- If $X$ is a finite-dimensional vector space and if $X_1$ is a vector space in $X$, then there is a projection $P$ in $X$ with $\mathscr{R}(P) = X_1$.


````{prf:theorem} 
:label: thm10.7
Suppose $m, n, r$ are nonnegative integers, $m \ge r$, $n \ge r$, $F$ is a $\mathscr{C}'$-mapping of an open set $E \subset \mathbb{R}^n$ into $\mathbb{R}^m$, and $F'(x)$ has rank $r$ for every $x \in E$. Fix $a \in E$, put $A = F'(a)$, let $Y_1$ be the range of $A$, and let $P$ be a projection
in $R^m$ whose range is $Y_1$. Let $Y_2$ be the null space of $P$.
Then there are open sets $U,V\in\mathbb{R}^n$, with $a \in U$, $U\subset E$, and there is a
1-1 $\mathscr{C}'$-mapping of $V$ onto $U$ (whose inverse is also of class $\mathscr{C}'$-mapping's) such that

$$F(H(x)) = Ax + \phi(Ax)\ \ \ \forall x \in V$$

where $\phi$ is a $\mathscr{C}'$-mapping of the open set $A(V) \subset Y_1$ into $Y_2$.
````

## Determinant
````{prf:definition}
If $(j_1, ... , j_n)$ is an ordered $n$-tuple of integers, define
$s(j_1, ... , j_n) = \Pi_{p<q} \operatorname{sgn} (j_q - j_p)$,
where $\operatorname{sgn} x = 1$ if $x > 0$, $\operatorname{sgn} x = -1$ if $x < 0$, $\operatorname{sgn} x = 0$ if $x = 0$. Then $s(j_1,\dots ,j_n) = 1, -1, 0$, and it changes sign if any two of the $j$'s are interchanged.
````
Let $[A]$ be the matrix of a linear operator $A$ on $\mathbb{R}^n$, relative to the standard basis $\{e_1,\dots , e_n\}$, with entries $a(i,j)$ in the $i$th row and $j$th column. The **determinant**
of $[A]$ is defined to be the number

$$\det[A] = \sum s(j_1, ... , j_n)a(1,j_1)a(2,j_2)\dots a(n,j_n)$$

The sum extends over all ordered $n$-tuples of integers $(j_1, ... , j_n)$ with $1\le j_r\le n$.

````{prf:theorem}
$[A]$ and $[B]$ are $n$ by $n$ matrices, then
$\det([B][A]) = \det [B] \det [A]$.
````


## Derivatives of high order
````{prf:definition}
Suppose $f$ is a real function defined in an open set $E \subset \mathbb{R}^n$, with partial derivatives $D_1f, \dots , D_nf$. If the functions $D_if$ are themselves differentiable, then the second-order partial derivatives of $f$ are defined by
$D_{ij} = D_i D_jf (i,j = 1, \dots , n)$.
````


````{prf:theorem} 
:label: thm10.8
Suppose $f$ is defined in an open set $E \subset \mathbb{R}^2$ , and $D_1f$ and $D_{21}f$ exist at every point of $E$. Suppose $Q \subset E$ is a closed rectangle with sides parallel
to the coordinate axes, having $(a, b)$ and $(a +h, b + k)$ as opposite vertices $(h \ne 0, k \ne 0)$. Put $\Delta(f, Q) = f(a + h, b + k) - f(a + h, b) - f(a, b + k) + f(a, b)$.
Then there is a point $(x, y)$ in the interior of $Q$ such that
$\Delta(f, Q) = hk(D_{21}f)(x, y)$.
````


````{prf:theorem} 
:label: thm10.9
Suppose $f$ is defined in an open set $E \subset \mathbb{R}^2$, suppose that $D_1f$, $D_{21}f$, and $D_2f$ exist at every point of $E$, and $D_{21}f$ is continuous at some point $(a, b) \in E$.
Then $D_{12}f$ exists at $(a, b)$ and
$(D_{12}f)(a, b) = (D_{21}f)(a, b)$.
````

## Differentiation of integrals
Under what conditions on $\psi$ can we establish that the equation
$\frac{\partial}{\partial t}\int_a^b\psi(x,t)dx = \int_a^b \frac{\partial}{\partial t}\psi(x,t)dx$ holds.

````{prf:theorem} 
:label: thm10.10
Suppose that 1) $\psi(x, t)$ is defined for $x\in[a,b], t\in[c,d]$.
2) $\alpha$ is an increasing function on $[a, b]$;
3) $\psi^t\in \mathscr{R}(\alpha)$ for every $t \in [c, d]$;
4) $c < s < d$, and to every $\epsilon > 0$ corresponds a $\delta > 0$ such that $|(D_2\psi)(x, t) - (D_2\psi)(x, s)| < \epsilon$
for all $x \in [a, b]$ and for all $t \in (s - \delta, s + \delta)$.

Define $f(t) = \int_a^b\psi(x, t)d\alpha(x)\ \ \ (c\le t\le d)$. Then $(D_2\psi)^s\in \mathscr{R}(\alpha)$, $f'(s)$ exists, and

$$f'(s) = \int_a^b(D_2\psi)(x, s) d\alpha(x).$$
````

## Integral of multivariate functions

````{prf:definition} 
:label: def10.10
 Let $f_1,...,f_k$ be real
functions on $[a,b]$. $\mathbf{f}=(f_1,\dots,f_k)$ is the mapping of
$[a,b]$ into $R^k$. If $\alpha$ increases monotonically on $[a,b]$.
$\mathbf{f}$ is integrable if and only if $f_1,...,f_k$ are integrable
on $[a,b]$. If so, then we define

$$\int_a^b \mathbf{f}d\alpha = \bigg(\int_a^b f_1 d\alpha, ..., \int_a^b f_k d\alpha \bigg).$$
````

- $\int_a^b \mathbf{f}d\alpha = \mathbf{F}(b)-\mathbf{F}(a)$.
-   If $\mathbf{f}$ is integrable, then $|\mathbf{f}|$ is integrable,
and $|\int_a^b \mathbf{f} d\alpha |\le \int_a^b |\mathbf{f}| d \alpha$.

## Rectifiable curves
````{prf:definition} rectifiable curve
:label: def10.11
A continuous mapping $\gamma$ of $[a,b]$ into $R^k$ is called a curve in
$R^k$. If $\gamma$ is 1-1, it is called an arc. If
$\gamma(a)=\gamma(b)$, it is called a closed curve. Let $P$ be a
partition of $[a,b]$. We define

$$\Phi (P,\gamma) = \sum_{i=1}^n |\gamma(x_i)-\gamma(x_{i-1})|$$

$\Phi (P,\gamma)$ is the length of a polygonal path defined by the
partition $P$. We define the length of $\gamma$ by

$$\Phi (\gamma) = \sup \Phi (P,\gamma)$$

We say that $\gamma$ is rectifiable if $\Phi (\gamma) < \infty$.
````

If the derivative $\gamma'$ of the curve $\gamma$ is continuous, then
$\gamma$ is rectifiable, and $\Phi (\gamma) =\int_a^b |\gamma'(t)|dt$.

