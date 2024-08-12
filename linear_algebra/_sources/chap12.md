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


# Chapter 12: Isomorphism

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## Quotient Spaces

In linear algebra, a quotient space arises from the process of "quotienting out" a subspace from a larger vector space. Informally, it is the space of all possible cosets of the subspace within the larger space.

### Definition

Let $V$ be a vector space and $W$ be a subspace of $V$. The quotient space $\frac{V}{W}$ is defined as the set of all cosets of $W \in V$. Formally, 

$$
\frac{V}{W} = \{v + W \,|\, v \in V\}
$$

where $v + W = \{v + w \,|\, w \in W\}$ is the coset of $W \in V$ containing the vector $v$.

### Properties

1. **Linearity**: The quotient space inherits a natural vector space structure from $V$. Addition and scalar multiplication are defined as follows:
   - $(v_1 + W) + (v_2 + W) = (v_1 + v_2) + W$
   - $c(v + W) = (cv) + W$ for all $v_1, v_2 \in V$ and $c \in \mathbb{R}$.
   
2. **Dimension**: The dimension of the quotient space $V/W$ is equal to the difference between the dimension of $V$ and the dimension of $W$.

### Applications

Quotient spaces have various applications across different areas of mathematics, including linear algebra, functional analysis, and group theory. They provide a natural framework for studying solutions of linear equations, understanding symmetry structures, and analyzing geometric objects.

### Conclusion

Quotient spaces are a powerful tool in linear algebra and abstract algebra, allowing us to study vector spaces in a more structured and organized way by considering their inherent symmetries and relations.

## The Universal Property of Quotients

The universal property of quotients is a foundational concept in algebra and category theory. It provides a rigorous characterization of quotient maps between algebraic structures, such as groups, rings, and vector spaces.

### Definition

Let $X$ be a set equipped with an equivalence relation $\sim$, and let $Y$ be a set equipped with a map $\pi: X \rightarrow Y$. The pair $(Y, \pi)$ is said to satisfy the universal property of quotients if the following conditions hold:

1. **Surjectivity**: The map $\pi$ is surjective, meaning that every element of $Y$ is the image of at least one element in $X$ under $\pi$.

2. **Compatibility**: The map $\pi$ respects the equivalence relation $\sim$ in the sense that for any $x_1, x_2 \in X$, if $x_1 \sim x_2$, then $\pi(x_1) = \pi(x_2)$.

3. **Universality**: For any set $Z$ equipped with a map $f: X \rightarrow Z$ that satisfies the compatibility condition with respect to $\sim$, there exists a unique map $\bar{f}: Y \rightarrow Z$ such that $f = \bar{f} \circ \pi$. In other words, any map $f$ that respects the equivalence relation factors uniquely through $\pi$.

### Interpretation

The universal property of quotients captures the essence of quotient maps by characterizing them in terms of their surjectivity, compatibility with the equivalence relation, and universality with respect to other maps satisfying the same compatibility condition. It provides a concise and precise description of quotient structures and their relations to other algebraic objects.

### Applications

The universal property of quotients finds applications in various branches of mathematics, including group theory, ring theory, module theory, and topology. It serves as a foundational tool for studying quotient structures, constructing quotient spaces, and proving important theorems in algebraic structures.

### Conclusion

The universal property of quotients is a fundamental concept in algebra and category theory, providing a rigorous characterization of quotient maps and their relations to other algebraic objects. It is an essential tool for understanding and analyzing quotient structures in mathematics.


## Isomorphism Theorem

The Isomorphism Theorem is a fundamental result in algebra that establishes a correspondence between quotient structures and homomorphisms.

### The First Isomorphism Theorem

Let $G$ and $H$ be groups, and let $\phi: G \rightarrow H$ be a group homomorphism. The First Isomorphism Theorem states that the kernel of $\phi$, denoted by $\text{ker}(\phi)$, is a normal subgroup of $G$, and the image of $\phi$, denoted by $\text{im}(\phi)$, is isomorphic to the quotient group $G/\text{ker}(\phi)$. Formally:

