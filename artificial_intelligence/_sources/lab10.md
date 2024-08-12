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
# Lab 10: Local Models

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Self-organizing map at Wikipedia](https://en.wikipedia.org/wiki/Self-organizing_map)
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?si=tekpYfpREEoEQpFq&amp;list=PLd5v0YmZlgWYfFd_Oo0o0YHbFLBOizZLp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Self Organizing Maps
A Self-Organizing Map (SOM), also known as Kohonen map, is a type of artificial neural network used for unsupervised learning. It is particularly useful for visualizing and organizing high-dimensional data into a lower-dimensional representation. Here's a brief overview of how SOMs work:

1. Initialization: Initialize a grid of neurons, where each neuron is associated with a weight vector of the same dimensionality as the input data.

2. Training: Iterate through the dataset multiple times (epochs). For each input data point:
    - Compute the similarity between the input data point and the weight vectors of all neurons.
    - Identify the neuron with the closest weight vector to the input data point. This neuron is called the "winner".
    - Update the weight vectors of neighboring neurons to the winner according to a neighborhood function, which decreases with distance from the winner. This encourages nearby neurons to become more similar to the input data point.
    - Update the learning rate and neighborhood size over time to gradually reduce the influence of distant neurons.
3. Visualization: After training, visualize the SOM by plotting the weight vectors in the SOM grid. This can reveal patterns and clusters in the data, as neighboring neurons tend to have similar weight vectors if they represent similar data points.

Here's a simple example of how you can implement a Self-Organizing Map in Python using the MiniSom library:

```{code-cell}
# Import necessary libraries
import numpy as np
from minisom import MiniSom
import matplotlib.pyplot as plt

# Load the data
data = np.random.rand(100, 2)  # Example random data
print(data)
```

```{code-cell}
# Define the size of the SOM grid
grid_size = 10
som = MiniSom(grid_size, grid_size, 2, sigma=0.3, learning_rate=0.5)  # Initialization of the SOM

# Training the SOM
som.train_batch(data, 1000)  # Training with 1000 iterations
```

```{code-cell}
# Visualizing the results
plt.figure(figsize=(8, 8))
plt.pcolor(som.distance_map().T, cmap='bone_r')  # plotting the distance map as background
plt.colorbar()

# Plotting data points on the map
for i, x in enumerate(data):
    w = som.winner(x)
    plt.plot(w[0]+0.5, w[1]+0.5, 'o', markeredgecolor='k', markerfacecolor='None', markersize=10, markeredgewidth=2)
plt.show()
```
### An example
```{code-cell} ipython3
from minisom import MiniSom   
data = [[ 0.80,  0.55,  0.22,  0.03],
        [ 0.82,  0.50,  0.23,  0.03],
        [ 0.80,  0.54,  0.22,  0.03],
        [ 0.80,  0.53,  0.26,  0.03],
        [ 0.79,  0.56,  0.22,  0.03],
        [ 0.75,  0.60,  0.25,  0.03],
        [ 0.77,  0.59,  0.22,  0.03]]    

som = MiniSom(6, 6, 4, sigma=0.5, learning_rate=0.5)
som.train_batch(data, 100)

# Visualizing the results
plt.figure(figsize=(8, 8))
plt.pcolor(som.distance_map().T, cmap='bone_r')  # plotting the distance map as background
plt.colorbar()
```

### Iris data
```{code-cell} ipython3
from minisom import MiniSom
from sklearn import datasets
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

data = np.genfromtxt('./iris.csv', delimiter=',', usecols=(0, 1, 2, 3),skip_header=1)
# data normalization
data = np.apply_along_axis(lambda x: x/np.linalg.norm(x), 1, data)
print(data)
```

```{code-cell}
# Initialization and training
som = MiniSom(7, 7, data.shape[1], sigma=3, learning_rate=0.5, neighborhood_function='triangle')

som.pca_weights_init(data)
print("Training...")
som.train_batch(data, 1000, verbose=True)  # random training
print("\n...ready!")
```

```{code-cell}
plt.figure(figsize=(7, 7))
# Plotting the response for each pattern in the iris dataset
plt.pcolor(som.distance_map().T, cmap='bone_r')  # plotting the distance map as background
#plt.colorbar()

target = np.genfromtxt('./iris.csv', delimiter=',', usecols=(4), dtype=str,skip_header=1)
t = np.zeros(len(target), dtype=int)
t[target == 'setosa'] = 0
t[target == 'versicolor'] = 1
t[target == 'virginica'] = 2

# use different colors and markers for each label
markers = ['o', 's', 'D']
colors = ['C0', 'C1', 'C2']
for cnt, xx in enumerate(data):
    w = som.winner(xx)  # getting the winner
    # palce a marker on the winning position for the sample xx
    plt.plot(w[0]+.5, w[1]+.5, markers[t[cnt]], markerfacecolor='None',
             markeredgecolor=colors[t[cnt]], markersize=12, markeredgewidth=2)
plt.axis([0, 7, 0, 7])
plt.show()

```
