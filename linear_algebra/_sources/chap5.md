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


# Chapter 5: Inner Product Spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Inner Product and Norm

In linear algebra, the inner product and norm are fundamental concepts that provide a way to measure the geometric properties of vectors and spaces.

### Inner Product

An inner product on a vector space $V$ over the field $\mathbb{F}$ is a function $\langle \cdot, \cdot \rangle: V \times V \rightarrow \mathbb{F}$ that satisfies the following properties for all vectors $\mathbf{u}$, $\mathbf{v}$, and $\mathbf{w}$ in $V$ and all scalars $\alpha$ and $\beta$ in $\mathbb{F}$:

1. **Linearity in the First Argument:** $\langle \alpha \mathbf{u} + \beta \mathbf{v}, \mathbf{w} \rangle = \alpha \langle \mathbf{u}, \mathbf{w} \rangle + \beta \langle \mathbf{v}, \mathbf{w} \rangle$
2. **Conjugate Symmetry:** $\langle \mathbf{u}, \mathbf{v} \rangle = \overline{\langle \mathbf{v}, \mathbf{u} \rangle}$
3. **Positive Definiteness:** $\langle \mathbf{v}, \mathbf{v} \rangle \geq 0$ and $\langle \mathbf{v}, \mathbf{v} \rangle = 0$ if and only if $\mathbf{v} = \mathbf{0}$

Common examples of inner products include the dot product in Euclidean spaces and the Hermitian inner product in complex vector spaces.

### Norm

A norm on a vector space $V$ over the field $\mathbb{F}$ is a function $|| \cdot ||: V \rightarrow \mathbb{R}$ that assigns a non-negative real number to each vector $\mathbf{v}$ in $V$ and satisfies the following properties for all vectors $\mathbf{u}$ and $\mathbf{v}$ in $V$ and all scalars $\alpha$ in $\mathbb{F}$:

1. **Positive Definiteness:** $||\mathbf{v}|| \geq 0$ and $||\mathbf{v}|| = 0$ if and only if $\mathbf{v} = \mathbf{0}$
2. **Scalar Multiplication:** $||\alpha \mathbf{v}|| = |\alpha| \cdot ||\mathbf{v}||$
3. **Triangle Inequality:** $||\mathbf{u} + \mathbf{v}|| \leq ||\mathbf{u}|| + ||\mathbf{v}||$

A norm induces a metric on the vector space, defining the distance between two vectors as the norm of their difference.

### Relationship between Inner Product and Norm

For a vector space equipped with an inner product, the norm of a vector is defined as the square root of the inner product of the vector with itself:

$$
||\mathbf{v}|| = \sqrt{\langle \mathbf{v}, \mathbf{v} \rangle}
$$

This relationship allows us to use the inner product to compute the lengths (norms) of vectors and the angles between them.

### Applications

- Inner products and norms are used extensively in geometry, functional analysis, optimization, and signal processing.
- They provide a framework for measuring distances, angles, and lengths in vector spaces, enabling the study of geometric properties and behaviors of vectors and spaces.


## Orthogonal Bases and Orthonormal Bases

In linear algebra, orthogonal bases and orthonormal bases are special types of bases that provide useful geometric and computational properties for vector spaces.

### Orthogonal Bases

An orthogonal basis for a vector space $V$ is a set of vectors $\{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n\}$ such that every pair of distinct vectors in the set is orthogonal, meaning their inner product is zero:

$$
\langle \mathbf{v}_i, \mathbf{v}_j \rangle = 0 \quad \text{for all } i \neq j
$$

Orthogonal bases have the advantage that computing projections and solving systems of equations becomes simpler.

### Orthonormal Bases

An orthonormal basis for a vector space $V$ is a set of vectors $\{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n\}$ that is both orthogonal and normalized, meaning each vector has unit length:

1. **Orthogonality:** $\langle \mathbf{v}_i, \mathbf{v}_j \rangle = 0$ for all $i \neq j$
2. **Normalization:** $||\mathbf{v}_i|| = 1$ for all $i$

Orthonormal bases are particularly useful because they simplify computations involving inner products and norms.

### Construction

Given any basis for a vector space $V$, an orthogonal basis can be constructed using the Gram-Schmidt process, which orthogonalizes the vectors one by one.

To obtain an orthonormal basis, simply normalize each vector in the orthogonal basis.

### Example

