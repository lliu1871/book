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

# Chapter 14: Banach spaces

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


Banach spaces are normed linear spaces that are complete. We will give the definitions, discuss the existence of bounded linear functionals, prove the Baire category theorem, and derive some consequences such as the uniform boundedness theorem and the open mapping theorem.


````{prf:definition} norm
:label: def14.1
If $V$ is a vector space over $F$, where $F$ is a field equal to $\mathbb{R}$ or to $\mathbb{C}$, then a norm on $V$ is a map $V \to \mathbb{R}$, denoted by $\|\cdot \|$, satisfying the following four axioms:
1. Non-negativity: for every $x\in V$, $\|x\|\ge 0$
2. Positive definiteness: $\|x\|=0$ if and only if $x$ is the zero vector.
3. Absolute homogeneity: for every $\lambda \in F$ and $x\in V$, $\|\lambda x\|=|\lambda|\|x\|$.
4. Triangle inequality: for every $x,y\in V$, $\|x+y\|\leq \|x\|+\|y\|$.
````
A norm induces a distance using the formula $d(x, y) = \|x - y\|$. This transformation turns any normed vector space into a metric space and a topological vector space.

````{prf:definition}
 :label: def14.1
 A Banach space is a normed linear space that is complete, that is, where every Cauchy sequence converges.
 ````

A linear map is a map $L$ from a normed linear space $X$ to a normed linear space $Y$ satisfying $L(x+y)=L(x)+L(y)$ for all $x, y \in X$ and $L(\alpha x)=\alpha L(x)$ for all $x \in X$ and $\alpha \in F$. We will sometimes write $L x$ for $L(x)$. Since $L(0)=L(0+0)=L(0)+L(0)$, then $L(0)=0$.

````{prf:definition}
 :label: def14.2
 A linear map $f$ from $X$ to $\mathbb{R}$ is a real linear functional, a linear map from $X$ to $\mathbb{C}$ a complex linear functional. $f$ is a bounded linear functional if

$$
\|f\|=\sup \{|f(x)|: x \in X,\|x\| \leq 1\}<\infty
$$
````
````{prf:proposition}
:label: pro14.1
The following are equivalent.

1. The linear functional $f$ is bounded.
2. The linear functional $f$ is continuous.
3. The linear functional $f$ is continuous at 0.
````

Proof. $|f(x)-f(y)|=|f(x-y)| \leq\|f\|\|x-y\|$, so (1) implies (2). That (2) implies (3) is obvious. To show (3) implies (1), if $f$ is not bounded, there exists a sequence $x_{n} \in X$ such that $\left\|x_{n}\right\|=1$ for each $n$, but $\left|f\left(x_{n}\right)\right| \rightarrow \infty$. If we let $y_{n}=x_{n} /\left|f\left(x_{n}\right)\right|$, then $y_{n} \rightarrow 0$ but $\left|f\left(y_{n}\right)\right|=1 \nrightarrow \rightarrow 0$, contradicting (3).

## The Hahn-Banach theorem
The Hahn–Banach theorem arose from attempts to solve infinite systems of linear equations. This is needed to solve problems such as the **moment problem**, whereby given all the potential **Moment of a function** one must determine if a function having these moments exists, and, if so, find it in terms of those moments. Another such problem is the **Fourier cosine series** problem, whereby given all the potential Fourier cosine coefficients one must determine if a function having those coefficients exists, and, again, find it if so.

The vector problem: Given a collection $\left(f_i\right)_{i \in I}$ of bounded linear functionals on a **normed space** $X$ and a collection of scalars $\left(c_i\right)_{i \in I},$ determine if there is an $x \in X$ such that $f_i(x) = c_i$ for all $i \in I.$

The functional problem: Given a collection $\left(x_i\right)_{i \in I}$ of vectors in a normed space $X$ and a collection of scalars $\left(c_i\right)_{i \in I},$ determine if there is a bounded linear functional $f$ on $X$ such that $f\left(x_i\right) = c_i$ for all $i \in I.$


````{prf:theorem}
:label: thm14.4
Let $(x_i)_{i \in I}$ be vectors in a real or complex normed space $X$ and let $(c_i)_{i \in I}$ be scalars also indexed by $I \neq \varnothing$.  There exists a continuous linear functional $f$ on $X$ such that $f\left(x_i\right) = c_i$ for all $i \in I$ if and only if there exists a $K > 0$ such that for any choice of scalars $(s_i)_{i \in I}$ where all but finitely many $s_i$ are $0$, the following holds:

