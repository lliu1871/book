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


# Chapter 2: Systems of Linear Equations

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Gaussian Elimination and Matrix Formulation

Gaussian elimination is a method used in linear algebra to solve systems of linear equations by transforming the associated augmented matrix into row-echelon form and then back-substituting to find the solution.

### Matrix Formulation of Linear Systems

A system of $m$ linear equations with $n$ variables can be represented in matrix form as $Ax = b$, where:

- $A$ is the coefficient matrix of size $m \times n$,
- $x$ is the column vector of variables of size $n \times 1$, and
- $b$ is the column vector of constants on the right-hand side of the equations, also of size $m \times 1$.

For example, consider the system of linear equations:

$$
\begin{align*}
2x + 3y - z &= 5 \\
4x - y + 2z &= 6 \\
x + 2y - z &= 7
\end{align*}
$$

This system can be represented in matrix form as:

$$
\begin{pmatrix}
2 & 3 & -1 \\
4 & -1 & 2 \\
1 & 2 & -1
\end{pmatrix}
\begin{pmatrix}
x \\
y \\
z
\end{pmatrix}
=
\begin{pmatrix}
5 \\
6 \\
7
\end{pmatrix}
$$

### Gaussian Elimination Algorithm

The Gaussian elimination algorithm proceeds as follows:

1. **Forward Elimination:** Transform the augmented matrix into row-echelon form through a sequence of row operations, such as adding multiples of one row to another or multiplying a row by a scalar.

2. **Back Substitution:** Solve for the variables starting from the bottom row and working upwards by substituting the values of already-solved variables into the equations.

### Example

Let's solve the following system of equations using Gaussian elimination:

$$
\begin{align*}
2x + y - z &= 8 \\
-3x - y + 2z &= -11 \\
-2x + y + 2z &= -3
\end{align*}
$$

#### Step 1: Matrix Formulation

The augmented matrix corresponding to the system is:

$$
\left[
\begin{array}{ccc|c}
2 & 1 & -1 & 8 \\
-3 & -1 & 2 & -11 \\
-2 & 1 & 2 & -3
\end{array}
\right]
$$

#### Step 2: Forward Elimination

Perform row operations to transform the matrix into row-echelon form.

#### Step 3: Back Substitution

Solve for the variables using back substitution.

### Conclusion

Gaussian elimination is a powerful method for solving systems of linear equations, and its matrix formulation provides a convenient way to represent and manipulate such systems in a computational context.


## Solutions to Linear Systems

When solving a system of linear equations, there are three possible outcomes: a unique solution, no solution, or infinitely many solutions. Let's explore each case.

### Unique Solution

A system of linear equations has a unique solution if and only if the coefficient matrix is non-singular, meaning its determinant is non-zero.

#### Example

Consider the system:

$$
\begin{align*}
2x + y &= 5 \\
3x - 2y &= 4
\end{align*}
$$

The coefficient matrix is:

$$
A = \begin{pmatrix} 2 & 1 \\ 3 & -2 \end{pmatrix}
$$

The determinant of $A$ is $-7$, which is non-zero. Therefore, the system has a unique solution.

To solve the system, we can use Gaussian elimination or other methods to find the values of $x$ and $y$.

### No Solution

A system of linear equations has no solution if the equations are inconsistent, meaning they represent parallel lines in the plane or planes in space that do not intersect.

#### Example

Consider the system:

$$
\begin{align*}
x + 2y &= 3 \\
2x + 4y &= 5
\end{align*}
$$

The coefficient matrix is:

$$
A = \begin{pmatrix} 1 & 2 \\ 2 & 4 \end{pmatrix}
$$

The determinant of $A$ is $0$, which means the system is singular and has no solution.

### Infinitely Many Solutions

A system of linear equations has infinitely many solutions if the equations are dependent, meaning they represent the same line or plane.

#### Example

Consider the system:

$$
\begin{align*}
2x + 3y &= 6 \\
4x + 6y &= 12
\end{align*}
$$

The coefficient matrix is:

$$
A = \begin{pmatrix} 2 & 3 \\ 4 & 6 \end{pmatrix}
$$

The determinant of $A$ is $0$, indicating that the system is singular. Therefore, the equations are dependent, and the system has infinitely many solutions.

To find the solutions, we can express one variable in terms of the other and parameterize the solution set.



## Matrix Inverses and Determinants

Matrix inverses and determinants are important concepts in linear algebra that play a crucial role in solving systems of linear equations and analyzing transformations.

### Matrix Inverse

The inverse of a square matrix $A$, denoted as $A^{-1}$, is another matrix such that their product equals the identity matrix $I$. In other words, if $A$ is an $n \times n$ matrix, then $A^{-1}$ is also an $n \times n$ matrix satisfying:

$$
A A^{-1} = A^{-1} A = I
$$

#### Properties

- If $A$ is invertible (non-singular), then $A^{-1}$ exists.
- If $A$ is singular (non-invertible), then $A^{-1}$ does not exist.

### Determinant

The determinant of a square matrix $A$, denoted as $|A|$ or $\det(A)$, is a scalar value that represents a certain geometric scaling factor of the matrix. It provides important information about the matrix, including whether it is invertible.

#### Properties

- If $\det(A) \neq 0$, then $A$ is invertible.
- If $\det(A) = 0$, then $A$ is singular (non-invertible).
- The determinant of a product of matrices is the product of their determinants: $\det(AB) = \det(A) \det(B)$.
- The determinant of the transpose of a matrix is equal to the determinant of the original matrix: $\det(A^T) = \det(A)$.

### Calculating Matrix Inverses and Determinants

#### Inverse Calculation

The inverse of a matrix $A$ can be calculated using various methods, such as Gaussian elimination, adjoint method, or using software tools like NumPy or MATLAB.

#### Determinant Calculation

The determinant of a matrix $A$ can be calculated using various methods, such as expansion by minors, cofactor expansion, or using software tools like NumPy or MATLAB.

### Applications

- Matrix inverses are used to solve systems of linear equations efficiently.
- Determinants are used to determine the invertibility of matrices and to compute volumes, areas, and transformations in geometry.



