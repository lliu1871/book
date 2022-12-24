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

# Vector calculus

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Real number](https://www.britannica.com/science/real-number)
- [Real number](https://en.wikipedia.org/wiki/Real_number)
```

## Vector field
A vector field in the plane is a map assigning to each point $(x, y)$ a vector $\vec{F}(x, y)=\langle P(x, y), Q(x, y)\rangle$. Similarly, a vector field in space assigns to each point $(x, y, z)$ in space a vector $\vec{F}(x, y, z)=\langle P(x, y, z), Q(x, y, z), R(x, y, z)\rangle$.

````{prf:definition} vector field
:label: vector_field
Let $A$ be an open subset of $\mathbb{R}^n$. A mapping $F: A \longrightarrow \mathbb{R}^n$ is called a vector field on $A$. 
````

If $f(x, y)$ is a function of two variables, then $\vec{F}(x, y)=\nabla f(x, y)$ is called a **gradient field**. Gradient fields in space are of the form $\vec{F}(x, y, z)=\nabla f(x, y, z)$. When is a vector field a gradient field? $\vec{F}(x, y)=\langle P(x, y), Q(x, y)\rangle=\nabla f(x, y)$ implies $Q_x(x, y)=$ $P_y(x, y)$. If this does not hold at some point, $F$ is not a gradient field.

## Line integral (flow integral)
````{prf:definition} flow
:label: flow
Let $\gamma: I \rightarrow A$ be a curve in $A\subset \mathbb{R}^n$. The flow of a vector field $F$ along $\gamma$ at $u\in I$ is the scalar component of $F(\gamma(u))$ tangent to $\gamma$ at $\gamma(u)$. 
````
Integrals involving the flow of a vector field arise naturally in physics. If $F$ is a force field then its flow integrals, also called line integrals, measure the work of moving along curves $\gamma$ in $A$.

````{prf:definition} line integral
:label: line_integral

If $\vec{F}$ is a vector field and $C: t \mapsto \vec{r}(t)$ is a curve defined on the interval $[a, b]$, then the line integral of $\vec{F}$ along the curve $C$ is defined by

$$
\int_C \vec{F} \cdot \vec{dr}=\int_a^b \vec{F}(\vec{r}(t)) \cdot \vec{r}^{\prime}(t) dt
$$
````

The following theorem regarding line integrals generalizes the fundamental theorem of calculus to higher dimensions.

````{prf:theorem} higher dimension fundamental theorem of calculus
:label: high_dimension_fundamental_theorem_calculus

If $\vec{F}=\nabla f$, then

$$
\int_a^b \vec{F}(\vec{r}(t)) \cdot \vec{r}^{\prime}(t) dt=f(\vec{r}(b))-f(\vec{r}(a)) .
$$
````

## Curl
````{prf:definition} curl
:label: curl
The curl of a vector field $\vec{F}$ is the cross product of the nabla operator $\nabla$ and the vector field $\vec{F}$, i.e., 

$$\operatorname{curl}(\vec{F})=\nabla\times \vec{F}$$
````

````{prf:example}
In $\mathbb{R}^2$, the curl of a vector field $\vec{F}(x, y)=\langle P(x, y), Q(x, y)\rangle$ is a scalar field

$$\operatorname{curl}(\vec{F})(x, y)=Q_x(x, y)-P_y(x, y)$$
````

````{prf:example}
In $\mathbb{R}^3$, the curl of a vector field $\vec{F}=\langle P, Q, R\rangle$ is the vector field 

$$
\nabla \times \vec{F}=\left|\begin{array}{ccc}
\hat{\imath} & \hat{\jmath} & \hat{k} \\
\frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
P & Q & R
\end{array}\right| = \left\langle R_y-Q_z, P_z-R_x, Q_x-P_y\right\rangle
$$

````

````{prf:theorem} Green's theorem
:label: Green
If $\vec{F}(x, y)=\langle P(x, y), Q(x, y)\rangle$ is a vector field and $G$ is a region for which the boundary $C$ is parametrized so that $G$ is to the left, then

$$
\int_C \vec{F} \cdot \vec{dr}=\iint_G \operatorname{curl}(F) dx dy .
$$
````

If $\vec{F}$ is a gradient field then both sides of Green's theorem are zero: $\int_C \vec{F} \cdot \vec{dr}$ is zero by the fundamental theorem for line integrals. and $\iint_G \operatorname{curl}(F) \cdot dA$ is zero because $\operatorname{curl}(F)=$ $\operatorname{curl}(\operatorname{grad}(f))=0$.


## Flux integral
````{prf:definition} flux
:label: flux
If $\Phi: D \rightarrow A$ is an $(n-1)$-surface in $A$ and $u$ is a point of $D$, then the **flux** of $F$ through $\Phi$ at $u$ is the scalar component of $F$ normal to $\Phi$ at $\Phi(u)$. 
````
```{note}
Because $\vec{n}=\vec{r}_u \times \vec{r}_v /\left|\vec{r}_u \times \vec{r}_v\right|$ is a unit vector normal to the surface and on the surface, $\vec{F} \cdot \vec{n}$ is the normal component of the vector field with respect to the surface. Thus, the function $\vec{F} \cdot \vec{n}$ is the scalar projection of $\vec{F}$ in the normal direction.
```

The flux integral is $\iint_S \vec{F} \cdot \vec{dS}=\iint \vec{F} \cdot \vec{n} dS$ where $dS=\left|\vec{r}_u \times \vec{r}_v\right| dudv$. It weights each area element $d S$ with the normal component $\vec{F}(\vec{r}(u, v) \cdot \vec{n}(\vec{r}(u, v))$ of the vector field.

````{prf:definition} flux integral
:label: flux_integral
If a surface $S$ is parametrized as $\vec{r}(u, v)=\langle x(u, v), y(u, v), z(u, v)\rangle$ over a domain $G$ in the $u v$-plane and $\vec{F}$ is a vector field, then the flux integral of $\vec{F}$ through $S$ is

$$
\iint_S \vec{F}\cdot \vec{dS} = \iint_G \vec{F}(\vec{r}(u, v)) \cdot\left(\vec{r}_u \times \vec{r}_v\right) dudv
$$
````
```{note}
The short hand notation $\vec{dS}=\left(\vec{r}_u \times \vec{r}_v\right) dudv$ represents an infinitesimal normal vector to the surface. If $\vec{F}=$ is the fluid velocity field, the interpretation of the flux integral $\iint_S \vec{F} \cdot \vec{d S}$ is the amount of fluid passing through $S$ in unit time.
```

The boundary of a surface is a curve oriented so that the surface is to the "left" if the normal vector to the surface is pointing "up". In other words, the velocity vector $v$, a vector $w$ pointing towards the surface and the normal vector $n$ to the surface form a right handed coordinate system.

````{prf:theorem} Stokes
:label: stokes_theorem
Stokes theorem: Let $S$ be a surface bounded by a curve $C$ and $\vec{F}$ be a vector field. Then

$$
\iint_S \operatorname{curl}(\vec{F}) \cdot \vec{d S}=\int_C \vec{F} \cdot \vec{d r} .
$$
````


## Divergence
````{prf:definition} diverence
:label: divergence
The divergence of a vector field $\vec{F}=\langle P, Q, R\rangle$ is the scalar field 

$$\operatorname{div}(\vec{F})=\nabla \cdot \vec{F}=P_x+Q_y+R_z$$
````

```{note}
The divergence of $\vec{F}=\langle P, Q\rangle$ in two dimensions is $\operatorname{div}(P, Q)=\nabla \cdot \vec{F}=P_x+Q_y$.
```

There are two fundamental vector derivatives in $\mathbb{R}^2$, namely, the gradient $\nabla\vec{F}$ and curl $\nabla\times \vec{F}$. In $\mathbb{R}^3$, there are three fundamental derivatives, the gradient, the curl and the divergence $\nabla\cdot\vec{F}$.

```{important}
Because $\nabla \cdot \nabla \times \vec{F}=0$ and $\nabla \times \nabla \vec{F}=\vec{0}$, it follows $\operatorname{div}(\operatorname{curl}(\vec{F}))=0$ and $\operatorname{curl}(\operatorname{grad}(\vec{F}))=\vec{0}$.
```

````{prf:theorem} divergence
:label: divergence_theorem
Divergence Theorem. Let $E$ be a solid with boundary surface $S$ oriented so that the normal vector points outside. Let $\vec{F}$ be a vector field. Then

$$
\iiint_E \operatorname{div}(\vec{F}) dV=\iint_S \vec{F} \cdot dS .
$$
````
## The fundamental theorem of Calculus
```{important}
All integral theorems are incarnations of the fundamental theorem of multivariable Calculus

$$
\int_G dF=\int_{\delta G} F
$$
```

Line integral: If $C$ is a curve with boundary $\{A, B\}$ and $f$ is a function, then

$$
\int_C \nabla f \cdot \vec{d r}=f(B)-f(A)
$$


Green's theorem. If $R$ is a region with boundary $C$ and $\vec{F}$ is a vector field, then

$$
\iint_R \operatorname{curl}(\vec{F}) dx dy=\int_C \vec{F} \cdot \vec{d r}
$$

Stokes theorem. If $S$ is a surface with boundary $C$ and $\vec{F}$ is a vector field, then

$$
\iint_S \operatorname{curl}(\vec{F}) \cdot dS=\int_C \vec{F} \cdot \vec{dr} .
$$

Divergence theorem: If $S$ is the boundary of a region $E$ in space and $\vec{F}$ is a vector field, then

$$
\iiint_B \operatorname{div}(\vec{F}) dV=\iint_S \vec{F} \cdot \vec{dS}
$$