$$\left|\sum_{i \in I} s_i c_i\right| \leq K \left\|\sum_{i \in I} s_i x_i\right\|.$$
````

````{prf:definition} sublinear function
:label: def14.3
A map $p : X \to \mathbb{R}$ is a sublinear function if it satisfies $p(x+y)\leq p(x) + p(y)$ and $p(t x) = t p(x)$ for all  $x, y \in X$ and all real $t \geq 0$.
````

````{prf:lemma} One–dimensional dominated extension theorem
:label: lemma14.5
Let $p : X \to \mathbb{R}$ be a sublinear function on a real vector space $X$. Let $f : M \to \mathbb{R}$ a linear functional on a proper vector subspace $M \subsetneq X$ such that $f \leq p$ on $M$ (meaning $f(m) \leq p(m)$ for all $m \in M$), and let $x \in X$ be a vector not in $M$ (so $M \oplus \mathbb{R} x = span \{M, x\}$). 
There exists a linear extension $F : M \oplus \mathbb{R} x \to \mathbb{R}$ of $f$ such that $F \leq p$ on $M \oplus \mathbb{R} x.$
````

````{prf:proof} 
Given any real number $b,$ the map $F_b : M \oplus \mathbb{R} x \to \mathbb{R}$ defined by $F_b(m + r x) = f(m) + r b$ is always a linear extension of $f$ to $M \oplus \mathbb{R} x$. 

This definition means, for instance, that $F_b(x) = F_b(0 + 1 x) = f(0) + 1 b = b$ and if $m \in M$ then $F_b(m) = F_b(m + 0 x) = f(m) + 0 b = f(m).$ In fact, if $G : M \oplus \mathbb{R} x \to \mathbb{R}$ is any linear extension of $f$ to $M \oplus \mathbb{R} x$ then $G = F_b$ for $b := G(x).$ In other words, every linear extension of $f$ to $M \oplus \mathbb{R} x$ is of the form $F_b$ for some (unique) $b.$</ref> but it might not satisfy $F_b \leq p.$ 
It will be shown that $b$ can always be chosen so as to guarantee that $F_b \leq p,$ which will complete the proof. 

If $m, n \in M$ then 

$$f(m) - f(n) = f(m - n) \leq p(m - n) = p(m + x - x - n) \leq p(m + x) + p(- x - n)$$

which implies

$$-p(-n - x) - f(n) ~\leq~ p(m + x) - f(m).$$

where importantly, the left hand side is independent of $m$ and the right hand side is independent of $n$. So define

$$a = \sup_{n \in M}[-p(-n - x) - f(n)]$$

and
 
$$c = \inf_{m \in M} [p(m + x) - f(m)]$$

where $a \leq c$ are real numbers. To guarantee $F_b \leq p,$ it suffices that $a \leq b \leq c$. Explicitly, for any real number $b \in \mathbb{R},$ $F_b \leq p$ on $M \oplus \mathbb{R} x$ if and only if $a \leq b \leq c.$ Combined with the fact that $F_b(x) = b,$ it follows that the dominated linear extension of $f$ to $M \oplus \mathbb{R} x$ is unique if and only if $a = c,$ in which case this scalar will be the extension's values at $x.$ Since every linear extension of $f$ to $M \oplus \mathbb{R} x$ is of the form $F_b$ for some $b,$ the bounds $a \leq b = F_b(x) \leq c$ thus also limit the range of possible values (at $x$) that can be taken by any of $f$'s dominated linear extensions. 

Specifically, if $F : X \to \mathbb{R}$ is any linear extension of $f$ satisfying $F \leq p$ then for every $x \in X \setminus M,$ $\sup_{m \in M}[-p(-m - x) - f(m)] ~\leq~ F(x) ~\leq~ \inf_{m \in M} [p(m + x) - f(m)]$, because then $b$ satisfies "the decisive inequality

$$-p(-n - x) - f(n) ~\leq~ b ~\leq~ p(m + x) - f(m) \qquad \text{ for all }\;  m, n \in M.$$

