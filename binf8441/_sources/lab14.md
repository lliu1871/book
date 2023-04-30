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


# Lab 14: Substitution models

The evolution of a single nucleotide is modeled by a continuous Markov chain which is defined by the initial probability distribution $\pi_0=\left(p_A, p_C, p_G, p_T\right)$ and the rate matrix $Q$. Note that in the rate matrix, the off-diagonal values are substitution rates and the diagonal values are negative numbers because the row sum must be 0 .

## The transition probability matrix $P(t)$
Given the rate matrix $Q$, the transition probability matrix is given by $P(t)=e^{Qt}$. The probability distribution of the nucleotide at time $t$ is $\pi_t=\pi_0 P(t)$. The limiting probability distribution is given by solving the following equations 

$$\left\{\begin{array}{l}\pi_{\infty} Q=0 \\ \sum \pi_{\infty}=1\end{array}\right.$$ 

For the Jukes-Cantor model, the equations are

$$
\left\{\begin{array}{c}
-3 p_A+p_C+p_G+p_T=0 \\
p_A-3 p_C+p_G+p_T=0 \\
p_A+p_C-3 p_G+p_T=0 \\
p_A+p_C+p_G-3 p_T=0 \\
p_A+p_C+p_G+p_T=1
\end{array}\right.
$$

The solution is $\pi_{\infty}=(0.25,0.25,0.25,0.25)$.

### Calculate the transition probability matrix
```{code-cell}
library(Matrix)
pi_0 = c(0.1,0.2,0.3,0.4)
Q_matrix = matrix(1,4,4)
diag(Q_matrix) = -3

print("The rate matrix")
Q_matrix

t = 0.1
P_t = expm(Q_matrix*t)
print("The transition probability matrix")
P_t
```

### Find the probability distribution $\pi_t$ at time $t$
```{code-cell}
pi_t = pi_0 %*% P_t
pi_t
```
### Find the limiting probability distribution $\pi_{\infty}$
```{code-cell}
x = eigen(Q_matrix)
x
pi = x$vectors[,1]
print("The limiting probabilities")
pi/sum(pi)
```
Now changing the rate matrix $Q=\left(\begin{array}{cccc} -6 &    1 &  2  & 3 \\ 1 & -10 & 4 & 5 \\ 2 & 4 & -12 & 6 \\ 3&  5&  6& -14\end{array}\right)$ and recalculating the limiting probability distribution.
```{code-cell}
qmatrix = matrix(c(-6,1,2,3,1,-10,4,5,2,4,-12,6,3,5,6,-14),nrow=4,ncol=4,byrow=T)
x = eigen(t(qmatrix))
x
pi = x$vectors[,1]
print("The limiting probabilities")
pi/sum(pi)
```

## An arbitrary limiting distribution $\pi_{\infty}$
We can show that the rate matrix $Q=\left(\begin{array}{cccc}- & \pi_C a & \pi_G b & \pi_T c \\ \pi_A a & - & \pi_G d & \pi_T e \\ \pi_A b & \pi_C d & - & \pi_T f \\ \pi_A c & \pi_C e & \pi_G f & -\end{array}\right)$ will produce the limiting distribution $\pi_{\infty}=\left(\pi_A, \pi_C, \pi_G, \pi_T\right)$

```{code-cell}
Q_matrix = matrix(1,4,4)
diag(Q_matrix) = -3
Q_matrix[,1] = Q_matrix[,1]*0.1
Q_matrix[,2] = Q_matrix[,2]*0.2
Q_matrix[,3] = Q_matrix[,3]*0.3
Q_matrix[,4] = Q_matrix[,4]*0.4
diag(Q_matrix) = c(-0.9,-0.8,-0.7,-0.6)
Q_matrix

#find the limiting probabilities
x = eigen(t(Q_matrix))
x
pi = x$vectors[,4]
print("The limiting probabilities")
pi/sum(pi)

```

## Simulating DNA sequences
Download and install the simulation program [seq-gen](https://github.com/rambaut/Seq-Gen/releases/tag/1.3.4) on the local computer. Type seq-gen -help in Terminal (Mac) or the CMD window (Windows)
```{code}
seq-gen -help
```

Download the tree file [lab14_tree.tre](https://book.phylolab.net/binf8441/data/lab14_tree.tre) and run the following command line to generate the sequence alignment of 1000 base pairs. 
```{code}
seq-gen -l1000 -mGTR -f 0.1 0.2 0.3 0.4 -r 1.6 1.3 2.5 0.7 3.8 1 lab14_tree.tre > seq.txt
```

