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


# Chapter 6: Diagonalization and Spectral Theorem

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Diagonalization of Matrices

In linear algebra, diagonalization is a process of finding a diagonal matrix that is similar to a given square matrix. Diagonalization is particularly useful because it simplifies many matrix computations and reveals important properties of the original matrix.

### Definition

A square matrix $A$ is said to be diagonalizable if there exists an invertible matrix $P$ and a diagonal matrix $D$ such that:

$$
A = PDP^{-1}
$$

where $D$ contains the eigenvalues of $A$ along its main diagonal, and the columns of $P$ are the corresponding eigenvectors of $A$.

### Procedure for Diagonalization

To diagonalize a matrix $A$, follow these steps:

1. Find the eigenvalues of $A$ by solving the characteristic equation $\text{det}(A - \lambda I) = 0$.
2. For each eigenvalue $\lambda$, find the corresponding eigenvectors by solving the equation $(A - \lambda I)\mathbf{v} = \mathbf{0}$.
3. If $A$ has $n$ linearly independent eigenvectors, form the matrix $P$ whose columns are the eigenvectors of $A$ and construct the diagonal matrix $D$ with the corresponding eigenvalues on the diagonal.
4. Verify that $P$ is invertible. If so, $A$ is diagonalizable, and $P^{-1}AP = D$.

### Properties

1. Not all matrices are diagonalizable. A matrix $A$ is diagonalizable if and only if it has $n$ linearly independent eigenvectors, where $n$ is the size of the matrix.
2. If $A$ is diagonalizable, then its powers $A^k$ for any positive integer $k$ can be easily computed as $(PDP^{-1})^k = PD^kP^{-1}$.

### Example

Consider the matrix:

$$
A = \begin{pmatrix}
2 & -1 \\
-1 & 2 \\
\end{pmatrix}
$$

To diagonalize $A$, first find its eigenvalues. Solving $\text{det}(A - \lambda I) = 0$, we get $\lambda_1 = 3$ and $\lambda_2 = 1$. Then, for each eigenvalue, find the corresponding eigenvectors. Let's say $\mathbf{v}_1 = \begin{pmatrix} 1 \\ 1 \end{pmatrix}$ and $\mathbf{v}_2 = \begin{pmatrix} 1 \\ -1 \end{pmatrix}$. 

Now, form the matrix $P = \begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$ and construct the diagonal matrix $D = \begin{pmatrix} 3 & 0 \\ 0 & 1 \end{pmatrix}$. Verify that $P^{-1}AP = D$.

### Applications

- Diagonalization is widely used in various fields such as physics, engineering, and computer science for solving systems of differential equations, analyzing dynamical systems, and performing transformations on data.
- It provides insights into the behavior and stability of systems described by linear transformations.


## Spectral Theorem for Hermitian Matrices

The spectral theorem for Hermitian matrices is a fundamental result in linear algebra, providing a powerful characterization of Hermitian matrices and their eigendecompositions.

### Theorem Statement

Let $A$ be a Hermitian matrix, i.e., $A = A^*$, where $A^*$ denotes the conjugate transpose of $A$. Then, there exists a unitary matrix $U$ such that:

$$
A = UDU^*
$$

where $D$ is a diagonal matrix containing the eigenvalues of $A$ on its diagonal.

### Properties

1. The eigenvalues of a Hermitian matrix are real.
2. The eigenvectors corresponding to distinct eigenvalues of a Hermitian matrix are orthogonal.
3. Hermitian matrices are diagonalizable.
4. The spectral theorem provides a geometric interpretation of Hermitian matrices as representing orthogonal transformations in a complex vector space.

### Applications

- The spectral theorem is widely used in quantum mechanics, where Hermitian matrices represent observables, and their eigendecompositions provide information about the possible measurement outcomes and states of a quantum system.
- In signal processing and image processing, the spectral theorem is used for analyzing and processing signals and images using techniques such as principal component analysis (PCA) and spectral filtering.

## Applications of Diagonalization in Linear Systems

Diagonalization of matrices plays a crucial role in various aspects of linear systems theory and applications.

### Solving Systems of Linear Equations

Given a diagonalizable matrix $A$, the system of linear equations $Ax = b$ can be solved efficiently by diagonalizing $A$ and solving the transformed system $D(P^{-1}x) = P^{-1}b$, where $D$ is the diagonal matrix and $P$ is the matrix of eigenvectors.

### Stability Analysis

Diagonalization is used in stability analysis of linear dynamical systems. For instance, in the study of ordinary differential equations, diagonalization helps identify the behavior of the system over time based on the eigenvalues of the system matrix.

### Eigenvalue Decomposition

Diagonalization provides an eigenvalue decomposition of a matrix, which is valuable in many applications such as solving differential equations, computing matrix exponentials, and performing power iterations for finding dominant eigenvalues.

### Singular Value Decomposition (SVD)

The SVD of a matrix is closely related to diagonalization. Diagonalizing the product of a matrix and its conjugate transpose leads to the SVD, which is a powerful tool in various fields such as data compression, signal processing, and machine learning.

### Applications

- Diagonalization is extensively used in control theory, signal processing, numerical analysis, and quantum mechanics for solving equations, analyzing stability, computing eigenvalues, and decomposing matrices.
- It provides insights into the behavior and properties of linear systems, facilitating efficient computations and analysis in diverse applications.

