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

# Chapter 5: Integral

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Integral](https://en.wikipedia.org/wiki/Integral)
```
In univariable calculus, we can calculate the area under a function curve $f(x)$ by an integral $\int_xf(x)dx$. This idea can be generalized to high dimensional spaces where the volume can be calculated by an integral of a function $f(x_1,...,x_k)$ with respect to $(x_1,...,x_n)$. 


## Integration over Boxes

````{prf:definition} compact box
A nonempty compact box in $\mathbb{R}^n$ is a cartesian product $B=I_1 \times I_2 \times \cdots \times I_n$
of nonempty compact intervals $I_j$ for $j=1, \ldots, n$. The volume of the box is the product of the lengths of its sides,

$$
\operatorname{vol}(B)=\prod_{j=1}^n \text { length }\left(I_j\right) .
$$
````

A partition of $B$ is a cartesian product of partitions $P_j$ of $I_j$ for $j=1, \ldots, n$,

$$
P=P_1 \times P_2 \times \cdots \times P_n .
$$

A partition divides the box $B$ into subboxes $J$. Each subbox is a cartesian product of subintervals. 

````{prf:definition}  n-dimensional Lower Sum and Upper Sum
Let $B$ be a nonempty compact box in $\mathbb{R}^n$, and let $f: B \longrightarrow \mathbb{R}$ be a bounded function. For any subbox $J$ of $B$, define $m_J(f)$ and $M_J(f)$,

$$
m_J(f)=\inf \{f(x): x \in J\} \quad \text { and } \quad M_J(f)=\sup \{f(x): x \in J\} .
$$

The lower sum of $f$ over $P$ is 

$$
L(f, P)=\sum_J m_J(f) \operatorname{vol}(J)
$$ 

and the upper sum is defined by

$$
U(f, P)=\sum_J M_J(f) \operatorname{vol}(J)
$$
````

````{prf:definition} Common Refinement 
Given two partitions of $B$, $P=P_1 \times P_2 \times \cdots \times P_n$ and $P^{\prime}=P_1^{\prime} \times P_2^{\prime} \times \cdots \times P_n^{\prime}$, their common refinement is the partition

$$
P^{\prime \prime}=\left(P_1 \cup P_1^{\prime}\right) \times\left(P_2 \cup P_2^{\prime}\right) \times \cdots \times\left(P_n \cup P_n^{\prime}\right)
$$
````

The common refinement of two partitions $P$ and $P^{\prime}$ is a partition that refines both $P$ and $P^{\prime}$, and it is the smallest such partition. 

````{prf:proposition} Lower Sums Are At Most Upper Sums
Let $P$ and $P^{\prime}$ be partitions of the box $B$, and let $f: B \longrightarrow \mathbb{R}$ be any bounded function. Then

$$
L(f, P) \leq U\left(f, P^{\prime}\right) .
$$
````

The lower integral of $f$ over $B$ is the least upper bound of the lower sums of $f$ over all partitions $P$,

$$
L \int_B f=\sup \{L(f, P): P \text { is a partition of } B\} \text {. }
$$

The upper integral of $f$ over $B$ is the greatest lower bound of the upper sums of $f$ over all partitions $P$,

$$
U \int_B f=\inf \{U(f, P): P \text { is a partition of } B\} \text {. }
$$

````{prf:definition}  Integral
The function $f$ is said to be integrable over a box $B$ if the lower and upper integrals are equal,  

$$L \int_B f=U \int_B f$$ 

This value is called the integral of $f$ over $B$ and written $\int_B f$.
````
 
A bounded funtion $f$ : $B \longrightarrow \mathbb{R}$ on a box $B$ is integrable over $B$ if and only if for every $\varepsilon>0$, there exists a partition $P$ of $B$ such that 

$$U(f, P)-L(f, P)<\varepsilon$$

This inequality indicates $U(f, P)\le L(f, P)$. We have shown that $L(f, P)\le U(f, P)$. Thus, $U(f, P) = L(f, P)$ and the function $f$ is integrable.


````{prf:proposition}  
Let $P$ be a partition of a box $B$. If a bounded function $f: B \longrightarrow \mathbb{R}$ is integrable over $B$ then $f$ is integrable over each subbox $J$ of $P$, in which case

$$
\sum_J \int_J f=\int_B f
$$
````

````{prf:theorem}  Continuity Implies Integrability
Let $B$ be a box, and $f : B \rightarrow \mathbb{R}$ is a continuous function. Then $f$ is integrable over $B$
````

### Integration over Nonboxes
The integral $\int_B f$ exists if $B$ is a box and $f: B \rightarrow \mathbb{R}$ is continuous. Next, we will show that the integral still exists if the function $f$ is discontinuous on a small enough subset of $B$. Let $S \subset \mathbb{R}^n$ be a bounded set. The characteristic function of $S$ is

$$
\chi_S: \mathbb{R}^n \longrightarrow \mathbb{R}, \quad \chi_S(x)= \begin{cases}1 & \text { if } x \in S \\ 0 & \text { otherwise }\end{cases}
$$

````{prf:definition}  Volume of a Set
If the characteristic function \chi_S of a bounded set $S \subset \mathbb{R}^n$ is integrable, the volume of $S$ is defined by 

$$\operatorname{vol}(S) := \int_B \chi_S$$

where $B$ is any box containing $S$.
````


Sets of volume zero are small enough that they don't interfere with integration. Let $S \subset \mathbb{R}^n$ sit in a box $B$, and let $P$ be a partition of $B$. The subboxes $J$ of $P$ consist of two types:

- type I : $J$ such that $J \cap S \neq \emptyset$
- type II : $J$ such that $J \cap S=\emptyset$.

````{prf:proposition}  Volume Zero Criterion 
A set $S$ contained in the box $B$ has volume zero if and only if for every $\varepsilon>0$ there exists a partition $P$ of $B$ such that

$$
\sum_{J: \text { type I }} \operatorname{vol}(J)<\varepsilon
$$
````

````{prf:theorem} Near-continuity Implies Integrability 
Let $B \subset \mathbb{R}^n$ be a box. Let $f : B \rightarrow \mathbb{R}$ be bounded, and continuous except on a set $S \subset B$ of volume zero. Then $\int_Bf$ exists.
````

````{prf:definition} Known-Integrable Function 
A function $f : K \rightarrow \mathbb{R}$
is known-integrable if $K$ is a compact subset of $R^n$ having boundary of
volume zero, and if $f$ is bounded on $K$ and is continuous on all of $K$ except
possibly a subset of volume zero.
````

````{prf:definition} Integral over a Nonbox

Let $f: K \rightarrow \mathbb{R}$ be a known-integrable function. Extend its domain to $\mathbb{R}^n$ by defining a new function

$$
\tilde{f}: \mathbb{R}^n \longrightarrow \mathbb{R}, \quad \tilde{f}(x)= \begin{cases}f(x) & \text { if } x \in K, \\ 0 & \text { if } x \notin K .\end{cases}
$$

The integral of $f$ over $K$ is $\int_K f=\int_B \tilde{f}$ where $B$ is any box containing $K$.
````

````{prf:proposition}
Let $K \subset \mathbb{R}^n$ be a compact set whose boundary has volume
zero. Let $f : K \rightarrow \mathbb{R}$ be continuous. Let $K = K_1 \cup K_2$ where each $K_j$
is compact and the intersection $K_1 \cap K_2$ has volume zero. Then $f$ is integrable
over $K_1$ and $K_2$, 

$$\int_Kf = \int_{K_1}f + \int_{K_2}f$$
````

## Computing integrals

````{prf:example} 
:label: double_integral
The double integral is defined as the limit of the Riemann sum

$$
\iint_R f(x, y) dx dy = \lim_{n \rightarrow \infty}\left(\frac{1}{n^2} \sum_{(i/n, j/n) \in R} f(i/n, j/n)\right)
$$
````

````{prf:example}
:label: triple_integral
If $f(x, y, z)$ is a function of three variables and $E$ is a solid region in space, then the triple integral is defined as the limit of the Riemann sum

$$
\iiint_E f(x,y,z) dxdydz=\lim_{n \rightarrow \infty}\left(\frac{1}{n^3} \sum_{(i/n, j/n, k/n) \in E} f(i/n, j/n, k/n)\right)
$$
````

Alternatively, we can calculate the surface area of a subset of $\mathbb{R}^n$ using surface integrals

````{prf:definition} surface integral
:label: surface integral
A parameterized surface $\vec{r}(u, v)$ on a parameter domain $G\subset\mathbb{R}^2$ has the surface area

$$
\iint_G\left|\vec{r}_u(u, v) \times \vec{r}_v(u, v)\right| dudv
$$
````

Under certain conditions, the order of the high dimensional integral does not matter.
````{prf:theorem} Fubini's theorem
:label: Fubini_theorem
Fubini's theorem allows to switch the order of integration over a rectangle, if the function $f$ is continuous: 

$$\int_a^b \int_c^d f(x,y) dxdy=\int_c^d \int_a^b f(x,y) dydx$$
````

## Variable transformation
In many cases, it is easier to integrate in the polar system. We here consider the relationship between the Cartesian integration and the Polar integration.

````{prf:theorem} polar integral
:label: polar_integral
To integrate in polar coordinates, we evaluate the integral

$$
\iint_R f(x, y) dxdy = \iint_R f\left(r \cos (\theta), r \sin (\theta)\right) rdrd\theta
$$
````
