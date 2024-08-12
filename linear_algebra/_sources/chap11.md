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


# Chapter 11: Linear Transformation

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Linear transformations

A linear transformation is a function between two vector spaces that preserves vector addition and scalar multiplication. In other words, for a linear transformation \( T \), if \( u \) and \( v \) are vectors in the domain of \( T \) and \( c \) is a scalar, then:

1. \( T(u + v) = T(u) + T(v) \) 
2. \( T(cu) = cT(u) \)

These properties ensure that the structure of the vector space is maintained under the transformation. Examples of linear transformations include rotations, reflections, scaling, and projections.
Linear transformations have several important properties:

1. Additivity: For any two vectors \( \mathbf{u} \) and \( \mathbf{v} \) in the domain of the transformation \( T \), we have \( T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v}) \).

2. Homogeneity: For any scalar \( c \) and any vector \( \mathbf{v} \) in the domain of \( T \), we have \( T(c\mathbf{v}) = cT(\mathbf{v}) \).

3. Preserves the origin: The linear transformation takes the zero vector in the domain to the zero vector in the codomain: \( T(\mathbf{0}) = \mathbf{0} \).

4. Preserves linear combinations: For any vectors \( \mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n \) and scalars \( c_1, c_2, \ldots, c_n \), we have \( T(c_1\mathbf{v}_1 + c_2\mathbf{v}_2 + \cdots + c_n\mathbf{v}_n) = c_1T(\mathbf{v}_1) + c_2T(\mathbf{v}_2) + \cdots + c_nT(\mathbf{v}_n) \).

5. Composition: The composition of two linear transformations is also a linear transformation.

6. Transformation of the standard basis: The image of the standard basis vectors under a linear transformation uniquely determines the transformation.

7. Invertibility: A linear transformation is invertible if and only if its matrix representation is invertible.

These properties are crucial for understanding the behavior of linear transformations and their applications in various mathematical and scientific fields.
There are several important theorems related to linear transformations. Here are some of the key theorems in linear algebra pertaining to linear transformations:

1. The Linearity Property: A function T: V → W is a linear transformation if it satisfies the following two properties for all vectors u, v in V and scalars c:
- T(u + v) = T(u) + T(v) (additivity)
- T(cu) = cT(u) (homogeneity)

2. Kernel-Image Theorem: Let T: V → W be a linear transformation. The kernel of T, denoted by Ker(T), is the set of all vectors v in V such that T(v) = 0. The image of T, denoted by Im(T), is the set of all vectors w in W that can be written as w = T(v) for some v in V. The Kernel-Image theorem states:
- Ker(T) is a subspace of V.
- Im(T) is a subspace of W.
- dim(Ker(T)) + dim(Im(T)) = dim(V).

3. Rank-Nullity Theorem: For a linear transformation T: V → W, the rank of T is the dimension of the image of T, denoted by rank(T), and the nullity of T is the dimension of the kernel of T, denoted by nullity(T). The Rank-Nullity theorem states:
- rank(T) + nullity(T) = dim(V).

4. Invertible Transformation Theorem: A linear transformation T: V → W is invertible if and only if it is bijective, meaning that it is both injective (one-to-one) and surjective (onto).

5. Matrix Representation Theorem: Every linear transformation T: V → W between finite-dimensional vector spaces V and W can be represented by a matrix. Given bases B and B' for V and W respectively, the matrix of the linear transformation T with respect to these bases is unique.

These theorems are fundamental in the study of linear algebra and provide important insights into the properties and structure of linear transformations and their relationship with vector spaces.
## Isomorphisms

In linear algebra, an isomorphism between two vector spaces V and W is a linear transformation T: V -> W that is bijective, meaning it is both injective (no two different vectors in V are mapped to the same vector in W) and surjective (every vector in W is the image of some vector in V). Isomorphisms preserve the structure and properties of vector spaces, such as dimensions, basis, and operations. Two isomorphic vector spaces are essentially the same in terms of their linear algebraic structure, just expressed in different bases or coordinate systems.
An isomorphism is a one-to-one linear transformation between two vector spaces that preserves both the operations of addition and scalar multiplication. Here are some key properties of isomorphisms:

1. Injective: An isomorphism is injective, meaning it maps distinct inputs to distinct outputs. In other words, if two vectors in the domain are different, their images under the isomorphism will also be different.

2. Surjective: An isomorphism is surjective, meaning every element in the codomain is the image of some element in the domain. In other words, every element in the codomain is mapped to by at least one element in the domain.

3. Bijective: An isomorphism is bijective, meaning it is both injective and surjective. This implies that there is a one-to-one correspondence between elements in the domain and elements in the codomain.

4. Preserves operations: An isomorphism preserves the operations of addition and scalar multiplication. This means that if you apply the isomorphism to the sum of two vectors, it will be the same as the sum of the images of those vectors under the isomorphism. Similarly, the isomorphism of a scalar multiple of a vector will be the same as the scalar multiple of the image of that vector.

5. Invertible: An isomorphism has an inverse mapping that is also an isomorphism. This means that there exists a linear transformation that "undoes" the original isomorphism, mapping elements from the codomain back to the domain.

6. Dimension-preserving: An isomorphism between finite-dimensional vector spaces preserves the dimension of the vector spaces. This means that if two vector spaces are isomorphic, they have the same dimension.

7. Unique: If two vector spaces are isomorphic, the isomorphism between them is unique. In other words, there is only one linear transformation that establishes the isomorphism between the two vector spaces.
1. Theorem 1: Let V and W be vector spaces over the same field F. An isomorphism between V and W is a bijective linear transformation from V to W. In other words, a linear transformation T: V → W is an isomorphism if and only if T is both injective and surjective.

2. Theorem 2: If T: V → W is an isomorphism, then the inverse function T^-1 : W → V exists and is also an isomorphism. In other words, T^-1 is a linear transformation that maps W back to V and preserves vector space operations.

3. Theorem 3: If V and W are finite-dimensional vector spaces over the same field F, then V and W are isomorphic if and only if they have the same dimension. This implies that any two finite-dimensional vector spaces with the same dimension are isomorphic.

4. Theorem 4: Let V be a vector space and B = {v1, v2, ..., vn} be a basis for V. Then, for any vector space W and any set of vectors {w1, w2, ..., wn} in W, there exists a unique linear transformation T: V → W such that T(vi) = wi for all i = 1, 2, ..., n.

