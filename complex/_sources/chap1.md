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

# Chapter 1: Complex Numbers

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Limits at Wikipedia](https://en.wikipedia.org/wiki/Limit_(mathematics))
- [Youtube lecture on limits](https://www.youtube.com/watch?v=YNstP0ESndU)
```

## The complex number system

````{prf:definition} Group
:nonumber:
:label: group
A group $(G,*)$ is a set $G$ equipped with a binary operation $*$ satisfying the following properties: 
1. associative law: $(a*b)*c=a*(b*c)$. 
2. neutral element $e$: $a*e=e*a=a$. 
3. inverse: every element a has an inverse $a^{-1}$ such that $a*a^{-1}=a^{-1}*a=e$.
````

```{code-cell}
:tags: ["hide-input"]
note = "Python syntax"
print(note)
```

````{prf:example} 1.1
:nonumber:
:label: ex.1
Show that if the set has a left neutral element and a right neutral element, they must coincide. 

Proof: Let $e∈G$ and $w∈G$ be the left and right neutral element, respectively. For all element a∈G, we have $e*a=a=a*w$. Thus, $e=e*w=w$.
````

````{prf:example} 1.2
:nonumber:
:label: ex.2
Show that a set provided with an associative binary operation can have at most one neutral element. 

Proof:  $e=e*w=w$

````

````{prf:example} 1.3
:nonumber:
:label: ex.3
Show that if a set has an associative binary operation with neutral element, then any element of the set has at most one inverse.

Proof: We first show that the left inverse is equal to the right inverse. Let $b∈G$ and $c∈G$ be the left and right inverse of $a∈G$. We have $a*b=e=c*a$ and $b=e*b=c*a*b=c*e=c$.
````

````{prf:definition} Abelian group
A group is called Abelian if it is commutative, i.e., for all elements x,y∈G holds x*y=y*x. (commutative law)
````

````{prf:definition} Field
A field $(F,+,∙)$ is a set $F$ provided with two binary operations $+$ and $∙$, such that $(F,+)$ is an Abelian group. If 0 denotes the neutral element of this group, also $(F\backslash \{0\} ,∙)$ is an Abelian group. In addition, the distributive laws $(x + y)·z = x·z + y·z$ and $x·(y+z) = x·y+x·z$ hold for all elements $x,y,z ∈ F$ . It is usual to denote the neutral element of $(F \backslash {0},·)$ by $1$.
````

````{prf:definition} Complex numbers
Definition: The complex numbers are pairs of real numbers, $\mathbb{C} := \{(x, y) : x, y \in \mathbb{R} \}$, equipped with the addition $(x, y) + (a, b) := (x + a, y + b)$ and the multiplication  $(x,y)\cdot (a,b) = (xa-yb, xb+ya)$.
````
The fact that the Euclidean plane can be made into a field is extremely useful in all areas of mathematics and its applications. Since we live in a 3-dimensional (at least) world, it would, from the point of view of applications, be very useful if we could make 3-dimensional space into a field as well. In the early part of the nineteenth century, this is exactly what the famous Irish mathematician
W. R. Hamilton tried, unsuccessfully, to do.



