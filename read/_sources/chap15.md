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

# Chapter 15: Hilbert Spaces

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


## Inner product
````{prf:definition} inner product
An inner product $\langle x, y\rangle$ on a vector space $X$ is a mapping of $X \times X$ into the scalar field $\mathbb{F}$ of $X$ such that for all $x, y, z \in X$ and scalars $\alpha\in \mathbb{F}$
1. $\langle x+y, z\rangle=\langle x, z\rangle+\langle y, z\rangle$
2. $\langle\alpha x, y\rangle=\alpha\langle x, y\rangle$
3. $\langle x, y\rangle=\overline{\langle y, x\rangle}$, (4) $\langle x, x\rangle \geq 0$ and $\langle x, x\rangle=0$ if and only if $x=0$
````

- An inner product on $X$ defines a norm on $X$ given by $\|x\|=\sqrt{\langle x, x\rangle}$
- A metric on $X$ is given by $d(x, y)=|| x-y||=\sqrt{\langle x-y, x-y\rangle}$
- A norm on an inner product space satisfies the parallelogram equality $\|x+y\|^2+|| x-y \|^2=2\left(\left.|| x\right|^2+|| y \|^2\right)$.

```{admonition} Important
If a norm does not satisfy the parallelogram equality, it cannot be obtained from an inner product by the use of ||$x||=\sqrt{\langle x, x\rangle}$
```

For a real inner product space we have $\langle x, y\rangle=\frac{1}{4}\left(\| x+y\|^2-\| x-y\|^2\right)$. For a complex inner product space we have the polarization identity

$$
\begin{gathered}
\operatorname{Re}\langle x, y\rangle=\frac{1}{4}\left(|| x+y\left\|^2-|| x-y\right\|^2\right) \\
\operatorname{Im}\langle x, y\rangle=\frac{1}{4}\left(|| x+i y\left\|^2-|| x-i y\right\|^2\right)
\end{gathered}
$$

```{admonition} Schwarz inequality
An inner product and the corresponding norm satisfy the Schwarz inequality

$$
|\langle x, y\rangle| \leq \|x\| \|y\| 
$$
where the equality sign holds if and only if $x$ and $y$ are linearly dependent.
```

```{admonition} Triangle inequality
$\|𝑥+𝑦\|\le\|𝑥\|+\|𝑦\|$ and the equality holds if and only if $𝑦=0$ or $𝑥=𝑐𝑦$ for $𝑐\in \mathbb{𝑅}^+$.
```


````{prf:definition}
An inner product space $\mathbb{X}$ is a vector space $X$ with an inner product $\langle 𝑥, 𝑦\rangle$ defined on $X$.
````
- An inner product space is a normed space, but the reverse is not true
- Hilbert spaces are the complete inner product spaces
- In an inner product space, if $𝑥_𝑛\rightarrow 𝑥$ and $𝑦_𝑛\rightarrow 𝑦$, then $⟨𝑥_𝑛,𝑦_𝑛 ⟩\rightarrow ⟨𝑥,𝑦⟩$.

````{prf:definition} isomorphism
An isomorphism $T$ of an inner product space $\mathbb{X}$ onto an inner product space $\tilde{\mathbb{X}}$ over the same field is a bijective linear operator $T: \mathbb{X} \rightarrow \tilde{\mathbb{X}}$ which preserves the inner product, that is, for all $x, y \in \mathbb{X}$,

$$\langle x, y\rangle=\langle T x, T y\rangle$$
````

````{prf:theorem} completion
For any inner product space $\mathbb{X}$ there exists a Hilbert space $\mathbb{H}$ and an isomorphism $A$ from $\mathbb{X}$ onto a dense subspace $𝑊\subset 𝐻$. The space $\mathbb{H}$ is unique except for isomorphisms.
````

- A subspace $Y$ of a Hilbert space $\mathbb{\mathbb{H}}$ is complete if and only if $Y$ is closed in $\mathbb{\mathbb{H}}$
- If $Y$ is finite dimensional, then $Y$ is complete
- If $\mathbb{\mathbb{H}}$ is separable, so is $Y$. More generally, every subset of a separable inner product space is separable

