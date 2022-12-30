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

# Chapter 14: Substitution models

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [substitution models](https://en.wikipedia.org/wiki/Substitution_model)
```
The substitution model is a continuous time Markov chain describing how a single nucleotide evolves over a continuous time $t$. Let $X_t$ be the nucleotide at time $t$. The state space is finite, i.e., $(A,C,G,T)$. Let $\pi_t = \left(\pi_t(A),\pi_t(C),\pi_t(G),\pi_t(T)\right)$ be the probability distribution of $X_t$. 

```{admonition} Goal
Our goal is to find $\pi_t$ and the limiting probability distribution $\pi_\infty$ as time $t$ goes to infinity.
```

## Transition probability matrix
The transition probabilities $P(t)$ for nucleotides is a 4
by 4 matrix, in which $P_{ij}(t)$ is the probability that nucleotide $i$
changes to nucleotide $j$ in time $t$, where $i,j=A,C,G,T$.

$$P(t) = \begin{pmatrix}
P_{AA}(t),\ P_{AC}(t),\ P_{AG}(t),P_{AT}(t) \\
P_{CA}(t),\ P_{CC}(t),\ P_{CG}(t),P_{CT}(t) \\
P_{GA}(t),\ P_{GC}(t),\ P_{GG}(t),P_{GT}(t) \\
P_{TA}(t),\ P_{TC}(t),\ P_{TG}(t),P_{TT}(t)\  \\
\end{pmatrix}$$

Given the transition probability matrix $P(t)$, the probability distribution $\pi_t$ of
$X_{t}$ is equal to the initial probability $\pi_0$ at time 0 multiplied by the transition probability matrix $P(t)$,

$$
\pi_t = \pi_0P(t)
$$ 

The transition probability matrix $P(t)$ can be derived from the
transition rate matrix $Q$

$$P(t) = e^{Qt}$$

The limiting probability distribution $\pi_\infty$ can be found by solving the equations

$$
\begin{equation} 
\begin{cases}
\pi_\infty Q = 0 \\ 
\sum_{j}^{}\pi_{j} = 1
\end{cases}
\end{equation}
$$

## Transition rate matrix

The rate matrix $Q$ describes
the rate at which nucleotides of one type mutate to nucleotides of
another type, i.e., $Q_{ij}$ for $i \neq j$ is the substitution rate at which
nucleotide $i$ mutates to nucleotide $j$. The diagonals of the $Q$ matrix are
chosen so that the rows sum to zero. Since the diagonal values are determined, they are often replaced by a dash in the $Q$ matrix.

### Jukes-Cantor model
The Jukes-Cantor model is the simplest substitution model. It assumes that all nucleotide
transitions have the same rate $u$, 

$$Q = \begin{pmatrix}
- & u & u & u \\
u & - & u & u \\
u & u & - & u \\
u & u & u & - \\
\end{pmatrix}$$

For $i,j = \{ A,C,G,T\}$, the transition probabilities for the Jukes-Cantor model are given by eq(3), 

$$P_{ij}(t) = \left\{ \begin{matrix}
\frac{1}{4} + \frac{3}{4}e^{- tu},\ for\ i = j \\
\frac{1}{4} - \frac{1}{4}e^{- tu},\ for\ i \neq j \\
\end{matrix} \right.\ $$

For the Jukes-Cantor model, the limiting probabilities are
$\lim_{t \rightarrow \infty}{P_{ij}(t)} = 1/4$ for all i and j. 
Thus, the limiting probabilities are

$$\pi_{A} = \pi_{C} = \pi_{G} = \pi_{T} = \frac{1}{4}$$

It can be verified that $\pi Q = 0$ and $\sum_{j}^{}\pi_{j} = 1$.


## General time reversible model
The general time reversible (GTR) model assumes that all transitions have distinct rates and the rate matrix $Q_0$ is given by

$$
Q_0 = \begin{pmatrix}
 - & \alpha & \beta & \gamma \\
\alpha & - & \phi & \omega \\
\beta & \phi &  - & \sigma \\
\gamma & \omega & \sigma & - \\
\end{pmatrix}
$$

The transition probability matrix P(t) can be derived from equ(3) and the limiting probabilities can be found by solving the equations in (4). Because the rate matrix $Q_0$ is symmetric, the limiting probabilities are always equal to $1/4$. The $Q$ matrix must be modified in order to produce arbitrary limiting probabilities.

It can be shown that the limiting probabilities of the Markov chain with
the following rate matrix $Q$ are $\pi_\infty=\left(\pi_A,\pi_C,\pi_G,\pi_T\right)$.

$$
Q=\begin{pmatrix}
-&\pi_C\alpha&\pi_G\beta&\pi_T\gamma\\
\pi_A\alpha&-&\pi_G\phi&\pi_T\omega\\
\pi_A\beta&\pi_C\phi&-&\pi_T\sigma\\
\pi_A\gamma&\pi_C\omega&\pi_G\sigma&-\\
\end{pmatrix}
$$

The general time reversible model for nucleotides consists of 9 free
parameters, including the limiting probabilities
$(\pi_{A},\pi_{C},\pi_{G},\pi_{T})$ and 6 rate parameters
$(\alpha,\beta,\gamma,\phi,\omega,\sigma)$. 

## Applications

Substitution models can be used to calculate distance between two DNA
sequences. A simple distance measure (called p-distance) between two sequences is defined as
the proportion of different nucleotides. For example, the p-distance of
the following two sequences is 1/5.

$$
\begin{align*}
AAAAA\\
AAATA
\end{align*}
$$

```{caution}
The p-distance does not consider multiple mutations and
may underestimate the distance between two sequences.
```

By contrast, the distance measures derived from substitution models can
make a correction for multiple mutations. Considering the Jukes-Cantor
model, in which the transition probabilities are given by

$$P_{ij}(t) = \left\{ \begin{matrix}
\frac{1}{4} + \frac{3}{4}e^{- ut},\ for\ i = j \\
\frac{1}{4} - \frac{1}{4}e^{- ut},\ for\ i \neq j \\
\end{matrix} \right.\ $$

The probability of different nucleotides is
$p = \frac{3}{4} - \frac{3}{4}e^{- ut}$, from which we find the 
evolutionary distance $d$,


$$d = \frac{3ut}{4} = - \frac{3}{4}log(1 - \frac{4p}{3})$$

The transition probability matrix $P(t)$ and limiting probabilities
$(\pi_{A},\pi_{C},\pi_{G},\pi_{T})$ will be used to derive the
likelihood function for phylogenetic models.