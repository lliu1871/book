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

# Chapter 9: Special functions

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

## Power series
````{prf:definition}
:label: def9.1
$f$ is said to be a power series function if it has the form
$f(x)=\sum_{n=0}^\infty c_nx^n$.
````

````{prf:theorem}
:label: thm9.1
Suppose the series $\sum_{n=0}^\infty c_nx^n$ converges for $|x|<R$, and
define $f(x)=\sum_{n=0}^\infty c_nx^n$. Then $\sum_{n=0}^\infty c_nx^n$
converges uniformly on $[-R+\epsilon, R-\epsilon]$. The function $f$ is
continuous and differentiable on $(-R, R)$ and

$$f'(x)=\sum_{n=0}^\infty nc_nx^{n-1}.$$
````

````{prf:theorem}
:label: thm9.2
Suppose the series $\sum c_n$ converges and define
$f(x)=\sum_{n=0}^\infty c_nx^n$ for $-1<x<1$. Then,

$$\lim\limits_{x\to 1}\sum_{n=0}^\infty c_nx^n=\sum c_n$$
````

````{prf:theorem}
:label: thm9.3
Suppose $\sum_j |a_{ij}| = b_i$ and $\sum b_i$ converges. Then,
$\sum_i\sum_j a_{ij} = \sum_j\sum_i a_{ij}$.
````

## Fourier series
````{prf:definition}
:label: def9.2
A function of the form
$p(x)=\sum_{k=0}^n \alpha_k \cos kx + \beta_k \sin kx$ is called a
trigonometric polynomial.
````

- $p(x)$ is $2\pi$ periodic and closed under addition and multiplication by real numbers.
- $\int_{-\pi}^{\pi} \sin nx \cos mx dx=0$
- $\int_{-\pi}^{\pi} \sin nx \sin mx dx = 0$ or $\pi$
- $\int_{-\pi}^{\pi} \cos nx \cos mx dx = 0$ or $\pi$, or $2\pi$.
- $\alpha_n = \frac{1}{\pi}\int_{-\pi}^{\pi}p(x)\cos nx dx$
- $\beta_n = \frac{1}{\pi}\int_{-\pi}^{\pi}p(x)\sin nx dx$

````{prf:definition} Fourier series
:label: def9.3
Let $f$ be a $2\pi$-periodic function which is integrable on
$[-\pi, \pi]$. The Fourier series of $f$ is

$$\alpha_0/2+\sum_{n=1}^{\infty} \alpha_n \cos nx + \beta_n \sin nx$$

where the Fourier coefficients are given by

$$\alpha_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\cos nx dx$$ 

$$\beta_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\sin nx dx.$$
````

Under certain conditions, the Fourier series of $f$ converges to $f$.

````{prf:definition} Fourier transform
:label: def9.4
The Fourier transform of an integrable function $\hat{f}: \mathbb{R}\to \mathbb{C}$ is defined as

$$\hat{f}(\eta)=\int_{-\infty}^{\infty}f(x)e^{-2\pi i\eta x} dx$$ 

for any real number $\eta$, where $x$ often represents time and $\eta$ is
frequency.
````

Under certain conditions, $f(x)$ is determined by $\hat{f}(\eta)$ via
the inverse transform:

$$f(x)= \int_{-\infty}^{\infty}\hat{f}(\eta)e^{2\pi i\eta x} d\eta$$

