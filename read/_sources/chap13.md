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

# Chapter 13: *L*<sup>p</sup> Spaces

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

$L^p$ spaces are a class of mathematical function spaces widely used in the field of functional analysis, particularly in the study of functions and sequences. These spaces are denoted as $L^p(X)$, where $X$ is a measurable space and $p$ is a real number greater than or equal to 1.

The $L^p$ space consists of all measurable functions $f$ defined on $X$ for which the integral of the $p$-th power of the absolute value of $f$ is finite:

$$\|f\|=\left(\int_X|f(x)|^pdx\right)^{1/p}<\infty$$

Here, the integral is taken over the entire measurable space $X$. The space $L^p(X)$ includes various subspaces, such as $L^1(X)$ and $L^2(X)$, which are commonly used in mathematical analysis and applications like signal processing.

The concept of $L^p$ spaces is fundamental in functional analysis, and it provides a framework for understanding convergence, continuity, and various properties of functions and sequences.

## Norm
````{prf:definition} norm
:label: def13.1
Let $(X, \mathcal{A}, \mu)$ be a $\sigma$-finite measure space. For $1 \leq p<\infty$, define the $L^{p}$ norm of $f$ by

$$
\|f\|_{p}=\left(\int|f(x)|^{p} d \mu\right)^{1 / p}
$$

For $p=\infty$, define the $L^{\infty}$ norm of $f$ by

$$
\|f\|_{\infty}=\inf \{M \geq 0: \mu(\{x:|f(x)| \geq M\})=0\}
$$

If no such $M$ exists, then $\|f\|_{\infty}=\infty$. Thus the $L^{\infty}$ norm of a function $f$ is the smallest number $M$ such that $|f| \leq M$ a.e.
````

For $1 \leq p \leq \infty$ the space $L^{p}$ is the set $\left\{f:\|f\|_{p}<\infty\right\}$. One can also write $L^{p}(X)$ or $L^{p}(\mu)$ if one wants to emphasize the space or the measure. It is clear that $\|f\|_{p}=0$ if and only if $f=0$ a.e.

If $1<p<\infty$, we define $q$ by

$$
\frac{1}{p}+\frac{1}{q}=1
$$

and call $q$ the conjugate exponent of $p$. If $p=1$, set $q=\infty$, and if $p=\infty$, set $q=1$.

Basic to the study of $L^{p}$ spaces is Hölder's inequality (usually pronounced by English speakers as "Hel-der," although "Herl-der" is a closer approximation). ' Note that when $p=q=2$, this is the Cauchy-Schwarz inequality.

````{prf:theorem} Hölder's inequality
:label: thm13.1
If $1<p, q<\infty, p^{-1}+q^{-1}=1$, and $f$ and $g$ are measurable, then

$$
\int|f g| d \mu \leq\|f\|_{p}\|g\|_{q}
$$

This also holds if $p=\infty$ and $q=1$ or if $p=1$ and $q=\infty$.
````
````{prf:proof}
If $M=\|f\|_{\infty}$, then $|f| \leq M$ a.e. and $\int|f g| \leq M \int|g|$. The case $p=\infty$ and $q=1$ follows.

Now let us assume $1<p, q<\infty$. If $\|f\|_{p}=0$, then $f=0$ a.e. and $\int|f g|=0$, so the result is clear if $\|f\|_{p}=0$ and similarly if $\|g\|_{q}=0$. The result is immediate if $\|f\|_{p}$ or $\|g\|_{q}$ is infinite, so suppose not. Let $F(x)=|f(x)| /\|f\|_{p}$ and $G(x)=|g(x)| /\|g\|_{q}$. Note $\|F\|_{p}=1$ and $\|G\|_{q}=1$, and it suffices to show that $\int F G d \mu \leq 1$.

The second derivative of the function $e^{t}$ is again $e^{t}$, which is everywhere positive. Any function whose second derivative is everywhere non-negative is convex, so if $0 \leq \lambda \leq 1$, we have

$$
e^{\lambda a+(1-\lambda) b} \leq \lambda e^{a}+(1-\lambda) e^{b}
$$

for every pair of reals $a \leq b$. If $F(x), G(x) \neq 0$, let $a=p \log F(x)$, $b=q \log G(x), \lambda=1 / p$, and $1-\lambda=1 / q$. We then obtain from (15.3) that

$$
F(x) G(x) \leq \frac{F(x)^{p}}{p}+\frac{G(x)^{q}}{q}
$$

Clearly this inequality also holds if $F(x)=0$ or $G(x)=0$. Integrating,

$$
\int F G d \mu \leq \frac{\|F\|_{p}^{p}}{p}+\frac{\|G\|_{q}^{q}}{q}=\frac{1}{p}+\frac{1}{q}=1
$$

This completes the proof.
````

One application of Hölder's inequality is to prove Minkowski's inequality, which is simply the triangle inequality for $L^{p}$.