$$
G/\text{ker}(\phi) \cong \text{im}(\phi)
$$

This theorem provides a fundamental understanding of the structure of quotient groups and their relationship to homomorphisms.

### The Second and Third Isomorphism Theorems

The Second and Third Isomorphism Theorems are extensions of the First Isomorphism Theorem and provide additional insights into the structure of groups.

- **Second Isomorphism Theorem**: Let $G$ be a group, $H$ be a subgroup of $G$, and $N$ be a normal subgroup of $G$. The Second Isomorphism Theorem states that $(H \cap N)$ is a normal subgroup of $H$, and $(HN)/N$ is isomorphic to $H/(H \cap N)$.
  
- **Third Isomorphism Theorem**: Let $G$ be a group, and let $N$ and $M$ be normal subgroups of $G$ such that $N \subseteq M$. The Third Isomorphism Theorem states that $N$ is a normal subgroup of $M$, and $(G/N)/(M/N)$ is isomorphic to $G/M$.

### Applications

The Isomorphism Theorems are fundamental tools in group theory and other areas of algebra. They provide a systematic approach to understanding the structure of groups, quotient groups, and homomorphisms. These theorems have numerous applications in abstract algebra, cryptography, and other fields.

### Conclusion

The Isomorphism Theorems are powerful results in algebra that establish important connections between quotient structures and homomorphisms. They play a central role in the study of group theory and have widespread applications in various branches of mathematics.


Complements
	Let S be a subspace of V. All complements of S in V are isomorphic to V/S and hence to each other
	dim⁡(V)=dim⁡(S)+dim⁡(V/S)

Codimension
If S is a subspace of V then dim⁡(V/S) is the codimension of S in V and is denoted by codim_V (S)


### Linear Functionals

In functional analysis, a linear functional is a linear map from a vector space to its underlying field. In simpler terms, it is a function that assigns a scalar value to each vector in a vector space, satisfying certain linearity properties.

### Definition

Let $V$ be a vector space over a field $\mathbb{F}$. A linear functional on $V$ is a function $f: V \rightarrow \mathbb{F}$ that satisfies the following properties for all vectors $\mathbf{v}, \mathbf{w} \in V$ and scalars $c \in \mathbb{F}$:

1. **Linearity**: $f(c\mathbf{v} + \mathbf{w}) = cf(\mathbf{v}) + f(\mathbf{w})$
2. **Scalar Preservation**: $f(c\mathbf{v}) = cf(\mathbf{v})$ for all $c \in \mathbb{F}$

### Examples

1. **Dot Product**: In Euclidean spaces, the dot product $\mathbf{v} \cdot \mathbf{w}$ is a linear functional that takes two vectors as input and outputs a scalar.
2. **Integration**: In spaces of integrable functions, the integral of a function over a certain interval is a linear functional.

### Dual Space

The set of all linear functionals on a vector space $V$ forms a vector space itself, called the dual space of $V$ and denoted by $V^*$. The elements of the dual space are often denoted by symbols like $f$, $g$, $\phi$, etc.

### Applications

Linear functionals have applications in various areas of mathematics and physics. In functional analysis, they are used to study properties of vector spaces and operators. In quantum mechanics, they are used to represent observables and measurements.

### Conclusion

Linear functionals provide a powerful tool for generalizing the concept of vectors to spaces of functions. They play a central role in functional analysis and have applications in diverse areas of mathematics and physics.


### Dual Bases

In linear algebra, given a basis for a vector space, the concept of dual bases arises when considering the corresponding dual space. Dual bases provide a convenient way to relate vectors in the original space to linear functionals in the dual space.

### Definition

