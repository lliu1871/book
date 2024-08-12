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

# Chapter 2: Continuous time Markov chain

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Continuous function Wikipedia](https://en.wikipedia.org/wiki/Continuous_function)
```

## Poisson process
```{Admonition} Postulates
1. $P(X_{t+h} = i+1|X_t=i) = \lambda h + o(h)$
2. $P(X_{t+h} = i|X_t=i) = 1-\lambda h + o(h)$
3. $X_0 = 0$
```
The postulate 1 indicates that $\lim_{h\rightarrow 0^+} \frac{P(X_{t+h} = i+1|X_t=i)}{h} = \lambda$. The goal is to find the probability distribution of $X_t$. From the postulates, we first find the probability $P(X_t=0)$,

$$
\begin{equation}
\begin{split}
P(X_{t+h}=0) &= P(X_h = 0)P(X_t=0) \\ 
&= (1 - \lambda h + o(h)) P(X_t=0)\\
\end{split}
\end{equation}
$$

which indicates the differential equation with the inital condition $X_0 = 0$,

$$P'(X_{t+h}=0) = -\lambda P(X_{t}=0)$$ 

The solution to the differential equation is 

$$P(X_t=0) = e^{-\lambda t}$$

Similarly, we find that $X_t$ follows the Poisson probability distribution 

$$P(X_t=i) = \frac{e^{\lambda t}\lambda^i}{i!}$$

Moreover, the waiting time $t^*$ until the next event follows the exponential distribution

$$f(t^*) = \lambda e^{\lambda t^*}$$



## Pure birth process


## Pure death process



## Birth and death process


## Finite state continuous time Markov chains
```{admonition} Postulates
Suppose the state space is finite, i.e., $S = \{1,2,\dots,n\}$.
1. $P(X_{t+h} = j | X_t = i) = \alpha_{ij}h + o(h)$ for $i\ne j$ and $i,j\in S$
2. $P(X_{t+h} = i | X_t = i) = 1- \sum_j\alpha_{ij}h +o(h)$ for $i\ne j$ and $i,j\in S$
```

Let $Q$ be the rate matrix in which the off-diagonal values are $\alpha_{ij}$ for $i\ne j$ and the diagonal values are $- \sum_j\alpha_{ij}$ for $i\ne j$ and $i,j\in S$. For example, if $n=4$, then the Q matrix is given by

$$
\begin{pmatrix}
-(\alpha_{12}+\alpha_{13}+\alpha_{14}) & \alpha_{12} & \alpha_{13} & \alpha_{14} \\
\alpha_{21} & -(\alpha_{21}+\alpha_{23}+\alpha_{24})  & \alpha_{23} & \alpha_{24} \\
\alpha_{31} & \alpha_{32} & -(\alpha_{31}+\alpha_{32}+\alpha_{34})  & \alpha_{34} \\
\alpha_{41} & \alpha_{42} & \alpha_{43} & -(\alpha_{41}+\alpha_{42}+\alpha_{43})  \\
\end{pmatrix}
$$

From the postulate, we find that the transition probability matrix $P(t+h)$ is given by 

$$P(t+h) = P(h)P(t) = (I-Qh)P(t) + o(h)P(t)$$

and thus

$$P'(t) = QP(t)$$

The solution to this differential equation is 

$$P(t) = e^{Qt}$$


