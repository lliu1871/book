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
# Lab 3: Multivariate Methods

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Multivariate analysis at Wikipedia](https://en.wikipedia.org/wiki/Multivariate_statistics)
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ui2El5CZPRE?si=K0AJpMmDF-HHpVRQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Parameter Estimation
Let $𝑋={𝑋_1,…,𝑋_𝑃}$ be a $p$-dimension point. The mean vector is $\mu=𝐸(𝑋)$ and the covariance matrix is $Σ_{𝑝×𝑝}$

### Two normal distributions with different mean vectors and covariance matrix

```{code-cell} 
import numpy as np
import matplotlib.pyplot as plt
mean = [0, 0]
cov = [[1, 0], [0, 100]]  # diagonal covariance
x, y = np.random.multivariate_normal(mean, cov, 5000).T
plt.plot(x, y, 'x')
plt.axis('equal')
plt.show()
```

The mean vector 𝜇 can be estimated by the sample average

```{code-cell} 
print(x.mean())
print(y.mean())
```

The covariance matrix can be estimated by the sample covariance matrix

```{code-cell} 
print(np.cov([x,y]))
```

### Two classes may have a common covaraince matrix

```{code-cell} 
cov = [[1, 0.5], [0.5, 1]]  # diagonal covariance
x1, y1 = np.random.multivariate_normal([3,4], cov, 100).T
x2, y2 = np.random.multivariate_normal([7,8], cov, 100).T
plt.plot(x1,y1,'x')
plt.plot(x2,y2,'o')
plt.axis('equal')
plt.show()
```

The covariance matrix is estimated by the sample covariance of the pooled data

```{code-cell}
x = np.concatenate((x1-x1.mean(),x2-x2.mean()))
y = np.concatenate((y1-y1.mean(),y2-y2.mean()))
print(np.cov([x,y]))
```

### The off-diagonal values of the common covariance matrix are 0 
In this case, the coordinate random variables $X_1,...X_p$ are independently distributed with a normal distribution

```{code-cell} 
cov = [[1, 0.0], [0.0, 1]]  # diagonal covariance
x1, y1 = np.random.multivariate_normal([3,4], cov, 100).T
x2, y2 = np.random.multivariate_normal([7,8], cov, 100).T
plt.plot(x1,y1,'x')
plt.plot(x2,y2,'o')
plt.axis('equal')
plt.show()
```

## Estimation of Missing Values
Values of certain variables may be missing in data. For example, the first 10 values of the first column of bvn1 are missing

```{code-cell} 
x1[:10] = np.nan
print(x1)
```

We fill in the missing entries by estimating them, i.e., imputation. In the main imputation, missing values are replaced by the average of the available data

```{code-cell} 
x1[:10] = x1[~np.isnan(x1)].mean()
print(x1)
```

In imputation by regression, missing values are predicted by linear regression

```{code-cell} 
from sklearn.linear_model import LinearRegression as lr
x = x1[10:]
y = y1[10:]
LR = lr()
reg = LR.fit(y.reshape(-1, 1), x)
x1[:10] = LR.intercept_+LR.coef_ * y1[:10]
print(x1)
```

## Multivariate Classification
Let $\{C_i: i=1,...,k\}$ be the $k$ classes. The points in the class $C_i$ follow the multivariate normal distribution with mean vector $\mu_i$ and covariance matrix $\Sigma_i$. 

Given the training data $X_i$ in class $C_i$, the mean vector and covariance matrix can be estimated by the sample average $\bar{X}_i$ and sample covariance matrix $S_i$

```{code-cell} 
cov = [[2, 0.5], [0.5, 2]]  # diagonal covariance
x1, y1 = np.random.multivariate_normal([3,4], cov, 100).T

cov = [[1, 0.5], [0.5, 1]]  # diagonal covariance
x2, y2 = np.random.multivariate_normal([7,8], cov, 100).T

bvn1_average = [x1.mean(),y1.mean()]
bvn2_average = [x2.mean(),y2.mean()]

bvn1_cov = np.cov([x1,y1])
bvn2_cov = np.cov([x2,y2])

print(bvn1_average)
print(bvn2_average)
print(bvn1_cov)
print(bvn2_cov)
```

Let $P(C_i): i=1,...k$ be the prior probabilities of the k classes. Given the training data $X$, the probablity $P(C_i)$ can be estimated by the proportion of points in the class $C_i$

The Bayes classifier is given by the posterior probability $g_i(x) = logf(x|C_i) + log(C_i)$. We substitute the mean vector, covariance matrix, and prior probabilties with their estimates. The posterior probability of the class $C_i$ is 

$$g_i(x) = -\frac{1}{2}(x-\bar{X}_i)^TS_i^{-1}(x-\bar{X}_i)+\hat{P}(C_i)$$

The Bayes classification is that $x\in C_i$ if $g_i(x) > g_j(x)$ for $i,j = 1,...,k$ and $j\ne i$ 

```{code-cell} 
x = np.concatenate((x1,x2))
y = np.concatenate((y1,y2))
class1 = []

for i in range(200):
  g1 = -0.5*((np.array([x[i],y[i]])-bvn1_average).dot(np.linalg.inv(bvn1_cov)).dot((np.array([x[i],y[i]])-bvn1_average).transpose()))+0.5
  g2 = -0.5*((np.array([x[i],y[i]])-bvn2_average).dot(np.linalg.inv(bvn2_cov)).dot((np.array([x[i],y[i]])-bvn2_average).transpose()))+0.5

  if g1>g2:
    class1.append(1)
  else:
    class1.append(2)

miss1 = 0
for x in class1[:100]:
  if x == 2:
    miss1 = miss1+1

print(miss1/100)

miss2 = 0
for x in class1[100:]:
  if x == 1:
    miss2 = miss2+1
print(miss2/100)
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
# grid search shrinkage for lda
from numpy import arange
from sklearn.datasets import make_classification
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
# define dataset
X, y = make_classification(n_samples=1000, n_features=10, n_informative=10, n_redundant=0, random_state=1)
```

```{code-cell} 
# define model
model = LinearDiscriminantAnalysis(solver='lsqr')
# define model evaluation method
cv = RepeatedStratifiedKFold(n_splits=10, n_repeats=3, random_state=1)
# define grid
grid = dict()
grid['shrinkage'] = arange(0, 1, 0.01)
# define search
search = GridSearchCV(model, grid, scoring='accuracy', cv=cv, n_jobs=-1)
# perform the search
results = search.fit(X, y)
```

```{code-cell} 
# summarize
print('Mean Accuracy: %.3f' % results.best_score_)
print('Config: %s' % results.best_params_)
```
