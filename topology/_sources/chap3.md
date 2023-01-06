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

# Chapter 3: Subspaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Subspaces at Wikipedia](https://en.wikipedia.org/wiki/Subspace_topology)
```
<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T17:44:50.870Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;ln_as4suOl2BDN0v1m3F\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;R2lEEEUBdFMjLlhIrx00\&quot; name=\&quot;Page-1\&quot;&gt;5Vvfc6I6FP5rfKwD+YH42NZ278Pt3N7p7OzdxwgRadG4IVbdv/6GkggEVFSwuJ3pjORwQsh3Ts75ckh78H62/sbJYvrEfBr1gOWve3DUA8BGEMmfRLJJJQOEU0HAQ18pZYKX8DdVQktJl6FP44KiYCwS4aIo9Nh8Tj1RkBHO2aqoNmFRcdQFCWhJ8OKRqCz9EfpimkpdbGXyv2gYTPXItqXuzIhWVoJ4Sny2KojoWjyyuVCv+Ez5jMzpXMg7T4S/Ud7DD1Mhkpne9sCj/Jsk2v2AsSCiZBHGfY/NpNiLpcrjhMzCKIE596A79SA5HHzowXvOmEivZut7GiW20mZI3+lxx90tDjx5bp0Ov9HgVzhaLb+//v55H96+vb9Obmw3fcw7iZYKYAWO2GjEqS8NoJqMiykL2JxED5n0jrPl3KfJOJZsZTp/M7aQQlsKX6kQG+VNZCmYFE3FLFJ3y3NR04vZknt03wSUCxIeULFPb6As7BfcS0H1jbIZFXwjFTiNiAjfi95GlEcEW70MaHmhsD4Cd4S+CO4Idgp3uwJ2J5ITuCNSPOV08iF1fi2TZXkXL8fxgni0/4EZgLqdacirIPkVbMEiFoQyUCXwKaUoVXkkWq1k5MyEiT1W01DQl4/OcLSSAbxorkkYRfdyGP7RF05cj3pe8pqCszeauzN2McLWPgO/Uy7oeq9F1F3gqOCoEoY9VO1VFn5tHUCnudCr+zVvRKcTi0dCyjf/qf4fjZ9Jow+wbo/W+bujjWqdvupgzVUHml50quszCz+yoXINBIquAW3D5OmLql6Z1W85J5uc2iJRiHePA4eGCw5wMdUd0IdWQV9epG+QueAWk9O9EpacUsWETck5JfNYJJdTuibS56RLLCgP5QtQnkmftQjUCQxrqrlaRaDwMXV9VBUoXDCGjtNQoHBx0UpOOVAMKuIEbCtO1AgTgYwCi/pz39JaMtZPsPZiggxPBBWYuBWYAHMlNQYKKIGSJbVPz037rFjbD29QEfMbuybmoC3My2Tvi4UGZHAIUGESp8IkqLVVYHWCQpzOBPR+5vDGZ9g0FzgP+HKa/EOB1xPrCvD4ywDfNO4ncVYEDQ5qlmeO02+Hs2pMDTZARbNcYDIB1VzAd8YObop+DkzSX7FPtS6ZZHTozaHrRSxe8oap1kXghaZ/Dj6Z3ev4lUNXLijJjOTsrw9egA7DW0Va24O3GxXKXUWWQzUWug5F0u3G6ls2UIK0q+0MVDvrmzTyXZ9zpPu8kg2ombVQK1mrnGZMJj4wHGhHyaaxKknHifdhduFexlDYiLdI1bC2j0g97+za2q5x2q2VVdXhr8oLGt9V1bMONIvqLXmBHqdVL8AdSTEqVdgyU8BCphhauIuZwmnF93a7TNM5AJQLs1e768BG0XtL0vK0GPRxmbm1V9sqf9O/3m0HHg76RYRhxffHqtpha8wYd6OSsg1bhZAFOxmyQOMh67wVUt6YX/HWEZtfO/WJrs/amcM6Nd65f5ucBpMtLyJxHHpFJIvLQ/u62vcpb7f3evoZXl23gpgDGFcArGXnckDbsK9puB0csLz3wwbVNz94NfS5fpsDjXHa3VIcSSZjGsykZ+RD8mk+WYy/+6Pv6T6pa4mNVb8v47sQ70jeR/uuZTzIpE8t1y1QR5K+Lodlda2sJubig1WxpNVc+kcdO49knvtBNZ3k6PNIxrknBN29zntAv52AiMpZeEziML5ChmPvSCiHGE5rWyxU3sFeK7Yme9x+h8xje8ntKy5/k/zUSHvs6c6MqzqFctJ+tvo5+zL7MnEZW0UfwybxbKiKiYbDynF2xWUbVb9XXX3QcK0cz4PR+m387FroaRb98+/32Y+w4si6T+dxuZbzZ54c28YeHZ6qTp9XEdgTTp/LZvbvOKn5sv+hgg//Aw==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

````{prf:definition} subspace
:label: subspace
If $X$ is a topological space and $A \subset X$ then the relative
topology or the subspace topology on $A$ is the collection of intersections of
$A$ with open sets of $X$. With this topology, $A$ is called a subspace of $X$.
````

- The open and closed sets in a subspace are inherited from the open and closed sets in the topological space. 
- If $Y$ is a subspace of $X$ then $A \subset Y$ is closed in $Y$ if and only if $A=Y \cap B$ for some closed subset $B \subset X$.

````{prf:theorem} construction of subspaces
Let $S$ be a subset of a topological space $(X,\tau)$. Then $(A,\tau^*)$ is a subspace with a topology $\tau^* = \tau \cap S$
````

## Boundary
If $X$ is a topological space and $A \subset X$ then there is a largest open set $U$ with $U \subset A$. This set is called the **interior** of $A$ in $X$ and is denoted by $int(A)$.
 
If $X$ is a topological space and $A \subset X$ then there is a smallest closed set $F$ with $A \subset F \subset X$. This set is called the **closure** of $A$ in $X$ and is denoted by $\bar{A}$.

If we need to specify the space in which a closure is taken (the $X$ ), we shall use the notation $\bar{A}^X$. A consequence of the following fact is that this notation need not be used very often:

````{prf:proposition} 
If $A \subset Y \subset X$, then $\bar{A}^Y=\bar{A}^X \cap Y$. Thus, if $Y$ is closed in $X$ then $\bar{A}^Y=\bar{A}^X$.
````

The boundary of a set can be defined upon the open and closed sets in a topological space.

````{prf:definition} boundary
:label: boundary 
If $X$ is a topological space and $A \subset X$ then the boundary of $A$ is defined to be $\partial A=\bar{A} \cap \overline{X-A}$.
````

## Basis
````{prf:proposition} 
If $Y \subset X$ then the set of intersections of $Y$ with
a basis of $X$ is a basis of the relative topology of $Y$. 
````


````{prf:proposition} 
If $X$, $Y$, $Z$ are topological spaces and $Y$ is a subspace of $X$
and $Z$ is a subspace of $Y$, then $Z$ is a subspace of $X$. 
````

## Dense subset
````{prf:proposition} 
If $X$ is a metric space and $A \subset X$ then $\bar{A}$ coincides with the
set of limits in $X$ of sequences of points in $A$.
````

````{prf:definition} dense subset
:label: dense_subset
A subset $A$ of a topological space $X$ is called dense in $X$ if
$\bar{A} = X$. A subset $A$ is said to be nowhere dense in $X$ if $int(A) = \emptyset$.
````
