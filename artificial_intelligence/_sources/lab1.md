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

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Python Tutorial](https://www.w3schools.com/python/default.asp)
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/kqtD5dpn9C8?si=Oucu0vicsWG8dWtO" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Introduction
Python is a versatile and powerful programming language used in various fields such as web development, data analysis, artificial intelligence, and more. In this tutorial, we'll cover the basics of Python programming for beginners.

### Installation
Before we start, you need to have Python installed on your computer. You can download and install Python from the official website: Python.org

### Getting Started
Once Python is installed, you can start writing and executing Python code using a text editor or an Integrated Development Environment (IDE) such as PyCharm, VSCode, or Jupyter Notebook.

#### Your First Python Program
Let's start with a simple "Hello, World!" program, a tradition for beginners in programming:

```{code-cell}
print("Hello, World!")
```

To run this program, save it with a .py extension (e.g., hello.py), open a terminal or command prompt, navigate to the directory where the file is located, and type python hello.py. You should see the output Hello, World! printed to the console.

#### Basic Syntax
Python syntax is straightforward and easy to read. Here are some basic concepts:

Variables: Used to store data. You can assign values to variables using the = operator.

```{code-cell}
x = 10
name = "Alice"
```

Data Types: Python supports various data types such as integers, floats, strings, lists, tuples, dictionaries, etc.

```{code-cell}
# Integer
age = 25

# Float
height = 5.9

# String
message = "Hello, Python!"

# List
numbers = [1, 2, 3, 4, 5]

# Tuple
coordinates = (10, 20)

# Dictionary
person = {"name": "Alice", "age": 30}
```

Control Structures: Python uses indentation to define code blocks. Common control structures include if-else statements, loops, and functions.

```{code-cell}
# If-else statement
if x > 0:
    print("Positive")
else:
    print("Negative")

# Loop
for i in range(5):
    print(i)

# Function
def greet(name):
    print("Hello,", name)
    
greet("Alice")
```

Example of a recursive function
```{code-cell}
def factorial(x):
    """This is a recursive function
    to find the factorial of an integer"""

    if x == 1:
        return 1
    else:
        return (x * factorial(x-1))


num = 3
print("The factorial of", num, "is", factorial(num))
```

In Python, a lambda function is a special type of function without the function name. For example,
```{code-cell}
# lambda that accepts one argument
greet_user = lambda name : print('Hey there,', name)
greet_user('Delilah')
```

### Python module
As our program grows bigger, it may contain many lines of code. Instead of putting everything in a single file, we can use modules to separate codes in separate files as per their functionality. This makes our code organized and easier to maintain.

Module is a file that contains code to perform a specific task. A module may contain variables, functions, classes etc. Let's see an example,

Let us create a module. Type the following and save it as example.py

```{code} python
# Python Module addition
def add(a, b):
   result = a + b
   return result
```

Here, we have defined a function add() inside a module named example. The function takes in two numbers and returns their sum. We can import the definitions inside a module to another module or the interactive interpreter in Python. We use the import keyword to do this. To import our previously defined module example, we type the following in the Python prompt.

```{code}
import example
```

## Python Object Oriented Programming
Python is a versatile programming language that supports various programming styles, including object-oriented programming (OOP) through the use of objects and classes.

An object is any entity that has attributes and behaviors. For example, a parrot is an object. It has

attributes - name, age, color, etc.
behavior - dancing, singing, etc.
Similarly, a class is a blueprint for that object.

### Python Class and Object
```{code-cell}
class Parrot:

    # class attribute
    name = ""
    age = 0

# create parrot1 object
parrot1 = Parrot()
parrot1.name = "Blu"
parrot1.age = 10

# create another object parrot2
parrot2 = Parrot()
parrot2.name = "Woo"
parrot2.age = 15

# access attributes
print(f"{parrot1.name} is {parrot1.age} years old")
print(f"{parrot2.name} is {parrot2.age} years old")
```

### Python Inheritance
Inheritance is a way of creating a new class for using details of an existing class without modifying it.

The newly formed class is a derived class (or child class). Similarly, the existing class is a base class (or parent class).

```{code-cell}
# base class
class Animal:
    
    def eat(self):
        print( "I can eat!")
    
    def sleep(self):
        print("I can sleep!")

# derived class
class Dog(Animal):
    
    def bark(self):
        print("I can bark! Woof woof!!")

# Create object of the Dog class
dog1 = Dog()

# Calling members of the base class
dog1.eat()
dog1.sleep()

# Calling member of the derived class
dog1.bark();
```

### Python Encapsulation
Encapsulation is one of the key features of object-oriented programming. Encapsulation refers to the bundling of attributes and methods inside a single class.

It prevents outer classes from accessing and changing attributes and methods of a class. This also helps to achieve data hiding.

In Python, we denote private attributes using underscore as the prefix i.e single _ or double __. For example,

```{code-cell}
class Computer:

    def __init__(self):
        self.__maxprice = 900

    def sell(self):
        print("Selling Price: {}".format(self.__maxprice))

    def setMaxPrice(self, price):
        self.__maxprice = price

c = Computer()
c.sell()

# change the price
c.__maxprice = 1000
c.sell()

# using setter function
c.setMaxPrice(1000)
c.sell()
```

We used __init__() method to store the maximum selling price of Computer. Here, notice the code c.__maxprice = 1000

Here, we have tried to modify the value of __maxprice outside of the class. However, since __maxprice is a private variable, this modification is not seen on the output.

As shown, to change the value, we have to use a setter function i.e setMaxPrice() which takes price as a parameter.

### Polymorphism
Polymorphism is another important concept of object-oriented programming. It simply means more than one form.

That is, the same entity (method or operator or object) can perform different operations in different scenarios.

Let's see an example,

```{code-cell}
class Polygon:
    # method to render a shape
    def render(self):
        print("Rendering Polygon...")

class Square(Polygon):
    # renders Square
    def render(self):
        print("Rendering Square...")

class Circle(Polygon):
    # renders circle
    def render(self):
        print("Rendering Circle...")
    
# create an object of Square
s1 = Square()
s1.render()

# create an object of Circle
c1 = Circle()
c1.render()
```

In the above example, we have created a superclass: Polygon and two subclasses: Square and Circle. Notice the use of the render() method.

The main purpose of the render() method is to render the shape. However, the process of rendering a square is different from the process of rendering a circle.

Hence, the render() method behaves differently in different classes. Or, we can say render() is polymorphic.

## Loading data

### Boston data

```{code-cell}
from sklearn.datasets import load_diabetes
X, y = load_diabetes(return_X_y=True)
print(X.shape)
X[:,1]
X[1:3,0:2]
```

### Iris data

```{code-cell} ipython3
from sklearn.datasets import load_iris
iris = load_iris()
```

```{code-cell} ipython3
print(iris.data.shape)
print(iris.target_names)
```

#### The first two features

```{code-cell} ipython3
X = iris.data[:, :2]
y = iris.target
```

#### Plot the first two features

```{code-cell} ipython3
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

```{code-cell} ipython3
fig = plt.figure(1, figsize=(8, 6))
ax = Axes3D(fig, elev=-150, azim=110)
X_reduced = PCA(n_components=3).fit_transform(iris.data)
ax.scatter(X_reduced[:, 0], X_reduced[:, 1], X_reduced[:, 2], c=y,
           cmap=plt.cm.Set1, edgecolor='k', s=40)
ax.set_title("First three PCA directions")
ax.set_xlabel("1st eigenvector")
ax.xaxis.set_ticklabels([])
ax.set_ylabel("2nd eigenvector")
ax.yaxis.set_ticklabels([])
ax.set_zlabel("3rd eigenvector")
ax.zaxis.set_ticklabels([])

plt.show()
```

### Digit data

```{code-cell} ipython3
from sklearn.datasets import load_digits
digits = load_digits()
print(digits.data.shape)
print(digits.target)
```

#### Plot an image

```{code-cell} ipython3
import matplotlib.pyplot as plt 
plt.gray() 
plt.matshow(digits.images[17]) 
plt.show()
```

## Simulating data


### Generate random numbers [0,1]

```{code-cell} ipython3
from random import seed
from random import random

seed(14)
for _ in range(10):
    value = random()
    print(value)
```

### Generate random integers

```{code-cell} ipython3
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

```{code-cell} ipython3
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

```{code-cell} ipython3
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

```{code-cell} ipython3
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

```{code-cell} ipython3
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
