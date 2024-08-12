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

# Chapter 16: Sobolev Spaces

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

For some purposes, particularly when studying partial di erential
equations, one wants to study functions which only have a derivative
in the weak sense. We look at spaces of such functions in this
chapter, and prove the important Sobolev inequalities.

## Weak derivatives
There are many criteria for smoothness of **mathematical function**s. The most basic criterion may be that of **continuous function|continuity**. A stronger notion of smoothness is that of **differentiability** (because functions that are differentiable are also continuous) and a yet stronger notion of smoothness is that the derivative also be continuous (these functions are said to be of class $C^1$ &mdash; see **Differentiability classes**). Differentiable functions are important in many areas, and in particular for **differential equation**s. In the twentieth century, however, it was observed that the space $C^1$ (or $C^2$, etc.) was not exactly the right space to study solutions of differential equations. The Sobolev spaces are the modern replacement for these spaces in which to look for solutions of partial differential equations.

Quantities or properties of the underlying model of the differential equation are usually expressed in terms of integral norms. A typical example is measuring the energy of a temperature or velocity distribution by an $L^2$-norm. It is therefore important to develop a tool for differentiating **$L^p$ space|Lebesgue space** functions.

The **integration by parts** formula yields that for every $u\in C^k(\Omega)$, where $k$ is a **natural number**, and for all infinitely differentiable functions with **compact support** $\varphi \in C_c^{\infty}(\Omega),$

$$\int_\Omega u\,D^{\alpha\!}\varphi\,dx=(-1)^{|\alpha|}\int_\Omega \varphi\, D^{\alpha\!} u\,dx,$$

where $\alpha$ is a **multi-index** of order $|\alpha|=k$ and we are using the notation:

$$D^{\alpha\!}f = \frac{\partial^{| \alpha |}\! f}{\partial x_{1}^{\alpha_{1}} \dots \partial x_{n}^{\alpha_{n}}}.$$

The left-hand side of this equation still makes sense if we only assume $u$ to be **locally integrable**. If there exists a locally integrable function $v$, such that

$$ 
\int_\Omega u\,D^{\alpha\!}\varphi\;dx=(-1)^{|\alpha|}\int_\Omega v\,\varphi  \;dx \qquad\text{for all }\varphi\in C_c^\infty(\Omega),$$

then we call $v$ the **weak derivative|weak $\alpha$-th partial derivative** of $u$. If there exists a weak $\alpha$-th partial derivative of $u$, then it is uniquely defined **almost everywhere**, and thus it is uniquely determined as an element of a **Lp space|Lebesgue space**. On the other hand, if $u\in C^k(\Omega)$, then the classical and the weak derivative coincide. Thus, if $v$ is a weak $\alpha$-th partial derivative of $u$, we may denote it by $D^\alpha u := v$.



## Sobolev inequalities

more will be here $f$