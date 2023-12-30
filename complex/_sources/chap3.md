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

# Chapter 3: Differentiation

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Continuous function Wikipedia](https://en.wikipedia.org/wiki/Continuous_function)
- [Continuous function on Youtube](https://www.youtube.com/watch?v=joewRl1CTL8)
```

````{prf:definition} continuous function


````

## Limit
````{prf:definition}
Suppose $f : G \rightarrow \mathbb{C}$ is a complex function and $z_0$ is an accumulation point of $G\subseteq \mathbb{C}$. If $w_0\in \mathbb{C}$ is a complex number such that for every $\epsilon > 0$ we can find $\delta > 0$ so that, for all $z \in G$ satisfying $|z - z_0| < \delta$, we have $|f(z)- w_0| < \epsilon$, then $w_0$ is the limit of $f$ as $z$ approaches $z_0$, i.e.,

$$\lim_{z\rightarrow z_0} f(z) = w_0$$

````

The definition idicates that $f(z)$ approaches $w_0$ as $z$ approaches $z_0$. However, this convergence is independent of the direction in which $z$ approaches $z_0$ in the two-dimensional space.

````{prf:theorem}
Let $f$ and $g$ be complex functions with domain $G\subseteq \mathbb{C}$, let $z_0$ be an accumulation point of $G$, and let $c\in \mathbb{C}$. If $\lim_{z\rightarrow z_0} f(z)$ and $\lim_{z\rightarrow z_0} g(z)$ exist, then

1. $\lim_{z\rightarrow z_0}( f (z) + c g(z)) = \lim_{z\rightarrow z_0} f (z) + c \lim_{z\rightarrow z_0}g(z)$
2. $\lim_{z\rightarrow z_0}( f(z)g(z)) = \lim_{z\rightarrow z_0}f(z)\lim_{z\rightarrow z_0}g(z)$
3. $\lim_{z\rightarrow z_0}\frac{f(z)}{g(z)} = \frac{\lim_{z\rightarrow z_0}f (z) }{\lim_{z\rightarrow z_0} g(z)}$ if $\lim_{z\rightarrow z_0} g(z) \ne 0$.
````

## Continuity
````{prf:definition}
Suppose $f : G \rightarrow \mathbb{C}$ and $z_0 \in G$ where $G\subseteq \mathbb{C}$. Then $f$ is continuous at $z_0$ if, for every positive real number $\epsilon>0$ there is a positive real number $\delta$ so that $|f(z) - f(z_0)| < \epsilon$ for all $z \rightarrow G$ satisfying $|z-z_0| < \delta$.
````
More generally, $f$ is continuous on $E\subseteq G$ if $f$ is continuous at every
$z \in E$.

## Derivative
````{prf:definition} Complex derivative
Suppose $f : G \rightarrow \mathbb{C}$ is a complex function and $z_0$ is an interior point of $G$. The
derivative of $f$ at $z_0$ is defined as

$$f'(z_0) = \lim_{z\rightarrow z_0} \frac{f(z) − f(z_0)}{z−z_0}$$

In this case, $f$ is called **differentiable** at $z_0$.
````

All the elementary properties of derivatives that we know from the theory of a real function of one variable continue to hold, with essentially the same proofs. We collect some such properties in the next theorem. Suppose that $f$ is differentiable at $a$. Then

1.	$f$ is continuous at $a$.
2.	$cf$ is differentiable at $a$ with derivative $cf'(a)$ for any constant $c\in \mathbb{C}$.
3.	If $g$ is differentiable at $a$, then so is $f + g$, $fg$ and, if $g(a) \ne 0$,
$f/g$ and $(f + g)'(a) = f'(a) + g'(a)$, $(fg)'(a) = f'(a)g(a) + f(a)g'(a)$,  $(f/g)'(a) = (f'(a)g(a) − f(a)g'(a))/g(a)^2$
4.	If $g$ is differentiable at $f(a)$, then $g\circ  f$ is differentiable at $a$
and the chain rule $(g\circ  f )'(a) = g'(f(a))f'(a)$ is valid.
5. If $f'(a) = 0$ and the inverse $f^{−1}$ is defined in a neighborhood of $f (a)$ and is continuous at $b = f (a)$, then the inverse is differentiable at $b$ and $(f^{−1})'(b)) = 1/f'(a)$.
6. Polynomials and rational functions are differentiable where they are defined (as functions in $\mathbb{C}$) and their derivatives are calculated in the same way as in the case of real polynomials and rational functions.

## Homomorphicity

If $f$ is differentiable for all points in an open disk centered at $z_0$ then $f$ is called **holomorphic** at $z_0$. The function $f$ is holomorphic on the open set $E\subset G$ if it is differentiable at every point in $E$. 

Functions that are holomorphic in the whole complex plane $\mathbb{C}$ are called **entire**.

The set of functions which are holomorphic in $\Omega\subseteq \mathbb{C}$ is often denoted $H(\Omega)$.

We will use **region** to denote an open, connected subset of the complex plane.

````{prf:theorem}
Suppose $f$ is homomorphic in a region $\Omega$ and that $f'(z) = 0$ for all $z \in \Omega$. Then $f$ is constant in $\Omega$.
````

````{prf:theorem} Conformal
Suppose $f$ is holomorphic at $a\in \mathbb{C}$ with $f'(a) \ne 0$ and suppose $\gamma_1$ and $\gamma_2$ are two
smooth paths that pass through the point $a$, making an angle of $\psi$ with each other. Then $f$ transforms $\gamma_1$ and $\gamma_2$ into smooth paths which meet at $f(a)$, and the transformed paths make an angle of $\psi$  with each other.

Proof: Let $\gamma_1(t)$ and $\gamma_2(t)$ be parameterizations of two path such that $\gamma_1(0)=a$ and $\gamma_2(0)=a$. The tangent vector of the path $\gamma_1$ at the point $a$ is $\gamma_1'(0)$, while the tagent vector of the path $\gamma_2$ at the point $a$ is $\gamma_2'(0)$. Moreover, the tangent vector of $f(\gamma_1)$ at the point $f(a)$ is $f'(\gamma_1(0))=f'(a)\gamma_1'(0)$, while the tangent vector of $f(\gamma_2)$ at the point $f(a)$ is $f'(\gamma_2(0))=f'(a)\gamma_2'(0)$. Two vectors $\gamma_1'(0)$ and $\gamma_1'(0)$ are dilated by the same factor $|f'(a)|$ and rotated by the same angle, i.e., an argument of $f'(a)$, which does not change the angle between the two vectors.
````

In words, a holomorphic function with nonzero derivative preserves angles. Functions that
preserve angles in this way are called conformal.


## The Cauchy–Riemann Equations

````{prf:theorem} Cauchy-Riemann equations
If $f$ is differentiable at $z_0 = x_0 + iy_0$, then the partial derivatives of $f$ exist
and satisfy $f_x(z_0) = if_y(z_0)$. Moreover, $f'(z_0) =f_x(z_0)$.

Proof: We first calculate the derivative along the real axis, i.e., for $w\in R$, $\frac{df(z)}{dz}=\frac{f(z+w)-f(z)}{w}=\frac{u(x+w,y)-u(x,y)}{w}+i\frac{v(x+w,y)-v(x,y)}{w}=u_x+iv_x$. We calculate the derivative along the imagine axis, i.e., for $w\in R$, $\frac{df(z)}{dz}=\frac{f(z+w)-f(z)}{iw}=\frac{u(x,y+w)-u(x,y)}{w}+i\frac{v(x,y+w)-v(x,y)}{w}=-iu_y+v_y$. Since two derivatives must be equal, i.e., $u_x+iv_x = v_y - iu_y$, we have $u_x = v_y$ and $u_y = -v_x$.
````

````{prf:theorem} 
If the partial derivatives of $f$ exist in an open disk centered at the point $z_0$ and are continuous at $z_0$ and satisfy $f_x(z_0) = if_y(z_0)$, then $f$ is differentiable at $z_0$. Moreover, $f'(z_0) =f_x(z_0)$.
````

We write $f(z) = f(x, y) = u(x, y) + iv(x, y)$ where $u$ is the real part of $f$ and $v$ is the
imaginary part. Then, using the usual shorthand $f_x = u_x + iv_x$ and $f_y = u_y + iv_y = u_y + iv_y$. The Cauchy-Riemann equations become $u_x=v_y$ and $u_y=-v_x$.

If $u$ and $v$ satisfy the Cauchy-Riemann equations and their second partials are also continuous, then
$u_{xx} = v_{yx} = v_{xy} = -u_{yy}$, that is 

$$u_{xx} + u_{yy} = 0$$

Functions with continuous second partials satisfying this partial differential equation on a region $G\subset \mathbb{C}$ (though not necessarily the Cauchy-Riemann equations) are called **harmonic** on $G$.

If $f$ is holomorphic in an open set $G$ then the partials of any order of $u$ and $v$ exist; hence the real and imaginary parts of a function that is holomorphic in an open set are harmonic on that set.

