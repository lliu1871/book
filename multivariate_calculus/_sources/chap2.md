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

# Chapter 2: Vector space

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Vector space](https://en.wikipedia.org/wiki/Vector_space)
```

````{prf:definition} vector space
:label: def2.2
Definition. A vector space is a non-empty set $V$ equipped with two operations - vector addition "+" and scalar multiplication "." which satisfy the two closure axioms as well as the eight vector space axioms

- Closure under vector addition: Given $\mathbf{v}, \mathbf{w} \in V, \mathbf{v}+\mathbf{w} \in V$.
- Closure under scalar multiplication: Given $\mathbf{v} \in V$ and a scalar $\alpha, \alpha \mathbf{v} \in V$.

For $\mathbf{u}, \mathbf{v}, \mathbf{w}$ arbitrary vectors in $V$, and $\alpha, \beta$ arbitrary scalars in $\mathbb{R}$,

1. (Commutativity of addition) $\mathbf{v}+\mathbf{w}=\mathbf{w}+\mathbf{v}$.

2. (Associativity of addition) $(\mathbf{u}+\mathbf{v})+\mathbf{w}=\mathbf{u}+(\mathbf{v}+\mathbf{w})$.

3. (Existence of a zero vector) There is a vector $\mathbf{z} \in V$ with $\mathbf{z}+\mathbf{v}=\mathbf{v}+\mathbf{z}=\mathbf{v}$.

4. (Existence of additive inverses) For each $\mathbf{v}$, there is a vector $-\mathbf{v} \in V$ with $\mathbf{v}+(-\mathbf{v})=(-\mathbf{v})+\mathbf{v}=\mathbf{z}$.

5. (Distributivity of scalar multiplication over vector addition) $\alpha(\mathbf{v}+\mathbf{w})=\alpha \mathbf{v}+\alpha \mathbf{w}$.

6. (Distributivity of scalar addition over scalar multiplication) $(\alpha+\beta) \mathbf{v}=\alpha \mathbf{v}+\beta \mathbf{v}$.

7. (Associativity of scalar multiplication $)(\alpha \beta) \mathbf{v})=(\alpha(\beta \mathbf{v})$.

8. (Scalar multiplication with 1 is the identity) $1 \mathbf{v}=\mathbf{v}$.
````

All vectors in the vector space can be expressed as a linear combination of basis vectors.
````{prf:definition} basis
:label: def2.3
A set of vectors $\left\{b_i\right\}$ is a basis of $\mathbb{R}^n$ if every $x \in \mathbb{R}^n$ is uniquely expressible as a linear combination of the $b_i$.
````

## Norm
````{prf:definition} norm
:label: def2.4
A norm on a vector space X is a real valued function $\rho:X\rightarrow \mathbb{R}$ with the following properties

1. $\rho (x+y)\le \rho(x)+\rho(y)$ for all $x,y\in X$
2. $\rho(ax)=|a|\rho(x)$ for all $x\in X$ and $a\in \mathbb{R}$
3. $\rho(x)\ge 0$ for all $x\in X$ and $\rho(x)=0$ if and only if $x=0$
````

````{prf:example}
:label: exp2.1
The $L_p$ norm of a vector $v$ is defined by $\|v\|_p = \left(\sum_i|x_i|^p\right)^{\frac{1}{p}}$
````

Two norms $p$ and $q$ on a vector space $X$ are equivalent, if there exist two positive real constants $a,b>0$ such that for every vector $x\in X$,

$$aq(x)\leq p(x)\leq bq(x)$$

- The norms are equivalent if and only if they induce the same topology on $X$
- Any two norms on a finite-dimensional space are equivalent

## Limits in $\mathbb{R}^n$
````{prf:definition} null sequence
:label: def2.5
A sequence of vectors $\{v_n\}$ is null if for every $\epsilon>0$ there exists $n_0$ such that if $n>n_0$ then $\|v_n\|<\epsilon$.
````

- $\{v_n\}$ is null if and only if each component sequence is null

````{prf:definition} sequence convergence
:label: def2.6
A sequence of vectors $\{v_n\}$ converges to $a$ if $\{v_n-a\}$ is null
````

- $\{v_n\}$ converges if and only if each component sequence converges
- If $\{v_n\}\rightarrow a$ and $\{w_n\}\rightarrow b$, then $\{v_n\}+\{w_n\}\rightarrow a+b$
- If $\{v_n\}\rightarrow a$ then If $\{cv_n\}\rightarrow ca$ 

## Continuous mappings

````{prf:definition} continuity
:label: def2.7
A function $f(x)$ with domain $\mathbb{R}^n$ is continuous at a point $x_0 \in \mathbb{R}^n$ if $f(x) \rightarrow f(x_0)$ whenever $x \rightarrow x_0$. The function $f$ is continuous on $\mathbb{R}^n$, if $f$ is continuous for every point $x\in\mathbb{R}^n$.
````

The norm $\|x\|$ is a continuous function and for a fixed vector $v$, the inner product $v\cdot x$ is a continuous function of $x$.

- linearity: any linear combination of continuous functions is continuous
- composition: the composition of two continuous functions is a continuous function
- componentwise continuity: a vector of functions $\left(f_1(x),\dots,f_n(x)\right)$ is continuous if and only if each of its component functions is continuous

````{prf:definition} Uniform Continuity
:label: def2.1

Let $S \subset \mathbb{R}^n$ be a set, and let $f: S \longrightarrow \mathbb{R}^m$ be a mapping. Then $f$ is uniformly continuous on $S$ if for every $\varepsilon>0$ there exists some $\delta>0$ such that

$$
\text { if } x, \tilde{x} \in S \text { and }|\tilde{x}-x|<\delta \text { then }|f(\tilde{x})-f(x)|<\varepsilon \text {. }
$$
````

````{prf:theorem} Continuity on Compact Sets is Uniform 
:label: them2.1 
Let $K \subset \mathbb{R}^n$ be compact, and let $f : K \rightarrow \mathbb{R}^m$ be pointwise continuous on $K$. Then $f$ is uniformly continuous on $K$.
````