## Orthogonality
````{prf:definition}
An element $x$ of an inner product space $\mathbb{X}$ is said to be orthogonal to an element $y \in \mathbb{X}$ if $\langle x, y\rangle=0$. We write $x \perp y$.
````

### Set distance

````{prf:definition}
In a metric space $X$, the distance from an element $x \in X$ to a nonempty subset $M \subset X$ is defined to be

$$
\delta=\inf _{y \in M} d(x, y)
$$
````

Let $\mathbb{X}$ be an inner product space and $M \neq \emptyset$ is a convex subset which is complete. Then for every given $x \in \mathbb{X}$ there exists a unique $y \in M$ such that the distance from $x$ to $M$ is

$$
\delta=\|x-y\|
$$

### Direct sum

Let $Y$ be a complete subspace of an inner product space $\mathbb{X}$. For every $x \in \mathbb{X}$ there exists a unique $y \in Y$ such that the distance from $x$ to $Y$ is $\delta=\|x-y\|$. Moreover, $z=x-y$ is orthogonal to $Y$.

````{prf:definition}
A vector space $X$ is said to be the direct sum of two subspaces $Y$ and $Z$ of $X$,

$$
X = Y \oplus Z
$$

if each $x \in X$ has a unique representation $x=y+z$ for $y \in$ $Y$ and $z \in Z$. $Z$ is called algebraic complement of $Y$ in $X$.
````

Let $Y$ be a closed subspace of a Hilbert space $\mathbb{\mathbb{H}}$. The **orthogonal complement** $Y^{\perp}$ is a set of vectors orthogonal to $Y$, i.e., $Y^{\perp}=\{z \in \mathbb{\mathbb{H}} \mid z \perp Y\}$. The orthogonal complement $Y^{\perp}$ is a closed subspace of $\mathbb{\mathbb{H}}$.

### Projection
````{prf:definition}
If $Y$ is a closed subspace of a Hilbert space $\mathbb{\mathbb{H}}$, then $\mathbb{\mathbb{H}}=Y \oplus Y^{\perp}$. The projection map $P:\mathbb{\mathbb{H}}\rightarrow Y$ is defined by $x\mapsto y=Px$, where $y\in Y$ is called the projection of $x\in \mathbb{\mathbb{H}}$ on $Y$.
````

- $𝑃$ is a bounded linear operator
- $𝑃$ maps $\mathbb{\mathbb{H}}$ onto $𝑌$, $𝑌$ onto itself, $𝑌^\perp$ onto $\{0\}$
- $𝑃$ is idempotent, i.e., $𝑃^2=𝑃$
- $𝑌^\perp$ is the null space $ℵ(𝑃)$ of the projection $𝑃$ of $\mathbb{\mathbb{H}}$ onto $Y$

````{prf:definition} annihilator
The annihilator $M^{\perp}$ of a set $M \neq \emptyset$ in an inner product space $\mathbb{X}$ is a set $M^{\perp}=\{x \in \mathbb{X} \mid x \perp M\}$
````

- The annihilator $M^{\perp}$ is a closed vector space 
- $M \subset M^{\perp \perp}$.
- If $M$ is a closed subspace of a Hilbert space $\mathbb{\mathbb{H}}$, then $M=M^{\perp \perp}$
 
### Orthonormal sets
````{prf:definition}
An orthogonal set $M$ in an inner product space $\mathbb{X}$ is a subset $M \subset \mathbb{X}$ whose elements are pairwise orthogonal.
````

