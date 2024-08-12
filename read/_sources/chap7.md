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

# Chapter 7: Riemann-Stieltjes Integral

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Integral](https://en.wikipedia.org/wiki/Integral)
```

````{prf:definition} Riemann integral
:label: def7.1
$\{x_1,...,x_n\}$ are points in the interval $[a,b]$ such that
$a=x_0\le x_1\le x_2...\le x_n=b$. Let $\Delta x_i = x_i - x_{i-1}$.
Suppose $f$ is a bounded real function on $[a,b]$. We define

$$M_i=\sup\limits_{x_{i-1}\le x\le x_i} f(x)\ \text{and} \ m_i=\inf\limits_{x_{i-1}\le x\le x_i} f(x),$$

$$U=\sum_{i=1}^n \bigg(M_i\Delta x_i\bigg) \ \text{and} \  L=\sum_{i=1}^n \bigg(m_i\Delta x_i\bigg),$$ 

and finally

$$\overline{\int_a^b} fdx=\inf U(P,f)$$

$$\underline{\int_a^b} fdx=\sup L(P,f)$$

The $\inf$ and $\sup$ are taken over all partitions. If the upper and
lower integrals are equal, we say that $f$ is Riemann integrable on
$[a,b]$ and write $\int_a^b fdx$.
````

````{prf:definition} Riemann-Stieltjes integral
:label: def7.2
Let $\alpha$ be a monotonically increasing
function on $[a,b]$. Corresponding each partition $P$ of $[a,b]$, we
write $\Delta \alpha_i = \alpha_i - \alpha_{i-1}$. For any function $f$
which is bounded on $[a,b]$, we define

$$U(P,f,\alpha)=\sum_{i=1}^{n} M_i\Delta \alpha_i.$$

$$L(P,f,\alpha)=\sum_{i=1}^{n} m_i \Delta \alpha_i.$$

Finally, we define

$$\overline{\int_a^b} fd\alpha=\inf U(P,f,\alpha)$$ 

$$\underline{\int_a^b} fd\alpha=\sup L(P,f,\alpha)$$

The $\inf$ and $\sup$ are taken over all partitions. If $\inf=\sup$, we
say that $f$ is integrable with respect to $\alpha$ and write
$f(x)\in R(\alpha)$.
````

Since $f$ is bounded, $L(P,f,\alpha)$ and $U(P,f,\alpha)$ are bounded
for every partition $P$. Thus, the lower integral $\sup L(P,f,\alpha)$
and the upper integral $\inf U(P,f,\alpha)$ are defined for every
bounded function $f$. The key question is their equality. Observe that the refinement of partitions $P$ will decrease $U(P,f,\alpha)$, increase $L(P,f,\alpha)$, decrease $M_i - m_i$. Thus, we have

$$L(P_1,f,\alpha)\le sup L(P,f,\alpha) \le \inf U(P,f,\alpha)\le U(P_2,f,\alpha)$$

Thus, $f(x)\in R(\alpha)$ on $[a,b]$ if and only if for every $\epsilon>0$ there exists a partition such that $U(p,f,\alpha)-L(p,f,\alpha) < \epsilon$.

## Properties
1. If $f$ is continuous on $[a,b]$, then $f$ is integrable on $[a,b]$.
2. If $f$ is monotonic on $[a,b]$ and if $\alpha$ is continuous on $[a,b]$, then $f$ is integrable.
3. If $f$ has only finitely many points of discontinuity on $[a,b]$ and
$\alpha$ is continuous at every point at which $f$ is discontinuous, then $f$ is integrable.
4. Suppose $f$ is integrable on $[a,b]$ and $m\le f\le M$. If $g$ is a
continuous function on $[m, M]$, then $g\circ f$ is integrable on
$[a,b]$.
5. If $f$ and $g$ are integrable on $[a,b]$, then $fg$ integrable on
    $[a,b]$.
6. If $f$ is integrable $[a,b]$, then $|f|$ is integrable $[a,b]$.

````{prf:theorem} integration and differentiation
:label: thm7.1
Suppose $f$ is integrable on $[a,b]$. For
$a\le x\le b$, define $F(x) = \int_a^x f(t)dt$. Then, $F(x)$ is
continuous on $[a,b]$. If $f$ is continuous at a point $x_0\in [a,b]$,
then $F$ is differentiable at $x_0$ and $F'(x_0) = f(x_0)$.
````

````{prf:theorem} Comparison Theorem
:label: thm7.2
Let $f, g \in I[a, b]$ so that $f(x) \le g(x)$
for all $x \in [a, b]$. Then 

$$
\int_a^b f(x) dx \le \int_a^b g(x) dx
$$

````

## The fundamental theorem of calculus
````{prf:theorem} The fundamental theorem of calculus
:label: thm7.5
If $f$ is integrable on $[a,b]$
and there is a differentiable function $F$ on $[a,b]$ such that $F'=f$,
then $\int_a^bf(x)dx = F(b)-F(a)$.
````

````{prf:theorem} Integration by parts
:label: thm7.6
$\int_a^bf(x)G(x)dx+\int_a^bF(x)g(x)dx = F(b)G(b)-F(a)G(a)$
````