We first need the following lemma:

````{prf:lemma}
If $a, b \geq 0$ and $1 \leq p<\infty$, then

$$
(a+b)^{p} \leq 2^{p-1} a^{p}+2^{p-1} b^{p} .
$$
````

Proof. The case $a=0$ is obvious, so we assume $a>0$. Dividing both sides by $a^{p}$, letting $x=b / a$, and setting

$$
f(x)=2^{p-1}+2^{p-1} x^{p}-(1+x)^{p},
$$

the inequality we want to prove is equivalent to showing $f(x) \geq 0$ for $x \geq 0$. Note $f(0)>0, f(1)=0, \lim _{x \rightarrow \infty} f(x)=\infty$, and the only solution to $f^{\prime}(x)=0$ on $(0, \infty)$ is $x=1$. We conclude that $f$ takes its minimum at $x=1$ and hence $f(x) \geq 0$ for $x \geq 0$.

````{prf:theorem} Minkowski's inequality.
:label: thm13.2
If $1 \leq p \leq \infty$ and $f$ and $g$ are measurable, then

$$
\|f+g\|_{p} \leq\|f\|_{p}+\|g\|_{p}
$$
````
````{prf:proof}
Since $|(f+g)(x)| \leq|f(x)|+|g(x)|$, integrating gives the case when $p=1$. The case $p=\infty$ is also easy. Now let us suppose $1<p<\infty$. If $\|f\|_{p}$ or $\|g\|_{p}$ is infinite, the result is obvious, so we may assume both are finite. The inequality (15.4) with $a=|f(x)|$ and $b=|g(x)|$ yields, after an integration,

$$
\int|(f+g)(x)|^{p} d \mu \leq 2^{p-1} \int|f(x)|^{p} d \mu+2^{p-1} \int|g(x)|^{p} d \mu .
$$

We therefore have $\|f+g\|_{p}<\infty$. Clearly we may assume $\|f+g\|_{p}>$ 0 .

Now write

$$
|f+g|^{p} \leq|f||f+g|^{p-1}+|g||f+g|^{p-1}
$$

and apply Hölder's inequality with $q=\left(1-\frac{1}{p}\right)^{-1}$. We obtain

$$
\int|f+g|^{p} \leq\|f\|_{p}\left(\int|f+g|^{(p-1) q}\right)^{1 / q}+\|g\|_{p}\left(\int|f+g|^{(p-1) q}\right)^{1 / q} .
$$

Since $p^{-1}+q^{-1}=1$, then $(p-1) q=p$, so we have

$$
\|f+g\|_{p}^{p} \leq\left(\|f\|_{p}+\|g\|_{p}\right)\|f+g\|_{p}^{p / q}
$$

Dividing both sides by $\|f+g\|_{p}^{p / q}$ and using the fact that $p-(p / q)=$ 1 gives us our result.
````

Recall the definition of normed linear space from Chapter 1. We would like to say that by virtue of Minkowski's inequality, $L^{p}$ is a normed linear space. This is not quite right. The $L^{p}$ norm of a function satisfies all the properties of a norm except that $\|f\|_{p}=0$ does not imply that $f$ is the zero function, only that $f=0$ a.e. The procedure we follow to circumvent this is to say two functions are equivalent if they differ on a set of measure 0 . This is an equivalence relation for functions. We then define the space $L^{p}$ to be the set of equivalence classes with respect to this equivalence relation, and define $\|f\|_{p}$ to be the $L^{p}$ norm of any function in the same equivalence class as $f$. We then have that $\|\cdot\|_{p}$ is a norm on $L^{p}$. We henceforth keep this interpretation in the back of our minds when we talk about a function being in $L^{p}$; the understanding is that we identify functions that are equal a.e.

When $X$ is the positive integers and $\mu$ is counting measure, the space $L^{p}$ is called $\ell^{p}$. Thus if $x=\left\{x_{n}\right\}$ is a sequence, $\|x\|_{\ell^{p}}=$ $\left(\sum_{n=1}^{\infty}\left|x_{n}\right|^{p}\right)^{1 / p}$ if $1 \leq p<\infty$. For $p=\infty,\|x\|_{\ell \infty}=\sup _{n}\left|x_{n}\right| .$.

````{prf:definition}
:label: def13.2
$f_{n}$ converges to $f$ in $L^{p}$ if $\int\left|f_{n}-f\right|^{p} \rightarrow 0$ as $n \rightarrow \infty$. In terms of $L^{p}$ norms, this is equivalent to $\left\|f_{n}-f\right\|_{p}^{p} \rightarrow 0$ as $n \rightarrow \infty$.
````

````{prf:definition}
:label: def13.3
Given a real-valued measurable function $f$, the essential supremum and essential infimum are defined by

