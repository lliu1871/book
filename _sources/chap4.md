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

# Chapter 4: Integration

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
```

````{prf:definition} complex integral
Suppose $g$ is a smooth path parametrized by $g(t)$, $a\le t\le b$, and $f$ is a complex
function which is continuous on $g$. Then we define the integral of $f$ on $g$ as

$$\int_\gamma f= \int_\gamma f(z)dz := \int_a^bf(\gamma(t))\gamma'(t) dt$$
````

````{prf:definition} Length of a smooth curve
The length of a smooth path $\gamma$ is $l(\gamma) := \int_a^b|\gamma'(t)|dt$
for any parametrization $\gamma(t)$, $a\le t \le b$. Naturally, the length of a piecewise smooth path is the
sum of the lengths of its smooth components.
````

````{prf:theorem}
Suppose $\gamma$ is a piecewise smooth path, $f$ and $g$ are complex functions which are continuous
on $\gamma$, and $c\in \mathbb{C}$.

1. $\int_\gamma(f+cg) = \int_\gamma f + c\int_\gamma g$
2. If $\gamma$ is parametrized by $\gamma(t)$, $a\le t\le b$, we define the path $-\gamma$ by $-\gamma(t) := \gamma(a+b-t)$, $a\le t\le b$. Then $\int_{-\gamma} f = -\int_\gamma f$ .
3. $||$
````


## Antiderivative
````{prf:definition}
If $F$ is holomorphic in the region $G\subset\mathbb{C}$ and $F'(z) = f(z)$ for all $z \in G$, then $F$ is an antiderivative of $f$ on $G$, also known as a primitive of $f$ on $G$.
````

````{prf:definition}
Suppose $G\subset\mathbb{C}$ is a region and $\gamma\in G$ is a piecewise smooth path with parametrization
$\gamma(t), a\le t\le b$. If $f$ is continuous on $G$ and $F$ is any antiderivative of $f$ on $G$ then

$$\int_\gamma f = F(\gamma(b)) - F(\gamma(a))$$
````

Suppose $G$ is an open subset of $\mathbb{C}$, and $\gamma \subset G$ is a piecewise smooth closed path, and $f$ is continuous on G and has an antiderivative on $G$. Then $\int_{\gamma} f = 0$.

````{prf:theorem}
Suppose $G \subseteq \mathbb{C}$ is a region and $z_0 \in G$. Let $f : G \rightarrow \mathbb{C}$ be a continuous function such that $\int_{\gamma}f=0$ for any closed piecewise smooth path $\gamma \subset G$. Then the function $F : G \rightarrow \mathbb{C}$ defined by $F(z) := \int_{\gamma_z}f$
where $\gamma_z$ is any piecewise smooth path in $G$ from $z_0$ to $z$, is an antiderivative for $f$ on $G$.
````

## Cauchy theorem
````{prf:definition}
Suppose $\gamma_0$ and $\gamma_1$ are closed paths in the region $G\subset \mathbb{C}$, parametrized by $\gamma_0(t), 0\le t\le 1$, and $\gamma_1(t), 0\le t\le 1$, respectively. Then $\gamma_0$ is $G$-homotopic to $\gamma_1$ if there exists a continuous
function $h : [0, 1]^2\rightarrow G$ such that, for all $s, t \in [0, 1]$, $h(t, 0) = \gamma_0(t)$ , $h(t, 1) = \gamma_1(t)$, $h(0, s) = h(1, s)$. We use the notation $\gamma_1 \thicksim_G \gamma_2$ to mean $\gamma_1$ is G-homotopic to $\gamma_2$.
````

````{prf:theorem} Cauchy theorem
Suppose $G\subset \mathbb{C}$ is a region, $f$ is holomorphic in $G$, $\gamma_0$ and $\gamma_1$ are
piecewise smooth paths in $G$, and $\gamma_0 \thicksim_G \gamma_1$. Then

$$\int_{\gamma_0}f = \int_{\gamma_1}f$$
````

Let $G \subseteq \mathbb{C}$ be a region. If the closed path $\gamma$ is $G$-homotopic to a point (that is, a constant path) then $\gamma$ is **$G$-contractible**, and we write $\gamma \thicksim_G 0$

Suppose $G \subseteq \mathbb{C}$ is a region, $f$ is holomorphic in $G$, $\gamma$ is piecewise smooth, and $\gamma \thicksim_G 0$. Then $\int_{\gamma}f=0$.

## Cauchy integral formula
````{prf:theorem} Cauchy integral formula
If $f$ is holomorphic in an open set containing $D[w, R]$ then

$$f(w) = \frac{1}{2\pi i}\int_{C[w,R]} \frac{f(z)}{z-w}dz$$
````

A piecewise smooth simple closed path $\gamma$ is **positively oriented** if it is parametrized so
that its inside is on the left as our parametrization traverses $\gamma$. An example is a counter-clockwise
oriented circle.

````{prf:theorem}
Suppose $f$ is holomorphic in the region $G$ and $\gamma$ is a
positively oriented, simple, closed, piecewise smooth path, such that $w$ is inside $\gamma$ and $\gamma \thicksim_G 0$. Then

$$f(w) = \frac{1}{2\pi i}\int_{\gamma} \frac{f(z)}{z-w}dz$$
````

````{prf:theorem}
Suppose $f$ is holomorphic in the region $G$ and $\gamma$ is a positively oriented, simple, closed,
piecewise smooth, G-contractible path. If $w$ is inside $\gamma$ then

$$f'(w) = \frac{1}{2\pi i}\int_{C[w,R]} \frac{f(z)}{(z-w)^2}dz$$

Moreover, $f''(w)$ exists, and

$$f''(w) = \frac{1}{\pi i}\int_{C[w,R]} \frac{f(z)}{(z-w)^3}dz$$
````

If f is differentiable in a region G then f is infinitely differentiable in G, and all partials
of f with respect to x and y exist and are continuous.

````{prf:theorem} Morera theorem
Suppose $f$ is continuous in the region $G$ and $\int_\gamma f=0$ for all piecewise smooth closed paths $\gamma$ in $G$. Then $f$ is holomorphic in $G$.
````

````{prf:definition} Simply connected
A region $G\in \mathbb{C}$ is simply connected if $\gamma \thicksim_G 0$ for every closed path $\gamma$ in $G$.
````

````{prf:theorem}
Every holomorphic function on a simply-connected region $G\subset \mathbb{C}$ has an antiderivative
on $G$.
````

````{prf:theorem} Fundamental theorem of algebra
Every nonconstant polynomial has a root in $\mathbb{C}$.
````

````{prf:theorem}
Any bounded entire function is constant.
````
