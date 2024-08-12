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


# Chapter 4: Linear Transformations

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Linear Transformations

In linear algebra, a linear transformation is a mapping between two vector spaces that preserves the operations of vector addition and scalar multiplication. Linear transformations play a fundamental role in many areas of mathematics and its applications.

### Definition

Let $V$ and $W$ be vector spaces over the same field $\mathbb{F}$. A function $T: V \rightarrow W$ is called a linear transformation if it satisfies the following properties for all vectors $\mathbf{u}$ and $\mathbf{v}$ in $V$ and all scalars $\alpha$ in $\mathbb{F}$:

1. **Additivity:** $T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v})$
2. **Homogeneity:** $T(\alpha \mathbf{u}) = \alpha T(\mathbf{u})$

### Properties

#### Preservation of Vector Operations

1. **Additivity:** $T(\mathbf{0}) = \mathbf{0}$, where $\mathbf{0}$ denotes the zero vector in the vector space.
2. **Homogeneity:** $T(\mathbf{u} - \mathbf{v}) = T(\mathbf{u}) - T(\mathbf{v})$
3. **Homogeneity of Scalar Multiplication:** $T(\alpha \mathbf{v}) = \alpha T(\mathbf{v})$ for any scalar $\alpha$.

#### Preservation of Linear Combinations

1. $T(\alpha_1 \mathbf{v}_1 + \alpha_2 \mathbf{v}_2 + \cdots + \alpha_n \mathbf{v}_n) = \alpha_1 T(\mathbf{v}_1) + \alpha_2 T(\mathbf{v}_2) + \cdots + \alpha_n T(\mathbf{v}_n)$ for any scalars $\alpha_1, \alpha_2, \ldots, \alpha_n$ and vectors $\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n$ in $V$.

#### Other Properties

1. **Injectivity:** A linear transformation $T$ is injective (or one-to-one) if and only if $\text{ker}(T) = \{\mathbf{0}\}$, where $\text{ker}(T)$ denotes the kernel or null space of $T$.
2. **Surjectivity:** A linear transformation $T$ is surjective (or onto) if and only if $\text{range}(T) = W$, where $\text{range}(T)$ denotes the range or image of $T$.

### Examples

1. **Matrix Transformation:** Let $A$ be an $m \times n$ matrix. The function $T: \mathbb{R}^n \rightarrow \mathbb{R}^m$ defined by $T(\mathbf{x}) = A\mathbf{x}$ is a linear transformation.
2. **Projection Transformation:** Let $P$ be a projection matrix onto a subspace $W$ of $\mathbb{R}^n$. The function $T: \mathbb{R}^n \rightarrow \mathbb{R}^n$ defined by $T(\mathbf{x}) = P\mathbf{x}$ is a linear transformation.

Linear transformations provide a powerful framework for studying the structure and properties of vector spaces and matrices, and they have numerous applications in mathematics, physics, engineering, and computer science.


## Matrix Representations of Linear Transformations

In linear algebra, linear transformations between vector spaces can often be represented by matrices. These matrix representations allow us to perform computations and analyze transformations using matrix operations.

### Definition

Let $T: V \rightarrow W$ be a linear transformation between vector spaces $V$ and $W$. If $\mathcal{B} = \{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n\}$ is a basis for $V$ and $\mathcal{C} = \{\mathbf{w}_1, \mathbf{w}_2, \ldots, \mathbf{w}_m\}$ is a basis for $W$, then the matrix representation of $T$ with respect to bases $\mathcal{B}$ and $\mathcal{C}$, denoted as $[T]_{\mathcal{C}, \mathcal{B}}$, is an $m \times n$ matrix defined as follows:

- Let $\mathbf{v}$ be any vector in $V$. Then $[T(\mathbf{v})]_{\mathcal{C}} = [T]_{\mathcal{C}, \mathcal{B}} [\mathbf{v}]_{\mathcal{B}}$, where $[\mathbf{v}]_{\mathcal{B}}$ is the coordinate vector of $\mathbf{v}$ with respect to basis $\mathcal{B}$.
- The $j$-th column of $[T]_{\mathcal{C}, \mathcal{B}}$ consists of the coordinate vector of $T(\mathbf{v}_j)$ with respect to basis $\mathcal{C}$, where $\mathbf{v}_j$ is the $j$-th vector in basis $\mathcal{B}$.