$$
\text { ess } \sup f=\inf \{M: \mu(\{x: f(x)>M\})=0\}
$$

and

$$
\text { ess inf } f=\sup \{m: \mu(\{x: f(x)<m\})=0\} \text {. }
$$
````

## Completeness
We show that the space $L^{p}$ viewed as a metric space is complete.

````{prf:theorem}
:label: thm13.3
If $1 \leq p \leq \infty$, then $L^{p}$ is complete.
````

Proof. We will do only the case $p<\infty$ and leave the case $p=\infty$ as Exercise 15.1.

Step 1. Suppose $f_{n}$ is a Cauchy sequence in $L^{p}$. Our first step is to find a certain subsequence. Given $\varepsilon=2^{-(j+1)}$, there exists $n_{j}$ such that if $n, m \geq n_{j}$, then $\left\|f_{n}-f_{m}\right\|_{p} \leq 2^{-(j+1)}$. Without loss of generality we may assume $n_{j} \geq n_{j-1}$ for each $j$.

Step 2. Set $n_{0}=0$ and define $f_{0}$ to be identically 0 . Our candidate for the limit function will be $\sum_{m}\left(f_{n_{m}}-f_{n_{m-1}}\right)$. In this step we show absolute convergence of this series.

Set $g_{j}(x)=\sum_{m=1}^{j}\left|f_{n_{m}}(x)-f_{n_{m-1}}(x)\right|$. Of course, $g_{j}(x)$ increases in $j$ for each $x$. Let $g(x)$, which might be infinite, be the limit. By Minkowski's inequality

$$
\begin{aligned}
\left\|g_{j}\right\|_{p} & \leq \sum_{m=1}^{j}\left\|f_{n_{m}}-f_{n_{m-1}}\right\|_{p} \\
& \leq\left\|f_{n_{1}}-f_{n_{0}}\right\|_{p}+\sum_{m=2}^{j} 2^{-m} \\
& \leq\left\|f_{n_{1}}\right\|_{p}+\frac{1}{2}
\end{aligned}
$$

By Fatou's lemma,

$$
\begin{aligned}
\int|g(x)|^{p} \mu(d x) & \leq \lim _{j \rightarrow \infty} \int\left|g_{j}(x)\right|^{p} \mu(d x) \\
& =\lim _{j \rightarrow \infty}\left\|g_{j}\right\|_{p}^{p} \\
& \leq\left(\frac{1}{2}+\left\|f_{n_{1}}\right\|_{p}\right)^{p}
\end{aligned}
$$

Hence $g$ is finite a.e. This proves the absolute convergence for almost every $x$.

Step 3. We define our function $f$. Set

$$
f(x)=\sum_{m=1}^{\infty}\left[f_{n_{m}}(x)-f_{n_{m-1}}(x)\right]
$$

We showed in Step 2 that this series is absolutely convergent for almost every $x$, so $f$ is well defined for a.e. $x$. Set $f(x)=0$ for any
$x$ where absolute convergence does not hold. We have

$$
f(x)=\lim _{K \rightarrow \infty} \sum_{m=1}^{K}\left[f_{n_{m}}(x)-f_{n_{m-1}}(x)\right]=\lim _{K \rightarrow \infty} f_{n_{K}}(x)
$$

since we have a telescoping series. By Fatou's lemma,

$$
\begin{aligned}
\left\|f-f_{n_{j}}\right\|_{p}^{p} & =\int\left|f-f_{n_{j}}\right|^{p} \leq \liminf _{K \rightarrow \infty} \int\left|f_{n_{K}}-f_{n_{j}}\right|^{p} \\
& =\liminf _{K \rightarrow \infty}\left\|f_{n_{K}}-f_{n_{j}}\right\|_{p}^{p} \leq 2^{-(j+1) p}
\end{aligned}
$$

Step 4. We have thus shown that $\left\|f-f_{n_{j}}\right\|_{p} \rightarrow 0$ as $j \rightarrow \infty$. It is standard that a Cauchy sequence with a convergent subsequence itself converges. Here is the proof in our case. Given $\varepsilon>0$, there exists $N$ such that $\left\|f_{n}-f_{m}\right\|_{p}<\varepsilon$ if $m, n \geq N$. In particular, $\left\|f_{n_{j}}-f_{m}\right\|_{p}<\varepsilon$ if $j$ is large enough. By Fatou's lemma,

$$
\left\|f-f_{m}\right\|_{p}^{p} \leq \liminf _{j \rightarrow \infty}\left\|f_{n_{j}}-f_{m}\right\|_{p}^{p} \leq \varepsilon^{p}
$$

if $m \geq N$. This shows that $f_{m}$ converges to $f$ in $L^{p}$ norm.


````{prf:theorem}
:label: thm13.4
The set of continuous functions with compact support is dense in $L^{p}(\mathbb{R})$ for $1 \leq p<\infty$.
````

