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


# Lab 3: Multivariate Methods

## Parameter Estimation
Let $𝑋={𝑋_1,…,𝑋_𝑃}$ be a $p$-dimension point. The mean vector is $\mu=𝐸(𝑋)$ and the covariance matrix is $Σ_{𝑝×𝑝}$

### Two normal distributions with different mean and covariance matrix
```{code-cell}
library(MASS)
sigma1 = matrix(2,2,2)
sigma1[1,2] = sigma1[2,1]=0.5
bvn1 = mvrnorm(100, mu=c(3,4), Sigma=sigma1)

sigma2 = matrix(1,2,2)
sigma2[1,2] = sigma2[2,1] = 0.5
bvn2 = mvrnorm(100, mu=c(7,8), Sigma=sigma2)

plot(bvn1,xlim=c(0,12),ylim=c(0,12),col="blue",xlab="X",ylab="Y")
points(bvn2,col="red")
```

The mean vector $\mu$ can be estimated by the sample average

```{code-cell}
bvn1_average = apply(bvn1,2,mean)
bvn2_average = apply(bvn2,2,mean)
print("the first group")
bvn1_average
print("the second group")
bvn2_average
```

The covariance matrix can be estimated by the sample covariance matrix

```{code-cell}
bvn1_cov = cov(bvn1)
bvn2_cov = cov(bvn2)

print("the first group")
bvn1_cov
print("the second group")
bvn2_cov
```

### Two classes may have a common covaraince matrix

```{code-cell}
sigma = matrix(1,2,2)
sigma[1,2] = sigma[2,1]=0.5

bvn1 = mvrnorm(100, mu=c(3,4), sigma)
bvn2 = mvrnorm(100, mu=c(7,8), sigma)

plot(bvn1,xlim=c(0,12),ylim=c(0,12),col="blue",xlab="X",ylab="Y")
points(bvn2,col="red")
```

The covariance matrix is estimated by the sample covariance of the pooled data

```{code-cell}
pooldata = rbind(bvn1-mean(bvn1),bvn2-mean(bvn2))
bvn1_cov = cov(pooldata)

print("The pooled covariance matrix")
bvn1_cov
```

### Diagnal covariance matrix
In this case, the coordinate random variables $X_1,...X_p$ are independently distributed with a normal distribution

```{code-cell}
sigma = matrix(1,2,2)
sigma[1,2] = sigma[2,1]= 0
sigma[2,2] = 4

bvn1 = mvrnorm(100, mu=c(3,4), sigma)
bvn2 = mvrnorm(100, mu=c(7,8), sigma)

plot(bvn1,xlim=c(0,12),ylim=c(0,12),col="blue",xlab="X",ylab="Y")
points(bvn2,col="red")
```

### Independent random variables with a common variance

```{code-cell}
sigma = matrix(1,2,2)
sigma[1,2] = sigma[2,1]= 0

bvn1 = mvrnorm(100, mu=c(3,4), sigma)
bvn2 = mvrnorm(100, mu=c(7,8), sigma)

plot(bvn1,xlim=c(0,12),ylim=c(0,12),col="blue",xlab="X",ylab="Y")
points(bvn2,col="red")
```

## Estimation of Missing Values
Values of certain variables may be missing in data. For example, the first 10 values of the first column of bvn1 are missing

```{code-cell}
:tags: ["hide-output"]
bvn1[1:10,1] = NA
bvn1
```
We fill in the missing entries by estimating them, i.e., imputation. In the main imputation, missing values are replaced by the average of the available data

```{code-cell}
bvn1[1:10,1] = mean(bvn1[,1],na.rm=T)
bvn1[1:10,1]
```
In imputation by regression, missing values are predicted by linear regression

```{code-cell}
x = bvn1[-(1:10),]
reg = lm(x[,1]~x[,2])
bvn1[1:10,] = reg$coef[1]+bvn1[1:10,2]*reg$coef[2]
bvn1[1:10,1]
```

## Multivariate Classification

Let $\{C_i: i=1,...,k\}$ be the $k$ classes. The points in the class $C_i$ follow the multivariate normal distribution with mean vector $\mu_i$ and covariance matrix $\Sigma_i$. 
 
Given the training data $X_i$ in class $C_i$, the mean vector and covariance matrix can be estimated by the sample average $\bar{X}_i$ and sample covariance matrix $S_i$