5. Theorem 5: If T: V → W is an isomorphism between vector spaces V and W, then T preserves linear independence and spanning sets. That is, if {v1, v2, ..., vn} is a linearly independent set in V, then {T(v1), T(v2), ..., T(vn)} is linearly independent in W. Similarly, if {v1, v2, ..., vn} spans V, then {T(v1), T(v2), ..., T(vn)} spans W.

These theorems provide important properties and results related to isomorphisms between vector spaces.
## The Kernel and Image of a Linear Transformation

The kernel and image of a linear transformation are fundamental concepts in linear algebra.

The kernel of a linear transformation T: V → W, denoted as ker(T), is the set of all vectors in the domain V that are mapped to the zero vector in the codomain W by the transformation. Formally, ker(T) = {v ∈ V : T(v) = 0}.

The image of a linear transformation T, denoted as im(T) or sometimes as range(T), is the set of all possible output vectors in the codomain W that can be obtained by applying the transformation to vectors in the domain V. Formally, im(T) = {T(v) : v ∈ V}.

The kernel and image of a linear transformation are related in that the kernel contains all vectors that are "lost" or mapped to zero by the transformation, while the image consists of all the possible "outputs" that can be obtained by applying the transformation.

These concepts have important implications in linear algebra, such as determining whether a linear transformation is injective (one-to-one), surjective (onto), or bijective (both injective and surjective). The kernel and image also play a key role in understanding the structure and properties of linear transformations and matrices.
The kernel and image of a linear transformation are fundamental concepts in linear algebra that provide valuable insights into the behavior and structure of a linear transformation. Here are some key properties of the kernel and image of a linear transformation:

1. Kernel (Null Space):
- The kernel of a linear transformation T, denoted as ker(T), is the set of all vectors in the domain of T that get mapped to the zero vector in the codomain.
- The kernel of a linear transformation is always a subspace of the domain.
- The dimension of the kernel is known as the nullity of the linear transformation.
- The kernel is non-empty if and only if the linear transformation is not injective (one-to-one).

2. Image (Range):
- The image of a linear transformation T, denoted as Im(T) or range(T), is the set of all vectors in the codomain that can be obtained by applying T to vectors in the domain.
- The image of a linear transformation is always a subspace of the codomain.
- The dimension of the image is known as the rank of the linear transformation.
- The image is non-empty if and only if the linear transformation is not surjective (onto).

3. Dimension Theorem (Rank-Nullity Theorem):
- The kernel and image of a linear transformation are related by the dimension theorem, also known as the rank-nullity theorem.
- For a linear transformation T from an n-dimensional vector space V to an m-dimensional vector space W, the rank-nullity theorem states that dim(ker(T)) + dim(Im(T)) = n.
- This theorem provides a fundamental relationship between the dimension of the kernel, the dimension of the image, and the dimension of the domain of the linear transformation.

4. Relationship between Kernel and Image:
- The kernel and image of a linear transformation are related through the fundamental theorem of linear algebra, which states that for a linear transformation T from an n-dimensional vector space V to an m-dimensional vector space W, the image of T is the orthogonal complement of the kernel of T in V.
- This relationship highlights the duality between the kernel and image of a linear transformation and provides insights into the structure of the linear transformation.

Overall, the kernel and image of a linear transformation play crucial roles in understanding the behavior and properties of linear transformations, and their study forms a core part of linear algebra theory.
1. Kernel-Image Theorem: Let \( T: V \rightarrow W \) be a linear transformation between vector spaces V and W. Then, the rank-nullity theorem states that:

\[
\text{rank}(T) + \text{nullity}(T) = \text{dim}(V)
\]

where \(\text{rank}(T)\) is the dimension of the image of T and \(\text{nullity}(T)\) is the dimension of the kernel of T.

2. Dimension of Kernel: The dimension of the kernel of a linear transformation \( T: V \rightarrow W \) is also known as the nullity of T and is denoted by \(\text{nullity}(T)\). It is equal to the number of linearly independent vectors in the kernel.

3. Dimension of Image: The dimension of the image of a linear transformation \( T: V \rightarrow W \) is denoted by \(\text{rank}(T)\) and is equal to the number of linearly independent vectors in the image.

4. Rank-Nullity Theorem: Let \( T: V \rightarrow W \) be a linear transformation between vector spaces V and W. Then, the rank-nullity theorem states that:

\[
\text{rank}(T) + \text{nullity}(T) = \text{dim}(V)
\]

5. Injective Linear Transformation: A linear transformation \( T: V \rightarrow W \) is injective if and only if the kernel of T is {0}, meaning that the only vector that gets mapped to the zero vector in W is the zero vector in V.

6. Surjective Linear Transformation: A linear transformation \( T: V \rightarrow W \) is surjective if and only if the image of T equals W, i.e., every vector in W is the image of some vector in V under T. 

These theorems are fundamental in understanding the properties of linear transformations and their associated kernel and image spaces.
## Linear Transformations from F^m to F^n 

A linear transformation from the vector space \(F^m\) to \(F^n\) is a function \(T: F^m \rightarrow F^n\) that satisfies two properties:

1. Additivity: For any vectors \(\mathbf{v_1}, \mathbf{v_2} \in F^m\), \(T(\mathbf{v_1} + \mathbf{v_2}) = T(\mathbf{v_1}) + T(\mathbf{v_2})\).
2. Homogeneity: For any scalar \(c \in F\) and vector \(\mathbf{v} \in F^m\), \(T(c\mathbf{v}) = cT(\mathbf{v})\).

In other words, a linear transformation preserves vector addition and scalar multiplication.
Linear transformations from the vector space \( F^m \) to \( F^n \) have the following key properties:

1. Linearity: A linear transformation T: \( F^m \) -> \( F^n \) satisfies the properties of additivity and homogeneity:
   - Additivity: \( T(u + v) = T(u) + T(v) \) for all vectors \( u, v \) in \( F^m \).
   - Homogeneity: \( T(cu) = cT(u) \) for all scalar \( c \) in \( F \) and vector \( u \) in \( F^m \).

2. Preservation of Vector Operations: The linear transformation T preserves vector addition and scalar multiplication, i.e., \( T(cu + dv) = cT(u) + dT(v) \) for all vectors \( u, v \) in \( F^m \) and scalars \( c, d \) in \( F \).