Proof. Suppose $f \in L^{p}$. We have $\int\left|f-f \chi_{[-n, n]}\right|^{p} \rightarrow 0$ as $n \rightarrow \infty$ by the dominated convergence theorem, the dominating function being $|f|^{p}$. Hence it suffices to approximate functions in $L^{p}$ that have compact support. By writing $f=f^{+}-f^{-}$we may suppose $f \geq 0$. Consider simple functions $s_{m}$ increasing to $f$; then we have $\int\left|f-s_{m}\right|^{p} \rightarrow 0$ by the dominated convergence theorem, so it suffices to approximate simple functions with compact support. By linearity, it suffices to approximate characteristic functions with compact support. Given $E$, a Borel measurable set contained in a bounded interval, and $\varepsilon>0$, we showed in Theorem 8.4 that there exists $g$ continuous with compact support and with values in $[0,1]$ such that $\int\left|g-\chi_{E}\right|<\varepsilon$. Since $\left|g-\chi_{E}\right| \leq 1$, then $\int\left|g-\chi_{E}\right|^{p} \leq$ $\int\left|g-\chi_{E}\right|<\varepsilon$. This completes the proof.

The same proof shows the following corollary.

````{prf:corollary}
:label: cor13.1
The set of continuous functions on $[a, b]$ are dense in the space $L^{2}([a, b])$ with respect to the $L^{2}([a, b])$ norm.
````

## Convolutions
In this section only, all functions are defined on $\mathbb{R}^{n}$ and we are using Lebesgue measure on $\mathbb{R}^{n}$.

The convolution of two measurable functions $f$ and $g$ is defined by

$$
f * g(x)=\int f(x-y) g(y) d y
$$

provided the integral exists.

Let us address the measurability issues. Suppose $f$ and $g$ are both Borel measurable functions. If $a \in \mathbb{R}$, then $A=f^{-1}((a, \infty))$ is a Borel measurable subset of $\mathbb{R}$. The mapping $K: \mathbb{R}^{2} \rightarrow \mathbb{R}$ defined by $K(x, y)=x-y$ is Borel measurable. By Proposition 5.11 with $X=\mathbb{R}^{2}$ and $\mathcal{A}$ the Borel $\sigma$-algebra on $\mathbb{R}^{2}, K^{-1}(A)$ is in $\mathcal{A}$. Therefore

$$
(f \circ K)^{-1}((a, \infty))=K^{-1}\left(f^{-1}((a, \infty))\right)=K^{-1}(A)
$$

is a Borel subset of $\mathbb{R}^{2}$, and hence $f \circ K$ is Borel measurable. Thus, since $g$ is also Borel measurable, the integrand is jointly measurable. Using Theorem 11.3(3), we see that $f * g$ is a Borel measurable function of $x$.

By a change of variables, $f * g(x)$ is the same as $\int f(y) g(x-y) d y$, so $f * g=g * f$.

Proposition 15.7 (1) If $f, g \in L^{1}$, then $f * g$ is in $L^{1}$ and

$$
\|f * g\|_{1} \leq\|f\|_{1}\|g\|_{1} .
$$

(2) If $1<p \leq \infty, f \in L^{1}$, and $g \in L^{p}$, then

$$
\|f * g\|_{p} \leq\|f\|_{1}\|g\|_{p}
$$

Proof. (1) We have

$$
\int|f * g(x)| d x \leq \iint|f(x-y)||g(y)| d y d x
$$

Since the integrand on the right is non-negative, we can apply the Fubini theorem to see that the right hand side is equal to

$$
\begin{aligned}
\iint|f(x-y)| d x|g(y)| d y & =\iint|f(x)| d x|g(y)| d y \\
& =\|f\|_{1}\|g\|_{1}
\end{aligned}
$$

The first equality here follows by a change of variables (see Exercise 8.2). This together with (15.7) proves (15.5). From (15.5) we conclude that $f * g$ is finite a.e.

(2) The case $p=\infty$ is easy and left to the reader, so let us suppose $p<\infty$. Let $q$ be the conjugate exponent to $p$. By Hölder's inequality

$$
\begin{aligned}
\mid \int f(y) g(x & -y) d y \mid \\
& \leq \int|f(y)|^{\frac{1}{q}}|f(y)|^{1-\frac{1}{q}}|g(x-y)| d y \\
& \leq\left(\int|f(y)| d y\right)^{\frac{1}{q}}\left(\int|f(y)|^{p\left(1-\frac{1}{q}\right)}|g(x-y)|^{p} d y\right)^{\frac{1}{p}}
\end{aligned}
$$

Then, using the Fubini theorem,

$$
\begin{aligned}
\int|f * g(x)|^{p} d x & \leq \int\left(\int|f(y)| d y\right)^{\frac{p}{q}} \int|f(y)||g(x-y)|^{p} d y d x \\
& =\|f\|_{1}^{p / q}\|g\|_{p}^{p} \int|f(y)| d y \\
& =\|f\|_{1}^{1+\frac{p}{q}}\|g\|_{p}^{p} .
\end{aligned}
$$

