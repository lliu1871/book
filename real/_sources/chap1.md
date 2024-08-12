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

# Chapter 1: Set Theory

```{epigraph}
*"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage."*

-- Lao Tzu
```

```{seealso}
- [Naive set theoy](https://www.britannica.com/science/set-theory#ref24026)
- [Axiom set theory](https://www.britannica.com/science/set-theory/Axiomatic-set-theory)
- [History of set Theory](https://en.wikipedia.org/wiki/Set_theory)
```

## Basic concepts and notations
In naive set theory, a set is a collection of objects listed within braces. For example, {1,2,3} is a set of three numbers 1, 2, and 3, and {$x^2$,$e^x$,$2x$} is a set of three functions. 

-   $x \in \Omega$ indicates that $x$ is an element of $\Omega$.
-   $x \notin \Omega$ indicates that $x$ is not an element of $\Omega$.
-   $A \subset \Omega$ indicates that $A$ is a subset of $\Omega$.
-   The empty set $\emptyset$ has no element.
-   The power set $\wp (S)$ of a set $S$ is the set of all subsets of
    $S$.
-   Two sets A and B are equal if and only if $A \subseteq B$ and
    $B \subseteq A$

## Basic operations on sets

-   The **union** of two sets A and B is the set containing all the
    elements in either A or B, written as $A \cup B = \{x: x\in A \lor  x\in B\}$.
-   The **intersection** of A and B is the set containing the elements
    contained in both A and B, written as
    $A \cap B = \{x: x\in A \land  x\in B\}$.
-   The **difference** of A and B is the set of elements in A and not in
    B, written as $A \backslash B = \{x: x\in A \land  x\notin B\}$.
-   The **complement** of a set $A \subset S$ is $A^c = S\backslash A$.
-   The **symmetric difference** of A and B is the set of elements in
    one of the sets, but not the other, written as
    $A \triangle B = (A \cup B) \backslash (A \cap B)$.

````{prf:proposition}
:label: prop1.1
Let $A,B,C\subset X$. Show $A\cup(B\cap C) = (A\cup B) \cap (A\cup C)$
````

````{prf:proof}
Let $x\in A\cup(B\cap C)$. It indicates that $x$ is in $A$ or it is in $B\cap C$. If $x\in A$, then $x\in A\cup B$ and $x\in A\cup B$. Thus, $x\in (A\cup B) \cap (A\cup C)$. If $x\in B\cap C$, then $x\in B$ indicating $x\in A\cup B$, and $x\in C$ indicating $x\in A\cup C$. Thus, $x\in A\cup(B\cap C)$ indicates $x\in (A\cup B) \cap (A\cup C)$. Similarly, we can show the reverse that  $x\in (A\cup B) \cap (A\cup C)$ indicates $x\in A\cup(B\cap C)$. This completes the proof.
````

````{prf:theorem} DeMorgan's Laws
:label: thm1.1

For a collection of sets $\{A_i, i=1,2,...\}$, $(\cup A_i)^c = \cap A_i^c$ and $(\cap A_i)^c = \cup A_i^c$.
````

````{prf:proof}
We show {prf:ref}`thm1.1` by induction. For two sets $A_1$ and $A_2$, it is trivial to show that $(A_1\cup A_2)^c = A_1^c \cap A_2^c$. Suppose the theorem is true for $n$ sets $(\cup_{i=1}^n A_i)^c = \cap_{i=1}^n A_i^c$. Then $(\cup_{i=1}^{n+1} A_i)^c = (\cup_{i=1}^{n} A_i \cup A_{n+1})^c = (\cup_{i=1}^{n} A_i)^c \cap A_{n+1}^c = \cap_{i=1}^n A_i^c \cap A_{n+1}^c = \cap_{i=1}^{n+1} A_i^c$. This completes the proof.
````
## Cartesian product
````{prf:definition}
:label: def1.1
For sets A and B, the Cartesian product $A \times B$ is the set of all ordered pairs $A \times B = \{(a, b): a \in A, b \in B\}$.
````

````{prf:example}
:label: exp1.1
If $A = \{1, 2\}$ and $B = \{male, female\}$ then the Cartesian product of $A$ and $B$ is
$A\times B = \{(1, male), (1, female), (2, male), (2, female)\}$.
````

## Relation
````{prf:definition} Relation
:label: def1.2
A relation $\mathscr{R}$ on $A \times B$ is defined as any subset of $A \times B$.
````
If $A=B$, we say that we have a relation on $A$. If $(a,b) \in \mathscr{R}$, we write $a\mathscr{R}b$. The **domain** of a relation $\mathscr{R}\subset A\times B$ is $dom(\mathscr{R})=\{a:(a,b)\in \mathscr{R}\}$. The **range** of $\mathscr{R}$ is $range(\mathscr{R})=\{b:(a,b)\in \mathscr{R}\}$

````{prf:example}
:label: exp1.2
Let $\mathscr{R}$ be the usual order on $\{0, 1, 2, 3\}$. Then $\mathscr{R}=\{(0,1),(0,2),(0,3),(1,2),(1,3),(2,3)\}$
$Dom(\mathscr{R}) = {0, 1, 2}$ while $Range(\mathscr{R}) = {1, 2, 3}$.
````

