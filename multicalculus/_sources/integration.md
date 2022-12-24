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

# Integration

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Real number](https://www.britannica.com/science/real-number)
- [Real number](https://en.wikipedia.org/wiki/Real_number)
```
In univariable calculus, we can calculate the area under a function curve $f(x)$ by an integral $\int_xf(x)dx$. This idea can be generalized to high dimensional spaces where the volume can be calculated by an integral of a function $f(x_1,...,x_k)$ with respect to $(x_1,...,x_n)$. 

````{prf:example} 
:label: double_integral
The double integral is defined as the limit of the Riemann sum

$$
\iint_R f(x, y) dx dy = \lim_{n \rightarrow \infty}\left(\frac{1}{n^2} \sum_{(i/n, j/n) \in R} f(i/n, j/n)\right)
$$
````

````{prf:example}
:label: triple_integral
If $f(x, y, z)$ is a function of three variables and $E$ is a solid region in space, then the triple integral is defined as the limit of the Riemann sum

$$
\iiint_E f(x,y,z) dxdydz=\lim_{n \rightarrow \infty}\left(\frac{1}{n^3} \sum_{(i/n, j/n, k/n) \in E} f(i/n, j/n, k/n)\right)
$$
````

Alternatively, we can calculate the surface area of a subset of $\mathbb{R}^n$ using surface integrals

````{prf:definition} surface integral
:label: surface integral
A parameterized surface $\vec{r}(u, v)$ on a parameter domain $G\subset\mathbb{R}^2$ has the surface area

$$
\iint_G\left|\vec{r}_u(u, v) \times \vec{r}_v(u, v)\right| dudv
$$
````

Under certain conditions, the order of the high dimensional integral does not matter.
````{prf:theorem} Fubini's theorem
:label: Fubini_theorem
Fubini's theorem allows to switch the order of integration over a rectangle, if the function $f$ is continuous: 

$$\int_a^b \int_c^d f(x,y) dxdy=\int_c^d \int_a^b f(x,y) dydx$$
````

## Variable transformation
In many cases, it is easier to integrate in the polar system. We here consider the relationship between the Cartesian integration and the Polar integration.

````{prf:theorem} polar integral
:label: polar_integral
To integrate in polar coordinates, we evaluate the integral

$$
\iint_R f(x, y) dxdy = \iint_R f\left(r \cos (\theta), r \sin (\theta)\right) rdrd\theta
$$
````

## Continuity and Integrability


## Change of variable