Taking $p^{t h}$ roots gives our desired result.

One application of convolutions is to approximate functions in $L^{p}$ by smooth functions. This procedure is known by the name mollification.

Let $\varphi: \mathbb{R}^{n} \rightarrow \mathbb{R}$ be infinitely differentiable with compact support, non-negative, and with integral equal to 1 . An example of such a function is give in Exercise 15.30. Let

$$
\varphi_{\varepsilon}(x)=\varepsilon^{-n} \varphi(x / \varepsilon) .
$$

Theorem 15.8 Suppose $1 \leq p \leq \infty$ and $f \in L^{p}$.

(1) For each $\varepsilon>0, f * \varphi_{\varepsilon}$ is infinitely differentiable. For each $\alpha_{1}, \alpha_{2}, \ldots, \alpha_{n}$ non-negative integers

$$
\frac{\partial^{\alpha_{1}+\cdots+\alpha_{n}}\left(f * \varphi_{\varepsilon}\right)}{\partial x_{1}^{\alpha_{1}} \cdots \partial x_{n}^{\alpha_{n}}}=f * \frac{\partial^{\alpha_{1}+\cdots+\alpha_{n}} \varphi_{\varepsilon}}{\partial x_{1}^{\alpha_{1}} \cdots \partial x_{n}^{\alpha_{n}}}
$$

We use the convention that the $0^{\text {th }}$ order derivative of a function is just the function itself.

(2) $f * \varphi_{\varepsilon} \rightarrow f$ a.e. as $\varepsilon \rightarrow 0$.

(3) If $f$ is continuous, then $f * \varphi_{\varepsilon} \rightarrow f$ uniformly on compact sets as $\varepsilon \rightarrow 0$.

(4) If $1 \leq p<\infty$ and $f \in L^{p}$, then $f * \varphi_{\varepsilon} \rightarrow f$ in $L^{p}$.

For other theorems along these lines, see Proposition 16.6 and Theorem 24.4.

Proof. (1) Suppose $\varphi$ has support in $B(0, R)$. Let $e_{i}$ be the unit vector in the $i^{\text {th }}$ direction. Write

$$
\begin{aligned}
f * \varphi_{\varepsilon}\left(x+h e_{i}\right) & -f * \varphi_{\varepsilon}(x) \\
& =\int f(y)\left[\varphi_{\varepsilon}\left(x+h e_{i}-y\right)-\varphi_{\varepsilon}(x-y)\right] d y
\end{aligned}
$$

Since $\varphi_{\varepsilon}$ is continuously differentiable with compact support, there exists a constant $c_{1}$ such that

$$
\left|\varphi_{\varepsilon}\left(x+h e_{i}-y\right)-\varphi_{\varepsilon}(x-y)\right| \leq c_{1}|h|
$$

for all $x$ and $y$. We may then divide both sides of (15.9) by $h$, let $h \rightarrow 0$, and use dominated convergence with the dominating function being $c_{1}|f(y)| \chi_{B(0, R \varepsilon+1)}(y)$, provided $|h| \leq 1$. This dominating function is in $L^{1}$ because $f \in L^{p}$.

We conclude

$$
\frac{\partial\left(f * \varphi_{\varepsilon}\right)}{\partial x_{i}}(x)=f * \frac{\partial \varphi_{\varepsilon}}{\partial x_{i}}(x) .
$$

Since $\partial \varphi_{\varepsilon} / \partial x_{i}$ is also infinitely differentiable with compact support, we may continue and handle the higher order partial derivatives by induction.

(2) Since $\varphi$ has integral 1, using a change of variables shows that $\varphi_{\varepsilon}$ does too. We then have

$$
\begin{aligned}
f * \varphi_{\varepsilon}(x)-f(x) & =\int[f(y)-f(x)] \varphi_{\varepsilon}(x-y) d y \\
& =\frac{1}{\varepsilon^{n}} \int_{B(x, R \varepsilon)}[f(y)-f(x)] \varphi\left(\frac{x-y}{\varepsilon}\right) d y
\end{aligned}
$$

This leads to

$$
\begin{aligned}
\mid f * \varphi_{\varepsilon}(x) & -f(x) \mid \\
& \leq \frac{1}{\varepsilon^{n}} \int_{B(x, R \varepsilon)}|f(y)-f(x)| \varphi\left(\frac{x-y}{\varepsilon}\right) d y \\
& \leq\|\varphi\|_{\infty} m(B(0, R)) \frac{1}{B(x, R \varepsilon)} \int_{B(x, R \varepsilon)}|f(y)-f(x)| d y
\end{aligned}
$$

