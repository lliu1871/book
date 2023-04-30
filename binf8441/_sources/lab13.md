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
  display_name: R
  language: R
  name: ir
---


# Lab 13: Markov chains

## Discrete time Markov chain
Consider a random walk $\left\{X_n\right\}$ with a finite state space $X_n=\{-1,0,1\}$. The initial state is 0, i.e., $\pi_0=(0,1,0)$. Suppose the one-step transition probability matrix is 

$$P=\left(\begin{array}{ccc}0 & 0.5 & 0.5 \\ 0.5 & 0 & 0.5 \\ 0.1 & 0.1 & 0.8\end{array}\right)$$

We first find the probability distribution of $X_1$ after the first step, i.e., $\pi_1=\pi_0 P$. 

```{code-cell}
pi_0 = c(0,1,0)
pmatrix = matrix(c(0,0.5,0.5,0.5,0,0.5,0.1,0.1,0.8),3,3,byrow=T)
pi_1 = t(pi_0) %*% pmatrix
pi_1
```

The probability distribution of $X_2$ after two steps is given by $\pi_2=\pi_1 P$
```{code-cell}
pi_2 = pi_1 %*% pmatrix
pi_2
```

Similarly, we can find $\pi_n=\pi_0 P^n$. To calculate $P^n$, suppose $\mathrm{P}$ is expressed as $P=E V E^{-1}$ where $E$ is the eigen vector matrix and $V$ is the diagonal matrix of eigen values. Then $P^n=$ $E V^n E^{-1}$.

```{code-cell}
n = 10
x = eigen(pmatrix)
E = x$vectors
V = diag(x$values)
pi_n = t(pi_0) %*% E %*% (V^n) %*% solve(E)
pi_n
```

In addition, we can find the limiting probability distribution $\pi_{\infty}=\left(\begin{array}{lll}a 1 & a 2 & a 3\end{array}\right)$ by solving the equations $\pi_{\infty}=\pi_{\infty} P$ and $\sum \pi_{\infty}=1$. Thus, $\pi_\infty$ is the eigenvector of the transition probability matrix $P$ with the eigenvalue = 1.

```{code-cell}
x
print("the limiting probability distribution")
E[,1]/sum(E[,1])
```

## Continuous time Markov chain
Consider a continuous time Markov chain for two alleles A and a. The initial allele at time 0 is $a$, i.e., $\pi_0 = (1,0)$. Suppose the mutation rate from A to a is 0.1 and the mutation rate from a to A is 0.1. The rate matrix is 

$$Q = \left(\begin{array}{ll} -0.1 & 0.1 \\ 0.1 & -0.1\end{array}\right)$$

We find the transition probability matrix $P(t)=e^{Qt}$. 

```{code-cell}
library(Matrix)
pi_0 = c(1,0)
t = 0.5
qmatrix = matrix(c(-0.1,0.1,0.1,-0.1),2,2)
pmatrix = expm(qmatrix*t)
pmatrix
```
The probability distribution $\pi_t$ of alleles at time $t$ is given by
```{code-cell}
pi_t = t(pi_0) %*% pmatrix
pi_t
```

The limiting probability distribution satisfies the equations $\pi_{\infty}Q=0$ and $\sum \pi_{\infty}=1$. Thus, $\pi_{\infty}$ is the eigenvector of the rate matrix $Q$ with the eigenvalue 0.

```{code-cell}
x = eigen(qmatrix)
x
print("the limiting probabilities")
x$vectors[,1]/sum(x$vectors[,1])
```