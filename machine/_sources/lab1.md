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

# Lab 1: Introduction to Python

## Loading data
### Boston data

```{code-cell}
import pandas as pd
import numpy as np

data_url = "http://lib.stat.cmu.edu/datasets/boston"
raw_df = pd.read_csv(data_url, sep="\s+", skiprows=22, header=None)
data = np.hstack([raw_df.values[::2, :], raw_df.values[1::2, :2]])
target = raw_df.values[1::2, 2]
```

#### data dimension

```{code-cell}
print(data.shape)
```

#### subset of data

```{code-cell}
data[:,1]
data[1:3,0:2]
```

### Iris data

```{code-cell}
from sklearn.datasets import load_iris
iris = load_iris()
print(iris.data.shape)
print(iris.target_names)
```

#### The first two features

```{code-cell}
X = iris.data[:, :2]
y = iris.target
```

#### Plot the first two features

```{code-cell}
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn.decomposition import PCA

plt.figure(2, figsize=(8, 6))
plt.clf()

plt.scatter(X[:, 0], X[:, 1], c=y, cmap=plt.cm.Set1,
            edgecolor='k')
plt.xlabel('Sepal length')
plt.ylabel('Sepal width')

x_min, x_max = X[:, 0].min() - .5, X[:, 0].max() + .5
y_min, y_max = X[:, 1].min() - .5, X[:, 1].max() + .5
plt.xlim(x_min, x_max)
plt.ylim(y_min, y_max)
plt.xticks(())
plt.yticks(())

plt.show()
```

#### Plot the first three PCA dimensions

```{code-cell}
fig = plt.figure(1, figsize=(8, 6))
ax = Axes3D(fig, elev=-150, azim=110)
X_reduced = PCA(n_components=3).fit_transform(iris.data)
ax.scatter(X_reduced[:, 0], X_reduced[:, 1], X_reduced[:, 2], c=y,
           cmap=plt.cm.Set1, edgecolor='k', s=40)
ax.set_title("First three PCA directions")
ax.set_xlabel("1st eigenvector")
ax.w_xaxis.set_ticklabels([])
ax.set_ylabel("2nd eigenvector")
ax.w_yaxis.set_ticklabels([])
ax.set_zlabel("3rd eigenvector")
ax.w_zaxis.set_ticklabels([])

plt.show()
```

### Digit data

```{code-cell}
from sklearn.datasets import load_digits
digits = load_digits()
print(digits.data.shape)
print(digits.target)
```

#### Plot an image

```{code-cell}
import matplotlib.pyplot as plt 
plt.gray() 
plt.matshow(digits.images[17]) 
plt.show()
```

## Simulating data


### Generate random numbers [0,1]

```{code-cell}
from random import seed
from random import random

seed(14)
for _ in range(10):
    value = random()
    print(value)
```

### Generate random integers

```{code-cell}
from random import seed
from random import randint
# seed random number generator
seed(1)
# generate some integers
for _ in range(10):
    value = randint(0, 10)
    print(value)
```

### Generating a random sample without replacement

```{code-cell}
# select a random sample without replacement
from random import seed
from random import sample
# seed random number generator
seed(1)
# prepare a sequence
sequence = [i for i in range(20)]
print(sequence)
# select a subset without replacement
subset = sample(sequence, 5)
print(subset)
```

### Generating random numbers from distributions

```{code-cell}
:tags: ["hide-output"]

import random

# seed random number generator
random.seed(1)

# generate some Gaussian values
print("Normal distribution")
for _ in range(10):
    value = random.gauss(0, 1)
    print(value)

# generate uniform    
print("\nUniform")
for _ in range(10):
    value = random.uniform(0, 1)
    print(value)

# generate exponential    
print("\nExponential")
for _ in range(10):
    value = random.expovariate(10)
    print(value)   
    
# generate Gamma  
print("\nGamma")
value = list(range(10))
for i in range(10):
    value[i] = random.gammavariate(1,10)
print(value) 

# generate multivariate normal
print("\nMultivariate normal")
import numpy as np
import matplotlib.pyplot as plt 
from scipy.stats import multivariate_normal

rmvn = np.array([x[:] for x in [[0.1]*2]*10])
for i in range(10):
    rmvn[i,] = multivariate_normal.rvs(mean = [0.5, -0.2], cov=[[2.0, 0.3], [0.3, 0.5]])
print(rmvn)

plt.scatter(rmvn[:,0], rmvn[:,1], s= 30*(rmvn[:,0]**2+rmvn[:,1]**2), c="red", alpha=0.5)
```

### Generate 2D classification points

```{code-cell}
:tags: ["hide-output"]

from sklearn.datasets import make_blobs
from matplotlib import pyplot
from pandas import DataFrame
# generate 2d classification dataset
X, y = make_blobs(n_samples=100, centers=3, n_features=2)
# scatter plot, dots colored by class value
df = DataFrame(dict(x=X[:,0], y=X[:,1], label=y))
colors = {0:'red', 1:'blue', 2:'green'}
fig, ax = pyplot.subplots()
grouped = df.groupby('label')
for key, group in grouped:
    group.plot(ax=ax, kind='scatter', x='x', y='y', label=key, color=colors[key])
pyplot.show()
```

### Generating circle data for classification

```{code-cell}
:tags: ["hide-output"]

from sklearn.datasets import make_circles
from matplotlib import pyplot
from pandas import DataFrame
# generate 2d classification dataset
X, y = make_circles(n_samples=100, noise=0.05)
# scatter plot, dots colored by class value
df = DataFrame(dict(x=X[:,0], y=X[:,1], label=y))
colors = {0:'red', 1:'blue'}
fig, ax = pyplot.subplots()
grouped = df.groupby('label')
for key, group in grouped:
    group.plot(ax=ax, kind='scatter', x='x', y='y', label=key, color=colors[key])
pyplot.show()
```