The last line tends to 0 for almost every $x$ by Theorem 14.4.

(3) Let $N>0$. Starting with (15.10),

$$
\begin{aligned}
\sup _{|x| \leq N} \mid f * \varphi_{\varepsilon}(x) & -f(x) \mid \\
& \leq\|\varphi\|_{\infty} m(B(0, R)) \sup _{|x| \leq N,|y-x| \leq R \varepsilon}|f(y)-f(x)|
\end{aligned}
$$

This tends to 0 as $\varepsilon \rightarrow 0$ because $f$ is uniformly continuous on $B(0, N+R)$.

(4) Let $\varepsilon>0$. If $f \in L^{p}$, let us take $g$ bounded with compact support in $B(0, N)$ so that $\|f-g\|_{p}<\varepsilon$. We can do this by first looking at $f_{N}=f \chi_{B(0, N)}$ with $N$ large. Using dominated convergence, $\left\|f-f_{N}\right\|_{p} \rightarrow 0$, so take $N$ sufficiently large such that $\left\|f-f_{N}\right\|<\varepsilon / 2$. We then let $g$ be a simple function approximation to $f_{N}$ chosen so that $\left\|f_{N}-g\right\|_{p}<\varepsilon / 2$.

Since $g \in L^{\infty}$, then $g * \varphi_{\varepsilon}$ is bounded by $\|g\|_{\infty}\left\|\varphi_{\varepsilon}\right\|_{1}=\|g\|_{\infty}$. By part (2) we have almost everywhere convergence of $g * g_{\varepsilon}$ to $g$ as $\varepsilon \rightarrow 0$. Since $\varphi_{\varepsilon}$ has support in $B(0, R \varepsilon)$ and $g$ has support in $B(0, N)$, we see by Exercise 15.14 that $g * \varphi_{\varepsilon}$ will have support in $B(0, N+R \varepsilon)$. We may therefore use dominated convergence to obtain that $g * \varphi_{\varepsilon} \rightarrow g$ in $L^{p}$ as $\varepsilon \rightarrow 0$.

Now $\|f-g\|_{p}<\varepsilon$ and

$$
\left\|f * \varphi_{\varepsilon}-g * \varphi_{\varepsilon}\right\|_{p} \leq\|f-g\|_{p}\left\|\varphi_{\varepsilon}\right\|_{1}<\varepsilon,
$$

so $\left\|f * \varphi_{\varepsilon}-f\right\|_{p} \leq 2 \varepsilon+\left\|g * \varphi_{\varepsilon}-g\right\|_{p}$. Therefore

$$
\limsup _{\varepsilon \rightarrow 0}\left\|f * \varphi_{\varepsilon}-f\right\|_{p} \leq 2 \varepsilon
$$

Since $\varepsilon$ is arbitrary, (4) is proved.

## Bounded linear functionals
````{prf:definition} bounded linear functional
A **linear functional** on $L^{p}$ is a map $H$ from $L^{p}$ to $\mathbb{R}$ satisfying $H(f+g)=H(f)+H(g), \quad H(a f)=a H(f)$,
whenever $f, g \in L^{p}$ and $a \in \mathbb{R}$. $H$ is a bounded linear functional if

$$
\|H\|=\sup \left\{|H f|:\|f\|_{p} \leq 1\right\}
$$

is finite. The dual space of $L^{p}$ is the collection of all bounded linear functionals with norm. 
````

Our goal in this section is to identify the dual of $L^{p}$. We define the signum function or sign function by

$$
\operatorname{sgn}(x)= \begin{cases}-1, & x<0 \\ 0, & x=0 \\ 1, & x>0\end{cases}
$$

Note $x \operatorname{sgn}(x)=|x|$.

The following is very useful.

````{prf:theorem}
:label: thm13.5
For $1<p<\infty$ and $p^{-1}+q^{-1}=1$, suppose $f \in L^{p}$. Then

$$
\|f\|_{p}=\sup \left\{\int f g d \mu:\|g\|_{q} \leq 1\right\} .
$$

When $p=1$, (15.12) holds if we take $q=\infty$, and if $p=\infty$, (15.12) holds if we take $q=1$.
````

Proof. The right hand side of (15.12) is less than the left hand side by Hölder's inequality. Thus we need only show that the right hand side is greater than the left hand side.

Case 1: $p=1$. Take $g(x)=\operatorname{sgn} f(x)$. Then $|g|$ is bounded by 1 and $f g=|f|$. This takes care of the case $p=1$.

Case 2: $p=\infty$. If $\|f\|_{\infty}=0$, the result is trivial, so suppose $\|f\|_{\infty}>0$. Since $\mu$ is $\sigma$-finite, there exist sets $F_{n}$ increasing up to $X$ such that $\mu\left(F_{n}\right)<\infty$ for each $n$. If $M=\|f\|_{\infty}$, let $a$ be any finite real less than $M$. By the definition of $L^{\infty}$ norm, the measure of $A_{n}=\left\{x \in F_{n}:|f(x)|>a\right\}$ must be positive if $n$ is sufficiently large. Let