3. Matrix Representation: A linear transformation from \( F^m \) to \( F^n \) can be represented by an \( n \times m \) matrix. The columns of the matrix correspond to the images of the basis vectors of \( F^m \) under the transformation.

4. Kernel and Image: The kernel of a linear transformation from \( F^m \) to \( F^n \) is the set of vectors that are mapped to the zero vector in \( F^n \). The image (or range) of the transformation is the set of all possible outputs of the transformation.

5. Rank and Nullity: The rank of a linear transformation is the dimension of its image, while the nullity is the dimension of its kernel. The rank-nullity theorem states that the sum of the rank and nullity of a linear transformation is equal to the dimension of the domain.

6. Invertibility: A linear transformation is invertible if and only if the transformation is both injective (one-to-one) and surjective (onto). In this case, the inverse transformation also exists, and the composition of a linear transformation with its inverse gives the identity transformation.

These properties are fundamental in the study of linear algebra and play a crucial role in various applications in mathematics and other fields.
There are several important theorems related to linear transformations from \(F^m\) to \(F^n\) where \(F\) is a field. Here are a few important theorems:

1. The Rank-Nullity Theorem: This theorem states that for a linear transformation \(T: F^m \rightarrow F^n\), the sum of the dimension of the image of \(T\) (also known as the rank of \(T\)) and the dimension of the kernel of \(T\) (also known as the nullity of \(T\)) is equal to the dimension of the domain of \(T\). Mathematically, if \(T: F^m \rightarrow F^n\) is a linear transformation, then \(\text{rank}(T) + \text{nullity}(T) = m\).

2. Invertibility Theorem: A linear transformation \(T: F^m \rightarrow F^n\) is invertible if and only if its matrix representation is invertible. In other words, \(T\) is invertible if and only if its matrix \(A\) is invertible.

3. Rank-Nullity Theorem for Matrices: For a matrix \(A\) that represents a linear transformation from \(F^m\) to \(F^n\), the rank of \(A\) is equal to the rank of the linear transformation it represents. Furthermore, the nullity of \(A\) is equal to the nullity of the linear transformation it represents.

4. Isomorphism Theorem: If \(T: F^m \rightarrow F^n\) is a linear transformation and \(m = n\), and \(T\) is also bijective (both injective and surjective), then \(T\) is an isomorphism. An isomorphism is a bijective linear transformation.

These theorems are fundamental in the study of linear algebra and help in understanding the properties and behavior of linear transformations from \(F^m\) to \(F^n\).
## The Rank Plus Nullity Theorem

The Rank Plus Nullity Theorem, also known as the Rank-Nullity Theorem, is a fundamental result in linear algebra that relates the dimensions of the range (or image) and the null space of a linear transformation. 

Formally, the theorem states that for a linear transformation T: V -> W between vector spaces V and W, the sum of the rank of the transformation and the dimension of the null space (kernel) of the transformation is equal to the dimension of the domain:

rank(T) + dim(ker(T)) = dim(V)

In other words, the rank of a linear transformation is the dimension of the image of the transformation, while the nullity is the dimension of the kernel (set of all vectors that map to zero under the transformation). The Rank Plus Nullity Theorem provides a way to understand the relationship between these two important subspaces of a linear transformation.
The Rank Plus Nullity Theorem, also known as the Rank-Nullity Theorem, is a fundamental result in linear algebra that relates the dimensions of the image and kernel of a linear transformation. The theorem states that for a linear transformation \( T: V \rightarrow W \) where \( V \) and \( W \) are vector spaces, the sum of the rank of \( T \) and the nullity of \( T \) is equal to the dimension of the domain \( V \):

\[ \text{rank}(T) + \text{nullity}(T) = \text{dim}(V) \]

Here are some key properties of the Rank-Nullity Theorem:

1. **Rank of a Transformation (Image):** The rank of a linear transformation \( T \) is the dimension of the image of \( T \), denoted as \( \text{rank}(T) \). This represents the maximum number of linearly independent vectors in the image of \( T \).

2. **Nullity of a Transformation (Kernel):** The nullity of a linear transformation \( T \) is the dimension of the kernel of \( T \), denoted as \( \text{nullity}(T) \). The kernel is the set of all vectors in the domain that are mapped to the zero vector in the co-domain.

3. **Dimension of the Domain:** The dimension of the domain of the linear transformation is denoted as \( \text{dim}(V) \). It represents the number of vectors needed to form a basis for the domain vector space \( V \).

4. **Relationship between Rank, Nullity, and Dimension:** The Rank-Nullity Theorem establishes a relationship between the rank, nullity, and dimension of a linear transformation. It states that the sum of the rank of \( T \) and the nullity of \( T \) is equal to the dimension of the domain \( V \).

5. **Usage in Solving Systems of Linear Equations:** The Rank-Nullity Theorem is often used in solving systems of linear equations to determine the number of independent equations and unknowns. It provides insight into the structure of the solution space and the existence of solutions.

6. **Invariance of Rank and Nullity:** The Rank-Nullity Theorem holds true for any linear transformation, regardless of the specific choice of basis for the vector spaces involved. This property makes it a powerful tool in linear algebra.

Overall, the Rank-Nullity Theorem is a fundamental result that provides a direct connection between the rank and nullity of a linear transformation and the dimension of its domain. It is a key concept in understanding the structure and properties of linear transformations in vector spaces.
The Rank-Nullity Theorem, also known as the Rank Plus Nullity Theorem, is a fundamental result in linear algebra that relates the dimensions of the column space and null space of a matrix to the number of columns and rows of the matrix. Here are the theorems associated with the Rank-Nullity Theorem:

1. Rank-Nullity Theorem: Let A be an m x n matrix. The rank of A plus the nullity of A equals the number of columns of A,
   i.e., rank(A) + nullity(A) = n.

2. Rank of a Matrix: The rank of a matrix A is the dimension of the column space of A, denoted by rank(A).

3. Nullity of a Matrix: The nullity of a matrix A is the dimension of the null space of A, denoted by nullity(A).

4. Dimension Theorem: For any m x n matrix A, dim(col(A)) + dim(null(A)) = n, where dim(col(A)) represents the dimension of the column space of A (rank of A) and dim(null(A)) represents the dimension of the null space of A (nullity of A).