````{prf:definition}
An orthonormal set $M \subset \mathbb{X}$ is an orthogonal set in $\mathbb{X}$ whose elements have norm 1, that is, for all $x, y \in M,\langle x, y\rangle=\left\{\begin{array}{l}0 \text { if } x \neq y \\ 1 \text { if } x=y\end{array}\right.$
````

- If an orthonormal set $M$ is countable, it is also called an orthonormal sequence
- If $\left\{x_n\right\}$ is an orthogonal set, then ||$\sum_i x_i\left\|^2=\sum_i|| x_i\right\|^2$
- An orthonormal set is linearly independent

Let $\left\{e_k\right\}$ be an orthonormal sequence in an inner product space $\mathbb{X}$. Let $Y_n=$ span $\left\{e_k\right\}$ be the vector space spanned by the orthonormal sequence $\left\{e_k\right\}$. For any $x \in \mathbb{X}$, we define $y=\sum_{k=1}^n\left\langle x, e_k\right\rangle e_k$ and $z=x-y$. Then $z \perp y$ and $\|\left. x\right|^2=$ ||$y \|^2+\left.|| z\right|^2$. Thus for all $n$,

$$
\| z\|^2=\sum_{k=1}^n\left|\left\langle x, e_k\right\rangle\right|^2 \leq\|x\|^2
$$

```{admonition} Bessel inequality
Let $\left\{e_k\right\}$ be an orthonormal sequence in an inner product space $\mathbb{X}$. Then for every $x \in \mathbb{X}$, we have the Bessel inequality

$$
\sum_{k=1}^{\infty}\left|\left\langle x, e_k\right\rangle\right|^2 \leq \|x\|^2
$$
```

The inner products $\left\langle x, e_k\right\rangle$ are called the **Fourier coefficients** of $x$ with respect to the orthonormal sequence $\left\{e_k\right\}$.

```{admonition} Gram-Schmidt process
The Gram-Schmidt process for orthonormalizing a linearly independent sequence $\left\{x_n\right\}$ in an inner product space. Note that $n$ may be infinity. The resulting orthonormal sequence $\left\{e_n\right\}$ has the property that for every $k \leq n$, $\operatorname{span}\left\{e_k\right\}=\operatorname{span}\left\{x_k\right\}$

1. $e_1=\frac{1}{\left\|x_1\right\|} x_1$
2. $e_2=\frac{1}{\left\|x_2-\left\langle x_2, e_1\right\rangle e_1\right\|} \left(x_2-\left\langle x_1, e_1\right\rangle e_1\right)$
3. $e_k=\frac{1}{\left\|x_k-\sum_{i=1}^{k-1}\left(x_k, e_i\right\rangle e_i\right\|}\left(x_k-\sum_{i=1}^{k-1}\left\langle x_k, e_i\right\rangle e_i\right)$
```

### Fourier series
````{prf:definition}
A trigonometric series is a series of the form

$$
a_0+\sum_{k=1}^{\infty}\left(a_k \cos (k t)+b_k \sin (kt)\right)
$$
````

A real-valued function $x$ on $\mathbb{R}$ is said to be **periodic** if there is a positive number $\mathrm{p}($ called a period of $X$ such that $x(t+p)=x(t)$ for all $t \in \mathbb{R}$

````{prf:definition} Fourier series
Suppose $x(t)$ is of period $2 \pi$ and continuous. Then, the Fourier series of $x(t)$ is the trigonometric series with coefficients $a_0=\frac{1}{2 \pi} \int_0^{2 \pi} x(t) d t, a_k=\frac{1}{\pi} \int_0^{2 \pi} x(t) \cos (k t) d t$, $b_k=\frac{1}{\pi} \int_0^{2 \pi} x(t) \sin (k t) d t$, where $\left\{a_k\right\}$ are called Fourier coefficients.
````

If the Fourier series of $x$ converges for each $t$ and has the sum $x(t)$, then we write

$$
x(t)=a_0+\sum_{k=1}^{\infty} \left(a_k \cos (k t)+b_k\sin(kt)\right)
$$

````{prf:theorem} convergence of Fourier series
Let $\left\{e_k\right\}$ be an orthonormal sequence in a Hilbert space $\mathbb{\mathbb{H}}$. Then the series $\sum_{k=1}^{\infty} \alpha_k e_k$ converges if and only if $\sum_{k=1}^{\infty}\left|\alpha_k\right|^2$ converges.
````

If $\sum_{k=1}^{\infty} \alpha_k e_k$ converges, then the coefficients $\alpha_k$ are the Fourier coefficients $\left\langle x, e_k\right\rangle$, where $x=\sum_{k=1}^{\infty} \alpha_k e_k$. Thus, 

$$x=\sum_{k=1}^{\infty}\left\langle x, e_k\right\rangle e_k$$

````{prf:theorem}
For any $x \in \mathbb{\mathbb{H}}$, the series $\sum_{k=1}^{\infty} \left\langle x, e_k\right\rangle e_k$ converges to $x$.
````

Any $x$ in an inner product space $\mathbb{X}$ can have at most countably many nonzero Fourier coefficients $\left\langle x, e_\kappa\right\rangle$ with respect to an orthonormal family $\left\{e_\kappa\right\}$ in $\mathbb{X}$.

### Hilbert dimension

````{prf:definition} total set
A total set (or fundamental set) in a normed space $X$ is a subset $M \subset X$ whose span is dense in $X$, i.e., $\overline{\operatorname{span}(M)}=X$
````

An orthonormal set in an inner product space $\mathbb{X}$ which is total in $\mathbb{X}$ is called a total orthonormal set in $\mathbb{X}$.

````{prf:theorem}
In every Hilbert space $\mathbb{\mathbb{H}} \neq\{0\}$ there exists a total orthonormal set.
````

````{prf:definition} Hilbert dimension
All total orthonormal sets in a Hilbert space $𝐻\ne\{0\}$ have the same cardinality, which is called the Hilbert dimension $\dim \mathbb{\mathbb{H}}$ of $\mathbb{H}$. 
````
- If $𝐻=\{0\}$ , $\dim \mathbb{H} = 0$.
- If a subset $M\subset \mathbb{X}$ is total in $\mathbb{X}$, then $M^{\perp}=\{0\}$
- If $\mathbb{X}$ is Hilbert, then $M$ is total if and only if $M^{\perp}=\{0\}$

````{prf:theorem}
An orthonormal set $M$ in a Hilbert space $\mathbb{H}$ is total if and only if for all $x \in \mathbb{H}$ the Parseval relation holds 

$$\sum_k\left|\left\langle x, e_k\right\rangle\right|^2=\|x\|^2$$
````

### Separability of Hilbert spaces
````{prf:definition}
A Hilbert space $\mathbb{H}$ is said to be separable if every orthonormal set in $\mathbb{H}$ is countable.
````
- If a Hilbert space $\mathbb{H}$ contains an orthonormal sequence which is total in $\mathbb{H}$, then $\mathbb{H}$ is separable

### Isomorphism
````{prf:definition}
An isomorphism of a Hilbert space $\mathbb{H}$ onto a Hilbert space $\widetilde{\mathbb{H}}$ over the same field is a bijective linear operator $T: \mathbb{H} \rightarrow \widetilde{\mathbb{H}}$ such that for all $x, y \in \mathbb{H}$,

$$
\langle T x, T y\rangle=\langle x, y\rangle
$$
````
- Two Hilbert spaces $\mathbb{H}$ and $\widetilde{\mathbb{H}}$, both real or both complex, are isomorphic if and only if they have the same Hilbert dimension.

## Polynomials

### Legendre polynomial
````{prf:definition}
The Legendre polynomial of order $n$ is defined over the interval $[-1,1]$ by

$$P_n(t)=\frac{1}{2^n n!} \frac{d^n}{d t^n}\left[\left(t^2-1\right)^n\right]$$
````
- $P_0(t)=1, P_1(t)=t, P_2(t)=\frac{1}{2}\left(3 t^2-1\right)$, and $\left\|P_n\right\|=\sqrt{\frac{2}{2 n+1}}$
- The Legendre polynomial is the solution to the Legendre differential equation $\left(1-t^2\right) P_n^{\prime \prime}-2 t P_n^{\prime}+n(n+1) P_n=0$
- The Legendre polynomial $\left\{P_n\right\}$ is an orthogonal sequence

````{prf:definition} $L^2[-1, 1]$
The inner product space $\mathbb{X}$ of all continuous real-valued functions on $[-1, 1]$ with inner product defined below is a Hilbert space, denoted by $L^2[-1, 1]$

$$
\langle x, y\rangle=\int_{-1}^1 x(t) y(t) d t
$$
````

- The polynomials $x_n(t)=t^n$ are linearly independent.
- Let $e_n(t)=\sqrt{\frac{2 n+1}{2}} P_n(t)$, where $P_n(t)$ is the Legendre polynomials. Then $\left\{e_n\right\}$ is the orthonormal sequence generated from polynomials $\left\{x_n\right\}$
- The orthonormal sequence $\left\{e_n\right\}$ is total in $L^2[-1,1]$
- A total orthonormal sequence in the space $L^2[a, b]$ is $\left\{q_n\right\}$, where $q_n=\frac{p_n}{\|p_n\|^{\prime}}$, $p_n(t)=P_n(s)$, and $s=1+2 \frac{t-b}{b-a}$
- The real space $L^2[a, b]$ is separable

### Hermite polynomial
````{prf:definition}
The Hermite polynomial of order $\mathrm{n}$ is defined over the interval $[-\infty, \infty]$ by 

$$H_n(t)=(-1)^n e^{t^2} \frac{d^n}{t^n}\left(e^{-t^2}\right)$$
````

- $H_0(t)=1, H_1(t)=2 t, H_2(t)=4 t^2-2$
- The Hermite polynomial is the solution to the Hermite differential equation $H_n^{\prime \prime}(t)-2 t H_n^{\prime}(t)+2 n H_n=0$

````{prf:definition}
The inner product space $\mathbb{X}$ of all continuous real-valued functions on $[-\infty, \infty]$ with inner product defined below is a Hilbert space, denoted by $L^2[-\infty, \infty]$

$$
\langle x, y\rangle=\int_{-\infty}^{\infty} x(t) y(t) dt
$$
````

- The polynomials $x_n(t)=e^{-t^2 / 2} t^n$ are integrable on $[-\infty, \infty]$ and are linearly independent
- Let $e_n(t)=\frac{1}{\left(2^n n ! \sqrt{\pi}\right)^{1 / 2}} e^{-t^2 / 2} H_n(t)$, where $H_n(t)$ is the Hermite polynomials. Then $\left\{e_n\right\}$ is the orthonormal sequence generated from polynomials $\left\{x_n\right\}$ 
- The orthonormal sequence $\left\{e_n\right\}$ is total in $L^2[-\infty, \infty]$ 
- $L^2[-\infty, \infty]$ is separable

### Laguerre polynomials
````{prf:definition}
The Laguerre polynomial of order $n$ is defined over $[0, \infty]$ by 

$$L_n(t)=\frac{e^t}{n !} \frac{d^n}{t^n}\left(t^n e^{-t}\right)$$ 
````
- $L_0(t)=1, L_1(t)=1-t, L_2(t)=1-2 t+$ $\frac{1}{2} t^2$
- The Laguerre polynomials are solutions of the Laguerre differential equation $t L_n^{\prime \prime}+(1-t) L_n^{\prime}+n L_n=0$

````{prf:definition}
The inner product space $\mathbb{X}$ of all continuous real-valued functions on $[0, \infty]$ with inner product defined below is a Hilbert space, denoted by $L^2[0, \infty]$

$$
\langle x, y\rangle=\int_{0}^{\infty} x(t) y(t) d t
$$
````

- The polynomials $x_n(t)=e^{-t / 2} t^n$ are integrable on $[0, \infty]$ and are linearly independent
- Let $e_n(t)=e^{-t / 2} L_n(t)$, where $L_n(t)$ is the Laguerre polynomials. Then $\left\{e_n\right\}$ is the orthonormal sequence generated from polynomials $\left\{x_n\right\}$
- The orthonormal sequence $\left\{e_n\right\}$ is total in $L^2[0, \infty]$ $L^2[0, \infty]$ is separable
- A total orthonormal sequence in $L^2[-\infty, b]$ and $L^2[a, \infty]$ can be obtained from the orthonormal sequence $e_n(t)=e^{-t / 2} L_n(t)$ in $L^2[0, \infty]$ by the transformations $t=b-s$ and $t=s+a$, respectively


## Hilbert-adjoint operator

````{prf:theorem} Riezs representation theorem
Every bounded linear functional $f$ on a Hilbert space $\mathrm{\mathbb{H}}$ can be represented in terms of the inner product $f(x)=\langle x, z\rangle$, where $z \in \mathbb{H}$ depends on $f$, is uniquely determined by $f$ and has norm $\|z\|=\|f\|$
````

- If $\left\langle v_1, w\right\rangle=\left\langle v_2, w\right\rangle$ for all $w\in\mathbb{X}$, then $v_1=v_2$. 
- If $(v, w)=0$ for all $w \in \mathbb{X}$, then $v=0$.

````{prf:definition} sesquilinear form
Let $X$ and $Y$ be vector spaces over the same field $K(\mathbb{R}, \mathbb{C})$. A sesquilinear form (i.e., sesquilinear functional) $S$ on $X \times Y$ is a mapping 

$$S:(X, Y) \rightarrow K$$ 

such that for all $x, x_1, x_2 \in X$ and $y, y_1, y_2 \in Y$ and scalars $\alpha, \beta \in K$, 

$$
\begin{multline}
S\left(x_1+x_2, y\right)=S\left(x_1, y\right)+S\left(x_2, y\right)\\
S\left(x, y_1+y_2\right)=S\left(x, y_1\right)+S\left(x, y_2\right)\\
S(\alpha x, y)=\alpha S(x, y)\\
S(x, \beta y)=\bar{\beta} S(x, y)
\end{multline}
$$
````

- The sesquilinear funtional $S$ is linear in the first argument and conjugate linear in the second one
- If it is a real field $K=\mathbb{R}$, the sesquilinear $\mathbb{H}$ is bilinear

````{prf:definition}
If $X$ and $Y$ are normed spaces and if there is a real number $c \in \mathbb{R}$ such that for all $x \in X$ and $y \in Y$, $S(x, y) \leq c\|x\|\|y\|$, then $S$ is said to be bounded, and the norm of $S$ is defined as

$$
\|S\|=\sup_{\|x\|=1,\|y\|=1}|S(x, y)|
$$
````

- If a sesquilinear form $S$ is bounded, then $|S(x, y)| \leq \|S\|\|x\|\|y\|$ for all $x \in X$ and $y \in Y$

````{prf:theorem}
Let $\mathbb{H}_1$ and $\mathbb{H}_2$ be Hilbert spaces. A bounded sesquilinear form $\mathbb{H}: H_1 \times H_2 \rightarrow K$ has a representation

$$
S(x, y)=\langle Tx, y\rangle
$$

where $T: H_1 \rightarrow H_2$ is a bounded linear operator. $T$ is uniquely determined by $S$ and has norm

$$
\|T\|=\|S\|
$$
````

````{prf:definition}
Let $T: \mathbb{H}_1 \rightarrow \mathbb{H}_2$ be a bounded linear operator, where $\mathbb{H}_1$ and $\mathbb{H}_2$ are Hilbert spaces. Then the Hilbert-adjoint operator $T^*$ of $T$ is the operator $T^*: \mathbb{H}_2 \rightarrow \mathbb{H}_1$ such that for all $x \in \mathbb{H}_1$ and $y \in \mathbb{H}_2$,

$$
\langle T x, y\rangle=\left\langle x, T^* y\right\rangle
$$
````

- The Hilbert-adjoint operator $T^*$ of $T$ exists, is unique and is a bounded linear operator with norm $
\left\|T^*\right\|=\|T\|$
- If a basis for $\mathbb{C}^n$ is given and a linear operator on $\mathbb{C}$ is represented by a certain matrix, then its Hilbert-adjoint operator is represented by the complex conjugate transpose of that matrix
- If a basis for $\mathbb{R}^n$ is given and a linear operator on $\mathbb{R}$ is represented by a certain matrix, then its Hilbert-adjoint operator is represented by the transpose of that matrix

- Let $\mathbb{X}$ and $\mathbb{Y}$ be inner product spaces and $Q: \mathbb{X} \rightarrow \mathbb{Y}$ a bounded linear operator. Then $Q=0$ if and only if $\langle Q x, y\rangle=0$ for all $x \in \mathbb{X}$ and $y \in Y$. 
- If $Q: \mathbb{X} \rightarrow \mathbb{X}$, where $\mathbb{X}$ is complex, and $\langle Q x, x\rangle=0$ for all $x \in \mathbb{X}$, then $Q=0$.


```{admonition} properties
Let $\mathbb{H}_1$ and $\mathbb{H}_2$ be Hilbert spaces, $S: \mathbb{H}_1 \rightarrow \mathbb{H}_2$ and $T: \mathbb{H}_1 \rightarrow \mathbb{H}_2$ bounded linear operators and $\alpha$ any scalar. Then we have

$$
\begin{split}
\left\langle T^* x, y\right\rangle &=\langle y, T x\rangle \\
(S+T)^* &= S^*+T^* \\
(\alpha T)^* &=\bar{\alpha} T^* \\
\left(T^*\right)^* &=T \\
\|T^*T\|=\|TT^*\| &=\|T\|^2 \\
T^* T=0 \Leftrightarrow T &=0 \\
(S T)^* &= T^* S^* \text { (assuming } H_1=H_2 \text { ) }
\end{split}
$$
```

````{prf:definition} self-adjoint
A bounded linear operator $T: \mathbb{H} \rightarrow \mathbb{H}$ on a Hilbert space $\mathbb{H}$ is said to be self-adjoint (or Hermite) if $T^*=T$
````

````{prf:definition} unitary
A bounded linear operator $T: \mathbb{H} \rightarrow \mathbb{H}$ on a Hilbert space $\mathbb{H}$ is said to be unitary if $T$ is bijective and $T^*=T^{-1}$.
````

````{prf:definition} normal
A bounded linear operator $T: \mathbb{H} \rightarrow \mathbb{H}$ on a Hilbert space $\mathbb{H}$ is said to be normal if $T T^*=T^* T$
````

- Let $T: \mathbb{H} \rightarrow \mathbb{H}$ be a bounded linear operator on a Hilbert space $\mathbb{H}$. If $T$ is self-adjoint, then $\langle T x, x\rangle$ is real for all $x \in \mathbb{H}$
- If $\mathbb{H}$ is complex and $\langle T x, x\rangle$ is real for all $x \in \mathbb{H}$, then $T$ is self-adjoint
- The product of two bounded self-adjoint linear operators $S$ and $T$ on a Hilbert space $\mathbb{H}$ is self-adjoint if and only if the operators commute $S T=T S$
- Let $\left\{T_n\right\}$ be a sequence of bounded self-adjoint linear operators $T_n: \mathbb{H} \rightarrow \mathbb{H}$ on a Hilbert space $\mathbb{H}$. Suppose that $\left\{T_n\right\}$ converges, $T_n \rightarrow T$ or ||$T_n-T|| \rightarrow 0$, where $\|\cdot\|$ is the norm on the space $B(\mathbb{H}, \mathbb{H})$. Then the limit operator $T$ is a bounded self-adjoint linear operator on $\mathbb{H}$
- Let the operators $U: \mathbb{H} \rightarrow \mathbb{H}$ and $V: \mathbb{H} \rightarrow \mathbb{H}$ be unitary on a Hilbert space $\mathbb{H}$. Then $U$ is isometric and $\|U x\|=\|x\|$ for all $x \in \mathbb{H}$

