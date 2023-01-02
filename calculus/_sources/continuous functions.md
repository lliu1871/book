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

# Continuous functions

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Continuous function Wikipedia](https://en.wikipedia.org/wiki/Continuous_function)
- [Continuous function on Youtube](https://www.youtube.com/watch?v=joewRl1CTL8)
```
````{prf:definition} continuous function
:label: continuous_function
A function $f:D\rightarrow \mathbb{R}$ is continuous at $x_{0}\in D$ if for every $epsilon >0$, there exists a $\delta >0$ such that for all $x\in D$, 

$$|x-x_{0}|<\delta ~~{\text{ implies }}~~|f(x)-f(x_{0})|<\epsilon$$

If $f$ is continuous at all points in $D$, we say that $f$ is continuous on $D$.
````

## Construction of continuous functions
A list of continuous functions and the values of $x$ for which they are continuous.

1. Polynomials for all $x$.

7. $\cos (x)$ and $\sin (x)$ for all $x$.

2. Rational function, except for $x$ 's that give division by zero.

8. $\tan (x)$ and $\sec (x)$ provided $x \neq \cdots,-\frac{3 \pi}{2},-\frac{\pi}{2}, \frac{\pi}{2}, \frac{3 \pi}{2}, \cdots$

3. $\sqrt[n]{x}$ ( $n$ odd) for all $x$.

4. $\sqrt[n]{x}$ ( $n$ even) for all $x \geq 0$.

5. $\mathbf{e}^{x}$ for all $x$.

6. $\ln x$ for $x>0$.

9. $\cot (x)$ and $\csc (x)$ provided $x \neq \cdots,-2 \pi,-\pi, 0, \pi, 2 \pi, \cdots$

````{prf:theorem}
If two functions $f$ and $g$ are continous at $a\in \mathbb{R}$, then $f+g$, $f-g$, $fg$, and $f/g$ where $g(a)\ne 0$ are continuous at $a$. 
````

````{prf:theorem}
If $g$ is continuous at $a\in\mathbb{R}$ and $f$ is continuous at $g(a)$, then the composition $f\circ g$ is continuous at $a$.
````

## Properties


````{prf:theorem} Intermediate Value Theorem
Suppose that $f(x)$ is continuous on $[a, b]$ and let $M$ be any number between $f(a)$ and $f(b)$. Then there exists a number $c$ such that $a<c<b$ and $f(c)=M$. 
````


````{prf:theorem} Extreme value theorem
If a function $f: D\rightarrow \mathbb{R}$ is defined on a closed and bounded set $D\subset\mathbb{R}$ and is continuous on $D$, then the function attains its maximum and minimum. 
````