```{code-cell}
sigma1 = matrix(2,2,2)
sigma1[1,2] = sigma1[2,1]=0.5
bvn1 = mvrnorm(100, mu=c(3,4), Sigma=sigma1)

sigma2 = matrix(1,2,2)
sigma2[1,2] = sigma2[2,1] = 0.5
bvn2 = mvrnorm(100, mu=c(7,8), Sigma=sigma2)

bvn1_average = apply(bvn1,2,mean)
bvn2_average = apply(bvn2,2,mean)

bvn1_cov = cov(bvn1)
bvn2_cov = cov(bvn2)
```

Let $P(C_i): i=1,...k$ be the prior probabilities of the k classes. Given the training data $X$, the probablity $P(C_i)$ can be estimated by the proportion of points in the class $C_i$

The Bayes classifier is given by the posterior probability $g_i(x) = logf(x|C_i) + log(C_i)$. We substitute the mean vector, covariance matrix, and prior probabilties with their estimates. The posterior probability of the class $C_i$ is 

$$g_i(x) = -\frac{1}{2}(x-\bar{X}_i)^TS_i^{-1}(x-\bar{X}_i)+\hat{P}(C_i)$$

The Bayes classification is that $x\in C_i$ if $g_i(x) > g_j(x)$ for $i,j = 1,...,k$ and $j\ne i$ 

```{code-cell}
x = rbind(bvn1,bvn2)
g1 = -0.5*diag((x-bvn1_average)%*%solve(bvn1_cov)%*%t(x-bvn1_average))+0.5
g2 = -0.5*diag((x-bvn2_average)%*%solve(bvn2_cov)%*%t(x-bvn2_average))+0.5
print("first class")
which(g1>g2)
print("second class")
which(g1<g2)

print("two misclassified points")
x[which(g1[101:200]>g2[101:200]),]
```

### Two classes have a common covariance matrix


If two classes have a common covariance matrix $S$, the posterior probability of the class $C_i$ is

$$g_i(x) = -\frac{1}{2}(x-\bar{X}_i)^TS^{-1}(x-\bar{X}_i)+\hat{P}(C_i)$$

When $g_i(x)$ is compared with $g_j(x)$, the quadratic term $x^TS^{-1}x$ cancels because it is common in all posterior probabilities of classes. Thus, it becomes a linear discriminant

$$g_i(x) = \bar{X}_i^TS^{-1}x -\frac{1}{2}\bar{X}_i^TS^{-1}\bar{X}_i + \hat{P}(C_i)$$

The Bayes classification is that $x\in C_i$ if $g_i(x) > g_j(x)$ for $i,j = 1,...,k$ and $j\ne i$

```{code-cell}
pooldata = rbind(bvn1-mean(bvn1),bvn2-mean(bvn2))
bvn1_cov = bvn2_cov = cov(pooldata)

m1 = 0.5*bvn1_average%*%solve(bvn1_cov)%*%bvn1_average
m2 = 0.5*bvn2_average%*%solve(bvn1_cov)%*%bvn2_average

x = rbind(bvn1,bvn2)
g1 = bvn1_average%*%solve(bvn1_cov)%*%t(x) - c(m1,m1) + 0.5
g2 = bvn2_average%*%solve(bvn2_cov)%*%t(x) - c(m2,m2) + 0.5
print("first class")
which(g1>g2)
print("second class")
which(g1<g2)

print("two misclassified points")
x[which(g1[101:200]>g2[101:200]),]
```

### Regularized discriminant analysis


Let $S_i$ be the sample covaraince matrix for class $i$ and let $S$ be the covariance matrix of the pool data. The covariance matrix is written as a weighted average of the three special cases

$$w(\lambda) = \lambda S + (1-\lambda) S_i$$
$$v(\lambda,\gamma) = (1-\gamma)w(\lambda) + \gamma\frac{1}{p}tr(w(\lambda))I$$

When $\lambda=\gamma=0$, it is a quadratic classifier. 

When $\lambda=1$ and $\gamma=0$, it is a linear classifier. 

When $\lambda=0$ and $\gamma=1$, the covariance matrices are diagonal with $\sigma^2$ and it is the nearest mean classifier. 

When $\lambda=1$ and $\gamma=1$, the covariance matrices are diagonal with the same variance. 

The choice of $\lambda$ and $\gamma$ can be optimized by cross-validation

```{code-cell}
:tags: ["hide-output"]
library(mlbench)
library(caret)
library(glmnet)
library(klaR)

data(Sonar)
Sonar
```

Regularized Discriminant Analysis 

```{code-cell}
set.seed(1337)
cv_5_grid = trainControl(method = "cv", number = 5)

fit_rda_grid = train(Class ~ ., data = Sonar, method = "rda", trControl = cv_5_grid)
fit_rda_grid

plot(fit_rda_grid)
```


