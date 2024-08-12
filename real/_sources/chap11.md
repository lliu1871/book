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

# Chapter 11: Integration of Differential forms

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Power series](https://en.wikipedia.org/wiki/Power_series)
- [Fourier series](https://en.wikipedia.org/wiki/Fourier_series)
```

*"Life is a book and there are a thousand pages I have not yet read."*

-- Cassandra Clare, *Clockwork Princess*

## Integration
## Primitive Mappings 
## Partitions of Unity 
## Change of Variables

## Differential forms
````{prf:definition}
Suppose $E$ is an open set in $\mathbb{R}^n$. A $k$-surface in $E$ is a $\mathscr{C}^{\prime}$ mapping $\Phi$ from a compact set $D \subset \mathbb{R}^k$ into $E$.
$D$ is called the parameter domain of $\Phi$. Points of $D$ will be denoted by $\mathbf{u}=\left(u_1, \ldots, u_k\right)$.
````

We shall confine ourselves to the simple situation in which $D$ is either a $k$-cell or the $k$-simplex $Q^k$ described in Example 10.4. The reason for this is that we shall have to integrate over $D$, and we have not yet discussed integration over more complicated subsets of $\mathbb{R}^k$. It will be seen that this restriction on $D$ (which will be tacitly made from now on) entails no significant loss of generality in the resulting theory of differential forms.

We stress that $k$-surfaces in $E$ are defined to be mappings into $E$, not subsets of $E$. This agrees with our earlier definition of curves (Definition 6.26). In fact, 1-surfaces are precisely the same as continuously differentiable curves.

````{prf:definition}
:label: def11.1
Suppose $E$ is an open set in $\mathbb{R}^n$. A differential form of order $k \geq 1$ in $E$ (briefly, a $k$-form in $E$ ) is a function $\omega$, symbolically represented by the sum

$$
\omega=\sum a_{i_1 \cdots i_k}(\mathbf{x}) d x_{i_1} \wedge \cdots \wedge d x_{i_k}
$$

(the indices $i_1, \ldots, i_k$ range independently from 1 to $n$ ), which assigns to each $k$-surface $\Phi$ in $E$ a number $\omega(\Phi)=\int_{\Phi} \omega$, according to the rule

$$
\int_{\Phi} \omega=\int_D \sum a_{i_1} \cdots_{i_k}(\Phi(\mathbf{u})) \frac{\partial\left(x_{i_1}, \ldots, x_{i_k}\right)}{\partial\left(u_1, \ldots, u_k\right)} d \mathbf{u}
$$

where $D$ is the parameter domain of $\Phi$.
````

````{prf:example}
:label: exp11.1
Let $\gamma$ be a 1-surface in $\mathbb{R}^3$, with parameter
domain $[0, 1]$. Suppose $\omega = xdy + ydx$. Then

$$
\int_\gamma \omega=\int_0^1\left[\gamma_1(t) \gamma_2^{\prime}(t)+\gamma_2(t) \gamma_1^{\prime}(t)\right] d t=\gamma_1(1) \gamma_2(1)-\gamma_1(0) \gamma_2(0)
$$

Thus, $\int_\gamma \omega=0$ for every closed curve $\gamma$. 
````

````{prf:example} line integral
:label: exp11.2
Integrals of 1-forms are often called line integrals. Fix $a>0, b>0$, and define $\gamma(t)=(a \cos t, b \sin t) \quad(0 \leq t \leq 2 \pi)$, so that $\gamma$ is a closed curve in $\mathbb{R}^2$. Then

$$
\int_\gamma x d y=\int_0^{2 \pi} a b \cos ^2 t d t=\pi a b
$$

whereas

$$
\int_\gamma y d x=-\int_0^{2 \pi} a b \sin ^2 t d t=-\pi a b .
$$

Note that $\int_\gamma x d y$ is the area of the region bounded by $\gamma$. This is a special case of Green's theorem.
````

````{prf:example} surface integral
:label: exp11.3
Let $D$ be the 3-cell defined by $0 \leq r \leq 1, \quad 0 \leq \theta \leq \pi, \quad 0 \leq \varphi \leq 2 \pi$. Define $\Phi(r, \theta, \varphi)=(x, y, z)$, where

$$
\begin{aligned}
& x=r \sin \theta \cos \varphi \\
& y=r \sin \theta \sin \varphi \\
& z=r \cos \theta .
\end{aligned}
$$

Then

$$
J_{\Phi}(r, \theta, \varphi)=\frac{\partial(x, y, z)}{\partial(r, \theta, \varphi)}=r^2 \sin \theta
$$

Hence

$$
\int_{\Phi} d x \wedge d y \wedge d z=\int_D J_{\Phi}=\frac{4 \pi}{3}
$$

Note that $\Phi$ maps $D$ onto the closed unit ball of $\mathbb{R}^3$, that the mapping is 1-1 in the interior of $D$ (but certain boundary points are identified by $\Phi)$, and that the integral (36) is equal to the volume of $\Phi(D)$.
````

### Elementary properties 
Let $\omega, \omega_1, \omega_2$ be $k$-forms in $E$. We write $\omega_1=\omega_2$ if and only if $\omega_1(\Phi)=\omega_2(\Phi)$ for every $k$-surface $\Phi$ in $E$. In particular, $\omega=0$ means that $\omega(\Phi)=0$ for every $k$-surface $\Phi$ in $E$. If $c$ is a real number, then $c \omega$ is the $k$-form defined by

$$
\int_{\Phi} c \omega=c \int_{\Phi} \omega
$$

and $\omega=\omega_1+\omega_2$ means that

$$
\int_{\Phi} \omega=\int_{\Phi} \omega_1+\int_{\Phi} \omega_2
$$

for every $k$-surface $\Phi$ in $E$. As a special case, note that $-\omega$ is defined so that

$$
\int_{\Phi}(-\omega)=-\int_{\Phi} \omega
$$

Consider a $k$-form $\omega=a(\mathbf{x}) d x_{i_1} \wedge \cdots \wedge d x_{i_k}$ and let $\bar{\omega}$ be the $k$-form obtained by interchanging some pair of subscripts. Because a determinant changes sign if two of its rows are interchanged, we see that

$$
\bar{\omega}=-\omega
$$

```{admonition} Anticommutative
- $d x_i \wedge d x_j=-d x_j \wedge d x_i$
- $d x_i \wedge d x_i=0$
```

The summands with repeated subscripts can therefore be omitted without changing $\omega$. It follows that 0 is the only $k$-form in any open subset of $\mathbb{R}^n$, if $k>n$.


### Basic $k$-forms
````{prf:definition} basic $k$-forms 
:label: def11.2
If $i_1, \ldots, i_k$ are integers such that $1 \leq i_1<i_2<\cdots$ $<i_k \leq n$, and if $I$ is the ordered $k$-tuple $\left\{i_1, \ldots, i_k\right\}$, then we call $I$ an increasing $k$-index, and we use the brief notation

$$
d x_I=d x_{i_1} \wedge \cdots \wedge d x_{i_k}
$$

These forms $d x_I$ are the so-called basic $k$-forms in $\mathbb{R}^n$.
````

Every $k$-form can be represented in terms of basic $k$-forms, i.e.,

$$
d x_{j_1} \wedge \cdots \wedge d x_{j_k}=\varepsilon\left(j_1, \ldots, j_k\right) d x_J
$$
where $\varepsilon\left(j_1, \ldots, j_k\right)$ is 1 or -1 , depending on the number of interchanges that are needed. 

````{prf:example}
:label: exp11.4
$$
d x_1 \wedge d x_5 \wedge d x_3 \wedge d x_2=-d x_1 \wedge d x_2 \wedge d x_3 \wedge d x_5
$$

$$
d x_4 \wedge d x_2 \wedge d x_3=d x_2 \wedge d x_3 \wedge d x_4 .
$$
````

If every $k$-tuple is converted to an increasing $k$-index, then we obtain the so-called standard presentation of $\omega$ :

$$
\omega=\sum_I b_I(\mathbf{x}) d x_I
$$

The summation extends over all increasing $k$-indices $I$. 

````{prf:example}
:label: exp11.5
The standard presentation of the 2-form $
x_1 d x_2 \wedge d x_1-x_2 d x_3 \wedge d x_2+x_3 d x_2 \wedge d x_3+d x_1 \wedge d x_2$ in $\mathbb{R}^3$ is

$$
\left(1-x_1\right) d x_1 \wedge d x_2+\left(x_2+x_3\right) d x_2 \wedge d x_3 \text {. }
$$
````

The following uniqueness theorem is one of the main reasons for the introduction of the standard presentation of a $k$-form.

````{prf:theorem}
:label: thm11.1
Suppose $\omega=\sum_I b_I(\mathbf{x}) d x_I$ is the standard presentation of a $k$-form $\omega$ in an open set $E \subset \mathbb{R}^n$. If $\omega=0$ in $E$, then $b_I(\mathbf{x})=0$ for every increasing $k$-index $I$ and for every $\mathbf{x} \in E$.
````

````{prf:proof}
Assume, to reach a contradiction, that $b_J(\mathbf{v})>0$ for some $\mathbf{v} \in E$ and for some increasing $k$-index $J=\left\{j_1, \ldots, j_k\right\}$. Since $b_J$ is continuous, there exists $h>0$ such that $b_J(\mathbf{x})>0$ for all $\mathbf{x} \in \mathbb{R}^n$ whose coordinates satisfy $\left|x_i-v_i\right| \leq h$. Let $D$ be the $k$-cell in $\mathbb{R}^k$ such that $\mathbf{u} \in D$ if and only if $\left|u_r\right| \leq h$ for $r=1, \ldots, k$. Define

$$
\Phi(\mathbf{u})=\mathbf{v}+\sum_{r=1}^k u_r \mathbf{e}_{j_r} \quad(\mathbf{u} \in D)
$$

Then $\Phi$ is a $k$-surface in $E$, with parameter domain $D$, and $b_J(\Phi(\mathbf{u}))>0$ for every $\mathbf{u} \in D$.
We claim that

$$
\int_{\Phi} \omega=\int_D b_J(\Phi(\mathbf{u})) d \mathbf{u}
$$

Since the right side of $(50)$ is positive, it follows that $\omega(\Phi) \neq 0$. Hence (50) gives our contradiction.

To prove (50), apply (35) to the presentation (48). More specifically, compute the Jacobians that occur in (35). By (49),

$$
\frac{\partial\left(x_{j_1}, \ldots, x_{j_k}\right)}{\partial\left(u_1, \ldots, u_k\right)}=1
$$

For any other increasing $k$-index $I \neq J$, the Jacobian is 0 , since it is the determinant of a matrix with at least one row of zeros.
````

### Products of basic $k$-forms 
````{prf:definition}
:label: def11.3
Suppose $I=\left\{i_1, \ldots, i_p\right\}, \quad J=\left\{j_1, \ldots, j_q\right\}$, where $1 \leq i_1<\cdots<i_p \leq n$ and $1 \leq j_1<\cdots<j_q \leq n$. The product of the corresponding basic forms $d x_I$ and $d x_J$ in $\mathbb{R}^n$ is a $(p+q)$-form in $\mathbb{R}^n$, denoted by the symbol $d x_I \wedge d x_J$, and defined by

$$
d x_I \wedge d x_J=d x_{i_1} \wedge \cdots \wedge d x_{i_p} \wedge d x_{j_1} \wedge \cdots \wedge d x_{j_q} .
$$
````

````{prf:definition} Multiplication 
:label: def11.4
Suppose $\omega$ and $\gamma$ are p- and q-forms, respectively, in
some open set $E \subset \mathbb{R}^n$, with standard presentations $\omega= \sum_I b_I(\mathbf{x}) dx_I$ and $\gamma= \sum_J c_J(\mathbf{x}) dx_J$, where $I$ and $J$ range over all increasing p-indices and over all increasing q-indices taken from the set $\{l, \dots , n\}$. Their product, denoted by the symbol $\omega\wedge\gamma$, is defined to be

$$\omega\wedge\gamma = \sum_{I,J} b_I(\mathbf{x})c_J(\mathbf{x}) dx_I \wedge dx_J.$$
````

It is quite easy to see (we leave the details as an exercise) that the distributive laws

- $\left(\omega_1+\omega_2\right) \wedge \lambda=\left(\omega_1 \wedge \lambda\right)+\left(\omega_2 \wedge \lambda\right)$
- $\omega \wedge\left(\lambda_1+\lambda_2\right)=\left(\omega \wedge \lambda_1\right)+\left(\omega \wedge \lambda_2\right)$
- $(\omega \wedge \lambda) \wedge \sigma=\omega \wedge(\lambda \wedge \sigma)$

In this discussion it was tacitly assumed that $p \geq 1$ and $q \geq 1$. The product of a 0 -form $f$ with the $p$-form $\omega$ given by (56) is simply defined to be the $p$-form

$$
f \omega=\omega f=\sum_I f(\mathbf{x}) b_I(\mathbf{x}) d x_I
$$

It is customary to write $f \omega$, rather than $f \wedge \omega$, when $f$ is a 0-form.

### Differentiation 
We shall now define a differentiation operator $d$ which associates a $(k+1)$-form $d \omega$ to each $k$-form $\omega$ of class $\mathscr{C}^{\prime}$ in some open set $E \subset \mathbb{R}^n$.
A 0-form of class $\mathscr{C}^{\prime}$ in $E$ is just a real function $f \in \mathscr{C}^{\prime}(E)$, and we define

$$
d f=\sum_{i=1}^n\left(D_i f\right)(\mathbf{x}) d x_i
$$

If $\omega=\Sigma b_I(\mathbf{x}) d x_I$ is the standard presentation of a $k$-form $\omega$, and $b_I \in \mathscr{C}^{\prime}(E)$ for each increasing $k$-index $I$, then we define

$$
d \omega=\sum_I\left(d b_I\right) \wedge d x_I
$$

````{prf:example} 
:label: exp11.6
Suppose $E$ is open in $\mathbb{R}^n, f \in \mathscr{C}^{\prime}(E)$, and $\gamma$ is a continuously differentiable curve in $E$, with domain $[0,1]$.

$$
\int_\gamma d f=\int_0^1 \sum_{i=1}^n\left(D_i f\right)(\gamma(t)) \gamma_i^{\prime}(t) d t
$$

By the chain rule, the last integrand is $(f \circ \gamma)^{\prime}(t)$. Hence

$$
\int_\gamma d f=f(\gamma(1))-f(\gamma(0))
$$
and we see that $\int_\gamma d f$ is the same for all $\gamma$ with the same initial point and the same end point.
````

````{prf:theorem}
:label: thm11.2
If $\omega$ and $\lambda$ are $k$- and $m$-forms of class $\mathscr{C}^{\prime}$ in $E$, then 

$$d(\omega \wedge \lambda)=(d \omega) \wedge \lambda+(-1)^k \omega \wedge d \lambda$$

If $\omega$ is of class $\mathscr{C}^{\prime \prime}$ in $E$, then $d^2 \omega=0$. Here $d^2 \omega$ means, of course, $d(d \omega)$.
````

````{prf:example}
:label: exp11.7
Find the derivative of 1-form $xdy$.

$d(xdy)=dx \wedge dy + x\wedge d^2y = dx\wedge dy$
````

### Change of variables 
Suppose $E$ is an open set in $\mathbb{R}^n, T$ is a $\mathscr{C}^{\prime}$-mapping of $E$ into an open set $V \subset \mathbb{R}^m$, and $\omega$ is a $k$-form in $V$, whose standard presentation is

$$
\omega=\sum_I b_I(\mathbf{y}) d y_I .
$$
(We use $\mathbf{y}$ for points of $V, \mathbf{x}$ for points of $E$.)
Let $t_1, \ldots, t_m$ be the components of $T$ : If

$$
\mathbf{y}=\left(y_1, \ldots, y_m\right)=T(\mathbf{x})
$$
then $y_i=t_i(\mathbf{x})$. As in (59),

$$
d t_i=\sum_{j=1}^n\left(D_j t_i\right)(\mathbf{x}) d x_j \quad(1 \leq i \leq m) .
$$

Thus each $d t_i$ is a 1 -form in $E$.
The mapping $T$ transforms $\omega$ into a $k$-form $\omega_T$ in $E$, whose definition is

$$
\omega_T=\sum_I b_r(T(\mathbf{x})) d t_{i_l} \wedge \cdots \wedge d t_{i_k} .
$$

````{prf:theorem}
:label: thm11.3
Let $\omega$ and $\lambda$ be $k$- and $m$-forms in $V$. Then
- $(\omega+\lambda)_T=\omega_T+\lambda_T$ if $k=m ;$
- $(\omega \wedge \lambda)_T=\omega_T \wedge \lambda_T$;
- $d\left(\omega_T\right)=(d \omega)_T$ if $\omega$ is of class $\mathscr{C}^{\prime}$ and $T$ is of class $\mathscr{C}^{\prime \prime}$.

````

````{prf:theorem}
:label: thm11.4
Suppose $T$ is a $\mathscr{C}^{\prime}$-mapping of an open set $E \subset \mathbb{R}^n$ into an open set $V \subset \mathbb{R}^m, S$ is a $\mathscr{C}^{\prime}$-mapping of $V$ into an open set $W \subset \mathbb{R}^p$, and $\omega$ is a $k$-form in $W$, so that $\omega_S$ is a $k$-form in $V$ and both $\left(\omega_S\right)_T$ and $\omega_{S T}$ are $k$-forms in $E$, where $S T$ is defined by $(S T)(\mathbf{x})=S(T(\mathbf{x}))$. Then

$$
\left(\omega_S\right)_T=\omega_{ST}
$$
````

````{prf:theorem}
:label: thm11.5
10.24 Theorem Suppose $\omega$ is a $k$-form in an open set $E \subset \mathbb{R}^n, \Phi$ is a $k$-surface in $E$, with parameter domain $D \subset \mathbb{R}^k$, and $\Delta$ is the $k$-surface in $\mathbb{R}^k$, with parameter domain $D$, defined by $\Delta(\mathbf{u})=\mathbf{u}(\mathbf{u} \in D)$. Then

$$
\int_{\Phi} \omega=\int_{\Delta} \omega_{\Phi}
$$
````
````{prf:theorem}
:label: thm11.6
Suppose $T$ is a $\mathscr{C}^{\prime}$-mapping of an open set $E \subset \mathbb{R}^n$ into an open set $V \subset \mathbb{R}^m, \Phi$ is a $k$-surface in $E$, and $\omega$ is a $k$-form in $V$.
Then

$$
\int_{T \Phi} \omega=\int_{\Phi} \omega_T .
$$
````

## Simplexes and Chains 
## Stokes' Theorem 
## Closed Forms and Exact Forms 

## Vector Analysis
In vector calculus and physics, a vector field assigns a vector to each point in a space, typically Euclidean space $\mathbb{R}^n$ . Visualized as arrows on a plane, vector fields model phenomena such as fluid movement and forces like wind, magnetic, or gravitational forces. The principles of differential and integral calculus extend to vector fields, where the line integral represents work done by a force. Conservation of energy is a special case of the fundamental theorem of calculus in this context. Vector fields, representing the velocity of a substance in space, give rise to concepts like divergence (rate of volume change) and curl (rotation of flow).

### vector fields
````{prf:definition} Vector fields
:label: def11.5
Let $\mathbf{F}=F_1 \mathbf{e}_1+F_2 \mathbf{e}_2+F_3 \mathbf{e}_3$ be a continuous mapping of an open set $E \subset \mathbb{R}^3$ into $\mathbb{R}^3$. Since $\mathbf{F}$ associates a vector to each point of $E, \mathbf{F}$ is sometimes called a vector field. 
````

Every vector field $\mathbf{F}$ is associated a 1-form $\lambda_{\mathrm{F}}=F_1 d x+F_2 dy+F_3 dz$ and a 2-form $\omega_{\mathrm{F}}=F_1 dy \wedge dz+F_2 dz \wedge d x+F_3 dx \wedge dy$. Conversely, every 1-form $\lambda$ in $E$ is $\lambda_{\mathbf{F}}$ for some vector field $\mathbf{F}$ in $E$, and that every 2-form $\omega$ is $\omega_{\mathbf{F}}$ for some $\mathbf{F}$. 

````{prf:definition} gradient field
:label: def11.6
A vector field $\mathbf{G}$ defined on an open set $S\subset \mathbb{R}^n$ is called a gradient field if there exists a real-valued function (a scalar field) $f\in \mathscr{C}^{\prime}(E)$ on $S$ such that

$$\mathbf{G}=\nabla f=\left({\frac {\partial f}{\partial x_{1}}},{\frac {\partial f}{\partial x_{2}}},{\frac {\partial f}{\partial x_{3}}},\dots ,{\frac {\partial f}{\partial x_{n}}}\right)$$
````

````{prf:definition} curl
:label: def11.7
Suppose now that $\mathbf{F}$ is a vector field in $E$, of class $\mathscr{C}^{\prime}$. Its $\operatorname{curl} \nabla \times \mathbf{F}$ is the vector field defined in $E$ by

$$
\nabla \times \mathbf{F}=\left(D_2 F_3-D_3 F_2\right) \mathbf{e}_1+\left(D_3 F_1-D_1 F_3\right) \mathbf{e}_2+\left(D_1 F_2-D_2 F_1\right) \mathbf{e}_3
$$
````

````{prf:definition} divergence
:label: def11.8
Divergence is the real function $\nabla \cdot \mathbf{F}$ defined in $E$ by

$$
\nabla \cdot \mathbf{F}=D_1 F_1+D_2 F_2+D_3 F_3 .
$$
````

Here are some relations between gradients, curls, and divergences Suppose $E$ is an open set in $\mathbb{R}^3, u \in \mathscr{C}^{\prime \prime}(E)$, and $\mathbf{G}$ is a vector field in $E$, of class $\mathscr{C}^{\prime \prime}$.

- If $\mathbf{F}=\nabla u$, then $\nabla \times \mathbf{F}=\mathbf{0}$.
- If $\mathbf{F}=\nabla \times \mathbf{G}$, then $\nabla \cdot \mathbf{F}=0$.

Furthermore, if $E$ is $\mathscr{C}^{\prime \prime}$-equivalent to a convex set, then (a) and (b) have converses, in which we assume that $\mathbf{F}$ is a vector field in $E$, of class $\mathscr{C}^{\prime}$ :

- If $\nabla \times \mathbf{F}=\mathbf{0}$, then $\mathbf{F}=\nabla u$ for some $u \in \mathscr{C}^{\prime \prime}(E)$.
- If $\nabla \cdot \mathbf{F}=0$, then $\mathbf{F}=\nabla \times \mathbf{G}$ for some vector field $\mathbf{G}$ in $E$, of class $\mathscr{C}^{\prime \prime}$

### Volume elements 
The $k$-form $d x_1 \wedge \cdots \wedge d x_k$
is called the volume element in $R^k$. It is often denoted by $d V$ (or by $d V_k$ if it seems desirable to indicate the dimension explicitly), and the notation

$$
\int_{\Phi} f(\mathbf{x}) d x_1 \wedge \cdots \wedge d x_k=\int_{\Phi} f d V
$$
is used when $\Phi$ is a positively oriented $k$-surface in $R^k$ and $f$ is a continuous function on the range of $\Phi$.

The reason for using this terminology is very simple: If $D$ is a parameter domain in $R^k$, and if $\Phi$ is a 1-1 $\mathscr{C}^{\prime}$-mapping of $D$ into $R^k$, with positive Jacobian $J_{\Phi}$, then the left side of $(126)$ is

$$
\int_D f(\Phi(\mathbf{u})) J_{\Phi}(\mathbf{u}) d \mathbf{u}=\int_{\Phi(D)} f(\mathbf{x}) d \mathbf{x}
$$

In particular, when $f=1$ defines the volume of $\Phi$. 

````{prf:theorem} Green's theorem
:label: thm11.7 
Suppose $E$ is an open set in $R^2, \alpha \in \mathscr{C}^{\prime}(E), \beta \in \mathscr{C}^{\prime}(E)$, and $\Omega$ is a closed subset of $E$, with positively oriented boundary $\partial \Omega$, as described in Sec. 10.31. Then

$$
\int_{\partial \Omega}(\alpha d x+\beta d y)=\int_{\Omega}\left(\frac{\partial \beta}{\partial x}-\frac{\partial \alpha}{\partial y}\right) d A
$$
````

````{prf:proof}
Put $\lambda=\alpha d x+\beta d y$. Then

$$
\begin{aligned}
d \lambda & =\left(D_2 \alpha\right) d y \wedge d x+\left(D_1 \beta\right) d x \wedge d y \\
& =\left(D_1 \beta-D_2 \alpha\right) d A,
\end{aligned}
$$

$$
\int_{\partial \Omega} \lambda=\int_{\Omega} d \lambda
$$
which is true by Theorem 10.33 .
With $\alpha(x, y)=-y$ and $\beta(x, y)=x$, (127) becomes

$$
\frac{1}{2} \int_{\partial \Omega}(x d y-y d x)=A(\Omega)
$$
the area of $\Omega$.
With $\alpha=0, \beta=x$, a similar formula is obtained. Example $10.12(b)$ contains a special case of this.
````

### Area elements in $R^3$ 
Let $\Phi$ be a 2 -surface in $R^3$, of class $\mathscr{C}^{\prime}$, with parameter domain $D \subset R^2$. Associate with each point $(u, v) \in D$ the vector

$$
\mathbf{N}(u, v)=\frac{\partial(y, z)}{\partial(u, v)} \mathbf{e}_1+\frac{\partial(z, x)}{\partial(u, v)} \mathbf{e}_2+\frac{\partial(x, y)}{\partial(u, v)} \mathbf{e}_3 .
$$

The Jacobians in (129) correspond to the equation

$$
(x, y, z)=\Phi(u, v)
$$

If $f$ is a continuous function on $\Phi(D)$, the area integral of $f$ over $\Phi$ is defined to be

$$
\int_{\Phi} f d A=\int_D f(\Phi(u, v))|\mathbf{N}(u, v)| d u d v
$$

In particular, when $f=1$ we obtain the area of $\Phi$, namely,

$$
A(\Phi)=\int_D|\mathbf{N}(u, v)| d u d v
$$

The following discussion will show that (131) and its special case (132) are reasonable definitions. It will also describe the geometric features of the vector $\mathbf{N}$.

Write $\Phi=\varphi_1 \mathbf{e}_1+\varphi_2 \mathbf{e}_2+\varphi_3 \mathbf{e}_3$, fix a point $\mathbf{p}_0=\left(u_0, v_0\right) \in D$, put $\mathbf{N}=\mathbf{N}\left(\mathbf{p}_0\right)$, put

$$
\alpha_i=\left(D_1 \varphi_i\right)\left(\mathbf{p}_0\right), \quad \beta_i=\left(D_2 \varphi_i\right)\left(\mathbf{p}_0\right) \quad(i=1,2,3)
$$

and let $T \in L\left(R^2, R^3\right)$ be the linear transformation given by

$$
T(u, v)=\sum_{i=1}^3\left(\alpha_i u+\beta_i v\right) \mathbf{e}_i .
$$

Note that $T=\Phi^{\prime}\left(\mathbf{p}_0\right)$, in accordance with Definition 9.11.
Let us now assume that the rank of $T$ is 2 . (If it is 1 or 0 , then $\mathbf{N}=\mathbf{0}$, and the tangent plane mentioned below degenerates to a line or to a point.) The range of the affine mapping

$$
(u, v) \rightarrow \Phi\left(\mathbf{p}_0\right)+T(u, v)
$$
is then a plane $\Pi$, called the tangent plane to $\Phi$ at $\mathbf{p}_0$. [One would like to call $\Pi$ the tangent plane at $\Phi\left(\mathbf{p}_0\right)$, rather than at $\mathbf{p}_0$; if $\Phi$ is not one-to-one, this runs into difficulties.]
If we use (133) in (129), we obtain

$$
\mathbf{N}=\left(\alpha_2 \beta_3-\alpha_3 \beta_2\right) \mathbf{e}_1+\left(\alpha_3 \beta_1-\alpha_1 \beta_3\right) \mathbf{e}_2+\left(\alpha_1 \beta_2-\alpha_2 \beta_1\right) \mathbf{e}_3,
$$
and (134) shows that

$$
T \mathbf{e}_1=\sum_{i=1}^3 \alpha_i \mathbf{e}_i, \quad T \mathbf{e}_2=\sum_{i=1}^3 \beta_i \mathbf{e}_i .
$$

A straightforward computation now leads to

$$
\mathbf{N} \cdot\left(T \mathrm{e}_1\right)=0=\mathbf{N} \cdot\left(T \mathrm{e}_2\right) .
$$

Hence $\mathbf{N}$ is perpendicular to $\Pi$. It is therefore called the normal to $\Phi$ at $\mathbf{p}_0$.
A second property of $\mathbf{N}$, also verified by a direct computation based on (135) and (136), is that the determinant of the linear transformation of $R^3$ that takes $\left\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\right\}$ to $\left\{T \mathbf{e}_1, T \mathbf{e}_2, \mathbf{N}\right\}$ is $|\mathbf{N}|^2>0$ (Exercise 30). The 3-simplex

$$
\left[0, T \mathrm{e}_1, T \mathrm{e}_2, \mathrm{~N}\right]
$$
is thus positively oriented.

The third property of $\mathbf{N}$ that we shall use is a consequence of the first two: The above-mentioned determinant, whose value is $|\mathbf{N}|^2$, is the volume of the parallelepiped with edges $\left[0, T \mathbf{e}_1\right],\left[0, T \mathbf{e}_2\right],[0, \mathbf{N}]$. By (137), [0,N] is perpendicular to the other two edges. The area of the parallelogram with vertices

$$
\mathbf{0}, T \mathrm{e}_1, T \mathrm{e}_2, T\left(\mathrm{e}_1+\mathrm{e}_2\right)
$$
is therefore $|\mathbf{N}|$.
This parallelogram is the image under $T$ of the unit square in $R^2$. If $E$ is any rectangle in $R^2$, it follows (by the linearity of $T$ ) that the area of the parallelogram $T(E)$ is

$$
A(T(E))=|\mathbf{N}| A(E)=\int_E\left|\mathbf{N}\left(u_0, v_0\right)\right| d u d v
$$


We conclude that (132) is correct when $\Phi$ is affine. To justify the definition (132) in the general case, divide $D$ into small rectangles, pick a point $\left(u_0, v_0\right)$ in each, and replace $\Phi$ in each rectangle by the corresponding tangent plane. The sum of the areas of the resulting parallelograms, obtained via (140), is then an approximation to $A(\Phi)$. Finally, one can justify (131) from (132) by approximating $f$ by step functions.

````{prf:example}
:label: exp11.8
Let $0<a<b$ be fixed. Let $K$ be the 3-cell determined by

$$
0 \leq t \leq a, \quad 0 \leq u \leq 2 \pi, \quad 0 \leq v \leq 2 \pi .
$$

The equations

$$
\begin{aligned}
& x=t \cos u \\
& y=(b+t \sin u) \cos v \\
& z=(b+t \sin u) \sin v
\end{aligned}
$$
describe a mapping $\Psi$ of $R^3$ into $R^3$ which is $1-1$ in the interior of $K$, such that $\Psi(K)$ is a solid torus. Its Jacobian is

$$
J_{\Psi}=\frac{\partial(x, y, z)}{\partial(t, u, v)}=t(b+t \sin u)
$$
which is positive on $K$, except on the face $t=0$. If we integrate $J_{\Psi}$ over $K$, we obtain

$$
\operatorname{vol}(\Psi(K))=2 \pi^2 a^2 b
$$
as the volume of our solid torus.
````
Now consider the 2-chain $\Phi=\partial \Psi$. (See Exercise 19.) $\Psi$ maps the faces $u=0$ and $u=2 \pi$ of $K$ onto the same cylindrical strip, but with opposite orientations. $\Psi$ maps the faces $v=0$ and $v=2 \pi$ onto the same circular disc, but with opposite orientations. $\Psi$ maps the face $t=0$ onto a circle, which contributes 0 to the 2-chain $\partial \Psi$. (The relevant Jacobians are 0 .) Thus $\Phi$ is simply the 2 -surface obtained by setting $t=a$ in (141), with parameter domain $D$ the square defined by $0 \leq u \leq 2 \pi, 0 \leq v \leq 2 \pi$.

According to (129) and (141), the normal to $\Phi$ at $(u, v) \in D$ is thus the vector

$$
\mathbf{N}(u, v)=a(b+a \sin u) \mathbf{n}(u, v)
$$
where

$$
\mathbf{n}(u, v)=(\cos u) \mathbf{e}_1+(\sin u \cos v) \mathbf{e}_2+(\sin u \sin v) \mathbf{e}_3 .
$$


Since $|\mathbf{n}(u, v)|=1$, we have $|\mathbf{N}(u, v)|=a(b+a \sin u)$, and if we integrate this over $D,(131)$ gives

$$
A(\Phi)=4 \pi^2 a b
$$
as the surface area of our torus.
If we think of $\mathbf{N}=\mathbf{N}(u, v)$ as a directed line segment, pointing from $\Phi(u, v)$ to $\Phi(u, v)+\mathbf{N}(u, v)$, then $\mathbf{N}$ points outward, that is to say, away from $\Psi(K)$. This is so because $\mathrm{J}_{\Psi}>0$ when $t=a$.

For example, take $u=v=\pi / 2, t=a$. This gives the largest value of $z$ on $\Psi(K)$, and $\mathbf{N}=a(b+a) \mathbf{e}_3$ points "upward" for this choice of $(u, v)$.

### Integrals of 1-forms in $R^3$ 
Let $\gamma$ be a $\mathscr{C}^{\prime}$-curve in an open set $E \subset R^3$, with parameter interval $[0,1]$, let $\mathbf{F}$ be a vector field in $E$, as in Sec. 10.42, and define $\lambda_F$ by (124). The integral of $\lambda_F$ over $\gamma$ can be rewritten in a certain way which we now describe.
For any $u \in[0,1]$,

$$
\gamma^{\prime}(u)=\gamma_1^{\prime}(u) \mathbf{e}_1+\gamma_2^{\prime}(u) \mathbf{e}_2+\gamma_3^{\prime}(u) \mathbf{e}_3
$$
is called the tangent vector to $\gamma$ at $u$. We define $\mathbf{t}=\mathbf{t}(u)$ to be the unit vector in the direction of $\gamma^{\prime}(u)$. Thus

$$
\gamma^{\prime}(u)=\left|\gamma^{\prime}(u)\right| \mathbf{t}(u)
$$

[If $\gamma^{\prime}(u)=\mathbf{0}$ for some $u$, put $\mathbf{t}(u)=\mathbf{e}_1$; any other choice would do just as well.] By (35),

$$
\begin{aligned}
\int_\gamma \lambda_{\mathbf{F}} & =\sum_{i=1}^3 \int_0^1 F_i(\gamma(u)) \gamma_i^{\prime}(u) d u \\
& =\int_0^1 \mathbf{F}(\gamma(u)) \cdot \gamma^{\prime}(u) d u \\
& =\int_0^1 \mathbf{F}(\gamma(u)) \cdot \mathbf{t}(u)\left|\gamma^{\prime}(u)\right| d u
\end{aligned}
$$

Theorem 6.27 makes it reasonable to call $\left|\gamma^{\prime}(u)\right| d u$ the element of arc length along $\gamma$. A customary notation for it is $d s$, and (142) is rewritten in the form

$$
\int_\gamma \lambda_{\mathbf{F}}=\int_\gamma(\mathbf{F} \cdot \mathbf{t}) d s
$$

Since $\mathbf{t}$ is a unit tangent vector to $\gamma, \mathbf{F} \cdot \mathbf{t}$ is called the tangential component of $\mathbf{F}$ along $\gamma$.


The right side of (143) should be regarded as just an abbreviation for the last integral in (142). The point is that $\mathbf{F}$ is defined on the range of $\gamma$, but $\mathbf{t}$ is defined on $[0,1]$; thus $\mathbf{F} \cdot \mathbf{t}$ has to be properly interpreted. Of course, when $\gamma$ is one-to-one, then $\mathbf{t}(u)$ can be replaced by $\mathbf{t}(\gamma(u))$, and this difficulty disappears.

### Integrals of 2-forms in $R^3$ 
Let $\Phi$ be a 2-surface in an open set $E \subset R^3$, of class $\mathscr{C}^{\prime}$, with parameter domain $D \subset R^2$. Let $\mathbf{F}$ be a vector field in $E$, and define $\omega_{\mathbf{F}}$ by (125). As in the preceding section, we shall obtain a different representation of the integral of $\omega_{\mathbf{F}}$ over $\Phi$.
By (35) and (129),

$$
\begin{aligned}
\int_{\Phi} \omega_{\mathbf{F}} & =\int_{\Phi}\left(F_1 d y \wedge d z+F_2 d z \wedge d x+F_3 d x \wedge d y\right) \\
& =\int_D\left\{\left(F_1 \circ \Phi\right) \frac{\partial(y, z)}{\partial(u, v)}+\left(F_2 \circ \Phi\right) \frac{\partial(z, x)}{\partial(u, v)}+\left(F_3 \circ \Phi\right) \frac{\partial(x, y)}{\partial(u, v)}\right\} d u d v \\
& =\int_D \mathbf{F}(\Phi(u, v)) \cdot \mathbf{N}(u, v) d u d v
\end{aligned}
$$

Now let $\mathbf{n}=\mathbf{n}(u, v)$ be the unit vector in the direction of $\mathbf{N}(u, v)$. [If $\mathbf{N}(u, v)=\mathbf{0}$ for some $(u, v) \in D$, take $\mathbf{n}(u, v)=\mathbf{e}_1$.] Then $\mathbf{N}=|\mathbf{N}| \mathbf{n}$, and therefore the last integral becomes

$$
\int_D \mathbf{F}(\Phi(u, v)) \cdot \mathbf{n}(u, v)|\mathbf{N}(u, v)| d u d v
$$

By (131), we can finally write this in the form

$$
\int_{\Phi} \omega_{\mathbf{F}}=\int_{\Phi}(\mathbf{F} \cdot \mathbf{n}) d A
$$

With regard to the meaning of $\mathbf{F} \cdot \mathbf{n}$, the remark made at the end of Sec. 10.48 applies here as well.
We can now state the original form of Stokes' theorem.

````{prf:theorem} Stokes' formula 
If $\mathbf{F}$ is a vector field of class $\mathscr{C}^{\prime}$ in an open set $E \subset R^3$, and if $\Phi$ is a 2-surface of class $\mathscr{C}^{\prime \prime}$ in $E$, then

$$
\int_{\Phi}(\nabla \times \mathbf{F}) \cdot \mathbf{n} d A=\int_{\partial \Phi}(\mathbf{F} \cdot \mathbf{t}) d s .
$$
````

````{prf:proof}
Put $\mathbf{H}=\nabla \times \mathbf{F}$. Then, as in the proof of Theorem 10.43, we have

$$
\omega_{\mathbf{H}}=d \lambda_{\mathbf{F}}
$$

Hence

$$
\begin{aligned}
\int_{\Phi}(\nabla \times \mathbf{F}) \cdot \mathbf{n} d A & =\int_{\Phi}(\mathbf{H} \cdot \mathbf{n}) d A=\int_{\Phi} \omega_{\mathbf{H}} \\
& =\int_{\Phi} d \lambda_{\mathbf{F}}=\int_{\partial \Phi} \lambda_{\mathbf{F}}=\int_{\partial \Phi}(\mathbf{F} \cdot \mathbf{t}) d s
\end{aligned}
$$

Here we used the definition of $\mathbf{H}$, then (144) with $\mathbf{H}$ in place of $\mathbf{F}$, then (146), then-the main step-Theorem 10.33, and finally (143), extended in the obvious way from curves to 1-chains.
````

````{prf:theorem} The divergence theorem 
:label: thm11.8
If $\mathbf{F}$ is a vector field of class $\mathscr{C}^{\prime}$ in an open set $E \subset R^3$, and if $\Omega$ is a closed subset of $E$ with positively oriented boundary $\partial \Omega$ (as described in Sec. 10.31) then

$$
\int_{\boldsymbol{\Omega}}(\nabla \cdot \mathbf{F}) d V=\int_{\partial \boldsymbol{\Omega}}(\mathbf{F} \cdot \mathbf{n}) d A
$$
````
````{prf:proof}
By theorem,

$$
d \omega_{\mathbf{F}}=(\nabla \cdot \mathbf{F}) d x \wedge d y \wedge d z=(\nabla \cdot \mathbf{F}) d V
$$

Hence

$$
\int_{\boldsymbol{\Omega}}(\boldsymbol{\nabla} \cdot \mathbf{F}) d V=\int_{\boldsymbol{\Omega}} d \omega_{\mathbf{F}}=\int_{\partial \boldsymbol{\Omega}} \omega_{\mathbf{F}}=\int_{\partial \boldsymbol{\Omega}}(\mathbf{F} \cdot \mathbf{n}) d A,
$$
by Theorem 10.33, applied to the 2 -form $\omega_F$, and (144).
````