Let $V$ be a finite-dimensional vector space over a field $\mathbb{F}$ with basis $\{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_n\}$. The dual basis of $V$, denoted by $\{\mathbf{v}^*_1, \mathbf{v}^*_2, \ldots, \mathbf{v}^*_n\}$, is the set of linear functionals on $V$ such that each $\mathbf{v}^*_i$ evaluates to $1$ on its corresponding basis vector $\mathbf{v}_i$ and evaluates to $0$ on all other basis vectors. Formally:

$$
\mathbf{v}^*_i(\mathbf{v}_j) = \begin{cases} 1 & \text{if } i = j \\ 0 & \text{if } i \neq j \end{cases}
$$

for all $i, j = 1, 2, \ldots, n$.

### Example

Consider the vector space $\mathbb{R}^3$ with the standard basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$, where $\mathbf{e}_1 = (1, 0, 0)$, $\mathbf{e}_2 = (0, 1, 0)$, and $\mathbf{e}_3 = (0, 0, 1)$. The dual basis of $\mathbb{R}^3$, denoted by $\{\mathbf{e}^*_1, \mathbf{e}^*_2, \mathbf{e}^*_3\}$, consists of the linear functionals such that:

$$
\begin{align*}
\mathbf{e}^*_1(\mathbf{e}_1) &= 1, \quad \mathbf{e}^*_1(\mathbf{e}_2) = 0, \quad \mathbf{e}^*_1(\mathbf{e}_3) = 0 \\
\mathbf{e}^*_2(\mathbf{e}_1) &= 0, \quad \mathbf{e}^*_2(\mathbf{e}_2) = 1, \quad \mathbf{e}^*_2(\mathbf{e}_3) = 0 \\
\mathbf{e}^*_3(\mathbf{e}_1) &= 0, \quad \mathbf{e}^*_3(\mathbf{e}_2) = 0, \quad \mathbf{e}^*_3(\mathbf{e}_3) = 1 \\
\end{align*}
$$

### Properties

1. Dual bases are unique: Given a basis for a vector space, its dual basis is unique.
2. Dimensionality: If $V$ is an $n$-dimensional vector space, then its dual space also has dimension $n$, and vice versa.

### Applications

Dual bases are extensively used in various areas of mathematics, including functional analysis, differential geometry, and optimization. They provide a powerful tool for understanding the relationship between vectors and linear functionals, as well as for solving problems involving duality.

### Conclusion

Dual bases provide a natural correspondence between a basis of a vector space and its dual space, allowing for a deeper understanding of the structure and properties of both spaces. They are a fundamental concept in linear algebra and have applications in diverse areas of mathematics.

## Reflexivity

Reflexivity is a property observed in certain mathematical structures, indicating a self-referential relationship within the structure itself.

### Definition

In the context of vector spaces and functional analysis, reflexivity refers to the property of a vector space being isomorphic to its double dual space. Formally, a vector space $V$ is said to be reflexive if there exists an isomorphism $\phi: V \rightarrow V^{**}$, where $V^{**}$ is the double dual space of $V$. This means that for every element $v \in V$, there exists a corresponding element $\phi(v) \in V^{**}$ that uniquely represents $v$ in the dual space of the dual space.

### Example

Consider the vector space $\mathbb{R}^n$. The natural map from $\mathbb{R}^n$ to its double dual space $(\mathbb{R}^n)^{**}$, defined by evaluating vectors on linear functionals, is an isomorphism. Therefore, $\mathbb{R}^n$ is reflexive.

### Importance

Reflexivity is an important property in functional analysis, as it establishes a deeper understanding of the structure and properties of vector spaces. It allows for the identification of a vector space with its dual space, providing a convenient framework for studying linear transformations and functionals.

### Conclusion

Reflexivity is a fundamental property in the study of vector spaces and functional analysis, indicating a close relationship between a vector space and its double dual space. It provides valuable insights into the structure and properties of vector spaces, leading to a deeper understanding of linear algebra and related areas of mathematics.

## Annihilators

