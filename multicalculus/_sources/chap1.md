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

# Chapter 1: Geometry

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Euclidean space](https://en.wikipedia.org/wiki/Euclidean_space)
```

## Euclidean space
Euclidean space is the $n$-dimensional space with Euclidean geometry. It is named after the Greek mathematician [Euclid of Alexandria](https://en.wikipedia.org/wiki/Euclid). In his famous book *Elements*, Euclid established foundations of geometry which is now referred to as Euclidean geometry.

A point in $n$-dimensional Euclidean space is represented by an $n$-tuple of real numbers. Two fundamental operations (tranlation and rotation) in Euclidean geometry are charaterized by affine space and inner product. Thus, Euclidean space is a set of n-tuple real numbers (i.e., real vector space $\mathbb{R}^n$). The action of translations makes the space an affine space, and this allows defining lines, planes, subspaces, dimension, and parallelism. The inner product allows defining distance and angles.


````{prf:definition} Euclidean space
:label: Euclidean_space
A Euclidean space is an affine space over $\mathbb{R}$ such that the associated vector space is a Euclidean vector space.
````

## Real coordinate system
Real coordinate system ([René Descartes](https://en.wikipedia.org/wiki/Ren%C3%A9_Descartes)) for an $n$-dimensional space consists of $n$ orthogonal cooridnate axes. Every point in the space is represented by its coordinates $\langle x_1, x_2,..., x_n\rangle$ on the $n$ coordinate axes. The coordinates of the origin is $\langle0,...,0\rangle$.

One of the fundamental operations in Euclidean space is to calculate the distance between two points in the space. Motivated by Pathagorean theorem, the Euclidean distance is defined as the length of the straight line connecting the two points. 

```{code-cell} python
%matplotlib inline
import numpy as np
import matplotlib.pyplot as plt
fig = plt.figure()
ax = plt.axes(projection='3d')
```

````{prf:definition} Euclidean distance
:label: Euclidean_distance
The Euclidean distance between two points $P=\langle x_1,..., x_n\rangle$ and $Q=\langle y_1,..., y_n\rangle$ in space is defined as $d(P, Q)=\sqrt{\sum_{i=1}^n(x_i-y_i)^2}$.
````

```{code-cell} python
:tags: ["hide-input"]
import numpy as np
import matplotlib.pyplot as plt

v = [2,4]
w = [4,2]

array = np.array([[0, 0, v[0], v[1]],[0, 0, w[0], w[1]]])

X, Y, V, W = zip(*array)
plt.figure()
plt.ylabel('Y-axis')
plt.xlabel('X-axis')
ax = plt.gca()
ax.annotate(f'v({v[0]},{v[1]})', (v[0],v[1]),fontsize=14)
plt.scatter(v[0],v[1], s=10,c='red')
ax.annotate(f'w({w[0]},{w[1]})', (w[0],w[1]),fontsize=14)
plt.scatter(w[0], w[1], s=10,c='blue')
ax.quiver(X, Y, V, W, angles='xy', scale_units='xy',color=['r','b'],scale=1)
ax.set_xlim([0, 10])
ax.set_ylim([0, 10])

plt.grid()
plt.draw()
plt.show()
```
The Euclidean distance between two vectors is $\sqrt{(2-4)^2+(4-2)^2}=2\sqrt{2}$.

## Vector operations
A point in the Euclidean space is represented by its coordinates or a **vector** of coordinates. Two vectors (i.e. points) may add, subtract, and multiply as defined below.


````{prf:definition} vector addition
:label: vector_addition
The addition of two vectors is $\vec{u}+\vec{v}=\left\langle u_1, u_2, u_3\right\rangle+\left\langle v_1, v_2, v_3\right\rangle=$ $\left\langle u_1+v_1, u_2+v_2, u_3+v_3\right\rangle$. 
````

````{prf:definition} vector scalar multiplication
:label: vector_scalar_multiplication
The scalar multiple $\lambda \vec{u}=\lambda\left\langle u_1, u_2, u_3\right\rangle=\left\langle\lambda u_1, \lambda u_2, \lambda u_3\right\rangle$. The difference $\vec{u}-\vec{v}$ can best be seen as the addition of $\vec{u}$ and $(-1) \cdot \vec{v}$.
````
The vector addition and scalar multiplication satisfy the communitativity, associativity, and distributivity laws

- communitativity: $\vec{v_1}+\vec{v_2}=\vec{v_2}+\vec{v_1}$
- associativity: $(\vec{v_1}+\vec{v_2})+\vec{v_3}=\vec{v_1}+(\vec{v_2}+\vec{v_3})$
- distributivity: $\gamma(\vec{v_1}+\vec{v_2})=\gamma\vec{v_1}+\gamma\vec{v_2}$

In addition to addition and scalar multiplication, Euclidean space is also equipped with dot product which can be used to measure distance, rotation, reflection, etc. 

````{prf:definition} dot product
:label: dot_product
The dot product of two vectors $\vec{v}=\langle a, b, c\rangle$ and $\vec{w}=\langle p, q, r\rangle$ is defined as $\vec{v} \cdot \vec{w}=$ $a p+b q+c r$
````

- The length of a vector $\vec{x}$, which is also called **norm** and denoted by $||\vec{x}||$, is given by $||\vec{x}||=\vec{x}\cdot\vec{x}$. 
- The distance between two vectors $\vec{x}$ and $\vec{y}$ is $d(\vec{x},\vec{y})=(\vec{x}-\vec{y})\cdot(\vec{x}-\vec{y})$.
- The angle between two nonzero vectors is defined as the unique $\alpha \in[0, \pi]$ which satisfies $\vec{v} \cdot \vec{w}=|\vec{v}| \cdot|\vec{w}| \cos (\alpha)$.

````{prf:theorem} Cauchy-Schwarz inequality
:label: Cauchy_Schwarz_inequality
$|\vec{v} \cdot \vec{w}| \leq|\vec{v}||\vec{w}|$
````
````{prf:theorem} Al Kashi's theorem
:label: Al_Kashi_theorem
A triangle $A B C$ with side lengths $a, b, c$ and angle $\alpha$ opposite to $c$ satisfies $a^2+b^2=c^2+2 a b \cos (\alpha)$.
````

The vector $\mathrm{P}(\vec{v})=\frac{\vec{v} \cdot \vec{w}}{|\vec{w}|^2} \vec{w}$ is called the projection of $\vec{v}$ onto $\vec{w}$. The scalar projection $\frac{\vec{v} \cdot \vec{w}}{|\vec{w}|}$ is plus or minus the length of the projection of $\vec{v}$ onto $\vec{w}$. The vector $\vec{b}=\vec{v}-P(\vec{v})$ is a vector orthogonal to $\vec{w}$.

````{prf:definition} cross product
:label: cross_product
The cross product of two vectors $\vec{v}=\left\langle v_1, v_2\right\rangle$ and $\vec{w}=\left\langle w_1, w_2\right\rangle$ in the plane is the scalar $v_1 w_2-v_2 w_1=\operatorname{det}\left[\begin{array}{cc}v_1 & v_2 \\ w_1 & w_2\end{array}\right]$

The cross product of two vectors $\vec{v}=\left\langle v_1, v_2, v_3\right\rangle$ and $\vec{w}=\left\langle w_1, w_2, w_3\right\rangle$ in space is defined as the vector

$$
\vec{v} \times \vec{w}=\left\langle v_2 w_3-v_3 w_2, v_3 w_1-v_1 w_3, v_1 w_2-v_2 w_1\right\rangle .
$$
````

- The cross product $\vec{v} \times \vec{w}$ is anti-commutative. The resulting vector is orthogonal to both $\vec{v}$ and $\vec{w}$.
- $|\vec{v} \times \vec{w}|=|\vec{v}||\vec{w}| \sin (\alpha)$
- The absolute value respectively length $|\vec{v} \times \vec{w}|$ defines the area of the parallelogram spanned by $\vec{v}$ and $\vec{w}$

## Lines and planes
```{note}
A line through two points $\vec{v}$ and $\vec{w}$ is $
L=\{\vec{v}+t(\vec{v}-\vec{w}) | t \in \mathbb{R}\}$.
```


```{code-cell} python
:tags: ["hide-input"]
import numpy as np
import matplotlib.pyplot as plt

v = [2,4]
w = [4,2]

array = np.array([[0, 0, v[0], v[1]],[0, 0, w[0], w[1]]])

X, Y, V, W = zip(*array)
plt.figure()
plt.ylabel('Y-axis')
plt.xlabel('X-axis')
ax = plt.gca()
ax.annotate(f'v({v[0]},{v[1]})', (v[0],v[1]),fontsize=14)
plt.plot([-2,2],[2,-2],c='green')
plt.plot([5,1],[1,5],c='green')
plt.arrow(0,-10,0,19.5, width = 0.02, head_width=0.5)
plt.arrow(-10,0,19.5,0, width = 0.02, head_width=0.5)
ax.annotate(f'w({w[0]},{w[1]})', (w[0],w[1]),fontsize=14)
ax.quiver(X, Y, V, W, angles='xy', scale_units='xy',color=['r','b'],scale=1)

ax.set_xlim([-10, 10])
ax.set_ylim([-10, 10])

plt.grid()
plt.draw()
plt.show()
```


```{note}
Three points $\vec{v_1}$, $\vec{v_2}$, and $\vec{v_3}$ define a plane $\Sigma=\{\vec{v_1}+t\vec{v}+s\vec{w}$ | $t,s\in\mathbb{R}\}$.
```

## Curves
A parametrization of a planar curve is a map $\vec{r}(t)=\langle x(t), y(t)\rangle$ from a parameter interval $t\in[a, b]$ to the plane. The functions $x(t)$ and $y(t)$ are called coordinate functions. The image of the parametrization is called a **parametrized curve** in the plane. The parametrization of a space curve is $\vec{r}(t)=\langle x(t), y(t), z(t)\rangle$. The image of $\vec{r}$ is a parametrized curve in space.

````{prf:definition} velocity
:label: velocity
The velocity of a parameterized curve $\vec{r}(t)=\langle x(t), y(t), z(t)\rangle$ at time $t$ is the tangent vector (or derivative) $\vec{r}^{\prime}(t)=\left\langle x^{\prime}(t), y^{\prime}(t), z^{\prime}(t)\right\rangle=\langle\dot{x}, \dot{y}, \dot{z}\rangle$ of the curve $\vec{r}$ at $t$. 
````

The length $\|\vec{r}^{\prime}(t)\|$ of velocity is called **speed** and $\vec{r}^{\prime} /|\vec{v}^{\prime}|$ is called **direction** of motion. The vector $\vec{r}^{\prime \prime}(t)$ is called the **acceleration**. The third derivative $\vec{r}^{\prime \prime \prime}$ is called the **jerk**.

````{prf:definition} tangent vector
:label: tangent_vector
Any vector parallel to $\vec{r}^{\prime}(t)$ is called tangent to the curve at $\vec{r}(t)$
````

```{code-cell} python
:tags: ["hide-input"]
import numpy as np
import matplotlib.pyplot as plt
import math

t = np.linspace(0,2*math.pi,100)
t1 = np.linspace(0,2*math.pi,10)
x = np.cos(t)
y = np.sin(t)

plt.figure()
plt.ylabel('Y-axis')
plt.xlabel('X-axis')
ax = plt.gca()

plt.plot(x,y,c='blue')
plt.quiver(np.cos(t1),np.sin(t1),-np.sin(t1),np.cos(t1))

plt.arrow(0,-2,0,3.95, width = 0.02, head_width=0.1)
plt.arrow(-2,0,3.95,0, width = 0.02, head_width=0.1)
ax.set_xlim([-2, 2])
ax.set_ylim([-2, 2])

plt.grid()
plt.draw()
plt.show()
```

## Curvature
The curvature measures how fast a curve is changing direction at a given point.

````{prf:definition} arc length
:label: arc_length
Let $\vec{r}(t)$ be a parameterized curve with velocity $\vec{r}^{\prime}(t)$ and speed $\|\vec{r}^{\prime}(t)\|$. The arc length of the curve is given by 

$$L=\int_a^b\|\vec{r}^{\prime}(t)\| d t$$

````

````{prf:example}
In $\mathbb{R}^3$, the arc length is $L=\int_a^b \sqrt{x^{\prime}(t)^2+y^{\prime}(t)^2+z^{\prime}(t)^2} dt$.
````

````{prf:definition} curvature
:label: curvature
Let $\vec{T}(t)=\frac{\vec{r}^{\prime}(t)}{\| \vec{r}^{\prime}(t)\|}$ be the unit tangent vector. The curvature of a curve at the point $\vec{r}(t)$ is defined as 

$$\kappa(t)=\left\|\frac{d\vec{T}}{ds} \right\| = \frac{\|\vec{T}^{\prime}(t)\|}{\|\vec{r}^{\prime}(t)\|}$$

where $s$ is the arc length.
````

- The curvature does not depend on the parametrization
- $\kappa=\frac{\left\|\vec{r}^{\prime}(t) \times \vec{r}^{\prime \prime}(t)\right\|}{\left\|\vec{r}^{\prime}(t)\right\|^3}$
- The distance from the vertex to the center of curvature is known as the radius of curvature $R=1/\kappa$

In general, the absolute curvature of a curve is the reciprocal of the radius of the best-fitting circle to $\gamma$. If $\gamma$ is a curve parametrized and begins at some point $p_0$ with initial tangent vector $T_0$, and that $\gamma$ has curvature function $\kappa(s)$, then we can reproduce the curve $\gamma$. Thus, the combination of a set of initial conditions and the local information of the curvature at each point of a curve is enough to recover the curve itself, a global object.

````{prf:example}
Find the curvature for $\vec{r}(t)=\langle t, 3 \sin t, 3 \cos t\rangle$


We first find the tangent vector $\vec{r}^{\prime}(t)=\langle 1,3 \cos t,-3 \sin t\rangle$ and the unit tangent vector 
$\vec{T}(t)=\left\langle\frac{1}{\sqrt{10}}, \frac{3}{\sqrt{10}} \cos t,-\frac{3}{\sqrt{10}} \sin t\right\rangle$. The derivative of the unit tangent vector is given by

$$
\vec{T}^{\prime}(t)=\left\langle 0,-\frac{3}{\sqrt{10}} \sin t,-\frac{3}{\sqrt{10}} \cos t\right\rangle
$$
The magnitudes of the two vectors are,

$$
\begin{aligned}
\left\|\vec{r}^{\prime}(t)\right\| & =\sqrt{1+9 \cos ^2 t+9 \sin ^2 t}=\sqrt{10} \\
\left\|\vec{T}^{\prime}(t)\right\| & =\sqrt{0+\frac{9}{10} \sin ^2 t+\frac{9}{10} \cos ^2 t}=\sqrt{\frac{9}{10}}=\frac{3}{\sqrt{10}}
\end{aligned}
$$

We find the curvature

$$
\kappa=\frac{\left\|\vec{T}^{\prime}(t)\right\|}{\left\|\vec{r}^{\prime}(t)\right\|}=\frac{{ }^3 / \sqrt{10}}{\sqrt{10}}=\frac{3}{10}
$$

Alternatively, $\left\|\vec{r}^{\prime}(t)\right\|^3= 10\sqrt{10}$ and $\vec{r}^{\prime \prime}(t) = \langle 0, -3sin(t), -3cos(t)\rangle$. Thus, $\kappa=\frac{\left\|\vec{r}^{\prime}(t) \times \vec{r}^{\prime \prime}(t)\right\|}{\left\|\vec{r}^{\prime}(t)\right\|^3} = \frac{3\sqrt{10}}{10\sqrt{10}}=\frac{3}{10}$.

The curvature of the curve (a helix) is constant.
````

```{code-cell} python
:tags: ["hide-input"]
import numpy as np
import matplotlib.pyplot as plt

ax = plt.axes(projection='3d')

# Data for a three-dimensional line
t = np.linspace(0, 15, 1000)

xline = t
yline = 3*np.sin(t)
zline = 3*np.cos(t)
ax.plot3D(xline, yline, zline, 'gray')
```



````{prf:definition} normal vector
:label: normal_vector
Let $\vec{r}(t)$ be a parameterized curve with nonzero speed at $t$. Let $T$ be the unit tangent vector. The normal vector is defined by

$$
\vec{N}(t)=\frac{\vec{T}^{\prime}(t)}{\|\vec{T}^{\prime}(t)\|}$$
````
````{prf:definition} binormal vector
:label: binormal_vector
The binormal vector is defined by $\vec{B}(t)=\vec{T}(t) \times \vec{N}(t)$. 
````


```{code-cell} python
:tags: ["hide-input"]
import numpy as np
import matplotlib.pyplot as plt

ax = plt.axes(projection='3d')

# Data for a three-dimensional line
t = np.linspace(0, 15, 1000)

xline = t-(t-2)
yline = np.sin(t)
zline = np.cos(t)
ax.plot3D(xline, yline, zline, 'gray')

tangent = [0, np.cos(5), -np.sin(5)]
tangent = tangent/np.linalg.norm(tangent)
normal =  [0, -np.sin(5), -np.cos(5)]
normal = normal/np.linalg.norm(normal)
binormal = np.cross(tangent, normal)

ax.plot3D([2,2+tangent[0]],[np.sin(5), np.sin(5)+tangent[1]],[np.cos(5), np.cos(5)+tangent[2]],'blue')
ax.plot3D([2,2-normal[0]],[np.sin(5), np.sin(5)-normal[1]],[np.cos(5), np.cos(5)-normal[2]],'red')
ax.plot3D([2,2-binormal[0]],[np.sin(5), np.sin(5)-binormal[1]],[np.cos(5), np.cos(5)-binormal[2]],'green')

```


The plane spanned by $\vec{N}$ and $\vec{B}$ is called the normal plane. It is perpendicular to the curve. The plane spanned by the tagent vector $\vec{T}$ and the normal vector $\vec{N}$ is called the osculating plane.

- The three vectors $(\vec{T}(t), \vec{N}(t), \vec{B}(t))$ are unit vectors orthogonal to each other.



## Torsion

The torsion of a space curve is the rate of change of the curve's osculating plane. It is also called the "second curvature". The torsion $\tau$ is positive for a right-handed curve, and negative for a left-handed curve. 



````{prf:definition} torsion
:label: torsion

The torsion of a parameterized curve $\lambda(t)$ is defined by $
\tau := -\vec{N}(t) \cdot \vec{B}^{\prime}(t)$
````
- The quantity $\sigma = 1/\tau$ is called the radius of torsion.
- A curve with curvature $\kappa \neq 0$ is planar if $\tau=0$.

## Polar and spherical coordinates

A point $(x, y)$ in the plane has the polar coordinates $r=\sqrt{x^2+y^2}, \theta=\operatorname{arctg}(y / x)$. We have the relation $(x, y)=(r \cos (\theta), r \sin (\theta))$.

Spherical coordinates use the distance $\rho$ to the origin as well as two angles $\theta$ and $\phi$. The first angle $\theta$ is the polar angle in polar coordinates of the $x y$ coordinates and $\phi$ is the angle between the vector $\overrightarrow{O P}$ and the $z$-axis. The relation is
$$
(x, y, z)=(\rho \cos (\theta) \sin (\phi), \rho \sin (\theta) \sin (\phi), \rho \cos (\phi)) .
$$


## Parametrized surfaces
````{prf:definition} parameterized surface
:label: parameterized_surface
A parametrization of a surface is a vector-valued function

$$
\vec{r}(u, v)=\langle x(u, v), y(u, v), z(u, v)\rangle,
$$
where $x(u, v), y(u, v), z(u, v)$ are three functions of two variables.
````

Because two parameters $u$ and $v$ are involved, the map $\vec{r}$ from the plane to space is also called
$uv$-map. A parametrized surface is the image of the $uv$-map. The domain of the $uv$-map is called the parameter domain.