-   $\mathscr{R}$ is **symmetric**, if $a\mathscr{R}b \Leftrightarrow b\mathscr{R}a$ or equivalently
    $(a,b)\in \mathscr{R} \Leftrightarrow (b,a) \in \mathscr{R}$.
-   $\mathscr{R}$ is **reflexive** if $a\mathscr{R}a$ or $(a,a) \in \mathscr{R}$.
-   $\mathscr{R}$ is **transitive**, if $a\mathscr{R}b \land b\mathscr{R}c \Rightarrow a\mathscr{R}c$.

````{prf:definition}  equivalence
:label: def1.3
$\mathscr{R}$ is an equivalence relation on $A$, denoted by $\mathscr{R}\subset A\times A$, if $\mathscr{R}$ is symmetric, reflexive and transitive.
````

````{prf:definition}  partial order
:label: def1.4
A relation on $X$ is a partial order, denoted by $<$, if it is transitive, but not reflexive and symmetric for all $x\in X$. 
````

````{prf:definition} total order
:label: def1.5
The relation is a total order if for all $x,y\in X$, we
have either $x<y$ or $x=y$ or $x>y$.
````

For the real numbers, the partial order $x<y$ is defined by $x-y<0$.

## Function
````{prf:definition} function
:label: def1.6

A relation $\mathscr{R} \subset A \times B$ is a function if $a\mathscr{R}b_1 \land a\mathscr{R}b_2 \Rightarrow b1 = b2$.
````
For a function $f \subset A \times B$, we often write $f: A\to B$ to
indicate the relation $f(a) = b$, where $a\in A$ and $b\in B$. The
set $A$ is the **domain** of $f$, but the **range** of $f$ is a subset of $B$, i.e., $ran(f)\subset B$.

````{prf:definition} composition
:label: def1.7
If $f: A\to B$ and $g: B\to C$, the composition $g \circ f: A \to C$ is given by $g \circ f(a) = g(f(a))$.
````

### Bijective functions
$f$ is **surjective**, if $ran(f) = B$. $f$ is **injective**, if $f(a) = f(b)$ implies $a=b$. $f$ is **bijective**, if it is both surjective and injective.

If $f : A \to B$ is bijective, the inverse of $f$ is the function $f^{-1}: B \to A$.

````{prf:theorem} bijective
:label: thm1.2
A function $f:X\to Y$ is bijective if and only if there is a function $g:Y\to X$ such that $f(g(y))=y$ for all $y\in Y$ and $g(f(x)) = x$ for all
$x\in X$.
````

````{prf:theorem}
:label: thm1.3
If $f$ and $g$ are bijective, then $g\circ f$ is bijective.
````

````{prf:theorem} Schroder-Bernstein Theorem
:label: thm1.4
If there are injective functions $f : A\to B$ and $g : B \to A$, then there is a bijective function $h : A\to B$.
````

```{prf:corollary} 
:label: cor1.1
:class: dropdown
There is a bijective function $h: \mathbb{N} \to \mathbb{N} \times \mathbb{N}$.
```

### Image and preimage

````{prf:definition} preimage
:label: def1.8

Let $f:X\to Y$ and $A\subset X$, $B\subset Y$. The image of $A$ under $f$ is the set $f(A)=\{f(x):x\in A\}$ and the preimage of $B$ under $f$
is the set $f^{-1}(B)=\{x\in X: f(x)\in B\}$.
````

````{prf:remark}
:label: rem1.1
$f$ does not have to be invertible for the preimage to be defined, and $f^{-1}(B)$ is a set while $f^{-1}$ is a relation.
````

Let $A, B\subset X$ and $E, F\subset Y$ and a function $f:X\to Y$. Then,
$f(A\cup B) = f(A)\cup f(B)$, $f(A\cap B) \subset f(A)\cap f(B)$,
$f^{-1}(E\cup F) = f^{-1}(E) \cup f^{-1}(F)$
$f^{-1}(E\cap F) = f^{-1}(E) \cap f^{-1}(F)$ .

## Cardinality

````{prf:definition} cardinality
:label: def1.9

The cardinality of a set $E$ is $n\in N$, i.e., $card(E) = n$, if there is a bijection $f:E\to \{1,...,n\}$.
````

A set $E$ is finite if there is an $n \in N$ and a surjection
$f:\{1,...,n\}\to E$. We say $card(A) \le card(B)$, if there is an injective function $f : A\to B$.

-   If $card(A) \le card(B)$ and $card(B) \le card(A)$, then
    $card(A) = card(B)$, because there is a bijective function
    $f : A \to B$.

-   $card(\mathbb{N}) = card(\mathbb{N} \times \mathbb{N}) = card(\mathbb{N} \times \mathbb{N} \times \mathbb{N})$.

````{prf:theorem} Cantor's theorem
:label: thm1.5

If $S$ is a set, $card(S) < card(\wp (S))$.
````

````{prf:definition} Countability
:label: def1.10

A set $S$ is countable, if $card(S) \le card(\mathbb{N})$
````

-   If two sets A and B are countable, then $A \times B$ and $A\cup B$
    are countable. 
-   Every infinite subset of a countable set $A$ is countable.
-   The countable union of countable sets is countable.
-   The set of all rational numbers is countable.

````{prf:theorem} 
:label: thm1.6

Let $A$ be the set of all sequences whose elements are the digits $0$ and $1$. This set is uncountable. 
````
This theorem indicates that real numbers are uncountable. 