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


# Chapter 1: Introduction to Linear Algebra

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Overview of Vectors and Matrices
A vector is a mathematical object that represents a quantity having both magnitude and direction. In its simplest form, a vector can be represented as an ordered collection of numbers. A vector $\mathbf{v}$ of dimension $n$ is typically represented as:

$$
\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{pmatrix}
$$

where $v_1, v_2, \ldots, v_n$ are the components of the vector.

A matrix is a rectangular array of numbers arranged in rows and columns. Matrices are used to represent linear transformations, systems of linear equations, and various other mathematical structures. A matrix $A$ with $m$ rows and $n$ columns is typically represented as:

$$
A = \begin{pmatrix} a_{11} & a_{12} & \cdots & a_{1n} \\ a_{21} & a_{22} & \cdots & a_{2n} \\ \vdots & \vdots & \ddots & \vdots \\ a_{m1} & a_{m2} & \cdots & a_{mn} \end{pmatrix}
$$

where $a_{ij}$ represents the entry in the $i$th row and $j$th column.

## Basic Operations on Vectors and Matrices

### Operations on Vectors

#### Addition

Vector addition is performed by adding corresponding elements of two vectors of the same dimension.

$$
\mathbf{v} + \mathbf{w} = \begin{pmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{pmatrix} + \begin{pmatrix} w_1 \\ w_2 \\ \vdots \\ w_n \end{pmatrix} = \begin{pmatrix} v_1 + w_1 \\ v_2 + w_2 \\ \vdots \\ v_n + w_n \end{pmatrix}
$$

````{prf:example} Vector Addition Example

Consider two vectors in 2-dimensional space:

$$
\mathbf{v} = \begin{pmatrix} 3 \\ -2 \end{pmatrix}, \quad \mathbf{w} = \begin{pmatrix} 1 \\ 4 \end{pmatrix}
$$

To add these vectors, we simply add corresponding components:

$$
\mathbf{v} + \mathbf{w} = \begin{pmatrix} 3 \\ -2 \end{pmatrix} + \begin{pmatrix} 1 \\ 4 \end{pmatrix} = \begin{pmatrix} 3+1 \\ -2+4 \end{pmatrix} = \begin{pmatrix} 4 \\ 2 \end{pmatrix}
$$

So, the sum of vectors $\mathbf{v}$ and $\mathbf{w}$ is $\begin{pmatrix} 4 \\ 2 \end{pmatrix}$.
````

#### Scalar Multiplication

Scalar multiplication is performed by multiplying each element of a vector by a scalar.

$$
\alpha \mathbf{v} = \alpha \begin{pmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{pmatrix} = \begin{pmatrix} \alpha v_1 \\ \alpha v_2 \\ \vdots \\ \alpha v_n \end{pmatrix}
$$


````{prf:example} Vector Scalar Multiplication Example

Consider a vector in 2-dimensional space:

$$
\mathbf{v} = \begin{pmatrix} 2 \\ -3 \end{pmatrix}
$$

and a scalar value:

$$
c = 3
$$

To perform scalar multiplication, we multiply each component of the vector by the scalar:

$$
c \cdot \mathbf{v} = 3 \cdot \begin{pmatrix} 2 \\ -3 \end{pmatrix} = \begin{pmatrix} 3 \cdot 2 \\ 3 \cdot (-3) \end{pmatrix} = \begin{pmatrix} 6 \\ -9 \end{pmatrix}
$$

So, the result of scalar multiplication of vector $\mathbf{v}$ by scalar $c$ is $\begin{pmatrix} 6 \\ -9 \end{pmatrix}$.
````


#### Dot Product

The dot product (or inner product) of two vectors of the same dimension is the sum of the products of their corresponding elements.

$$
\mathbf{v} \cdot \mathbf{w} = v_1 w_1 + v_2 w_2 + \ldots + v_n w_n
$$

### Operations on Matrices

#### Addition

Matrix addition is performed by adding corresponding elements of two matrices of the same size.

$$
A + B = \begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} + \begin{pmatrix} b_{11} & b_{12} \\ b_{21} & b_{22} \end{pmatrix} = \begin{pmatrix} a_{11} + b_{11} & a_{12} + b_{12} \\ a_{21} + b_{21} & a_{22} + b_{22} \end{pmatrix}
$$

#### Scalar Multiplication

Scalar multiplication of a matrix is performed by multiplying each element of the matrix by a scalar.

$$
\alpha A = \alpha \begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} = \begin{pmatrix} \alpha a_{11} & \alpha a_{12} \\ \alpha a_{21} & \alpha a_{22} \end{pmatrix}
$$

