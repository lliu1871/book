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


# Chapter 3: Vector Spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Vector Spaces

A vector space, also known as a linear space, is a mathematical structure formed by a collection of vectors, called the elements of the vector space, together with operations of addition and scalar multiplication. These operations must satisfy certain properties to qualify as a vector space.

### Definition

A vector space $V$ over a field $\mathbb{F}$ is a set of elements (vectors) equipped with two operations:

1. **Vector Addition:** For any two vectors $\mathbf{v}$ and $\mathbf{w}$ in $V$, there exists a vector $\mathbf{v} + \mathbf{w}$ in $V$ called the sum of $\mathbf{v}$ and $\mathbf{w}$.
2. **Scalar Multiplication:** For any scalar $\alpha$ in $\mathbb{F}$ and any vector $\mathbf{v}$ in $V$, there exists a vector $\alpha \mathbf{v}$ in $V$ called the scalar multiple of $\mathbf{v}$ by $\alpha$.

These operations must satisfy the following properties:

#### Properties

1. **Closure under Addition:** For any $\mathbf{v}$ and $\mathbf{w}$ in $V$, $\mathbf{v} + \mathbf{w}$ is also in $V$.
2. **Associativity of Addition:** For any $\mathbf{u}$, $\mathbf{v}$, and $\mathbf{w}$ in $V$, $(\mathbf{u} + \mathbf{v}) + \mathbf{w} = \mathbf{u} + (\mathbf{v} + \mathbf{w})$.
3. **Existence of Additive Identity:** There exists a vector $\mathbf{0}$ in $V$ such that for any vector $\mathbf{v}$ in $V$, $\mathbf{v} + \mathbf{0} = \mathbf{v}$.
4. **Existence of Additive Inverse:** For every vector $\mathbf{v}$ in $V$, there exists a vector $-\mathbf{v}$ in $V$ such that $\mathbf{v} + (-\mathbf{v}) = \mathbf{0}$.
5. **Closure under Scalar Multiplication:** For any scalar $\alpha$ in $\mathbb{F}$ and any vector $\mathbf{v}$ in $V$, $\alpha \mathbf{v}$ is also in $V$.
6. **Distributivity of Scalar Multiplication over Vector Addition:** For any scalars $\alpha$ and $\beta$ in $\mathbb{F}$ and any vector $\mathbf{v}$ in $V$, $(\alpha + \beta)\mathbf{v} = \alpha\mathbf{v} + \beta\mathbf{v}$.
7. **Distributivity of Scalar Multiplication over Field Addition:** For any scalar $\alpha$ in $\mathbb{F}$ and any vectors $\mathbf{v}$ and $\mathbf{w}$ in $V$, $\alpha(\mathbf{v} + \mathbf{w}) = \alpha\mathbf{v} + \alpha\mathbf{w}$.
8. **Compatibility of Scalar Multiplication with Field Multiplication:** For any scalars $\alpha$ and $\beta$ in $\mathbb{F}$ and any vector $\mathbf{v}$ in $V$, $(\alpha\beta)\mathbf{v} = \alpha(\beta\mathbf{v})$.
9. **Existence of Multiplicative Identity:** There exists a scalar $1$ in $\mathbb{F}$ such that for any vector $\mathbf{v}$ in $V$, $1\mathbf{v} = \mathbf{v}$.


- The set of real numbers $\mathbb{R}$ forms a vector space over $\mathbb{R}$ with usual addition and scalar multiplication.
- The set of $n$-dimensional real vectors $\mathbb{R}^n$ forms a vector space over $\mathbb{R}$ with component-wise addition and scalar multiplication.

Vector spaces provide a fundamental framework for studying linear algebraic structures and are essential in various mathematical and scientific fields.


## Subspaces and Basis Vectors

In linear algebra, subspaces and basis vectors are important concepts related to vector spaces.

### Subspaces

A subspace of a vector space $V$ is a subset of $V$ that is itself a vector space with respect to the operations of vector addition and scalar multiplication defined on $V$. Subspaces are closed under these operations.

#### Properties

1. **Non-Empty:** The zero vector must belong to the subspace.
2. **Closure under Addition:** If $\mathbf{v}$ and $\mathbf{w}$ belong to the subspace, then $\mathbf{v} + \mathbf{w}$ also belongs to the subspace.
3. **Closure under Scalar Multiplication:** If $\mathbf{v}$ belongs to the subspace and $\alpha$ is a scalar, then $\alpha \mathbf{v}$ also belongs to the subspace.

### Basis Vectors

A basis for a vector space $V$ is a set of linearly independent vectors that span $V$, meaning that any vector in $V$ can be expressed as a unique linear combination of basis vectors.

#### Properties

1. **Linear Independence:** Basis vectors are linearly independent, meaning that no vector in the basis can be expressed as a linear combination of the other basis vectors.
2. **Spanning Set:** Any vector in the vector space $V$ can be expressed as a unique linear combination of the basis vectors.
3. **Minimal Set:** The basis is a minimal set of vectors needed to span the vector space $V$.

````{prf:example}
:label: exp3.1
Consider the vector space $\mathbb{R}^3$. The standard basis for $\mathbb{R}^3$ consists of three vectors:

$$
\mathbf{e}_1 = \begin{pmatrix} 1 \\ 0 \\ 0 \end{pmatrix}, \quad
\mathbf{e}_2 = \begin{pmatrix} 0 \\ 1 \\ 0 \end{pmatrix}, \quad
\mathbf{e}_3 = \begin{pmatrix} 0 \\ 0 \\ 1 \end{pmatrix}
$$