To see that $f(m) + r b \leq p(m + r x)$ follows,<ref group=note name="GeometricIllustration" /> assume $r \neq 0$ and substitute $\tfrac{1}{r} m$ in for both $m$ and $n$ to obtain
$-p\left(- \tfrac{1}{r} m - x\right) - \tfrac{1}{r} f\left(m\right) ~\leq~ b ~\leq~ p\left(\tfrac{1}{r} m + x\right) - \tfrac{1}{r} f\left(m\right).$ 
If $r > 0$ (respectively, if $r < 0$) then the right (respectively, the left) hand side equals $\tfrac{1}{r} \left[p(m + r x) - f(m)\right]$ so that multiplying by $r$ gives $r b \leq p(m + r x) - f(m)$. 

$$-p\left(- \tfrac{1}{r} m - x\right) - f\left(\tfrac{1}{r} m\right) = -p\left(\left(- \tfrac{1}{r}\right) \left(m + rx\right)\right) - \tfrac{1}{r} f(m) = \tfrac{1}{r} \left[p(m + r x) - f(m)\right].$$
$\blacksquare$
````

If $p : X \to \mathbb{R}$ is a sublinear function defined on a real vector space $X$ then any linear functional defined on a vector subspace of $X$ that is dominated above by $p$ has at least one linear extension to all of $X$ that is also dominated above by $p$.

````{prf:theorem} Hahn–Banach dominated extension theorem
:label: thm14.1

If $p : X \to \mathbb{R}$ is a sublinear function, and if $f : M \to \mathbb{R}$ is a linear functional defined on a vector subspace $M$ of $X$ such that $f(m) \leq p(m)$ for all $m \in M$, then there exists a linear functional $F : X \to \mathbb{R}$ such that $F(m) = f(m)$ for all $m \in M$, $F(x) \leq p(x)$ for all $x \in X$. 
Moreover, if $p$ is a seminorm then $|F(x)| \leq p(x)$ necessarily holds for all $x \in X.$ 
````

Here is Zorn's lemma. Given a set $Y$ with a partial order " $\leq$ ", a linear ordered subset $X \subset Y$ is one such that if $x, y \in X$, then either $x \leq y$ or $y \leq x$ or both holds. A linearly ordered subset $X \subset Y$ has an upper bound if there exists an element $z$ of $Y$ such that $x \leq z$ for all $x \in X$. An element $z$ of $Y$ is maximal if $z \leq y$ for $y \in Y$ implies $y=z$.

````{prf:lemma} Zorn's lemma
:label: lem14.1
If $Y$ is a partially ordered set and every linearly ordered subset of $Y$ has an upper bound, then $Y$ has a maximal element.
````

A subspace of a normed linear space $X$ is a subset $M \subset X$ such that $M$ is itself a normed linear space. We now give the Hahn-Banach theorem for real linear functionals.

````{prf:theorem} Hahn-Banach theorem
:label: thm14.1
If $M$ is a subspace of a normed linear space $X$ and $f$ is a bounded real linear functional on $M$, then $f$ can be extended to a bounded linear functional $F$ on $X$ such that $\|F\|=\|f\|$.

Saying that $F$ is an extension of $f$ means that the domain of $F$ contains the domain of $f$ and $F(x)=f(x)$ if $x$ is in the domain of $f$.
````

````{prf:proof}
The map $F$ being an extension of $f$ means that $\operatorname{domain} f \subseteq \operatorname{domain} F$ and $F(m) = f(m)$ for every $m \in \operatorname{domain} f$. Consequently,

$$\{|f(m)| : \|m\| \leq 1, m \in \operatorname{domain} f\} \subseteq \{|F(x)\,| : \|x\| \leq 1, x \in \operatorname{domain} F\}$$ 
Thus, the supremum of the set on the left hand side, which is $\|f\|,$ does not exceed the supremum of the right hand side, which is $\|F\|.$ In other words, $\|f\| \leq \|F\|$. It suffices to show that $\|F\| \leq \|f\|$.

If $\|f\|=0$, then we take $F$ to be identically 0 , so we may assume that $\|f\| \neq 0$, and then by multiplying by a constant, that $\|f\|=1$. We first show that we can extend $f$ by at least one dimension.