#### Matrix Multiplication

Matrix multiplication is performed by taking the dot product of rows of the first matrix and columns of the second matrix.

$$
C = AB = \begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} \begin{pmatrix} b_{11} & b_{12} \\ b_{21} & b_{22} \end{pmatrix} = \begin{pmatrix} a_{11}b_{11} + a_{12}b_{21} & a_{11}b_{12} + a_{12}b_{22} \\ a_{21}b_{11} + a_{22}b_{21} & a_{21}b_{12} + a_{22}b_{22} \end{pmatrix}
$$


````{prf:example} Matrix Multiplication Example

Consider two matrices:

$$
A = \begin{pmatrix} 2 & -1 \\ 3 & 4 \end{pmatrix}, \quad B = \begin{pmatrix} 5 & 2 \\ -2 & 1 \end{pmatrix}
$$

To multiply matrices $A$ and $B$, we perform row-by-column multiplication and sum the products:

$$
A \times B = \begin{pmatrix} 2 & -1 \\ 3 & 4 \end{pmatrix} \times \begin{pmatrix} 5 & 2 \\ -2 & 1 \end{pmatrix} = \begin{pmatrix} (2 \times 5) + (-1 \times -2) & (2 \times 2) + (-1 \times 1) \\ (3 \times 5) + (4 \times -2) & (3 \times 2) + (4 \times 1) \end{pmatrix} = \begin{pmatrix} 12 & 3 \\ 7 & 14 \end{pmatrix}
$$

So, the product of matrices $A$ and $B$ is $\begin{pmatrix} 12 & 3 \\ 7 & 14 \end{pmatrix}$.
````


## Geometric Interpretation of Vectors

In Euclidean space, vectors can be interpreted geometrically as directed line segments with both magnitude and direction. They are often represented as arrows in space.

### Representation

A vector $\mathbf{v}$ in $\mathbb{R}^n$ can be represented as an ordered collection of $n$ real numbers, corresponding to the coordinates of its endpoint relative to a chosen origin and coordinate system.

$$
\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{pmatrix}
$$

### Geometric Properties

#### Magnitude

The magnitude (or length) of a vector $\mathbf{v}$ is denoted by $\|\mathbf{v}\|$ and is calculated using the Pythagorean theorem:

$$
\|\mathbf{v}\| = \sqrt{v_1^2 + v_2^2 + \ldots + v_n^2}
$$

#### Direction

The direction of a vector $\mathbf{v}$ is determined by the angle it makes with the coordinate axes or with another vector.

#### Addition and Subtraction

Vector addition and subtraction can be geometrically interpreted as the combination or decomposition of vectors using the parallelogram rule or the triangle rule.

#### Scalar Multiplication

Scalar multiplication of a vector $\mathbf{v}$ by a scalar $\alpha$ results in a vector that is parallel to $\mathbf{v}$ and has a magnitude scaled by $\alpha$.

### Dot Product

The dot product of two vectors $\mathbf{v}$ and $\mathbf{w}$ is a scalar quantity given by the projection of one vector onto the other, scaled by the magnitudes of both vectors and the cosine of the angle between them:

$$
\mathbf{v} \cdot \mathbf{w} = \|\mathbf{v}\| \|\mathbf{w}\| \cos(\theta)
$$

where $\theta$ is the angle between $\mathbf{v}$ and $\mathbf{w}$.

### Cross Product

The cross product of two vectors $\mathbf{v}$ and $\mathbf{w}$ in three-dimensional space results in a vector that is perpendicular to both $\mathbf{v}$ and $\mathbf{w}$, with a magnitude equal to the area of the parallelogram formed by $\mathbf{v}$ and $\mathbf{w}$.





