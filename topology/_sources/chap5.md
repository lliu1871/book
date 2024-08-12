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

# Chapter 5: Separation

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Separated sets at Wikipedia](https://en.wikipedia.org/wiki/Separation_axiom)
```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T16:01:17.656Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;2sY3gtnwmW4_1dCzebkk\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;JP2wpyMFRvMX6pZtYzCo\&quot; name=\&quot;Page-1\&quot;&gt;3VjLdpswEP0aL9MjnraXieMmi/Sc9Lg9jZcCBKiRGVcIP/r1lUAYMMRxmsTBWZm5Gj3mzp2RYWBNFpsbjpfxNwgIG5go2Ays64FpGrZlyx+FbAtkaDsFEHEaaKcKmNG/RINIoxkNSNpwFABM0GUT9CFJiC8aGOYc1k23EFhz1yWOSAuY+Zi10V80EHGBjhxU4beERnG5s4H0yAKXzhpIYxzAugZZ04E14QCieFpsJoQp8kpeinlfnxjdHYyTRBwzgSWz++k8jMT85rvgd5PLnw/ZRUnzCrNMR6xPK7YlBSSQjGgTuIghggSzaYVecciSgKh9kLQqnzuApQQNCf4mQmx1enEmQEKxWDA92o5Fh5dCxn1yKACtCcwjIg746bBULLUNNFM3BBZE8K104IRhQVfN7GMtomjnp6deco63NYcl0ESktZXvFSAddD04Y61+XQ2mtZezZ/wt5NT95UNxgtKqhVJBuQ5eoomWJG5xlgYQhiohSyzzsS+RSgAqm+uYCjLLHa3rtewLzWSHlLEJMOD5XCsc+cT3JZ4KDo+kNuKNHNtBh+SxIlyQzcGE6lHb3GO+rNN1VdVGWapxraJd9LQGanl4Oc1mR+W5TO56FdCVfIxEHnkBSdqTBuXun0w1jisP+49RTv+FXzB3qTZOqKCYFQtoz3LJRAXnAY8BAunq4ZRKxSJQ2cWK5kKCxb4ysmLr5nEk3Djka+SAGY0S+ezL5BLeoY8wNLv1Ebie67hvow/X3tPHqEMfToc+nPfSx7CljzTzdPmhPGWcRBnD/G2r8SRs71ej7XSwjU5ZjUa7653XRTj+qIvwdbR3dcHT0042VDyo6V+GjjbntaHrjV46N7baeP9cDXuVq3ErVbsG9Gn+Flil/WF/Cwy3FxXx/+I2rCPVPe6Vuo32ffuxnajeiNDBRiRTxLcPdWNeraDMalpuvb6BHZ1jo1c5Ns/+bfdo3ke9Ir48d434H7tXm8wrXySM+mtHBZ/x/WLaqG/3i3PuNWAfWwNWv2rAPqoG0Kevgc6XvdPWwKiVigT4ArMzZtk9XaORZvXZuvjqWH38t6b/AA==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

A topological space $X$ is called a $\mathrm{T}_0$-space if for any two points $x \neq y$ there is an open set containing one of them but not the other.

A topological space $X$ is called a $\mathrm{T}_1$-space if for any two points $x \neq y$ there is an open set containing $x$ but not $y$ and another open set containing $y$ but not $x$.

A topological space $X$ is called a $\mathrm{T}_2$-space or **Hausdorff** if for any two points $x \neq y$ there are disjoint open sets $U$ and $V$ with $x \in U$ and $y \in V$.

A $\mathrm{T}_1$-space $X$ is called a $\mathrm{T}_3$-space or **regular** if for any point $x$ and closed set $F$ not containing $x$ there are disjoint open sets $U$ and $V$ with $x \in U$ and $F \subset V$.

A $\mathrm{T}_1$-space $X$ is called a $\mathrm{T}_4$-space or **normal** if for any two disjoint closed sets $F$ and $G$ there are disjoint open sets $U$ and $V$ with $F \subset U$ and $G \subset V$.

## Properties 
How the points in a space are separated forms a basic structure of the space. Particularly, separation is closely related to neighborhood, closed sets, open sets, etc. 

````{prf:proposition}
A Hausdorff space is regular if and only if the closed neighborhoods of any point form a neighborhood basis of the point.
````

````{prf:proposition} regular_sub
:label: regular_sub
A subspace of a regular space is regular.
````