$$
g_{n}(x)=\frac{\operatorname{sgn}(f(x)) \chi_{A_{n}}(x)}{\mu\left(A_{n}\right)} .
$$

Then the $L^{1}$ norm of $g_{n}$ is 1 and $\int f g_{n}=\int_{A_{n}}|f| / \mu\left(A_{n}\right) \geq a$. Since $a$ is arbitrary, the supremum on the right hand side of (15.12) must be $M$.

Case 3: $1<p<\infty$. We may suppose $\|f\|_{p}>0$. Let $F_{n}$ be measurable sets of finite measure increasing to $X, q_{n}$ a sequence of non-negative simple functions increasing to $f^{+}, r_{n}$ a sequence of non-negative simple functions increasing to $f^{-}$, and

$$
s_{n}(x)=\left(q_{n}(x)-r_{n}(x)\right) \chi_{F_{n}}(x) .
$$

Then $s_{n}(x) \rightarrow f(x)$ for each $x,\left|s_{n}(x)\right|$ increases to $|f(x)|$ for each $x$, each $s_{n}$ is a simple function, and $\left\|s_{n}\right\|_{p}<\infty$ for each $n$. Then $\left\|s_{n}\right\|_{p} \rightarrow\|f\|_{p}$ by the monotone convergence theorem, whether or not $\|f\|_{p}$ is finite. For $n$ sufficiently large, $\left\|s_{n}\right\|_{p}>0$.

Let

$$
g_{n}(x)=(\operatorname{sgn} f(x)) \frac{\left|s_{n}(x)\right|^{p-1}}{\left\|s_{n}\right\|_{p}^{p / q}} .
$$

$g_{n}$ is again a simple function. Since $(p-1) q=p$, then

$$
\left\|g_{n}\right\|_{q}=\frac{\left(\int\left|s_{n}\right|^{(p-1) q}\right)^{1 / q}}{\left\|s_{n}\right\|_{p}^{p / q}}=\frac{\left\|s_{n}\right\|_{p}^{p / q}}{\left\|s_{n}\right\|_{p}^{p / q}}=1
$$

On the other hand, since $|f| \geq\left|s_{n}\right|$,

$$
\int f g_{n}=\frac{\int|f|\left|s_{n}\right|^{p-1}}{\left\|s_{n}\right\|_{p}^{p / q}} \geq \frac{\int\left|s_{n}\right|^{p}}{\left\|s_{n}\right\|_{p}^{p / q}}=\left\|s_{n}\right\|_{p}^{p-(p / q)} .
$$

Since $p-(p / q)=1$, then $\int f g_{n} \geq\left\|s_{n}\right\|_{p}$, which tends to $\|f\|_{p}$. This proves the right hand side of (15.12) is at least as large as the left hand side.

The proof of Theorem 15.9 also establishes

````{prf:corollary}
:label: cor13.2
For $1<p<\infty$ and $p^{-1}+q^{-1}=1$, suppose $f$ is measurable and $\int f g$ is defined for all simple $g$. Then

$$
\|f\|_{p}=\sup \left\{\int f g:\|g\|_{q} \leq 1, g \text { simple }\right\}
$$
````

````{prf:proposition}
:label: pro13.1
Suppose $1<p<\infty, p^{-1}+q^{-1}=1$, and $g \in L^{q}$. If we define $H(f)=\int$ fg for $f \in L^{p}$, then $H$ is a bounded linear functional on $L^{p}$ and $\|H\|=\|g\|_{q}$.
````
````{prf:proof}
The linearity is obvious. That $\|H\| \leq\|g\|_{q}$ follows by Hölder's inequality. Using Theorem 15.9 and writing

$$
\|H\|=\sup _{\|f\|_{p} \leq 1}|H(f)|=\sup _{\|f\|_{p} \leq 1}\left|\int f g\right| \geq \sup _{\|f\|_{p} \leq 1} \int f g=\|g\|_{q}
$$

completes the proof.
````

````{prf:theorem}
:label: thm13.6
Theorem 15.12 Suppose $1<p<\infty, p^{-1}+q^{-1}=1$, and $H$ is a real-valued bounded linear functional on $L^{p}$. Then there exists $g \in L^{q}$ such that $H(f)=\int f g$ and $\|g\|_{q}=\|H\|$.
````

This theorem together with Proposition 15.11 allows us to identify the dual space of $L^{p}$ with $L^{q}$.

Proof. Suppose we are given a bounded linear functional $H$ on $L^{p}$. First suppose $\mu(X)<\infty$. Define $\nu(A)=H\left(\chi_{A}\right)$. Note $\chi_{A} \in L^{p}$ by the finiteness of $\mu$. We will show that $\nu$ is a signed measure, that $\nu \ll \mu$ and that $g=d \nu / d \mu$ is the function we seek.