### Properties

1. The matrix representation of a linear transformation is unique for a given pair of bases.
2. If $\mathcal{B}$ is the standard basis for $V$ and $\mathcal{C}$ is the standard basis for $W$, then the matrix representation of $T$ with respect to $\mathcal{B}$ and $\mathcal{C}$ is simply the matrix formed by the images of the standard basis vectors under $T$.

### Example

Consider the linear transformation $T: \mathbb{R}^2 \rightarrow \mathbb{R}^2$ defined by $T(x, y) = (2x + y, x - y)$. 

Let $\mathcal{B} = \{ \mathbf{e}_1, \mathbf{e}_2 \}$ and $\mathcal{C} = \{ \mathbf{f}_1, \mathbf{f}_2 \}$ be the standard bases for $\mathbb{R}^2$. 

The matrix representation of $T$ with respect to bases $\mathcal{B}$ and $\mathcal{C}$ is:

$$
[T]_{\mathcal{C}, \mathcal{B}} = \begin{pmatrix} 2 & 1 \\ 1 & -1 \end{pmatrix}
$$

### Applications

- Matrix representations of linear transformations are widely used in computer graphics, robotics, and numerical simulations to represent and manipulate geometric transformations.
- They provide a computationally efficient way to analyze and compute transformations in various mathematical and scientific contexts.



## Eigenvectors and Eigenvalues

In linear algebra, eigenvectors and eigenvalues are important concepts associated with square matrices. They play a fundamental role in understanding transformations and systems of linear equations.

### Definition

Let $A$ be an $n \times n$ square matrix. An eigenvector of $A$ is a non-zero vector $\mathbf{v}$ such that when $A$ is applied to $\mathbf{v}$, the resulting vector is a scalar multiple of $\mathbf{v}$:

$$
A\mathbf{v} = \lambda \mathbf{v}
$$

Here, $\lambda$ is called the eigenvalue corresponding to the eigenvector $\mathbf{v}$.

### Properties

1. **Existence:** Not every matrix has eigenvectors, but if $A$ is a square matrix, it always has at least one eigenvalue and corresponding eigenvector.
2. **Linear Independence:** Eigenvectors corresponding to distinct eigenvalues are linearly independent.
3. **Diagonalization:** If $A$ has $n$ linearly independent eigenvectors, it can be diagonalized as $A = PDP^{-1}$, where $P$ is the matrix whose columns are the eigenvectors of $A$ and $D$ is a diagonal matrix with the corresponding eigenvalues on the diagonal.

### Calculation

To find the eigenvalues of a matrix $A$, solve the characteristic equation:

$$
\text{det}(A - \lambda I) = 0
$$

where $I$ is the identity matrix. The roots of this equation are the eigenvalues of $A$.

Once the eigenvalues are found, the corresponding eigenvectors can be obtained by solving the equation $(A - \lambda I)\mathbf{v} = \mathbf{0}$.

### Example

Consider the matrix:

$$
A = \begin{pmatrix} 3 & 1 \\ 1 & 3 \end{pmatrix}
$$

To find the eigenvalues, solve the characteristic equation:

$$
\text{det}(A - \lambda I) = 0
$$

which yields $\lambda_1 = 4$ and $\lambda_2 = 2$. 

For $\lambda_1 = 4$, solving $(A - 4I)\mathbf{v}_1 = \mathbf{0}$ gives the eigenvector $\mathbf{v}_1 = \begin{pmatrix} 1 \\ 1 \end{pmatrix}$. Similarly, for $\lambda_2 = 2$, solving $(A - 2I)\mathbf{v}_2 = \mathbf{0}$ gives the eigenvector $\mathbf{v}_2 = \begin{pmatrix} -1 \\ 1 \end{pmatrix}$.

### Applications

- Eigenvectors and eigenvalues are extensively used in solving systems of differential equations, stability analysis of dynamical systems, and optimization problems.
- They are crucial in various areas such as physics, engineering, computer science, and data analysis for understanding patterns and behaviors in datasets and systems.