In linear algebra, annihilators refer to sets of linear functionals that "annihilate" certain subsets of a vector space by mapping them to zero.

### Definition

Let $V$ be a vector space over a field $\mathbb{F}$, and let $S$ be a subset of $V$. The annihilator of $S$, denoted by $S^\perp$, is the set of all linear functionals in the dual space $V^*$ that vanish on every element of $S$. Mathematically, it is defined as:

$$
S^\perp = \{f \in V^* \,|\, f(s) = 0 \text{ for all } s \in S\}
$$

In other words, $S^\perp$ consists of all linear functionals that map every vector in $S$ to zero.

### Example

Consider a vector space $V = \mathbb{R}^3$ and a subset $S = \{(1, 0, 0), (0, 1, 0)\}$. The annihilator of $S$, denoted by $S^\perp$, consists of all linear functionals that vanish on the vectors $(1, 0, 0)$ and $(0, 1, 0)$. Geometrically, $S^\perp$ corresponds to the set of all planes in $\mathbb{R}^3$ that contain the $z$-axis.

### Properties

1. **Linearity**: The annihilator $S^\perp$ is a subspace of the dual space $V^*$.
2. **Dimensionality**: The dimension of $S^\perp$ is at least the dimension of $V$ minus the dimension of $S$.

### Importance

Annihilators are useful in various areas of mathematics, including linear algebra, functional analysis, and optimization. They provide a way to characterize subsets of vector spaces based on their interactions with linear functionals. Annihilators also play a crucial role in duality theory, where they help establish connections between primal and dual spaces.

### Conclusion

Annihilators are important mathematical objects that arise in the study of vector spaces and linear functionals. They provide a useful tool for characterizing subsets of vector spaces and have applications in various areas of mathematics, including functional analysis and optimization.

## Adjoint Operators

In linear algebra and functional analysis, the adjoint operator is a concept that arises in the context of inner product spaces, providing a way to relate the action of a linear transformation on vectors to the action of its dual on functionals.

### Definition

Let $V$ and $W$ be inner product spaces, and let $T: V \rightarrow W$ be a linear transformation between them. The adjoint operator of $T$, denoted by $T^*$, is a unique linear transformation from $W$ to $V$ such that for all vectors $v \in V$ and $w \in W$, the following equality holds:

$$
\langle T(v), w \rangle_W = \langle v, T^*(w) \rangle_V
$$

where $\langle \cdot, \cdot \rangle_V$ and $\langle \cdot, \cdot \rangle_W$ denote the inner products on $V$ and $W$ respectively.

### Properties

1. **Existence and Uniqueness**: The adjoint operator $T^*$ always exists and is unique for a given linear transformation $T$.
  
2. **Conjugate Linear**: In complex inner product spaces, the adjoint operator is conjugate linear, meaning that it satisfies $T^*(cv) = \overline{c} T^*(v)$ for all scalars $c$.

3. **Composition**: The adjoint of the composition of two linear transformations is the composition of their adjoints in the reverse order, i.e., $(ST)^* = T^*S^*$.

### Example

Consider a linear transformation $T: \mathbb{R}^3 \rightarrow \mathbb{R}^3$ represented by a $3 \times 3$ matrix. The adjoint operator of $T$, denoted by $T^*$, can be found by taking the transpose of the matrix representation of $T$ if $\mathbb{R}^3$ is equipped with the standard inner product.

### Applications

Adjoint operators have various applications in mathematics and physics. They are used in the study of self-adjoint operators, which play a crucial role in spectral theory and quantum mechanics. Adjoint operators also arise in optimization problems, where they are used to derive necessary conditions for optimality.

### Conclusion

The adjoint operator is a fundamental concept in linear algebra and functional analysis, providing a way to relate the action of a linear transformation on vectors to the action of its dual on functionals. It has important applications in various areas of mathematics and physics, including spectral theory, quantum mechanics, and optimization.