These vectors are linearly independent and span $\mathbb{R}^3$, forming a basis for $\mathbb{R}^3$.
````

### Applications

- Subspaces and basis vectors are essential in solving systems of linear equations and understanding linear transformations.
- They provide a foundation for various advanced topics in linear algebra, such as eigenvalues and eigenvectors, diagonalization, and singular value decomposition.



## Dimension and Rank of a Vector Space

In linear algebra, the dimension and rank of a vector space provide important insights into the structure and properties of the space.

### Dimension of a Vector Space

The dimension of a vector space $V$, denoted as $\text{dim}(V)$, is the number of vectors in any basis for $V$. It represents the maximum number of linearly independent vectors that can span $V$.

#### Properties

1. All bases for the same vector space have the same number of vectors, i.e., the same dimension.
2. The dimension of the zero vector space $\{ \mathbf{0} \}$ is defined to be zero.

### Rank of a Matrix

The rank of a matrix $A$, denoted as $\text{rank}(A)$, is the maximum number of linearly independent rows or columns in the matrix. It provides information about the dimension of the column space (or row space) of the matrix.

#### Properties

1. The rank of a matrix is equal to the dimension of its column space.
2. The rank of a matrix is equal to the dimension of its row space.
3. The rank of a matrix is equal to the maximum number of linearly independent columns (or rows) of the matrix.
4. The rank of a matrix is always less than or equal to the minimum of its number of rows and columns.

### Relationship between Dimension and Rank

For a matrix $A$ representing a linear transformation, the dimension of the column space (or row space) of $A$ is equal to the dimension of the range (or null space) of the linear transformation. Therefore, the dimension of the column space (or row space) of $A$ is equal to the rank of $A$.

````{prf:example}
:label: exp3.2
Consider a $3 \times 3$ matrix $A$:

$$
A = \begin{pmatrix}
1 & 2 & 3 \\
2 & 4 & 6 \\
-1 & 0 & 1 \\
\end{pmatrix}
$$

The rank of $A$ is $2$, as the third column is a scalar multiple of the first column, making it linearly dependent. Therefore, the dimension of the column space of $A$ (or the rank of $A$) is $2$.
````

### Applications

- The dimension and rank provide fundamental information about the structure of vector spaces and matrices.
- They are crucial in various areas of mathematics and science, including linear algebra, functional analysis, and data analysis.


## Direct Sum Operation

The direct sum of two vector spaces $V$ and $W$, denoted as $V \oplus W$, is defined as the set of all possible combinations of vectors from $V$ and $W$.

Mathematically, the direct sum is expressed as:

$$
V \oplus W = \{ v + w \,|\, v \in V, w \in W \}
$$

This means that every element in the direct sum $V \oplus W$ can be represented as the sum of one element from $V$ and one element from $W$.

For example, if $V = \mathbb{R}^2$ and $W = \mathbb{R}^3$, then the direct sum $V \oplus W$ consists of all pairs of vectors where the first component is from $\mathbb{R}^2$ and the second component is from $\mathbb{R}^3$.

## Spanning Sets

A spanning set of a vector space $V$ is a set of vectors that, when combined through linear combinations, can generate any vector in $V$.

### Definition

Let $V$ be a vector space over a field $\mathbb{F}$. A set of vectors $\{ v_1, v_2, \ldots, v_n \}$ in $V$ is said to span $V$ if every vector in $V$ can be expressed as a linear combination of the vectors in the set. Mathematically, this can be expressed as:

$$
\text{span}(\{ v_1, v_2, \ldots, v_n \}) = V
$$

````{prf:example}
:label: exp3.3
Consider the vector space $V = \mathbb{R}^2$ over the field $\mathbb{R}$. The set of vectors $\{ (1, 0), (0, 1) \}$ forms a spanning set for $V$ because any vector $(x, y) \in \mathbb{R}^2$ can be expressed as a linear combination of $(1, 0)$ and $(0, 1)$:

$$
(x, y) = x(1, 0) + y(0, 1)
$$

Thus, $\{ (1, 0), (0, 1) \}$ spans $\mathbb{R}^2$.
````

## Linear Independence

In linear algebra, a set of vectors $\{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n\}$ in a vector space $V$ is said to be linearly independent if no vector in the set can be expressed as a linear combination of the others. Mathematically, this means that the equation:

$$
c_1 \mathbf{v}_1 + c_2 \mathbf{v}_2 + \ldots + c_n \mathbf{v}_n = \mathbf{0}
$$

has only the trivial solution $c_1 = c_2 = \ldots = c_n = 0$. If there exist non-zero scalars $c_1, c_2, \ldots, c_n$ that satisfy the equation, then the set of vectors is linearly dependent.

Linear independence is a fundamental concept in linear algebra and plays a crucial role in various applications, such as solving systems of linear equations, computing bases and dimensions of vector spaces, and analyzing the structure of matrices and transformations.

### Dimension

The dimension of a vector space $V$, denoted as $\text{dim}(V)$, is the number of vectors in any basis of $V$. It represents the "size" or "degrees of freedom" of the vector space. If $V$ is finite-dimensional, all bases of $V$ have the same number of vectors, which defines the dimension of $V$. For example, the dimension of $\mathbb{R}^n$ is $n$, as any basis of $\mathbb{R}^n$ contains $n$ vectors.

The concept of dimension is essential in linear algebra as it helps in understanding the structure and properties of vector spaces. It allows us to classify vector spaces and study their behavior under linear transformations and operations.

