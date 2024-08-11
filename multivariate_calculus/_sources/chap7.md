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

# Chapter 7: Differential forms

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Differential form](https://en.wikipedia.org/wiki/Differential_form)
```

## Volume of Parallelepiped
Let $v_1, \ldots, v_k$ be vectors in $\mathbb{R}^n$. Let $V$ be the $n$-by-k matrix with these vectors as its columns. Then the $k$-volume of the parallelepiped spanned by the $\left\{v_j\right\}$ is

$$
\operatorname{vol}_k\left(\mathcal{P}\left(v_1, \ldots, v_k\right)\right)=\sqrt{\operatorname{det}\left(V^{\boldsymbol{\top}} V\right)} .
$$
In coordinates, this formula is

$$
\operatorname{vol}_k\left(\mathcal{P}\left(v_1, \ldots, v_k\right)\right)=\sqrt{\operatorname{det}\left(\left[v_i \cdot v_j\right]_{i, j=1, \ldots, k}\right)},
$$
where $v_i \cdot v_j$ is the inner product of $v_i$ and $v_j$.

````{prf:definition} surface integral
:label: def7.1
Let $A$ be an open subset of $\mathbb{R}^n$. Let $\Phi: D \longrightarrow A$ be a k-surface in $A$. Let $f: \Phi(D) \rightarrow \mathbb{R}$ be a function such that $f \circ \Phi$ is smooth. Then the integral of $f$ over $\Phi$ is

$$
\int_{\Phi} f=\int_D(f \circ \Phi) \operatorname{vol}_k\left(\mathcal{P}\left(D_1 \Phi, \ldots, D_k \Phi\right)\right) .
$$
````

In particular, the $k$-dimensional volume of $\Phi$ is

$$
\operatorname{vol}_k(\Phi)=\int_{\Phi} 1=\int_D \operatorname{vol}_k\left(\mathcal{P}\left(D_1 \Phi, \ldots, D_k \Phi\right)\right)
$$

The $k$-volume factor in the surface integral is

$$
\operatorname{vol}_k\left(\mathcal{P}\left(D_1 \Phi, \ldots, D_k \Phi\right)\right)=\sqrt{\operatorname{det}\left(\Phi^{\prime \top} \Phi^{\prime}\right)}=\sqrt{\operatorname{det}\left(\left[D_i \Phi \cdot D_j \Phi\right]_{i, j=1, \ldots, k}\right)}
$$


## Flow and flux integrals
If $\gamma: I\rightarrow A$ is a curve in $A\subset \mathbb{R}^n$ and $\mu\in I$, then the flow of a vector field $F$ along the curve $\gamma$ at $\mu$ is the scalar component of $F(\gamma(\mu))$ tangent to the curve $\gamma$ at the point $\gamma(\mu)$. The flow integral is the integral of the vector field $F$ along the curve $\gamma$, denoted by $\int_{\gamma}F$. Since the tangent vector to the curve $\gamma$ at the point $\gamma(\mu)$ is $\gamma^{\prime}(\mu)$, the flow of $F$ along the curve is the inner product $F(\gamma(\mu))\cdot \gamma{\prime}(\mu)$. Thus, 

$$\int_{\gamma}F = \int_I F(\gamma(\mu))\cdot \gamma{\prime}(\mu) $$ 

If $\Phi: D\rightarrow A$ is an $(n−1)$-surface in $A$ and $\mu\in D$, then the flux of the vector field $F$ through $\phi$ at $\mu$ is the scalar component of $F$ normal to $\Phi$ at $\Phi(\mu)$. Surface integrals of the vector field $F$ with respect to the surface $\Phi$, denoted by $\int_{\Phi}F$, measures the flux coming through the surface. For 2-surface in $\mathbb{R}^3$, the normal vector $\hat{N}$ is the cross product of two basis vectors $\left( D_1\Phi(\mu),D_2\Phi(\mu)\right)$ of the tangent plane. Thus, the flux of the vector field $F$ is $F\cdot \hat{N}=F\cdot \left(D_1\Phi(\mu)\times D_2\Phi(\mu)\right)$ and the flux integral w.r.t the surface $\Phi$ is given by

$$\int_\Phi F = \int_D F(\Phi(\mu))\cdot \left(D_1\Phi(\mu)\times D_2\Phi(\mu)\right)$$

The generalization of the 3-dimensional flux integral to higher dimensions also involves the cross product of the vectors $D_1\Phi(\mu),\ldots,D_1\Phi(\mu)$, 

$$
\left(D_{1} \Phi \times \cdots \times D_{n-1} \Phi\right)(u)=\operatorname{det}\left[\begin{array}{l|l|l|l|c}
 & & &e_1\\
D_{1} \Phi(u) & \cdots & D_{n-1} \Phi(u) &\vdots \\
 & & &e_{n}
\end{array}\right]
$$

This determinant can be understood better by considering the data in the matrix as rows. Recall that for $i=1, \ldots, n$, the $i$ th row of the $n$-by- $(n-1)$ derivative matrix $\Phi^{\prime}$ is the derivative matrix of the $i$ th component function of $\Phi$

$$
\Phi_{i}^{\prime}(u)=\left[D_{1} \Phi_{i}(u) \cdots D_{n-1} \Phi_{i}(u)\right] .
$$

In terms of these component function derivatives, the general cross product is

$$
\begin{aligned}
& \left(D_{1} \Phi \times \cdots \times D_{n-1} \Phi\right)(u)=\operatorname{det}\left[\begin{array}{c|c}\Phi_{1}^{\prime}(u) & e_{1} \\\vdots & \vdots \\\Phi_{n}^{\prime}(u) & e_{n}\end{array}\right]=(-1)^{n-1} \operatorname{det}\left[\begin{array}{c|c}e_{1} & \Phi_{1}^{\prime}(u) \\\vdots & \vdots \\e_{n} & \Phi_{n}^{\prime}(u)\end{array}\right] \\
& =(-1)^{n-1}\left(\operatorname{det}\left[\begin{array}{c}\Phi_{2}^{\prime}(u) \\\Phi_{3}^{\prime}(u) \\\Phi_{4}^{\prime}(u) \\\vdots \\\Phi_{n}^{\prime}(u)\end{array}\right] e_{1}-\operatorname{det}\left[\begin{array}{c}\Phi_{1}^{\prime}(u) \\\Phi_{3}^{\prime}(u) \\\Phi_{4}^{\prime}(u) \\\vdots \\\Phi_{n}^{\prime}(u)\end{array}\right] e_{2}+\operatorname{det}\left[\begin{array}{c}\Phi_{1}^{\prime}(u) \\\Phi_{2}^{\prime}(u) \\\Phi_{4}^{\prime}(u) \\\vdots \\\Phi_{n}^{\prime}(u)\end{array}\right] e_{3}+\cdots\right) \\
& =(-1)^{n-1} \sum_{i=1}^{n}(-1)^{i-1} \operatorname{det}\left[\begin{array}{c}\Phi_{1}^{\prime}(u) \\\vdots \\\Phi_{i-1}^{\prime}(u) \\\Phi_{i+1}^{\prime}(u) \\\vdots \\\Phi_{n}^{\prime}(u)\end{array}\right] e_{i} .
\end{aligned}
$$

Thus finally, the general flux integral in coordinates is

$$
\int_{\Phi} F \cdot \widehat{N}=(-1)^{n-1} \int_{u \in D}\left(\sum_{i=1}^{n}(-1)^{i-1}\left(F_{i} \circ \Phi\right) \operatorname{det}\left[\begin{array}{c}
\Phi_{1}^{\prime} \\
\vdots \\
\Phi_{i-1}^{\prime} \\
\Phi_{i+1}^{\prime} \\
\vdots \\
\Phi_{n}^{\prime}
\end{array}\right]\right)(u) .
$$

The integrand here contains the determinants of all $(n-1)$-by- $(n-1)$ subblocks of the $n$-by- $(n-1)$ derivative matrix of the $(n-1)$-surface $\Phi$.

Instead of trying to analyze these complex integrals, we can represent their important characteristics using symbol patterns and manipulate these patterns algebraically. This approach is more efficient and easier to understand than the classical method, which involves tracking all the intricate details of the original setup and is extremely tedious and difficult to recreate. By using these new definitions, we can more easily understand and analyze vector integration phenomena. In short, the modern method is a significant improvement in methodology and requires less effort than the classical approach.

## Differential forms
```{prf:definition} k-form
:label: def7.2
Let $A$ be an open subset of $\mathbb{R}^n$. A 0-form on $A$ is a smooth function $f : A \rightarrow \mathbb{R}$. For $k \ge 1$, a k-form
on $A$ is an element of the form 

$$\sum_{i_1,...,i_k=1}^{n}f_{(i_1,...,i_k)}dx_{i_1}\wedge\ldots\wedge dx_{i_k}$$

or simply

$$\sum_I f_I dx_I$$
```

## Integration of k-form
```{prf:definition} integration of form
:label: def7.3

Let $A$ be an open subset of $\mathbb{R}^{n}$. For $k=0$, a syntactic 0-form $\omega=f$ on $A$ gives rise to a function of 0 -surfaces in $A$, also called $\omega$,

$$
\omega:\{0 \text {-surfaces in } A\} \longrightarrow \mathbb{R},
$$

defined by the rule that for any point $p \in A$,

$$
\omega\left(\Phi_{p}\right)=f(p) .
$$

That is, integrating $\omega$ over a one-point surface consists simply of evaluating $f$ at the point. For $k \geq 1$, a syntactic $k$-form $\omega=\sum_{I} f_{I} d x_{I}$ on A gives rise to a function of $k$-surfaces in $A$, also called $\omega$,

$$
\omega:\{k \text {-surfaces in } A\} \longrightarrow \mathbb{R},
$$

defined by the rule that for any $k$-surface $\Phi: D \longrightarrow A$,

$$
\omega(\Phi)=\int_{D} \sum_{I}\left(f_{I} \circ \Phi\right) \operatorname{det} \Phi_{I}^{\prime} .
$$

For all $k$, the integral of $\omega$ over $\Phi$ is defined to be $\omega(\Phi)$,

$$
\int_{\Phi} \omega=\omega(\Phi) .
$$
```

## Algebra of forms
Let $A$ be an open subset of $\mathbb{R}^n$. Since $k$-forms on $A$ are functions (functions
of k-surfaces), they come with an inherent notion of equality. The meaning of
$\omega_1 = \omega_2$ is that $\omega_1(\Phi) = \omega_1(\Phi)$ for all k-surfaces $\Phi$ in A. In particular, the meaning of
$\omega = 0$ is that $\omega(\Phi) = 0$ for all $\Phi$, where the first 0 is a form while the second
is a real number. Addition of k-forms is defined naturally,
$(\omega_1 + \omega_2)(\Phi) = \omega_1(\Phi) + \omega_2(\Phi)$ for all $\omega_1, \omega_2, \Phi$,
where the first “+” lies between two forms, the second between two real
numbers. Similarly, the definition of scalar multiplication is
$(c\omega)(\Phi) = c(\omega(\Phi))$ for all $c, \omega, \Phi$. 

```{important}
The set of all k-forms on A forms a vector space.
```
Forms have other algebraic properties 
- skew symmetry, $dy \wedge dx = −dx \wedge dy$
- $dx\wedge dx = 0$ 

### Wedge product
````{prf:definition} wedge product
:label: def7.4
Let $A$ be an open subset of $Rn$. If $\omega=\sum_If_Idx_I$ is a k-form and $\lambda=\sum_Jg_Jdx_J$ is a $l$-form on $A$, then their wedge product $\omega\wedge\lambda$ is $(k+l)$-form on $A$, i.e.,

$$\omega\wedge\lambda=\sum_{I,J}f_Ig_Jdx_{(I,J)}$$
````

The wedge product is formed by following the usual distributive law
and wedge-concatenating the dx-terms.

- $\omega\wedge(\lambda_1+\lambda_2)=\omega\wedge\lambda_1+\omega\wedge\lambda_2$
- $(\omega\wedge\lambda)\wedge\mu=\omega\wedge(\lambda\wedge\mu)$
- $\omega\wedge\lambda=-\lambda\wedge\omega$

### Differentiation of k-form

````{prf:definition} derivative of a differential form
:label: def7.5

Let $A$ be an open subset of $\mathbb{R}^n$. For each integer $k \ge 0$ define the derivative mapping,

$$d:\Gamma^k(A)\rightarrow\Gamma^{k+1}(A)$$

For a 0-form $f$,

$$df=\sum_{i=1}^nD_ifdx_i$$

For a k-form $\omega=\sum_If_Idx_I$,

$$d\omega = \sum_Idf_I\wedge dx_I$$
````

````{prf:theorem}
:label: them7.1
Let $A$ be an open subset of $\mathbb{R}^n$. Let $\omega$ and $\lambda$ be respectively a $k$-form and an $l$-form on $A$. Then

$$d(\omega\wedge\lambda) = d\omega\wedge\lambda+(-1)^k\omega\wedge d\lambda$$
````
````{prf:theorem}
Let $A$ be an open subset of Rn. Then
$d^2\omega = 0$ for any form $\omega\in \Gamma k(A)$, where $d^2=d\circ d$. In other words, $d^2 = 0$.
````

### Pullback
````{prf:definition} pullback
:label: def7.6
Let $k$ be a nonnegative integer. Let $A$ be an open subset of $\mathbb{R}^{n}$, and let $B$ be an open subset of $\mathbb{R}^{m}$. Let

$$
T=\left(T_{1}, \ldots, T_{m}\right): A \longrightarrow B
$$

be a smooth mapping. Then $T$ gives rise to a pullback mapping of $k$-forms in the other direction,

$$
T^{*}: \Lambda^{k}(B) \longrightarrow \Lambda^{k}(A) .
$$

Let the coordinates on $\mathbb{R}^{n}$ be $\left(x_{1}, \ldots, x_{n}\right)$, and let the coordinates on $\mathbb{R}^{m}$ be $\left(y_{1}, \ldots, y_{m}\right)$. For each $k$-tuple $I=\left(i_{1}, \ldots, i_{k}\right)$ from $\{1, \ldots, m\}$, let $d T_{I}$ denote $d T_{i_{1}} \wedge \cdots \wedge d T_{i_{k}}$. Then the pullback of any $k$-form on $B$, $\omega=\sum f_{I} d y_{I}$, is

$$
T^{*} \omega=\sum_{I}\left(f_{I} \circ T\right) d T_{I} .
$$
````

Since each $T_{i_{j}}$ is a function on $A$, each $d T_{i_{j}}$ is a 1-form on $A$. As usual, when $k=0$, the empty products $d y_{I}$ and $d T_{I}$ are interpreted as 1, and the pullback is simply a composition,

$$
T^{*} f=f \circ T .
$$

Given a form $\omega$ in terms of $y$'s and $dy$'s, its pullback $T^∗\omega$ comes from replacing each $y_i$ in $\omega$ by the expression $T_i(x_1, . . . , x_n)$ and then working out the resulting $d$’s and wedges.

````{prf:theorem}
:label: them7.2

Let $A$ be an open
subset of $\mathbb{R}^n$, and let $B$ be an open subset of $\mathbb{R}^m$. Let $T : A\rightarrow B$ be a smooth mapping. Let $\mathbb{R}^n$ have coordinates $(x1, . . . , xn)$, and let $\mathbb{R}^m$ have coordinates $(y1, . . . , ym)$. Let $I = (i1, . . . , in)$ be an n-tuple from $\{1, . . . ,m\}$. Then

$$T^∗dy_I = \det T^′_I dx_1 \wedge \ldots \wedge dx_n$$
````

- $T^*(\omega_1+\omega_2)=T^*\omega_1+T^*\omega_2$
- $T^*(c\omega)=cT^*(\omega)$
- $T^*(\omega\wedge\lambda)=(T^*\omega)\wedge(T^*\lambda)$
- $T^*(d\omega)=d(T^*\omega)$

## Homotopy
Let $\omega$ be a differential form. Recall the terminology that $\omega$ is closed if $d\omega = 0$ and $\omega$ is exact if $\omega = d\lambda$ for some $\lambda$.

A homotopy of a set is a process of deforming the set to a single point, the deformation taking place entirely within the original set. For example, consider the open ball $A = \{x \in \mathbb{R}^n : |x| < 1\}$. A mapping that shrinks the ball to its center as one unit of time elapses is 

$$h : [0, 1] × A \rightarrow A, h(t, x) = tx$$

````{prf:definition} homotopy
:label: def7.7
Let $A$ be an open subset of $\mathbb{R}^n$. Let $\epsilon$ be a positive number. Let $B = (−\epsilon, 1 + \epsilon) \times A$ be
an open subset of $\mathbb{R}^{n+1}$. A homotopy of $A$ is a a smooth mapping $h : B \rightarrow A$ such that for some point $p$ of $A$, $h(0, x) = p$ and  $h(1, x) = x$ for all $x in A$. 
````

An open subset $A$ of $\mathbb{R}^n$ that has a homotopy is called **contractible**.
````{prf:theorem} Poincare
:label: them7.3 
Let $A$ be a contractible subset of $\mathbb{R}^n$. Let $k \ge 1$ be an integer. Then every closed k-form on $A$ is exact.
````

## Cubes and chain
````{prf:definition} cube
:label: def7.8
Let $A$ be an open subset of $\mathbb{R}^{n}$. A singular $k$-cube in $A$ is a surface whose parameter domain is the unit $k$-box,

$$
\Phi:[0,1]^{k} \longrightarrow A .
$$

In particular, the standard $k$-cube is

$$
\Delta^{k}:[0,1]^{k} \longrightarrow \mathbb{R}^{k}, \quad \Delta^{k}(u)=u \text { for all } u \in[0,1]^{k} .
$$
````

````{prf:definition} chain
:label: def7.9
Let $A$ be an open subset of $\mathbb{R}^{n}$. A -chain in $A$ is a finite formal linear combination

$$
\mathcal{C}=\sum_{s} \nu_{s} \Phi_{(s)}
$$

where each $\nu_{s}$ is an integer and each $\Phi_{(s)}$ is a singular $k$-cube in $A$. (The surface subscript is in parentheses only to distinguish it from a component function subscript.)
````

## Boundary
Let $A$ be an open subset of $\mathbb{R}^{n}$. For each $k \geq 1$, define the boundary mapping

$$
\partial:\{k \text {-chains in } A\} \longrightarrow\{(k-1) \text {-chains in } A\}
$$

by the properties:

(1) For any $k$-chain $\sum \nu_{s} \Phi_{(s)}$,

$$
\partial\left(\sum \nu_{s} \Phi_{(s)}\right)=\sum \nu_{s} \partial \Phi_{(s)} .
$$

(2) For any singular $k$-cube $\Phi$,

$$
\partial \Phi=\Phi \circ \partial \Delta^{k}
$$

(The composition here is of the sort defined at the end of the previous section.)

(3) Define mappings from the standard $(k-1)$-cube to the faces of the standard $k$-cube as follows: for any $i \in\{1, \ldots, n\}$ and $\alpha \in\{0,1\}$, the mapping to the face where the ith coordinate equals $\alpha$ is

$$
\Delta_{i, \alpha}^{k}:[0,1]^{k-1} \longrightarrow[0,1]^{k},
$$

given by

$$
\Delta_{i, \alpha}^{k}\left(u_{1}, \ldots, u_{k-1}\right)=\left(u_{1}, \ldots, u_{i-1}, \alpha, u_{i}, \ldots, u_{k-1}\right) .
$$

Then

$$
\partial \Delta^{k}=\sum_{i=1}^{k} \sum_{\alpha=0}^{1}(-1)^{i+\alpha} \Delta_{i, \alpha}^{k} .
$$

In property (2) the composition symbol "o" has been generalized a little from its ordinary usage. Since $\partial \Delta^{k}$ is a chain $\sum \mu_{s} \Psi_{(s)}$, the composition $\Phi \circ$ $\partial \Delta^{k}$ is defined as the corresponding chain $\sum \mu_{s} \Phi \circ \Psi_{(s)}$. 

## The General Fundamental Theorem of Integral Calculus
````{prf:theorem} The General Fundamental Theorem of Integral Calculus
:label: them7.4 
Let $A$ be an open subset of $\mathbb{R}^n$. Let $C$ be a k-chain in $A$, and let $\omega$ be a $(k − 1)$-form on $A$. Then

$$\int_Cd\omega = \int_{\partial C}\omega$$
````