5. Relationship to Row Space: The rank of a matrix A is also equal to the dimension of the row space of A. Therefore, rank(A) = rank(A^T).

6. Full Rank Matrix: A matrix with a rank equal to the number of columns is called a full rank matrix. Therefore, for a full rank matrix A, rank(A) = n and nullity(A) = 0.

These theorems highlight the relationship between the rank and nullity of a matrix, and they are essential in understanding the properties and structure of linear transformations represented by matrices.
## Change of Basis Matrices

A change of basis matrix is a matrix used to convert between different bases of a vector space. If we have two bases B and B' of a vector space V, and V has dimension n, then a change of basis matrix P is an invertible matrix such that if v is a vector in V expressed in terms of the basis B as [v]_B and in terms of the basis B' as [v]_B', then we have the relationship [v]_B' = P[v]_B.

In other words, a change of basis matrix allows us to convert the coordinates of a vector from one basis to another basis in the same vector space.
A change of basis matrix is a matrix that allows us to convert vectors and linear transformations between different basis vectors. Here are some properties of change of basis matrices:

1. Invertibility: A change of basis matrix is invertible, meaning that it has an inverse matrix that can be used to convert back to the original basis.

2. Composition: If you have two change of basis matrices, say P and Q, for converting between basis A and basis B, and between basis B and basis C respectively, then the composition of P and Q, PQ, will be a change of basis matrix for converting between basis A and basis C.

3. Transpose: The transpose of a change of basis matrix is also a change of basis matrix. This allows us to convert linear transformations in the original basis to the new basis.

4. Multiplication: Multiplying a vector by a change of basis matrix converts the vector from the original basis to the new basis.

5. Linear Independence: Change of basis matrices preserve linear independence. If a set of vectors are linearly independent in one basis, they will remain linearly independent in the new basis.

6. Eigenvalues: The eigenvalues of a linear transformation will remain the same under a change of basis.

7. Determinant: The determinant of a change of basis matrix is nonzero, ensuring that it is invertible and does not change the orientation of vectors.

These properties make change of basis matrices a powerful tool in linear algebra for understanding and manipulating vectors and linear transformations in different coordinate systems.
There are several important theorems related to change of basis matrices in linear algebra. Some of the key theorems include:

1. Let V be a vector space with finite basis B and B' and let P be the change of basis matrix from B to B'. If v is a vector in V with coordinates X with respect to B and X' with respect to B', then X' = PX.

2. If P is the change of basis matrix from basis B to basis B', then P^-1 is the change of basis matrix from basis B' to basis B.

3. If A is a matrix representing a linear transformation T with respect to basis B and A' is a matrix representing the same linear transformation with respect to basis B', then there exists a change of basis matrix P such that A' = P^-1AP.

4. If A and B are similar matrices, i.e., there exists an invertible matrix P such that A = P^-1BP, then they represent the same linear transformation under different bases.

5. The change of basis matrix is unique for a given pair of bases. That is, if there exists two change of basis matrices P and Q relating basis B and B', then P = Q.

These theorems highlight the fundamental properties of change of basis matrices and their importance in understanding linear transformations with respect to different bases.
## The Matrix of a Linear Transformation

The matrix of a linear transformation is a representation of the transformation in terms of a matrix. Given a linear transformation T: V -> W between vector spaces V and W, where dim(V) = n and dim(W) = m, the matrix of T is an m x n matrix A such that for any vector x in V, the action of T on x can be expressed as the matrix-vector product Ax.

More formally, if {v1, v2, ..., vn} is a basis for V and {w1, w2, ..., wm} is a basis for W, the matrix A is defined such that for any vector x = a1v1 + a2v2 + ... + anvn in V, the action of T on x can be written as T(x) = b1w1 + b2w2 + ... + bmwm, where the coefficients b1, b2, ..., bm are the entries of the column vector Ax.

In summary, the matrix of a linear transformation serves as a way to represent the transformation using matrix operations and allows for efficient computation of the transformed vectors.
The matrix of a linear transformation represents how the transformation affects vectors in a given vector space. Here are some key properties of the matrix of a linear transformation:

1. Basis Representation: The matrix of a linear transformation with respect to a given basis for the vector spaces involved reveals how the transformation behaves on the basis vectors. Specifically, the columns of the matrix correspond to the images of the basis vectors under the linear transformation.

2. Composition: The matrix of the composition of two linear transformations is the product of the matrices of the individual transformations. This property makes it convenient to determine the effect of applying multiple linear transformations sequentially.

3. Invertibility: A linear transformation is invertible if and only if its matrix is invertible. In other words, the matrix is invertible if and only if the corresponding linear transformation is bijective (one-to-one and onto).

4. Change of Basis: The matrix of a linear transformation changes when the basis of the vector space is changed. Specifically, if you change the basis, the matrix of the linear transformation will be conjugated by the change of basis matrix.

5. Rank and Nullity: The rank of the matrix of a linear transformation is equal to the rank of the linear transformation itself. Similarly, the nullity of the matrix is the same as the nullity of the linear transformation.

6. Eigenvalues and Eigenvectors: The eigenvectors and eigenvalues of a linear transformation are related to the eigenvectors and eigenvalues of its matrix. In particular, the eigenvectors are the same, while the eigenvalues may differ if a change of basis is involved.

7. Determinant: The determinant of the matrix of a linear transformation is equal to the determinant of the linear transformation itself. This property can be used to determine whether a transformation preserves orientation.

These properties highlight the close relationship between a linear transformation and its corresponding matrix representation, making matrices a powerful tool for analyzing and understanding linear transformations.
There are several theorems related to the matrix representation of a linear transformation. Some of the important theorems are:

1. **Existence and Uniqueness Theorem**: Every linear transformation from a finite-dimensional vector space V to a finite-dimensional vector space W can be represented by a unique matrix.

2. **Standard Matrix Representation Theorem**: Let T : V -> W be a linear transformation, where V and W are finite-dimensional vector spaces with ordered bases B = {v1, v2, ..., vn} and C = {w1, w2, ..., wm} respectively. Then there exists a unique matrix A such that [T]B,C = A, where [T]B,C denotes the matrix representation of T with respect to bases B and C.

