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

# Chapter 3: Linear maps

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Linear map](https://en.wikipedia.org/wiki/Linear_map)
```

````{prf:definition} linear mapping
:label: def3.1
The mapping $T: \mathbb{R}^n \rightarrow \mathbb{R}^m$ is linear if for all positive integers $k$, all real numbers $\alpha_1$ through $\alpha_k$, and all vectors $x_1$ through $x_k$,

$$
T\left(\sum_{i=1}^k \alpha_i x_i\right)=\sum_{i=1}^k \alpha_i T\left(x_i\right)
$$
````

Consider a special linear map $T: \mathbb{R}^n\rightarrow\mathbb{R}$ called linear functionals. All linear functionals can be expressed as an inner product with a fixed vector.

````{prf:proposition}
:label: prop3.1
The linear functionals $T: \mathbb{R}^n \rightarrow \mathbb{R}$ are precisely the mappings

$$
T(x)=\langle a, x\rangle
$$
where $a \in \mathbb{R}^n$. That is, each linear functional $T: \mathbb{R}^n \rightarrow \mathbb{R}$ is multiplication by a unique $a \in \mathbb{R}^n$ and conversely.
````

A linear map can be represented as an $m$-tuple of linear maps as described in the following proposition.
````{prf:proposition}
:label: prop3.2
$T=(T_1,...,T_m):\mathbb{R}^n\rightarrow \mathbb{R}^m$ is linear if and only if each scalar-valued component function $T_i:\mathbb{R}^n\rightarrow \mathbb{R}$ is linear
````

- A linear map is continuous if and only if it is bounded. 
- The linear map $T: \mathbb{R}^n \rightarrow \mathbb{R}^m$ is continuous.


All finite linear maps can be expressed as matrices. 
````{prf:theorem}
:label: them3.1
The linear maps $T: \mathbb{R}^n \rightarrow \mathbb{R}^m$ are precisely the mappings

$$
T(x)=Ax
$$
where $A \in \mathrm{M}_{m, n}(\mathbb{R})$. That is, each linear mapping $T: \mathbb{R}^n \rightarrow \mathbb{R}^m$ is multiplication by a unique $A \in \mathrm{M}_{m, n}(\mathbb{R})$ and conversely.
````

The set of linear maps $L(n,m)$ forms a vector space.

````{prf:theorem}
:label: them3.2
Suppose that $S, T: \mathbb{R}^n \longrightarrow \mathbb{R}^m$ are linear and that $a \in \mathbb{R}$. Then the mappings

$$
S+T, a S: \mathbb{R}^n \rightarrow \mathbb{R}^m
$$
are also linear. Consequently, the set of linear mappings from $\mathbb{R}^n$ to $\mathbb{R}^m$ forms a vector space.
````


## Matrix operations
The set of matrices with the same dimension is a vector space. Here, we define the vector addition and scalar multiplication for matrices.

````{prf:definition} matrix addition
:label: def3.2
Definition 3.2.1 (Matrix Addition).
If $A=\left[a_{i j}\right]_{m \times n}$ and $B=\left[b_{i j}\right]_{m \times n}$, then 

$$A+B=\left[a_{i j}+b_{i j}\right]_{m \times n}$$
````

````{prf:definition} matrix scalar multiplication
:label: def3.3
Definition 3.2.2 (Scalar-by-Matrix Multiplication).
If $\alpha \in \mathbb{R}$ and $A=\left[a_{i j}\right]_{m \times n}$, then 

$$\alpha A=\left[\alpha a_{i j}\right]_{m \times n}$$
````

```{note}
The set $\mathrm{M}_{m, n}(\mathbb{R})$ of $m$-by-$n$ matrices forms a vector space over $\mathbb{R}$.
```

Matrix multiplication corresponds to composition of two linear functions.

````{prf:definition} matrix multiplication
:label: def3.4
Given two matrices $A \in \mathrm{M}_{m, n}(\mathbb{R})$ and $B \in \mathrm{M}_{n, p}(\mathbb{R})$ such that $A$ has as many columns as $B$ has rows, their product, then the product of two matrices $AB \in \mathrm{M}_{m, p}(\mathbb{R})$ has for its $(i, j)^{th}$ entry (for any $i \in\{1, \cdots, m\}$ and $j \in\{1, \cdots, p\})$ the inner product of the $i^{th}$ row of $A$ and the $j^{th}$ column of $B$. In symbols,

$$
(A B)_{i j}=\langle\text { ith row of } A, j \text { th column of } B\rangle,
$$
````


## Inverse

````{prf:theorem} 
:label: them3.3
A nonsquare matrix $A$ is never invertible. A square matrix $A$ is invertible if and only if its echelon form is the identity matrix.
````

When $A$ is square, the discussion above gives an algorithm that simultaneously checks whether it is invertible and finds its inverse when it is.

```{admonition} Matrix Inversion Algorithm
Given $A \in \mathrm{M}_n(\mathbb{R})$, set up the matrix

$$
B=\left[A \mid I_n\right]
$$
in $\mathrm{M}_{n, 2 n}(\mathbb{R})$. Carry out row operations on this matrix to reduce the left side to echelon form. If the left side reduces to $I_n$ then $A$ is invertible and the right side is $A^{-1}$. If the left side doesn't reduce to $I_n$ then $A$ is not invertible.
```

## Determinant
````{prf:definition} determinant
:label: def3.5
The determinant is a multilinear skew-symmetric normalized function from the $n$-fold product of $\mathbb{R}^n$ to $\mathbb{R}$

$$
\operatorname{det}: \mathbb{R}^n \times \cdots \times \mathbb{R}^n \rightarrow \mathbb{R}
$$
````

The above definition of determinant makes sense only if it exists and unique.

````{prf:theorem}
:label: them3.4
The determinant exists and is unique. Furthermore, all multilinear skew-symmetric functions from the $n$-fold product of $\mathbb{R}^n$ to $\mathbb{R}$ are scalar multiples of of the determinant. That is, any multilinear skew-symmetric function $\delta: \mathbb{R}^n \times \cdots \times \mathbb{R}^n \longrightarrow \mathbb{R}$ is

$$
\delta=c \cdot \text { det } \quad \text { where } c=\delta\left(e_1, \ldots, e_n\right)
$$
````
The determinant of the product of two matrices is equal to the product of the determinants of two matrices
````{prf:theorem}
:label: them3.5
For all matrices $A, B \in \mathrm{M}_n(\mathbb{R})$,

$$
\operatorname{det}(A B)=\operatorname{det}(A) \operatorname{det}(B) .
$$
In particular, if $A$ is invertible then the determinant of the matrix inverse is the scalar inverse of the determinant,

$$
\operatorname{det}\left(A^{-1}\right)=(\operatorname{det}(A))^{-1} .
$$
````

The following theorem tells us the relationship between determinant and invertibility.
````{prf:theorem}
:label: them3.6
The matrix $A \in \mathrm{M}_n(\mathbb{R})$ is invertible if and only if $\operatorname{det}(A) \neq 0$.
````

The geometric interpretation of a determinant is that the determinant measures the volumn of the parallelepiped formed by the column vectors of the matrix.

````{prf:theorem}
:label: them3.7
Any linear mapping $T: \mathbb{R}^n \rightarrow \mathbb{R}^n$ is the composition of a possible squash followed by shears, scales and reflections. If the matrix of $T$ is $A$, then $T$ magnifies volume by $|\operatorname{det} A|$.
````