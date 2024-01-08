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

# Chapter 1: Probability theory

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Probability theory](https://en.wikipedia.org/wiki/Probability_theory)
```

```{admonition} Probability Axioms
1. Probability is a real number between 0 and 1
2. The total probability is 1
3. Countable addition: For the disjoint events $E_{1}, E_{2}, \ldots$, the probability of the union is equal to the sum of the probabilities of individual events, i.e.,

$$P\left(\cup_{i=1}^{\infty} E_{i}\right)=\sum_{i=1}^{\infty} P\left(E_{i}\right)$$
```

- The union $A\cup B$ of two events $A$ and $B$ denotes that either $A$ or $B$ or both occur.
- The intersection $A\cap B$ of two events $A$ and $B$ denotes that both $A$ and $B$ occur.
- The complement $\bar{A}$ of $A$ denotes not $A$


```{image} ./images/intersection.png
:height: 250px
:name: intersection
```

## Calculating probabilities
- $P(\bar{A})=1-P(A)$
- $P(A\cup B) = P(A)+P(B)-P(A\cap B)$
- If two events $A$ and $B$ are disjoint, then $P(A\cap B) = 0$

````{prf:example}
:label: exp1.1
Flipping a coin, the probabiliy of a head is 0.47. What is the probability of a tail?

$P(tail) = 1-P(head) = 1-0.47 = 0.53$
````

````{prf:example} 1.2
:label: exp1.2
Find the probability of a head or a tail?

$P(head \cup tail) = P(head) + P(tail) - P(head\cap tail) = 0.47 + 0.53 - 0 = 1$
````


## Conditional probabilities
````{prf:definition} conditional probability
:label: def1.1
For two events $A$ and $B$, the probability of $A$ given that the event $B$ occurs is called the conditional probability of $A$ conditional on the event $B$, denoted by $P(A|B)$. 
````
- $P(A|B)=\frac{P(A \cap B)}{P(B)}$
- $P(A\cap B) = P(A)P(B|A) = P(B)P(A|B)$

````{prf:example} 
:label: exp1.3
Show that if A is a subset of B, then $P(B|A) = 1$

$P(B|A)=\frac{P(A \cap B)}{P(A)}=\frac{P(A)}{P(A)}=1$
````

```{image} ./images/diag_prob.png
:height: 250px
```

````{prf:example}
:label: exp1.4
John has an 80% probability of having dinner at home and a 20% probability of dining at a restaurant. If he opts for a home-cooked meal, there's a 40% chance he'll choose chicken and a 60% chance he'll choose vegetables. On the other hand, if he dines at a restaurant, there's a 90% probability he'll choose chicken and a 10% probability he'll choose vegetables. (see the diagram)


Let $H=home$, $R=restaurant$, $C=chicken$, and $V=veg$. From the diagram, we know that $P(H)=0.8$, $P(R=0.2)$, $P(C|H)=0.4$, $P(V|H)=0.6$, $P(C|R)=0.9$, $P(V|R)=0.1$.

What is the probability of having chicken at home?
$P(H \cap C) = P(C|H)P(H) = 0.4\times 0.8 = 0.32$

What is the probability of having chicken?
$P(C) = P(C\cap H)+P(C\cap R) = P(C|H)P(H)+P(C|R)P(R) = 0.4\times 0.8 + 0.9\times 0.2 = 0.32+0.18=0.5$

If John is having chicken, what is the probability that he is having chicken at home?
$P(H|C) = \frac{P(H\cap C)}{P(C)} = \frac{0.4\times 0.8}{0.5} = 0.64$

````


## Independent events
````{prf:definition} independence
:label: def1.2

Two sets (events) $A$ and $B$ are independent if and only if $P(A \cap B)=P(A) P(B)$.
```` 

````{prf:example}
:label: exp1.5

Show that if two event A and B are independent of each other, then $P(A|B) = P(A)$

By definition, the conditional probability is $P(A|B) = \frac{P(A\cap B)}{P(B)}$. Since $A$ and $B$ are independent, $P(A\cap B) = P(A)P(B)$. Thus, $P(A|B) = \frac{P(A)P(B)}{P(B)} = P(A)$
```` 

````{prf:example}
:label: exp1.6

Show that two disjoint events A and B with positive probabilities, i.e., $P(A)>0$ and $P(B)>0$, must be dependent of each other. 

We show it by contradiction. Suppose $A$ and $B$ are independent. Then, $P(A\cap B) = P(A)P(B)>0$. However, $A$ and $B$ are disjoint and thus $P(A\cap B) = 0$. 

````

````{prf:example}
:label: exp1.7

Let $X_1, X_2, X_3$ be the outcomes of three flips. Find the probability of three heads.

Because three flips are independent of each other, the probability of three heads is equal to the product of the probablities of individual flips.

$$
\begin{equation}
\begin{split}
P(X_1=H \cap X_2=H \cap X_3=H) &= P(X_1=H)P(X_2=H)P(X_3=H)\\
 &= 0.5\times 0.5\times 0.5\\
&= 0.125
\end{split}
\end{equation}
$$
````