Choose $x_{0} \in X-M$ and let $M_{1}$ be the vector space spanned by $M$ and $x_{0}$. Thus $M_{1}$ consists of all vectors of the form $x+\lambda x_{0}$, where $x \in X$ and $\lambda$ is real.

We have for all $x, y \in M$

$$
f(x)-f(y)=f(x-y) \leq\|x-y\| \leq\left\|x-x_{0}\right\|+\left\|y-x_{0}\right\| .
$$

Hence

$$
f(x)-\left\|x-x_{0}\right\| \leq f(y)+\left\|y-x_{0}\right\|
$$

for all $x, y \in M$. Choose $\alpha \in \mathbb{R}$ such that

$$
f(x)-\left\|x-x_{0}\right\| \leq \alpha \leq f(y)+\left\|y-x_{0}\right\|
$$

for all $x, y \in M$. Define $f_{1}\left(x+\lambda x_{0}\right)=f(x)+\lambda \alpha$. This is clearly an extension of $f$ to $M_{1}$.

We need to verify that the norm of $f_{1}$ is less than or equal to 1. Let $x \in M$ and $\lambda \in \mathbb{R}$. By our choice of $\alpha, f(x)-\left\|x-x_{0}\right\| \leq \alpha$, or $f(x)-\alpha \leq\left\|x-x_{0}\right\|$, and $\alpha \leq f(x)+\left\|x-x_{0}\right\|$, or $f(x)-\alpha \geq$ $-\left\|x-x_{0}\right\|$. Thus

$$
|f(x)-\alpha| \leq\left\|x-x_{0}\right\|
$$

Replacing $x$ by $-x / \lambda$ and multiplying by $|\lambda|$, we get

$$
|\lambda||-f(x) / \lambda-\alpha| \leq|\lambda|\left\|-x / \lambda-x_{0}\right\|
$$

or

$$
\left|f_{1}\left(x+\lambda x_{0}\right)\right|=|f(x)+\lambda \alpha| \leq\left\|x+\lambda x_{0}\right\|,
$$

which is what we wanted to prove.

We now establish the existence of an extension of $f$ to all of $X$. Let $\mathcal{F}$ be the collection of all linear extensions $F$ of $f$ satisfying $\|F\| \leq 1 = \|f\|$. This collection is partially ordered by inclusion. That is, if $f_{1}$ is an extension of $f$ to a subspace $M_{1}$ and $f_{2}$ is an extension of $f$ to a subspace $M_{2}$, we say $f_{1} \leq f_{2}$ if $M_{1} \subset M_{2}$. Since the union of any increasing family of subspaces of $X$ is again a subspace, then the union of a linearly ordered subfamily of $\mathcal{F}$ lies in $\mathcal{F}$. 

By Zorn's lemma, $\mathcal{F}$ has a maximal element, say, $F_{1}$. By the construction of the preceding two paragraphs, if the domain of $F_{1}$ is not all of $X$, we can find an extension, which would be a contradiction to $F_{1}$ being maximal. Therefore $F_{1}$ is the desired extension.


$\blacksquare$
````

To get a version for complex valued linear functionals is quite easy. Note that if $f(x)=u(x)+i v(x)$, then the real part of $f$, namely, $u=\operatorname{Re} f$, is a real valued linear functional. Also, $u(i x)=$ $\operatorname{Re} f(i x)=\operatorname{Re} i f(x)=-v(x)$, so that $v(x)=-u(i x)$, and hence $f(x)=u(x)-i u(i x)$.

````{prf:theorem} 
:label: thm14.2
If $M$ is a subspace of a normed linear space $X$ and $f$ is a bounded complex linear functional on $M$, then $f$ can be extended to a bounded linear functional $F$ on $X$ such that $\|F\|=$ $\|f\|$.
````

````{prf:proof}
Assume without loss of generality that $\|f\|=1$. Let $u=\operatorname{Re} f$. Note $|u(x)| \leq|f(x)| \leq\|x\|$. Now use the version of the Hahn-Banach theorem for real linear functionals to find a linear functional $U$ that is an extension of $u$ to $X$ such that $\|U\| \leq 1$. Let $F(x)=U(x)-i U(i x)$.

It only remains to show that the norm of $F$ is at most 1 . Fix $x$, and write $F(x)=r e^{i \theta}$. Then