3. **Matrix of Composition Theorem**: Let S : U -> V and T : V -> W be linear transformations, where U, V, and W are finite-dimensional vector spaces. Suppose B, C, and D are ordered bases for U, V, and W respectively. Then the matrix of the composition T ◦ S is equal to the product of the matrices [T]C,D and [S]B,C, i.e., [T ◦ S]B,D = [T]C,D [S]B,C.

4. **Change of Basis Formula**: Let T : V -> V be a linear transformation on a finite-dimensional vector space V, and let B and C be two ordered bases for V. If P is the change of basis matrix from B to C, then the matrix representation of T with respect to basis C is given by [T]C = P^(-1) [T]B P, where [T]B and [T]C are the matrix representations of T with respect to bases B and C respectively.

5. **Rank-Nullity Theorem**: For any linear transformation T : V -> W between finite-dimensional vector spaces V and W, the rank of T plus the nullity of T equals the dimension of V.

These theorems play a crucial role in understanding the relationship between linear transformations and their matrix representations.
## Change of Bases for Linear Transformations

Change of bases for linear transformations refers to the process of analyzing how the representation of a linear transformation changes when the basis of the vector space is changed. 

When we have a linear transformation \( T: V \rightarrow W \) between vector spaces \( V \) and \( W \), and we have two different bases \( B \) and \( B' \) for the vector space \( V \), we can determine how the matrix representation of the linear transformation changes when we switch from basis \( B \) to basis \( B' \) using a change of basis matrix.