If $A$ and $B$ are disjoint, then

$$
\begin{aligned}
\nu(A \cup B) & =H\left(\chi_{A \cup B}\right)=H\left(\chi_{A}+\chi_{B}\right) \\
& =H\left(\chi_{A}\right)+H\left(\chi_{B}\right)=\nu(A)+\nu(B) .
\end{aligned}
$$

To show $\nu$ is countably additive, it suffices to show that if $A_{n} \uparrow A$, then $\nu\left(A_{n}\right) \rightarrow \nu(A)$, and then use Exercise 3.1. But if $A_{n} \uparrow A$, then $\chi_{A_{n}} \rightarrow \chi_{A}$ in $L^{p}$, and so $\nu\left(A_{n}\right)=H\left(\chi_{A_{n}}\right) \rightarrow H\left(\chi_{A}\right)=\nu(A)$; we use here the facts that $\mu(X)<\infty$ and $p<\infty$. We conclude that $\nu$ is a countably additive signed measure. Moreover, if $\mu(A)=0$, then $\chi_{A}=0$ a.e., hence $\nu(A)=H\left(\chi_{A}\right)=0$. We use the Jordan decomposition theorem to write $\nu=\nu^{+}-\nu^{-}$, apply the RadonNikodym theorem to obtain $g^{+}=d \nu^{+} / d \mu$ and $g^{-}=d \nu^{-} / d \mu$, and set $g=g^{+}-g^{-}$. We therefore have a real-valued integrable function $g$ such that $\nu(A)=\int_{A} g d \mu$ for all sets $A$.

If $s=\sum_{i} a_{i} \chi_{A_{i}}$ is a simple function, by linearity we have

$$
H(s)=\sum_{i} a_{i} H\left(\chi_{A_{i}}\right)=\sum_{i} a_{i} \nu\left(A_{i}\right)=\sum_{i} a_{i} \int g \chi_{A_{i}}=\int g s .
$$

By Corollary 15.10 and (15.13),

$$
\begin{aligned}
\|g\|_{q} & =\sup \left\{\int g s:\|s\|_{p} \leq 1, s \text { simple }\right\} \\
& =\sup \left\{H(s):\|s\|_{p} \leq 1, s \text { simple }\right\} \leq\|H\| .
\end{aligned}
$$

If $s_{n}$ are simple functions tending to $f$ in $L^{p}$ (see Exercise 15.2), then $H\left(s_{n}\right) \rightarrow H(f)$, while by Hölder's inequality and the fact that $g \in L^{q}$

$$
\left|\int s_{n} g-\int f g\right|=\left|\int\left(s_{n}-f\right) g\right| \leq\left\|s_{n}-f\right\|_{p}\|g\|_{q} \rightarrow 0
$$

so $\int s_{n} g \rightarrow \int f g$. We thus have $H(f)=\int f g$ for all $f \in L^{p}$, and $\|g\|_{q} \leq\|H\|$. By Hölder's inequality, $\|H\| \leq\|g\|_{q}$.

In the case where $\mu$ is $\sigma$-finite, but not necessarily finite, let $F_{n} \uparrow X$ so that $\mu\left(F_{n}\right)<\infty$ for each $n$. Define functionals $H_{n}$ by $H_{n}(f)=H\left(f \chi_{F_{n}}\right)$. Clearly each $H_{n}$ is a bounded linear functional on $L^{p}$. Applying the above argument, we see there exist $g_{n} \in$ $L^{q}\left(F_{n}\right)$ such that $H_{n}(f)=\int f g_{n}$ and $\left\|g_{n}\right\|_{q}=\left\|H_{n}\right\| \leq\|H\|$. It is easy to see that $g_{n}$ is 0 if $x \notin F_{n}$. Moreover, by the uniqueness part of the Radon-Nikodym theorem, if $n>m$, then $g_{n}=g_{m}$ on $F_{m}$. Define $g$ by setting $g(x)=g_{n}(x)$ if $x \in F_{n}$. Then $g$ is well defined. By Fatou's lemma, $g$ is in $L^{q}$ with a norm bounded by $\|H\|$. Note $f \chi_{F_{n}} \rightarrow f$ in $L^{p}$ by the dominated convergence theorem. Since $H$ is a bounded linear functional on $L^{p}$, we have
$H_{n}(f)=H\left(f \chi_{F_{n}}\right) \rightarrow H(f)$. On the other hand

$$
H_{n}(f)=\int_{F_{n}} f g_{n}=\int_{F_{n}} f g \rightarrow \int f g
$$

by the dominated convergence theorem. Thus $H(f)=\int f g$. Again by Hölder's inequality $\|H\| \leq\|g\|_{q}$.

