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

# Vector space

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Real number](https://www.britannica.com/science/real-number)
- [Lecture note](https://tutorial.math.lamar.edu/)
```

````{prf:definition} vector space
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
:label: basis
A set of vectors $\left\{b_i\right\}$ is a basis of $\mathbb{R}^n$ if every $x \in \mathbb{R}^n$ is uniquely expressible as a linear combination of the $b_i$.
````

## Norm


## Limits in $\mathbb{R}^n$


## Continuous mappings
We first define a sequence which converges to 0.
````{prf:definition} null sequence
:label: null_sequence
The sequence $\left\{x_\nu\right\}$ in $\mathbb{R}^n$ is null if for every $\varepsilon>0$ there exists some $\nu_0$ such that
if $\nu>\nu_0$ then $\left|x_\nu\right|<\varepsilon$.
````

Then, we can define the convergence of a sequence.
````{prf:definition} sequence convergence
:label: sequence_convergence
Consider a sequence $\left\{x_\nu\right\}$ in $A\subset\mathbb{R}^n$ and a point $a \in \mathbb{R}^n$. The sequence $\left\{x_\nu\right\}$ converges to $a$ (or has limit a), written $\left\{x_\nu\right\} \rightarrow a$, if the sequence $\left\{x_\nu-a\right\}$ is null. When the limit a is a point of $A$, the sequence $\left\{x_\nu\right\}$ converges in $A$.

````


````{prf:definition} continuity
:label: continuous_function
A function $f(x)$ with domain $\mathbb{R}^n$ is continuous at a point $x_0 \in \mathbb{R}^n$ if $f(x) \rightarrow f(x_0)$ whenever $x \rightarrow x_0$. The function $f$ is continuous on $\mathbb{R}^n$, if $f$ is continuous for every point $x\in\mathbb{R}^n$.
````

- linearity: any linear combination of continuous functions is continuous
- composition: the composition of two continuous functions is a continuous function
- componentwise continuity: a function is continuous if and only if each of its components is continuous