Consider the vector space $\mathbb{R}^3$. The standard basis vectors $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$ form an orthonormal basis for $\mathbb{R}^3$. Each basis vector is orthogonal to the others, and each has unit length.

### Applications

- Orthogonal bases and orthonormal bases are used in various numerical methods, such as the QR decomposition and least squares approximation.
- They are fundamental in signal processing, where they are used to represent signals in terms of orthogonal or orthonormal basis functions (e.g., Fourier basis, wavelet basis).
- Orthonormal bases are essential in quantum mechanics for representing states of quantum systems and performing computations involving operators.


## Gram-Schmidt Process and Orthogonal Projections

In linear algebra, the Gram-Schmidt process is a method for orthogonalizing a set of vectors, while orthogonal projections are a way to decompose vectors into components along orthogonal directions.

### Gram-Schmidt Process

The Gram-Schmidt process is a method to transform a set of linearly independent vectors into an orthogonal or orthonormal set. Given a set of vectors $\{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n\}$, the Gram-Schmidt process produces a new set of vectors $\{\mathbf{u}_1, \mathbf{u}_2, \ldots, \mathbf{u}_n\}$ with the following properties:

1. **Orthogonality:** Each vector $\mathbf{u}_i$ is orthogonal to all previous vectors $\mathbf{u}_1, \mathbf{u}_2, \ldots, \mathbf{u}_{i-1}$.
2. **Span Preservation:** The span of the original set of vectors is the same as the span of the orthogonalized set.

The Gram-Schmidt process can be described by the following steps:

1. Set $\mathbf{u}_1 = \mathbf{v}_1$.
2. For $i = 2, 3, \ldots, n$, compute:
   - $\mathbf{u}_i = \mathbf{v}_i - \text{proj}_{\mathbf{u}_1}(\mathbf{v}_i) - \text{proj}_{\mathbf{u}_2}(\mathbf{v}_i) - \ldots - \text{proj}_{\mathbf{u}_{i-1}}(\mathbf{v}_i)$
   - Where $\text{proj}_{\mathbf{u}_j}(\mathbf{v}_i) = \frac{\langle \mathbf{v}_i, \mathbf{u}_j \rangle}{\langle \mathbf{u}_j, \mathbf{u}_j \rangle} \mathbf{u}_j$ is the orthogonal projection of $\mathbf{v}_i$ onto $\mathbf{u}_j$.

### Orthogonal Projections

Given a vector $\mathbf{v}$ and an orthogonal basis $\{\mathbf{u}_1, \mathbf{u}_2, \ldots, \mathbf{u}_n\}$, the orthogonal projection of $\mathbf{v}$ onto the subspace spanned by $\{\mathbf{u}_1, \mathbf{u}_2, \ldots, \mathbf{u}_n\}$ is the vector:

$$
\text{proj}_{\text{span}(\{\mathbf{u}_1, \mathbf{u}_2, \ldots, \mathbf{u}_n\})}(\mathbf{v}) = \sum_{i=1}^n \frac{\langle \mathbf{v}, \mathbf{u}_i \rangle}{\langle \mathbf{u}_i, \mathbf{u}_i \rangle} \mathbf{u}_i
$$

This projection represents the component of $\mathbf{v}$ along each direction $\mathbf{u}_i$.

### Example

Consider the vectors $\mathbf{v}_1 = \begin{pmatrix} 1 \\ 1 \\ 0 \end{pmatrix}$ and $\mathbf{v}_2 = \begin{pmatrix} 1 \\ 0 \\ 1 \end{pmatrix}$. To orthogonalize these vectors, we can apply the Gram-Schmidt process:

1. Set $\mathbf{u}_1 = \mathbf{v}_1$.
2. Compute $\mathbf{u}_2 = \mathbf{v}_2 - \text{proj}_{\mathbf{u}_1}(\mathbf{v}_2)$.

The resulting orthogonal vectors are $\mathbf{u}_1 = \begin{pmatrix} 1 \\ 1 \\ 0 \end{pmatrix}$ and $\mathbf{u}_2 = \begin{pmatrix} 0 \\ -1 \\ 1 \end{pmatrix}$.

### Applications

- The Gram-Schmidt process is used in various numerical algorithms, such as QR decomposition and least squares approximation.
- Orthogonal projections are fundamental in signal processing, image processing, and machine learning for dimensionality reduction and feature extraction.


