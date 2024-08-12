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

# Chapter 6: Differentiation

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Derivative](https://en.wikipedia.org/wiki/Derivative)
```


````{prf:definition} differentiable at a point
:label: def6.1
A real-valued function $f$ is defined on $[a,b]$. Define
$f'(x) = \lim_{t\to x} \frac{f(t)-f(x)}{t-x}$ for any $x\in [a,b]$ and
$a<t<b$ and $t\ne x$. We say that $f$ is differentiable at $x$ if the
limit exists.
````

## Properties
1. If $f$ is differentiable at $x$, then $f$ is continuous at $x$.
2. If $f$ and $g$ are differentiable, then $f+g$, $fg$, and $f/g$ are differentiable.
3. If $f$ is differentiable at $x$ and $g$ is differentiable at $f(x)$, then $g\circ f$ is differentiable at $x$.


## Inverse function theorem
````{prf:theorem} Inverse function theorem
:label: thm6.
Suppose $f : [a,b]\to [c,d]$ is continuous and invertible. If $x_0 \in
D(f)$ and $f'(x_0) \ne 0$ for some $x_0 \in (a,b)$, then $f(x_0) \in D(f^{-1})$ and $(f^{-1})'(f(x_0)) = \frac{1}{f'(x_0)}$.
````

## Mean value theorem
````{prf:theorem} mean value theorem
:label: thm6.1
If $f$ is a continuous real function on $[a,b]$ and
$f$ is differentiable in $(a,b)$, then there is a point $x\in (a,b)$
such that $f(b)-f(a)=f'(x)(b-a)$
````

````{prf:theorem} generalized mean value theorem
:label: thm6.2
If $f$ and $g$ are continuous real
functions on $[a,b]$ and are differentiable in $(a,b)$, then there is a
point $x\in (a,b)$ such that $[f(b)-f(a)]g'(x)=[g(b)-g(a)]f'(x)$
````

````{prf:theorem} generalized mean value theorem
:label: thm6.3
If $f$ is a real differentiable
function on $[a,b]$ and $f'(a)<c<f'(b)$, then there exists a
$x\in (a,b)$ such that $f'(x)=c$.
````

````{prf:theorem} L'Hospital's rule
:label: thm6.4
$f$ and $g$ are differentiable in $(a,b)$ and
$g'(x)\ne 0$ for all $x\in (a,b)$. If $f(x)\to 0$ and $g(x)\to 0$ as
$x\to a$ or $g(x)\to \infty$ as $x\to a$, then

$$\lim\limits_{x\to a}\frac{f(x)}{g(x)}=\lim\limits_{x\to a}\frac{f'(x)}{g'(x)}$$
````

````{prf:theorem} Taylor theorem
:label: thm6.5
$f$ is a real function on $[a,b]$, $n$ is a positive
integer, $f^{n-1}$ is continuous on $[a,b]$, $f^n$ exists on $[a,b]$.
Then, there exists a point $\beta$ between $x$ and $\alpha$ such that

$$f(x)=\sum_{k=0}^{n-1} \frac{f^k(a)}{k!}(x-a)^k+ \frac{f^n(\beta)}{n!}(x-a)^n$$
````

