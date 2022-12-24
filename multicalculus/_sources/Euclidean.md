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

# Euclidean space

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Real number](https://www.britannica.com/science/real-number)
- [Lecture note](https://tutorial.math.lamar.edu/)
```


````{prf:definition}  limit of a function
 A real function $f(x)$ converges to $L$ as $x\rightarrow a$ if for every $\epsilon>0$ there is a $\delta>0$ such that whenever $|x-a|<\delta$ then $|f(x)-L|<\epsilon$. 
 ````

Infinite Limit : We say $\lim_{x \rightarrow a} f(x)=\infty$ if we can make $f(x)$ arbitrarily large (and positive) by taking $x$ sufficiently close to a (on either side of $a$) without letting $x=a$. There is a similar definition for $\lim_{x \rightarrow a} f(x)= -\infty$ except we make $f(x)$ arbitrarily large and negative.

Limit at Infinity : We say $\lim_{x \rightarrow \infty} f(x)=L$ if we can make $f(x)$ as close to $L$ as we want by taking $x$ large enough and positive. There is a similar definition for $\lim_{x \rightarrow a} f(x)=-\infty$ except we require that $x$ is large and negative.

````{prf:definition} right and left hand limit
Right hand limit : $\lim_{x \rightarrow a^{+}} f(x)=L$. This has
the same definition as the limit except it requires $x>a$.

Left hand limit : $\lim_{x \rightarrow a^{-}} f(x)=L$. This has the same definition as the limit except it requires $x<a$. 
````

````{prf:theorem}
$\lim_{x \rightarrow a} f(x)=L$ if and only if $\lim_{x \rightarrow a^{+}} f(x)=\lim_{x \rightarrow a^{-}} f(x)=L$
````

Note that if $\lim_{x \rightarrow a^{+}} f(x) \neq \lim_{x \rightarrow a^{-}} f(x)$, then $\lim_{x \rightarrow a} f(x)$ does not exist.

## Properties
Assume $\lim_{x \rightarrow a} f(x)$ and $\lim_{x \rightarrow a} g(x)$ both exist and $c\in \mathbb{R}$ is any real number then,

1. $\lim_{x \rightarrow a}[c f(x)]=c \lim_{x \rightarrow a} f(x)$

2. $\lim_{x \rightarrow a}\left[\frac{f(x)}{g(x)}\right]=\frac{\lim_{x \rightarrow a} f(x)}{\lim_{x \rightarrow a} g(x)}$ provided $\lim_{x \rightarrow a} g(x) \neq 0$

3. $\lim_{x \rightarrow a}[f(x) \pm g(x)]=\lim_{x \rightarrow a} f(x) \pm \lim_{x \rightarrow a} g(x)$

4. $\lim_{x \rightarrow a}[f(x)]^{n}=\left[\lim_{x \rightarrow a} f(x)\right]^{n}$
5. $\lim_{x \rightarrow a}[\sqrt[n]{f(x)}]=\sqrt[n]{\lim_{x \rightarrow a} f(x)}$
6. $\lim_{x \rightarrow a}[f(x) g(x)]=\lim_{x \rightarrow a} f(x) \lim_{x \rightarrow a} g(x)$

## Basic Limit Evaluations at $\pm \infty$

Note : $\operatorname{sgn}(a)=1$ if $a>0$ and $\operatorname{sgn}(a)=-1$ if $a<0$.
1. $\lim_{x \rightarrow \infty} \mathbf{e}^{x}=\infty \quad \& \quad \lim_{x \rightarrow-\infty} \mathbf{e}^{x}=0$
5. $n$ even: $\lim_{x \rightarrow \pm \infty} x^{n}=\infty$
2. $\lim_{x \rightarrow \infty} \ln (x)=\infty \quad \& \quad \lim_{x \rightarrow 0^{+}} \ln (x)=-\infty$
$\begin{aligned} & \lim_{x \rightarrow 0^{+}} \\=& 0 \end{aligned}$
3. If $r>0$ then $\lim_{x \rightarrow \infty} \frac{b}{x^{r}}=0$
4. If $r>0$ and $x^{r}$ is real for negative $x$ then $\lim_{x \rightarrow-\infty} \frac{b}{x^{r}}=0$
6. $n$ odd : $\lim_{x \rightarrow \infty} x^{n}=\infty \& \lim_{x \rightarrow-\infty} x^{n}=-\infty$
7. $n$ even : $\lim_{x \rightarrow \pm \infty} a x^{n}+\cdots+b x+c=\operatorname{sgn}(a) \infty$
8. $n$ odd : $\lim_{x \rightarrow \infty} a x^{n}+\cdots+b x+c=\operatorname{sgn}(a) \infty$
9. $n$ odd : $\lim_{x \rightarrow-\infty} a x^{n}+\cdots+c x+d=-\operatorname{sgn}(a) \infty$ 

## Evaluation techniques

### Continuous functions
If $f(x)$ is continuous at $a$ then $\lim_{x \rightarrow a} f(x)=f(a) \quad$ 

### L'Hospital's Rule
If $\lim_{x \rightarrow a} \frac{f(x)}{g(x)}=\frac{0}{0}$ or $\lim_{x \rightarrow a} \frac{f(x)}{g(x)}=\frac{\pm \infty}{\pm \infty}$, then $\lim_{x \rightarrow a} \frac{f(x)}{g(x)}=\lim_{x \rightarrow a} \frac{f^{\prime}(x)}{g^{\prime}(x)}$ where $a$ is a number, $\infty$ or $-\infty$ 

### Composition
If $f(x)$ is continuous at $b$ and $\lim_{x \rightarrow a} g(x)=b$, then $\lim_{x \rightarrow a} f(g(x))=f(\lim g(x))=f(b) \quad$ 

### Polynomials at Infinity
Suppose that $p(x)$ and $q(x)$ are polynomials. To compute $\lim_{x \rightarrow \pm \infty} \frac{p(x)}{q(x)}$, we first factor largest power of $x$ in $q(x)$ out of both $p(x)$ and $q(x)$ and then compute the limit. For example, 
$$\lim_{x \rightarrow-\infty} \frac{3 x^{2}-4}{5 x-2 x^{2}}=\lim_{x \rightarrow-\infty} \frac{x^{2}\left(3-\frac{4}{x^{2}}\right)}{x^{2}\left(\frac{5}{x}-2\right)}=\lim_{x \rightarrow-\infty} \frac{3-\frac{4}{x^{2}}}{\frac{5}{x}-2}=-\frac{3}{2}$$


### Factor and Cancel 
$\lim_{x \rightarrow 2} \frac{x^{2}+4 x-12}{x^{2}-2 x}=\lim_{x \rightarrow 2} \frac{(x-2)(x+6)}{x(x-2)}=\lim_{x \rightarrow 2} \frac{x+6}{x}=\frac{8}{2}=4$ 

### Rationalize Numerator/Denominator
$\lim_{x \rightarrow 9} \frac{3-\sqrt{x}}{x^{2}-81}=\lim_{x \rightarrow 9} \frac{3-\sqrt{x}}{x^{2}-81} \frac{3+\sqrt{x}}{3+\sqrt{x}} =\lim_{x \rightarrow 9} \frac{9-x}{\left(x^{2}-81\right)(3+\sqrt{x})}=\lim_{x \rightarrow 9} \frac{-1}{(x+9)(3+\sqrt{x})}=\frac{-1}{(18)(6)}=-\frac{1}{108}$

### Piecewise Function 
Compute $\lim_{x \rightarrow-2} g(x)$ where $g(x)= \begin{cases}x^{2}+5 & \text { if } x<-2 \\ 1-3 x & \text { if } x \geq-2\end{cases}$.

We first compute two one sided limits

$$\lim_{x \rightarrow-2^{-}} g(x)=\lim_{x \rightarrow-2^{-}} x^{2}+5=9$$
$$\lim_{x \rightarrow-2^{+}} g(x)=\lim_{x \rightarrow-2^{+}} 1-3 x=7$$

Because one sided limits are different, the limit $\lim_{x \rightarrow-2} g(x)$ doesn't exist. If the two one sided limits had been equal then $\lim_{x \rightarrow-2} g(x)$ would have existed and had the same value.

### Combine Rational Expressions
$$
\begin{aligned}
\lim_{h \rightarrow 0} \frac{1}{h}\left(\frac{1}{x+h}-\frac{1}{x}\right) 
& =\lim_{h \rightarrow 0} \frac{1}{h}\left(\frac{x-(x+h)}{x(x+h)}\right)\\
& =\lim_{h \rightarrow 0} \frac{1}{h}\left(\frac{-h}{x(x+h)}\right)\\
& =\lim_{h \rightarrow 0} \frac{-1}{x(x+h)}=-\frac{1}{x^{2}}
\end{aligned}
$$



