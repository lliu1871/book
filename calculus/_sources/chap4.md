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

# Chapter 4: Integral

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Integral at Wikipedia](https://en.wikipedia.org/wiki/Integral)
- [Youtube](https://www.youtube.com/watch?v=__Uw1SXPW7s) 
```

````{prf:definition} integral
:nonumber:
:label: integral
Suppose $f(x)$ is continuous on $[a, b]$. Divide $[a, b]$ into $n$ subintervals of width $\Delta x$ and choose $x_{i}^{*}$ from each interval. Then 

$$\int_{a}^{b} f(x) d x=\lim _{n \rightarrow \infty} \sum_{i=1}^{n} f\left(x_{i}^{*}\right) \Delta x$$ 

If the limit exist, the function $f(x)$ is said to be integrable.
````

## Properties
It follows from the definition that $\int_{a}^{a} f(x) d x=0$, $\int_{a}^{b} c d x=c(b-a)$, $\int_{a}^{b} f(x) d x=-\int_{b}^{a} f(x) dx$, and 

$$\int_{a}^{b} f(x) d x=\int_{a}^{c} f(x) d x+\int_{c}^{b} f(x) dx$$(1)

Let $\Omega$ be a set of all integrable functions. Due to linearity of the limit operator, it is straightforward that integral is a linear operator, i.e., 

$$\int f(x) + g(x) d x=\int f(x) d x \pm \int g(x) d x$$(2)

and for a constant $c$,

$$\int c f(x) d x=c \int f(x) d x$$(3)

Additionally, if $f(x) \geq g(x)$ on $a \leq x \leq b$ then 

$$\int_{a}^{b} f(x) d x \geq \int_{a}^{b} g(x) d x$$(4)

It indicates the following inequalities
- If $f(x) \geq 0$ on $a \leq x \leq b$ then $\int_{a}^{b} f(x) d x \geq 0$
- $\left|\int_{a}^{b} f(x) d x\right| \leq \int_{a}^{b}|f(x)| dx$ 
- If $m \leq f(x) \leq M$ on $a \leq x \leq b$ then $m(b-a) \leq \int_{a}^{b} f(x) d x \leq M(b-a)$. 

```{admonition} Common Integrals 

- $\int k d x=k x+c$
- $\int \cos u d u=\sin u+c$
- $\int x^{n} d x=\frac{1}{n+1} x^{n+1}+c$
- $\int \sin u d u=-\cos u+c$
- $\int x^{-1} d x=\int \frac{1}{x} d x=\ln |x|+c$
- $\int \frac{1}{a x+b} d x=\frac{1}{a} \ln |a x+b|+c$
- $\int \sec u \tan u d u=\sec u+c$
- $\int \ln u d u=u \ln (u)-u+c$ 
- $\int \csc u \cot u d u=-\csc u+c$
- $\int \csc ^{2} u d u=-\cot u+c$
- $\int e^u du=e^u+c$
- $\int \tan u d u=\ln |\sec u|+c$
- $\int \sec u d u=\ln |\sec u+\tan u|+c$
- $\int \frac{1}{a^{2}+u^{2}} d u=\frac{1}{a} \tan ^{-1}\left(\frac{u}{a}\right)+c$
- $\int \frac{1}{\sqrt{a^{2}-u^{2}}} d u=\sin ^{-1}\left(\frac{u}{a}\right)+c$ 
```


## Fundamental Theorem of Calculus
````{prf:definition} anti-derivative
:nonumber:
:label: anti-derivative
A function $F(x)$ is said to be the anti-derivative of $f(x)$ if $F^{\prime}(x)=f(x)$. 
`````

It turns out that the integral operator (function) is an anti-derivative function, i.e., the integral operator is the inverse function of the derivative operator. 

````{prf:theorem} Fundamental Theorem of Calculus
:label: fundamental theorem of calculus

If $f(x)$ is continuous on $[a, b]$, then $g(x)=\int_{a}^{x} f(t) d t$ is differentiable in $(a, b)$,   

$$g^{\prime}(x)=\frac{d}{d x} \int_{a}^{x} f(t) d t=f(x)$$

and

$$\frac{d}{d x} \int_{a}^{v(x)} f(t) d t=v^{\prime}(x) f[v(x)]$$

Moreover, if $F(x)$ is an anti-derivative of $f(x)$, then 

$$\int_{a}^{b} f(x) d x=F(b)-F(a)$$

Variants of Part I: 

$$\frac{d}{d x} \int_{a}^{u(x)} f(t) d t=u^{\prime}(x) f[u(x)]$$

$$\int f(x) \pm g(x) d x=\int f(x) d x \pm \int g(x) d x $$

$$\frac{d}{d x} \int_{v(x)}^{u(x)} f(t) d t=u^{\prime}(x) f[u(x)]-v^{\prime}(x) f[v(x)]$$
````



## Integration Techniques

### Substitution
The substitution $u=g(x)$ will convert $\int_{a}^{b} f(g(x)) g^{\prime}(x) d x=\int_{g(a)}^{g(b)} f(u) d u$ using $d u=g^{\prime}(x) d x$.

````{prf:example} 4.1
:nonumber:
:label: substitution
Calculate $\int_{1}^{2} 5 x^{2} \cos \left(x^{3}\right) d x $

$$u=x^3 \Rightarrow d u=3 x^{2} d x \Rightarrow x^{2} d x=\frac{1}{3} d u$$
$$x=1 \Rightarrow u=1^{3}=1:: x=2 \Rightarrow u=2^{3}=8$$
$$\int_{1}^{2} 5 x^{2} \cos \left(x^{3}\right) d x=\int_{1}^{8} \frac{5}{3} \cos (u) d u$$
````

```{code-cell} python
:tags: ["hide-input"]

import matplotlib.pyplot as plt 
import numpy as np 
    
plt.rcParams["figure.figsize"] = [7.50, 3.50]
plt.rcParams["figure.autolayout"] = True

def f(x):
   return 5*(x**2)*np.cos(x**3)

x = np.linspace(1, 2, 100)

plt.plot(x, f(x), color='brown')
plt.title("plot f(x)")

plt.show()
```

### Integration by parts

$\int u d v=u v-\int v d u$ and $\int_{a}^{b} u d v=\left.u v\right|_{a} ^{b}-\int_{a}^{b} v d u$. Choose $u$ and $dv$ from integral and compute $du$ by differentiating $u$ and compute $v$ using $v=\int dv$.

````{prf:example} 4.2
:nonumber:
:label: ex4.2
calculate $\int xe^{-x} dx$

Let $u=x$ and $dv=e^{-x}$. Thus, $du=dx$ and $v=-e^{-x}$. Using integration by parts, we have

$$\int xe^{-x} d x=-x e^{-x}+\int e^{-x} d x=-xe^{-x}-e^{-x}+c$$
````

## Integration of trigonometry functions

```{important}
- $\sin (2 x)=2 \sin (x) \cos (x)$ 
- $\cos ^{2}(x)=\frac{1}{2}(1+\cos (2 x))$ 
- $\sin ^{2}(x)=\frac{1}{2}(1-\cos (2 x))$
```

For $\int \sin ^{n} x \cos ^{m} x d x$ we have the following: 
1. $n$ odd. Strip 1 sine out and convert rest to $\operatorname{cosines}$ using $\sin ^{2} x=1-\cos ^{2} x$, then use the substitution $u=\cos x$.
2. $m$ odd. Strip 1 cosine out and  $\cos ^{2} x=1-\sin ^{2} x$, then use the substitution $u=\sin x$.
3. $n$ and $m$ both odd. Use either 1 . or 2.  
4. $n$ and $m$ both even. Use double angle and/or half angle formulas to reduce the integral into a form that can be integrated

For $\int \tan ^{n} x \sec ^{m} x d x$ we have the following: 
1. $n$ odd. Strip 1 tangent and 1 secant out and convert rest to sines using $\tan ^{2} x=\sec ^{2} x-1$, then use the substitution $u=\sec x$.
2. $m$ even. Strip 2 secants out and convert rest to tangents using $\sec ^{2} x=1+\tan ^{2} x$, then use the substitution $u=\tan x$.
3. $n$ odd and $m$ even. Use either 1 . or 2 .
4. $n$ even and $m$ odd. Each integral will be . dealt with differently.

````{prf:example} 4.3
:label: ex4.3
:nonumber:
$$
\begin{aligned}
&\int \tan ^{3} x \sec ^{5} x d x=\int \tan ^{2} x \sec ^{4} x \tan x \sec x d x\\
&=\int\left(\sec ^{2} x-1\right) \sec ^{4} x \tan x \sec x d x\\
&=\int\left(u^{2}-1\right) u^{4} d u \quad(u=\sec x)\\
&=\frac{1}{7} \sec ^{7} x-\frac{1}{5} \sec ^{5} x+c\\
\end{aligned}
$$
````

````{prf:example} 4.4
:label: ex4.4
:nonumber:
$$
\begin{aligned}
\int \frac{\sin ^{5} x}{\cos ^{3} x} d x &=\int \frac{\sin ^{4} x \sin x}{\cos ^{3} x} d x=\int \frac{\left(\sin ^{2} x\right)^{2} \sin x}{\cos ^{3} x} d x \\
&=\int \frac{\left(1-\cos ^{2} x\right)^{2} \sin x}{\cos ^{3} x} d x \quad(u=\cos x) \\
&=-\int \frac{\left(1-u^{2}\right)^{2}}{u^{3}} d u=-\int \frac{1-2 u^{2}+u^{4}}{u^{3}} d u \\
&=\frac{1}{2} \sec ^{2} x+2 \ln |\cos x|-\frac{1}{2} \cos ^{2} x+c
\end{aligned}
$$
````

### Trigonometric Substitutions
If the integral contains the following root use the given substitution and formula to convert into an integral involving trigonometric functions.

| transform | fact |
| ----------- | ----------- |
|$\sqrt{a^{2}-b^{2} x^{2}} \Rightarrow x=\frac{a}{b} \sin \theta$ | $\cos ^{2} \theta=1-\sin ^{2} \theta$ |
|$\sqrt{b^{2} x^{2}-a^{2}} \Rightarrow x=\frac{a}{b} \sec \theta$ | $\tan ^{2} \theta=\sec ^{2} \theta-1$ |
|$\sqrt{a^{2}+b^{2} x^{2}} \Rightarrow x=\frac{a}{b} \tan \theta$ | $\sec ^{2} \theta=1+\tan ^{2} \theta$ |


````{prf:example} 4.5
:label: ex4.5
:nonumber:
calculate $\int \frac{16}{x^{2} \sqrt{4-9 x^{2}}} d x$

$x=\frac{2}{3} \sin \theta \Rightarrow d x=\frac{2}{3} \cos \theta d \theta $ and $\sqrt{4-9 x^{2}}=\sqrt{4-4 \sin ^{2} \theta}=\sqrt{4 \cos ^{2} \theta}=2|\cos \theta|$

Recall $\sqrt{x^{2}}=|x|$. Because we have an indefinite integral we'll assume positive and drop absolute value bars. If we had a definite integral we'd need to compute $\theta$ 's and remove absolute value bars based on that,

$$
|x|=\left\{\begin{array}{cc}
x & \text { if } x \geq 0 \\
-x & \text { if } x<0
\end{array}\right.
$$

In this case we have $\sqrt{4-9 x^{2}}=2 \cos \theta$.

$$
\begin{aligned}
\int \frac{16}{\frac{4}{9} \sin ^{2} \theta(2 \cos \theta)}\left(\frac{2}{3} \cos \theta\right) d \theta &=\int \frac{12}{\sin ^{2} \theta} d \theta \\
&=\int 12 \csc ^{2} d \theta \\
&= -12 \cot \theta+c
\end{aligned}
$$

Use Right Triangle Trig to go back to $x$'s. From substitution we have $\sin \theta=\frac{3 x}{2}$, from which we see that $\cot \theta= \frac{\sqrt{4-9 x^{2}}}{3x}$. So

$$\int \frac{16}{x^{2} \sqrt{4-9 x^{2}}} d x = -\frac{4\sqrt{4-9 x^{2}}}{x}+c$$

````

### Partial Fractions

If integrating $\int \frac{P(x)}{Q(x)} d x$ where the degree of $P(x)$ is smaller than the degree of $Q(x)$. Factor denominator as completely as possible and find the partial fraction decomposition of the rational expression. Integrate the partial fraction decomposition (P.F.D.). For each factor in the denominator we get term(s) in the decomposition according to the following table.

| Factor in $Q(x)$      | Term in P.F.D | Factor in $Q(x)$ | Term in P.F.D |
| ----------- | ----------- | ----------- | ----------- |
| $a x+b$ | $\frac{A}{a x+b}$ | $(a x+b)^{k}$ | $\frac{A_{1}}{a x+b}+\frac{A_{2}}{(a x+b)^{2}}+\cdots+\frac{A_{k}}{(a x+b)^{k}}$ |
| $a x^{2}+b x+c$ | $\frac{A x+B}{a x^{2}+b x+c}$ | $\left(a x^{2}+b x+c\right)^{k}$ | $\frac{A_{1} x+B_{1}}{a x^{2}+b x+c}+\cdots+\frac{A_{k} x+B_{k}}{\left(a x^{2}+b x+c\right)^{k}}$ |


````{prf:example} 4.6
:label: ex4.6
:nonumber:

$$
\begin{aligned}
\int \frac{7 x^{2}+13 x}{(x-1)\left(x^{2}+4\right)}
&=\int \frac{4}{x-1}+\frac{3 x+16}{x^{2}+4} d x\\
&=\int \frac{4}{x-1}+\frac{3 x}{x^{2}+4}+\frac{16}{x^{2}+4} d x\\ 
&=4\ln |x-1|+\frac{3}{2} \ln \left(x^{2}+4\right)+8 \tan ^{-1}\left(\frac{x}{2}\right)
\end{aligned}
$$

Here is partial fraction form and recombined. 

$$\int \frac{7 x^{2}+13 x}{(x-1)\left(x^{2}+4\right)} dx = \frac{A}{x-1}+\frac{B x+C}{x^{2}+4}=\frac{A\left(x^{2}+4\right)+(B x+C)(x-1)}{(x-1)\left(x^{2}+4\right)}$$ 

Set numerators equal and collect like terms 

$$7x^{2}+13x=(A+B)x^{2}+(C-B)x+4A-C$$

Set coefficients equal to get a system and solve to get constants. 

$$A+B=7, C-B=13, 4A-C=0, A=4, B=3, C=16$$

````
An alternate method that sometimes works to find constants. Start with setting numerators equal in previous example: $7 x^{2}+13 x=A\left(x^{2}+4\right)+(B x+C)(x-1)$. Chose nice values of $x$ and plug in. For example if $x=1$ we get $20=5 A$ which gives $A=4$. This won't always work easily.

## Improper Integral

````{prf:definition} improper integral
:nonumber:
:label: improper_integral
An improper integral is an integral with one or more infinite limits and/or discontinuous integrands. 
````
Integral is called **convergent** if the limit exists and has a finite value and **divergent** if the limit doesn't exist or has infinite value.

```{admonition} infinite limit
1. $\int_{a}^{\infty} f(x) d x=\lim _{t \rightarrow \infty} \int_{a}^{t} f(x) d x$
2. $\int_{-\infty}^{b} f(x) d x=\lim _{t \rightarrow-\infty} \int_{t}^{b} f(x) d x$
3. $\int_{-\infty}^{\infty} f(x) d x=\int_{-\infty}^{c} f(x) d x+\int_{c}^{\infty} f(x) d x$ provided both integrals are convergent.
```

```{admonition} Discontinuous Integrand
1. Discontinuity at $a: \int_{a}^{b} f(x) d x=\lim _{t \rightarrow a^{+}} \int_{t}^{b} f(x) d x$
2. Discontinuity at $b: \int_{a}^{b} f(x) d x=\lim _{t \rightarrow b^{-}} \int_{a}^{t} f(x) d x$
3. Discontinuity at $a<c<b: \int_{a}^{b} f(x) d x=\int_{a}^{c} f(x) d x+\int_{c}^{b} f(x) d x$ provided both are convergent.
```

If $f(x) \geq g(x) \geq 0$ on $[a, \infty)$ then,
1. If $\int_{a}^{\infty} f(x) d x$ converge, then $\int_{a}^{\infty} g(x) d x$ converge.
2. If $\int_{a}^{\infty} g(x) d x$ diverge, then $\int_{a}^{\infty} f(x) d x$ diverge.

```{tip}
If $a>0$ then $\int_{a}^{\infty} \frac{1}{x^{p}} d x$ converges if $p>1$ and diverges for $p \leq 1$.
```
## Approximating Definite Integrals

To approximate an integral $\int_{a}^{b} f(x) d x$, we find the width $\Delta x=\frac{b-a}{n}$ and divide the interval $[a, b]$ into $n$ subintervals $\left[x_{0}, x_{1}\right],\left[x_{1}, x_{2}\right], \ldots,\left[x_{n-1}, x_{n}\right]$ with $x_{0}=a$ and $x_{n}=b$.

**Midpoint Rule** : $\int_{a}^{b} f(x) d x \approx \Delta x\left[f\left(x_{1}^{*}\right)+f\left(x_{2}^{*}\right)+\cdots+f\left(x_{n}^{*}\right)\right], x_{i}^{*}$ is midpoint $\left[x_{i-1}, x_{i}\right]$

**Trapezoid Rule** : $\int_{a}^{b} f(x) d x \approx \frac{\Delta x}{2}\left[f\left(x_{0}\right)+2 f\left(x_{1}\right)++2 f\left(x_{2}\right)+\cdots+2 f\left(x_{n-1}\right)+f\left(x_{n}\right)\right]$

**Simpson's Rule (n is even)** : $\int_{a}^{b} f(x) d x \approx \frac{\Delta x}{3}\left[f\left(x_{0}\right)+4 f\left(x_{1}\right)+2 f\left(x_{2}\right)+\cdots+2 f\left(x_{n-2}\right)+4 f\left(x_{n-1}\right)+f\left(x_{n}\right)\right]$


