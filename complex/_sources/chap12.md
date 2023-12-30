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

# Chapter 12: The Gamma function

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
```

The gamma function $\Gamma(z)=\int_0^\infty t^{z-1}e^{-t}dt$ converges locally uniformly in $z$
for $Re (z) > 0$, since the absolute value of the integrand is $t^{x-1}e^{-t}$ if $z = x + iy$.

Integration by parts shows that the functional equation $\Gamma(z + 1) = z\Gamma(z)$
is valid for $Re (z) > 0$.

Since clearly $\Gamma(1) = 1$ it follows by induction that $\Gamma(n+1) = n!$ for natural numbers n, so one may view the gamma function as an extension of the factorial to non-natural numbers.