$$
|F(x)|=r=e^{-i \theta} F(x)=F\left(e^{-i \theta} x\right) .
$$

Since this quantity is real and non-negative,

$$
|F(x)|=U\left(e^{-i \theta} x\right) \leq\|U\|\left\|e^{-i \theta} x\right\| \leq\|x\| .
$$

This holds for all $x$, so $\|F\| \leq 1$.
$\blacksquare$
````

As an application of the Hahn-Banach theorem, given a subspace $M$ and an element $x_{0}$ not in $M$ such that $\inf _{x \in M}\left\|x-x_{0}\right\|>0$, we can define $f\left(x+\lambda x_{0}\right)=\lambda$ for $x \in M$, and then extend this linear functional to all of $X$. Then $f$ will be 0 on $M$ but non-zero at $x_{0}$.

Another application is to fix $x_{0} \neq 0$, let $f\left(\lambda x_{0}\right)=\lambda\left\|x_{0}\right\|$, and then extend $f$ to all of $X$. Thus there exists a linear functional $f$ such that $f\left(x_{0}\right)=\left\|x_{0}\right\|$ and $\|f\|=1$.

## Baire's theorem and consequences
We turn now to the Baire category theorem and some of its consequences. Recall that if $A$ is a set, we use $\bar{A}$ for the closure of $A$ and $A^{\circ}$ for the interior of $A$. A set $A$ is dense in $X$ if $\bar{A}=X$ and $A$ is nowhere dense if $(\bar{A})^{\circ}=\emptyset$.

The Baire category theorem is the following. Completeness of the metric space is crucial to the proof.

````{prf:theorem} Baire category theorem
:label: thm14.4
Let $X$ be a complete metric space.

1. If $G_{n}$ are open sets dense in $X$, then $\cap_{n} G_{n}$ is dense in $X$.
2. $X$ cannot be written as the countable union of nowhere dense sets.
````

````{prf:proof}
We first show that (1) implies (2). Suppose we can write $X$ as a countable union of nowhere dense sets, that is, $X=\cup_{n} E_{n}$ where $\left(\overline{E_{n}}\right)^{\circ}=\emptyset$. We let $F_{n}=\overline{E_{n}}$, which is a closed set, and then $F_{n}^{o}=\emptyset$ and $X=\cup_{n} F_{n}$. Let $G_{n}=F_{n}^{c}$, which is open. Since $F_{n}^{o}=\emptyset$, then $\overline{G_{n}}=X$. Starting with $X=\cup_{n} F_{n}$ and taking complements, we see that $\emptyset=\cap_{n} G_{n}$, a contradiction to (1).

We must prove (1). Suppose $G_{1}, G_{2}, \ldots$ are open and dense in $X$. Let $H$ be any non-empty open set in $X$. We need to show there exists a point in $H \cap\left(\cap_{n} G_{n}\right)$. We will construct a certain Cauchy sequence $\left\{x_{n}\right\}$ and the limit point, $x$, will be the point we seek.

Let $B(z, r)=\{y \in X: d(z, y)<r\}$, where $d$ is the metric. Since $G_{1}$ is dense in $X, H \cap G_{1}$ is non-empty and open, and we can find $x_{1}$ and $r_{1}$ such that $\overline{B\left(x_{1}, r_{1}\right)} \subset H \cap G_{1}$ and $0<r_{1}<1$. Suppose we have chosen $x_{n-1}$ and $r_{n-1}$ for some $n \geq 2$. Since $G_{n}$ is dense, then $G_{n} \cap B\left(x_{n-1}, r_{n-1}\right)$ is open and non-empty, so there exists $x_{n}$ and $r_{n}$ such that $\overline{B\left(x_{n}, r_{n}\right)} \subset G_{n} \cap B\left(x_{n-1}, r_{n-1}\right)$ and $0<r_{n}<2^{-n}$. We continue and get a sequence $x_{n}$ in $X$. If $m, n>N$, then $x_{m}$ and $x_{n}$ both lie on $B\left(x_{N}, r_{N}\right)$, and so $d\left(x_{m}, x_{n}\right)<2 r_{N}<2^{-N+1}$. Therefore $x_{n}$ is a Cauchy sequence, and since $X$ is complete, $x_{n}$ converges to a point $x \in X$.

$\blacksquare$
````
