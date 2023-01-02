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

# Derivative

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Derivative at Wikipedia](https://en.wikipedia.org/wiki/Derivative)
- [Derivative calculator](https://www.derivative-calculator.net/)
- [Youtube](https://en.wikipedia.org/wiki/Real_number) 
<iframe width="160" height="80" src="https://www.youtube.com/embed/5yfh5cf4-0w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

````{prf:definition} derivative
:label: derivative
If $y=f(x)$ then the derivative is defined to be $f^{\prime}(x)=\lim _{h \rightarrow 0} \frac{f(x+h)-f(x)}{h}$.
````
The derivative $f^{\prime}(a)$ is the instantaneous rate of change of $y=f(x)$ at $x=a$. If $f(x)$ is the position of an object at  time $x$ then the derivate $f^{\prime}(a)$ is the velocity of the object at $x=a$. 

Geometrically, the derivate of $f(x)$ at $x=a$ is the slope of the tangent line of the graph $y=f(x)$ at $x=a$. The equation of the tangent line is given by 

$$y=f(a)+f^{\prime}(a)(x-a)$$

A function $f(x)$ is said to be differentiable at $x=a$ if the derivative $f^{\prime}(a)$ exists. If $f(x)$ is differentiable at any point in an open set $D\subset\mathbb{R}$, we say that $f(x)$ is differentiable on $D$.  

```{admonition} Notation
If $y=f(x)$, then all of the following are equivalent notations for the derivative. $f^{\prime}(x)=y^{\prime}=\frac{d f}{d x}=\frac{d y}{d x}=\frac{d}{d x}(f(x))=D_xf$ 

If $y=f(x)$, then all of the following are equivalent notations for derivative evaluated at $x=a$. $f^{\prime}(a)=\left.y^{\prime}\right|_{x=a}=\left.\frac{d f}{d x}\right|_{x=a}=\left.\frac{d y}{d x}\right|_{x=a}=D_af$
```

## Properties
If $f$ is a constant function, then its derivative is equal to 0. Moreover, the derivate $D_af$ is a linear operator. Let $\Omega$ be the set of all functions differentiable at $x=a$. 

````{prf:theorem} linearity of derivative
Given $f,g\in\Omega$ and $c\in\mathbb{R}$, $D_a(f+g)=D_af+D_ag$ and $D_a(cf)=cD_af$.
````

- **The product rule**: $(f g)^{\prime}=f^{\prime} g+f g^{\prime}$
- **The quotient rule**: $\left(\frac{f}{g}\right)^{\prime}=\frac{f^{\prime} g-f g^{\prime}}{g^{2}}-$
- **The power rule**: $\frac{d}{d x}\left(x^{n}\right)=n x^{n-1}$
- **The chain rule**: $\frac{d}{d x}(f(g(x)))=f^{\prime}(g(x)) g^{\prime}(x)$

```{admonition} Common Derivatives
- $(x)^\prime=1$, $\left(a^{x}\right)^\prime=a^{x} \ln (a)$, $\left(e^x\right)^\prime=e^x$
- $(\ln x)^\prime=\frac{1}{x}$, $(\ln |x|)^\prime=\frac{1}{x}$, $\left(\log_{a}x\right)^\prime=\frac{1}{x \ln a}$ 
- $(\sin x)^\prime=\cos x$, $(\cos x)^\prime=-\sin x$, $\left(\sin ^{-1} x\right)^\prime=\frac{1}{\sqrt{1-x^{2}}}$, $\left(\cos ^{-1} x\right)^\prime=-\frac{1}{\sqrt{1-x^{2}}}$
- $(\tan x)^\prime=\sec ^{2} x$, $\left(\tan ^{-1} x\right)^\prime=\frac{1}{1+x^{2}}$
- $(\csc x)^\prime=-\csc x \cot x$, $(\cot x)^\prime=-\csc ^{2} x$, $(\sec x)^\prime=\sec x \tan x$
```
The derivative $f^\prime(a)$ characterizes the local behavior of the function $f(x)$ at $x=a$. If $f^{\prime}(x)>0$ for all $x$ in an interval $I$ then $f(x)$ is increasing on the interval $I$. If $f^{\prime}(x)<0$ for all $x$ in an interval $I$ then $f(x)$ is decreasing on the interval $I$. If $f^{\prime}(x)=0$ for all $x$ in an interval $I$ then $f(x)$ is constant on the interval $I$. 

````{prf:theorem} Mean Value Theorem
:label: mean_value
If $f(x)$ is continuous on the closed interval $[a, b]$ and differentiable on the open interval $(a, b)$ then there is a number $a<c<b$ such that $f^{\prime}(c)=\frac{f(b)-f(a)}{b-a}$.
````

````{prf:theorem} implicit function theorem
:label: implicit
Given a graph $f(x,y)=0$, we want to find the derivative of the inverse function $y^{\prime}(x)$ if it exists. 

$$df(x,y)=0 \Rightarrow f_xdx+f_ydy=0 \Rightarrow \frac{dy}{dx} = \frac{f_x}{f_y}$$

Thus, if $f_y\ne 0$, the derivative $y^\prime(x)$ exists and equals $y^\prime(x) = \frac{f_x}{f_y}$.
````


```{admonition} Example1
Given $\mathbf{e}^{2 x-9 y}+x^{3} y^{2}=\sin (y)+11 x$, we want to find $y^\prime(x)$. We first find two partial derivatives $
f_x = 11-2 \mathbf{e}^{2 x-9 y}-3 x^{2} y^{2}$ and $f_y = 2 x^{3} y-9 \mathbf{e}^{2 x-9 y}-\cos y$. Thus,

$$y^\prime = \frac{11-2 \mathbf{e}^{2 x-9 y}-3 x^{2} y^{2}}{2 x^{3} y-9 \mathbf{e}^{2 x-9 y}-\cos (y)}$$

```

## Higher Order Derivatives
````{prf:definition} second derivative
:label: second_derivative
The second derivative is defined as $f^{\prime \prime}(x)=\left(f^{\prime}(x)\right)^{\prime}$, i.e. the derivative of first derivative $f^{\prime}(x)$.
````

The $n^{th}$ derivative is denoted as $f^{(n)}(x)=\frac{d^{n} f}{d x^{n}}$ and is defined as $f^{(n)}(x)=\left(f^{(n-1)}(x)\right)^{\prime}$ i.e. the derivative of the $(n-1)^{\text {st }}$ derivative. 

### Concave and Convex

````{prf:definition} critical point
$x=c$ is a critical point of $f(x)$ if $f^{\prime}(c)=0$ or $f^{\prime}(c)$ doesn't exist. 
````

- If $f^{\prime \prime}(x)>0$ for all $x$ in an interval $I$ then $f(x)$ is **convex** on the interval $I$.
- If $f^{\prime \prime}(x)<0$ for all $x$ in an interval $I$ then $f(x)$ is **concave** on the interval $I$
- $x=c$ is a **inflection point** of $f(x)$ if the concavity changes at $x=c$. 

## Extrema

````{prf:definition} Absolute Extrema
$x=c$ is an absolute maximum of $f(x)$ if $f(c) \geq f(x)$ for all $x$ in the domain.
$x=c$ is an absolute minimum of $f(x)$ if $f(c) \leq f(x)$ for all $x$ in the domain.
````

````{prf:theorem} Fermat's Theorem
:label: Ferma
If $f(x)$ has a relative (or local) extrema at $x=c$, then $x=c$ is a critical point of $f(x)$.
````

````{prf:theorem} Extreme Value Theorem
:label: extreme_value
If $f(x)$ is continuous on the closed interval $[a, b]$ then there exist numbers $c$ and $d$ so that,
1. $a \leq c, d \leq b$
2. $f(c)$ is the abs. max. in $[a, b]$
3. $f(d)$ is the abs. min. in $[a, b]$
````

To find the absolute extrema of the continuous function $f(x)$ on the interval $[a, b]$ use the following process.
1. Find all critical points of $f(x)$ in $[a, b]$.
2. Evaluate $f(x)$ at all points found in Step 1 .
3. Evaluate $f(a)$ and $f(b)$.
4. Identify the max and min from the evaluations in steps $2 \& 3$.

````{prf:definition} Relative (local) Extrema
$x=c$ is a relative (or local) maximum of $f(x)$ if $f(c) \geq f(x)$ for all $x$ near $c$.
$x=c$ is a relative (or local) minimum of $f(x)$ if $f(c) \leq f(x)$ for all $x$ near $c$.
````

```{tip} 
**First derivative test**: If $x=c$ is a critical point of $f(x)$ then $x=c$ is
1. a rel. max. of $f(x)$ if $f^{\prime}(x)>0$ to the left of $x=c$ and $f^{\prime}(x)<0$ to the right of $x=c$.
2. a rel. min. of $f(x)$ if $f^{\prime}(x)<0$ to the left of $x=c$ and $f^{\prime}(x)>0$ to the right of $x=c$.
3. not a relative extrema of $f(x)$ if $f^{\prime}(x)$ is the same sign on both sides of $x=c$.

**Second derivative test**: If $x=c$ is a critical point of $f(x)$ such that $f^{\prime}(c)=0$ then $x=c$
1. is a relative maximum of $f(x)$ if $f^{\prime \prime}(c)<0$.
2. is a relative minimum of $f(x)$ if $f^{\prime \prime}(c)>0$.
3. may be a relative maximum, relative minimum, or neither if $f^{\prime \prime}(c)=0$.
```

## Applications
### Newton's Method
If $x_{n}$ is the $n^{\text {th }}$ guess for the root/solution of $f(x)=0$ then $(n+1)^{\text {st }}$ guess is $x_{n+1}=x_{n}-\frac{f\left(x_{n}\right)}{f^{\prime}\left(x_{n}\right)}$ provided $f^{\prime}\left(x_{n}\right)$ exists. 

### Related Rates
Sketch picture and identify known/unknown quantities. Write down equation relating quantities and differentiate with respect to $t$ using implicit differentiation (i.e. add on a derivative every time you differentiate a function of $t$ ). Plug in known quantities and solve for the unknown quantity.

````{prf:example} Example 1
Ex. A 15 foot ladder is resting against a wall. The bottom is initially $10 \mathrm{ft}$ away and is being pushed towards the wall at $\frac{1}{4} \mathrm{ft} / \mathrm{sec}$. How fast is the top moving after $12 \mathrm{sec}$ ?

![](https://cdn.mathpix.com/cropped/2022_02_21_e76cb09babe3c7e036d8g-06.jpg?height=143&width=244&top_left_y=350&top_left_x=243)

$x^{\prime}$ is negative because $x$ is decreasing. Using Pythagorean Theorem and differentiating, $x^{2}+y^{2}=15^{2} \Rightarrow 2 x x^{\prime}+2 y y^{\prime}=0$

After $12 \mathrm{sec}$ we have $x=10-12\left(\frac{1}{4}\right)=7$ and so $y=\sqrt{15^{2}-7^{2}}=\sqrt{176}$. Plug in and solve for $y^{\prime}$.
````

````{prf:example} Example 2
$7\left(-\frac{1}{4}\right)+\sqrt{176} y^{\prime}=0 \Rightarrow y^{\prime}=\frac{7}{4 \sqrt{176}} \mathrm{ft} / \mathrm{sec}$ Ex. Two people are $50 \mathrm{ft}$ apart when one starts walking north. The angle $\theta$ changes at $0.01 \mathrm{rad} / \mathrm{min}$. At what rate is the distance between them changing when $\theta=0.5$ rad?

![](https://cdn.mathpix.com/cropped/2022_02_21_e76cb09babe3c7e036d8g-06.jpg?height=140&width=371&top_left_y=335&top_left_x=720)

We have $\theta^{\prime}=0.01 \mathrm{rad} / \mathrm{min}$. and want to find $x^{\prime}$. We can use various trig fcns but easiest is,

$$
\sec \theta=\frac{x}{50} \Rightarrow \sec \theta \tan \theta \theta^{\prime}=\frac{x^{\prime}}{50}
$$

We know $\theta=0.5$ so plug in $\theta^{\prime}$ and solve.

$$
\sec (0.5) \tan (0.5)(0.01)=\frac{x^{\prime}}{50}
$$

$$
\begin{aligned}
& x^{\prime}=0.3112 \mathrm{ft} / \mathrm{min}
\end{aligned}
$$

Remember to have calculator in radians!
````

### Optimization

Sketch picture if needed, write down equation to be optimized and constraint. Solve constraint for one of the two variables and plug into first equation. Find critical points of equation in range of variables and verify that they are $\mathrm{min} / \mathrm{max}$ as needed.

![](https://cdn.mathpix.com/cropped/2022_02_21_e76cb09babe3c7e036d8g-06.jpg?height=624&width=1043&top_left_y=916&top_left_x=116)