Let \( P \) be the change of basis matrix that transforms coordinates of vectors in basis \( B \) to coordinates in basis \( B' \). If \( [T]_B \) represents the matrix of the linear transformation \( T \) with respect to basis \( B \) and \( [T]_{B'} \) represents the matrix of \( T \) with respect to basis \( B' \), then the relationship between these matrices is given by:

\[ [T]_{B'} = P^{-1} [T]_B P \]

This equation shows how the matrix representation of the linear transformation changes when the basis is changed using the change of basis matrix \( P \). This concept is crucial in understanding how linear transformations behave with respect to different bases and is fundamental in linear algebra.
There are several important properties of change of bases for linear transformations:

1. Linear independence: If a set of vectors is linearly independent in one basis, they will remain linearly independent in any other basis. Conversely, if a set of vectors is linearly dependent in one basis, they will remain linearly dependent in any other basis.

2. Eigenvalues and eigenvectors: The eigenvalues and eigenvectors of a linear transformation are invariant under a change of basis. This means that the eigenvalues and eigenvectors will remain the same regardless of the basis chosen.

3. Matrix representation: The matrix representation of a linear transformation changes when the basis changes. Specifically, if we have a linear transformation represented by a matrix A with respect to one basis, the matrix representation of the same transformation with respect to a different basis is given by the change of basis matrix P multiplied by the original matrix A, and then multiplied by the inverse of the change of basis matrix P^(-1).

4. Transformation properties: The transformation properties of a linear transformation, such as whether it is invertible or diagonalizable, are preserved under a change of basis. This means that any structural properties of the linear transformation will remain the same, regardless of the basis chosen.

Overall, change of bases for linear transformations allows us to analyze and understand linear transformations in different coordinate systems, while preserving important properties such as linear independence, eigenvalues and eigenvectors, and transformation properties.
There are two important theorems related to change of bases for linear transformations:

1. Change of Basis Theorem for Linear Transformations: Let \( T: V \rightarrow W \) be a linear transformation between vector spaces \( V \) and \( W \), and let \( B = \{v_1, v_2, \ldots, v_n\} \) and \( C = \{w_1, w_2, \ldots, w_n\} \) be two ordered bases for \( V \). Suppose that \( P = [v_1, v_2, \ldots, v_n] \) and \( Q = [w_1, w_2, \ldots, w_n] \) are the respective coordinate matrices. If \( A \) is the matrix representation of \( T \) with respect to the basis \( B \) and \( D \) is the matrix representation of \( T \) with respect to the basis \( C \), then \( D = Q^{-1}AP \).

2. Similarity Transformation Theorem: Let \( A \) and \( B \) be two square matrices of the same size. If there exists an invertible matrix \( P \) such that \( B = P^{-1}AP \), then \( A \) and \( B \) are said to be similar matrices. This theorem also applies to linear transformations if we consider the matrix representations of the transformations as matrices.

These theorems are fundamental in understanding how the representation of a linear transformation changes when we change the basis of the vector spaces involved.
## Equivalence of Matrices

Two matrices are said to be equivalent if they can be transformed into each other by a sequence of elementary row operations. These row operations include:

1. Swapping two rows.
2. Multiplying a row by a nonzero scalar.
3. Adding a multiple of one row to another row.

If two matrices can be transformed into each other using these elementary row operations, then they are considered equivalent. This equivalence relation is important in linear algebra as equivalent matrices represent the same linear transformation in different bases or have the same row space and null space properties.
The equivalence of matrices refers to the relation between two matrices that have the same row echelon form. In other words, two matrices are considered equivalent if one can be transformed into the other through a sequence of elementary row operations.

Some key properties of equivalence of matrices include:

1. Reflexivity: A matrix is equivalent to itself. This is because the row echelon form of a matrix is itself, so no row operations are needed to transform it into itself.

2. Symmetry: If matrix A is equivalent to matrix B, then matrix B is also equivalent to matrix A. This property stems from the fact that elementary row operations are reversible.

3. Transitivity: If matrix A is equivalent to matrix B, and matrix B is equivalent to matrix C, then matrix A is equivalent to matrix C. This property follows from the fact that the row echelon form is unique for a given matrix, so if two matrices share the same row echelon form, they must be equivalent.

4. Equivalence is an equivalence relation: This means that the relation of equivalence between matrices satisfies the properties of reflexivity, symmetry, and transitivity.

5. Equivalence preserves certain properties: If two matrices are equivalent, they share some important properties such as rank, determinant, and eigenvalues. This makes equivalence useful in various applications, such as solving systems of linear equations and understanding the geometric properties of matrices.

These properties make the concept of equivalence of matrices a powerful tool in linear algebra for simplifying calculations, analyzing matrices, and solving problems.
There are several theorems related to the equivalence of matrices in linear algebra. Here are some of the key theorems:

1. Two matrices are equivalent if and only if they have the same rank.

2. If two matrices are row equivalent, then they are equivalent.

3. If two matrices are equivalent, then they have the same nullity.

4. If two matrices are equivalent, then they have the same column space.

5. If two matrices are equivalent, then they have the same row space.

6. If two matrices are equivalent, then they have the same determinant.

7. If two matrices are equivalent, then they have the same eigenvalues.

These theorems are fundamental in understanding the properties and relationships between equivalent matrices in linear algebra.
## Similarity of Matrices

Two matrices A and B are said to be similar if there exists an invertible matrix P such that B = P^(-1) * A * P. In other words, matrices A and B are similar if they represent the same linear transformation under different bases.
When two square matrices A and B are said to be similar, there exists an invertible matrix P such that B = P^-1AP. The concept of similarity has several important properties, including:

1. Similar matrices have the same eigenvalues: If A and B are similar matrices, then they have the same eigenvalues. This can be shown by observing that det(B - λI) = det(P^-1AP - λI) = det(A - λI), where λ represents an eigenvalue.

2. Similar matrices have the same characteristic polynomial: The characteristic polynomial of a matrix is defined as det(A - λI), where λ is an eigenvalue. Since similar matrices have the same eigenvalues, they will have the same characteristic polynomial.

3. Similar matrices have the same trace and determinant: The trace and determinant of a matrix are invariant under similarity transformations. Mathematically, tr(A) = tr(B) and det(A) = det(B), where tr denotes the trace.

4. Similarity is an equivalence relation: Similarity is reflexive, symmetric, and transitive. Any matrix is similar to itself (reflexive), if A is similar to B, then B is similar to A (symmetric), and if A is similar to B and B is similar to C, then A is similar to C (transitive).

5. If A and B are similar matrices, then powers of A and B are also similar: Specifically, A^k and B^k are similar for any non-negative integer k.

6. Diagonalizability is preserved under similarity: If a matrix A is diagonalizable, meaning it has a full set of linearly independent eigenvectors, then any matrix similar to A is also diagonalizable.

7. Similar matrices have the same rank: The rank of a matrix is the same as the rank of any similar matrix.

These properties make the concept of similarity an important one in linear algebra, as it helps to connect and understand the properties of different matrices.
There are several theorems related to the similarity of matrices in linear algebra:

1. Two matrices \(A\) and \(B\) are similar if and only if there exists an invertible matrix \(P\) such that \(B = P^{-1}AP\).

2. Similarity is an equivalence relation, which means that it is reflexive, symmetric, and transitive.
    - Reflexive: A matrix is always similar to itself, as \(A = I^{-1}AI\).
    - Symmetric: If \(A\) is similar to \(B\), then \(B\) is also similar to \(A).
    - Transitive: If \(A\) is similar to \(B\) and \(B\) is similar to \(C\), then \(A\) is similar to \(C\).

3. Similar matrices share many important properties, such as determinant, trace, eigenvalues, and rank. Specifically:
    - The determinants of similar matrices are equal, i.e., det(\(A\)) = det(\(B\)).
    - The eigenvalues of similar matrices are the same.
    - The trace of similar matrices is the same, i.e., tr(\(A\)) = tr(\(B\)).

4. If \(A\) and \(B\) are similar matrices, then they have the same characteristic polynomial and minimal polynomial.

5. If \(A\) is a diagonalizable matrix, then it is similar to a diagonal matrix containing its eigenvalues as entries.

Understanding these theorems can be helpful in analyzing the properties and relationships of matrices in linear algebra.
## Similarity of Operators

Two linear operators \(A\) and \(B\) defined on the same vector space are called similar if there exists an invertible operator \(P\) such that \(B = P^{-1}AP\). In other words, operators \(A\) and \(B\) are similar if they represent the same linear transformation but with respect to different bases, where \(P\) is the change of basis operator. This concept is important in linear algebra as it allows us to study the properties of a linear operator in a different basis while preserving structural and algebraic properties.
When we say that two linear operators are similar, we mean that there exists an invertible matrix P such that the two operators A and B are related by the equation:

\[ B = P^{-1}AP \]

This notion of similarity is important in linear algebra and has several key properties:

1. Similarity is an equivalence relation: This means that similarity satisfies three properties - reflexivity, symmetry, and transitivity.

2. Similar operators share many properties: Similar operators have the same eigenvalues. This property is useful in the context of diagonalization and understanding the behavior of linear operators.

3. Similarity is preserved under certain operations: If A and B are similar, then any function of A is similar to the corresponding function of B. Specifically, if f is a function, then f(A) = P^{-1}f(B)P.

4. Similar operators have the same trace: The trace of a linear operator is invariant under similarity transformations. This property is particularly useful in studying the behavior of operators.

5. Similarity is a useful concept in applications: Similarity of operators is important in various areas of mathematics and its applications in physics, engineering, and signal processing. It helps to simplify computations and analysis by transforming operators into more convenient forms.

Overall, the concept of similarity of operators plays a fundamental role in linear algebra and has many important implications and applications.
There are several important theorems related to the similarity of operators in linear algebra. Some key theorems include:

1. Similarity of matrices implies similarity of operators: Given two linear operators \( T: V \rightarrow V \) and \( S: V \rightarrow V \) on a finite-dimensional vector space \( V \) with respect to some basis, if the matrices of these operators are similar, then the operators themselves are similar. That is, if there exists an invertible matrix \( P \) such that \( P^{-1}AP = B \), where \( A \) and \( B \) are the matrices of \( T \) and \( S \) respectively, then \( T \) and \( S \) are similar.

2. Similarity is an equivalence relation: Similarity of linear operators is an equivalence relation, meaning it satisfies the properties of reflexivity, symmetry, and transitivity. That is, any operator is similar to itself, if \( T \) is similar to \( S \), then \( S \) is similar to \( T \), and if \( T \) is similar to \( S \) and \( S \) is similar to \( U \), then \( T \) is similar to \( U \).

3. Diagonalizable operators are similar to diagonal matrices: If an operator \( T: V \rightarrow V \) on a finite-dimensional vector space \( V \) is diagonalizable, then it is similar to a diagonal matrix with its eigenvalues on the diagonal. This is known as the diagonalizability theorem for operators.

4. Similarity and Jordan Canonical Form: Every operator on a finite-dimensional vector space \( V \) over an algebraically closed field is similar to a matrix in Jordan canonical form. The Jordan canonical form provides a canonical representation for linear operators up to similarity.

These theorems are fundamental results in linear algebra and are key to understanding the concept of similarity of operators and matrices.
## Invariant Subspaces

An invariant subspace of a linear transformation \( T: V \rightarrow V \) on a vector space \( V \) is a subspace \( W \subseteq V \) such that for any vector \( \mathbf{v} \in W \), the image of \( \mathbf{v} \) under the linear transformation, \( T(\mathbf{v}) \), also belongs to \( W \), i.e., \( T(\mathbf{v}) \in W \).

Formally, a subspace \( W \subseteq V \) is said to be an invariant subspace of the linear transformation \( T \) if for any vector \( \mathbf{v} \in W \), we have \( T(\mathbf{v}) \in W \).

Invariant subspaces play a crucial role in the study of linear algebra and are essential for understanding the structure and behavior of linear transformations.
Invariant subspaces are a key concept in linear algebra and have several important properties. An invariant subspace of a linear transformation or matrix is a subspace that is mapped into itself under the action of the transformation or matrix.

Some important properties of invariant subspaces include:

1. Closure under the action of the linear transformation: If a subspace V is an invariant subspace of a linear transformation T, then for any vector v in V, the vector Tv is also in V. In other words, the linear transformation T maps vectors within the invariant subspace V back to the subspace V.

2. Existence of non-trivial invariant subspaces: Not all subspaces are invariant under a given linear transformation. However, every linear transformation has at least two trivial invariant subspaces, namely the zero subspace {0} and the entire space itself.

3. Invariant subspaces and eigenvectors: Eigenvectors associated with distinct eigenvalues of a linear transformation always span invariant subspaces that are orthogonal to each other. This means that if a linear transformation has distinct eigenvalues, its eigenvectors form invariant subspaces that are independent of each other.

4. Direct sum decomposition: Any vector space V can be decomposed as a direct sum of invariant subspaces with respect to a linear transformation T. This decomposition provides a useful tool for analyzing the behavior of the linear transformation on the entire space.

5. Relation to diagonalization: If a linear transformation is diagonalizable, then the vector space can be decomposed into invariant subspaces corresponding to the eigenspaces of the transformation. In this case, the matrix representation of the linear transformation is diagonal.

6. Connection to the characteristic polynomial: The characteristic polynomial of a linear transformation plays a crucial role in understanding the invariant subspaces. The roots of the characteristic polynomial correspond to the eigenvalues of the transformation, which in turn determine the invariant subspaces associated with these eigenvalues.

Understanding invariant subspaces and their properties is essential for analyzing the behavior of linear transformations and matrices in various applications of linear algebra, such as in differential equations, quantum mechanics, and control theory.
1. Every matrix has at least two trivial invariant subspaces, namely the zero subspace and the entire space itself.
2. If an n x n matrix A has n distinct eigenvalues, then each eigenspace corresponding to these eigenvalues is an invariant subspace of A.
3. If a linear operator T on a finite-dimensional vector space V has a cyclic vector v, then the subspace spanned by the powers of v, {v, Tv, T^2v, ...}, is an invariant subspace of T.
4. If a linear transformation T: V → V has an invariant subspace U, then the kernel and image of T restricted to U, i.e., ker(T|_U) and im(T|_U), are also invariant subspaces of T.
5. A linear operator T on a finite-dimensional vector space V has a non-trivial invariant subspace if and only if there exists a non-zero vector v in V such that the subspace spanned by {v, Tv, T^2v, ...} is a proper subspace of V.
## Reducing Pairs

In the context of linear algebra, reducing pairs are a pair of vectors in a vector space that can be used to generate a basis for the vector space through a process known as orthogonalization. More specifically, given a vector space V with an inner product, a reducing pair is a pair of non-zero vectors u and v such that u is orthogonal to v and the subspace spanned by u and v is complementary to the subspace spanned by the vectors orthogonal to u and v.

Reducing pairs play a crucial role in various linear algebra techniques, such as Gram-Schmidt orthogonalization process, where they are used to construct an orthogonal basis for a vector space. By iteratively finding and processing reducing pairs, one can transform an arbitrary basis into an orthogonal basis, which is often more convenient for computational and theoretical purposes.
In linear algebra, reducing pairs are pairs of matrices that are closely related and have some specific properties. Two matrices A and B are said to be reducing pairs if they simultaneously diagonalize each other. In other words, if there exists an invertible matrix P such that both A and B can be simultaneously diagonalized by similarity transformations, i.e., 

P^(-1) * A * P = D,

and 

P^(-1) * B * P = E,

where D and E are diagonal matrices.

Some properties of reducing pairs include:

1. Commutativity: If A and B are reducing pairs, then they commute with each other, i.e., AB = BA.

2. Similarity: If A and B are reducing pairs, then any power of A is similar to the corresponding power of B, i.e., A^k is similar to B^k for all non-negative integers k.

3. Spectral properties: The eigenvalues of A and B are the same and correspond to the diagonal elements of the diagonal matrices D and E.

4. Simultaneous diagonalizability: The matrices A and B are simultaneously diagonalizable by a common invertible matrix P.

5. Application in representation theory: Reducing pairs are often utilized in the context of representation theory, where they provide a way to analyze the structure of representations of algebraic structures.

Overall, reducing pairs play a significant role in linear algebra and related areas, providing a framework to analyze the spectral properties and relationships between matrices.
I'm not familiar with a specific concept or theorem called "Reducing Pairs" in the context of linear algebra. It's possible that the term may refer to a specific concept used in a particular context or textbook. 

If you can provide more information or context, I would be happy to try to help clarify or provide information related to the topic. Alternatively, if you meant a different concept or theorem, please let me know so I can assist you accordingly.
## Topological Vector Spaces

A topological vector space is a vector space equipped with a topology that makes vector addition and scalar multiplication continuous functions with respect to this topology. In other words, the topological structure on the vector space allows for a notion of convergence that behaves well with the algebraic operations of addition and scalar multiplication. This convergence is compatible with the linear structure of the vector space, allowing for the development of a theory that combines both algebraic and topological properties.
Topological Vector Spaces are vector spaces equipped with a topology that makes vector addition and scalar multiplication continuous. Here are some key properties of topological vector spaces:

1. Addition and scalar multiplication are continuous operations: In a topological vector space, vector addition and scalar multiplication are continuous functions with respect to the given topology. This means that if you take two sequences of vectors that converge to certain elements in the space, the sum of these sequences and the scalar multiples of these sequences will also converge to certain elements in the space.

2. Translation invariance: The topology on a topological vector space is translation invariant, which means that if a subset of the space is open, then translates of that subset by any vector in the space are also open.

3. Convergence: In a topological vector space, a sequence of vectors converges to a limit if and only if the sequence of their differences converges to zero. This is known as the Hausdorff property.

4. Local convexity: A topological vector space is locally convex if the topology can be induced by a family of seminorms, which are functions that satisfy the triangle inequality and are positive homogeneous.

5. Separation properties: Topological vector spaces satisfy separation properties like Hausdorffness. This means that distinct points can be separated by open sets.

6. Topological dual: The topological dual of a topological vector space is the space of continuous linear functionals on that space. It plays a crucial role in the theory of topological vector spaces.

7. Subspaces and quotient spaces: Subspaces and quotient spaces of topological vector spaces inherit the topology from the parent space, and operations like addition and scalar multiplication are continuous in these spaces as well.

These properties make topological vector spaces a powerful framework for studying vector spaces with additional topological structure, providing a versatile setting for various mathematical analyses and applications.
There are several important theorems related to topological vector spaces. Here are a few notable theorems:

1. Hahn-Banach Theorem: This theorem states that given a subspace \(Y\) of a topological vector space \(X\), and a continuous linear functional \(f\) defined on \(Y\), there exists a continuous linear extension of \(f\) to all of \(X\). This is a fundamental result in functional analysis.

2. Open Mapping Theorem: This theorem asserts that a continuous linear surjection between two Banach spaces is an open map. In other words, it maps open sets to open sets.

3. Closed Graph Theorem: The Closed Graph Theorem states that if a linear operator between two Banach spaces is bounded and its graph is closed in the product topology, then the operator is continuous.

4. Uniform Boundedness Principle: This principle states that if a sequence of continuous linear operators from a Banach space to another normed space is pointwise bounded (i.e., bounded at each point), then the operators are uniformly bounded.

5. Banach-Steinhaus Theorem: Also known as the Uniform Boundedness Principle, this theorem states that if a collection of continuous linear operators from a Banach space into a normed space is pointwise bounded, then the collection is uniformly bounded.

These theorems are fundamental in the study of topological vector spaces and play a crucial role in understanding the properties of linear operators on these spaces.
## Linear Operators on V^C,

A linear operator on a complex vector space V is a function T: V -> V that satisfies two properties:

1. Additivity: T(u + v) = T(u) + T(v) for all u, v in V.
2. Homogeneity: T(cu) = cT(u) for all scalar c and u in V.

In other words, a linear operator is a linear transformation from V to itself, where the operation preserves vector addition and scalar multiplication.
Linear operators on the complex vector space \(V^C\) are functions that map each vector in \(V^C\) to another vector in \(V^C\) while satisfying the properties of linearity. Here are some key properties of linear operators on \(V^C\):

1. Linearity: A linear operator \(T: V^C \rightarrow V^C\) satisfies the following properties for all vectors \(v, w \in V^C\) and scalars \(a, b \in \mathbb{C}\):
   - \(T(av + bw) = aT(v) + bT(w)\)
   - \(T(0) = 0\), where \(0\) is the zero vector in \(V^C\)

2. Additivity: The operator \(T\) is additive, meaning that \(T(v + w) = T(v) + T(w)\) for all vectors \(v, w \in V^C\).

3. Homogeneity: The operator \(T\) is homogeneous, meaning that \(T(av) = aT(v)\) for all vectors \(v \in V^C\) and scalar \(a \in \mathbb{C}\).

4. Preserves Scalar Multiplication: For any vector \(v \in V^C\) and scalar \(a \in \mathbb{C}\), the operator \(T\) satisfies \(T(av) = aT(v)\).

5. Preserves Linear Combinations: A linear operator \(T\) also preserves linear combinations of vectors. That is, for any vectors \(v_1, v_2, \ldots, v_n \in V^C\) and scalars \(a_1, a_2, \ldots, a_n \in \mathbb{C}\), we have
   \[ T\left(\sum_{i=1}^{n} a_i v_i\right) = \sum_{i=1}^{n} a_i T(v_i) \]

6. Composition of Linear Operators: If \(S: V^C \rightarrow V^C\) and \(T: V^C \rightarrow V^C\) are linear operators, then the composition \(S \circ T: V^C \rightarrow V^C\) is also a linear operator.

7. Null Space and Range: Just like in the case of linear transformations, linear operators on \(V^C\) also have well-defined null space, range, and rank.

These are some of the fundamental properties of linear operators on the complex vector space \(V^C\). They play a crucial role in various areas of mathematics, physics, and engineering.
When working with linear operators on complex vector spaces, there are several important theorems that come into play. Some key theorems for linear operators on \(V^C\) (complex vector space \(V\)) include:

1. **Cayley-Hamilton Theorem**: Every square matrix satisfies its characteristic equation, which states that the matrix satisfies its own characteristic polynomial.

2. **Spectral Theorem**: For a self-adjoint (or Hermitian) linear operator on a complex inner product space, there exists an orthonormal basis of eigenvectors.

3. **Jordan Canonical Form**: Every linear operator on a finite-dimensional complex vector space can be represented in Jordan canonical form, which consists of diagonal blocks and upper triangular blocks along the diagonal.

4. **Singular Value Decomposition**: Every linear operator on a complex vector space can be decomposed into a product of three matrices: a unitary matrix, a diagonal matrix with non-negative real numbers on the diagonal, and another unitary matrix.

5. **Schur Decomposition**: Every square matrix can be decomposed into a unitary matrix and an upper triangular matrix.

6. **Perron-Frobenius Theorem**: For a positive matrix (all entries are positive), the largest eigenvalue is real and positive, and the corresponding eigenvector can be chosen to have all positive entries.

7. **Fredholm Alternative**: For a linear operator on a complex vector space, the Fredholm alternative states that either the operator has a nontrivial kernel (null space) or the range is the whole space.

These theorems provide important properties and insights into the behavior of linear operators on complex vector spaces and help analyze their structure and properties.