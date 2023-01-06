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

# Chapter 1: Metric spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Metric spaces at Wikipedia](https://en.wikipedia.org/wiki/Metric_space)
```
<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-18T13:26:00.039Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;oFBzOs2zSm7kIimWiCJ-\&quot; version=\&quot;20.7.4\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;C5RBs43oDa-KdzZeNtuy\&quot; name=\&quot;Page-1\&quot;&gt;7VtdW6M4FP41XtYHCFB6ua2Oujszq+M67nrjk0KAKCUMpLb1109SAiUUW6pg6eqNNichkPPxnvec0iMwmszPYhj534iDgiNNceZH4ORI0yzFZH+5YJEKTEVJBV6MnVSkrgTX+BkJYbZsih2USAspIQHFkSy0SRgim0oyGMdkJi9zSSDfNYIeWhNc2zBYl95ih/riWFp/JT9H2POzO6vmIJ2ZwGyxOEniQ4fMCiJwegRGMSE0/TSZj1DAdZfp5fZicRt8fTTP/rxKfsGb4V//fP/ZSzf7sssl+RFiFNJXb30De4/as3cZeoMBvnNm6sVJ0hNnfYLBVOhLnJUuMgUih+lTDElMfeKREAanK+kwJtPQQfw2Chut1nwlJGJClQkfEKUL4RxwSgkT+XQSiNma5xN6SMg0ttGGdUC4GYw9RDccXpyVH7DgK0J7Z4hMEI0XbEGMAkjxk+xQUPill69b6Z59EOrfwRSq9ZFtoRr7Msamx5ZsYQbsAEPIxH6M3KXU/DXl0T/kN8U210cEbXS8VKcGSITC+zHkd8sWsk8e/8+n2HIxGaRTX2A2vWb4lVm5jWY+puia34oJZgy2ZRO6JKTCvipT4dALYJIIj0hoTB5zJOSrc1jj0y4OghEJSLy8LXBdV7Pt/LLCjGOOTcPc2V+eUEzRfKOBxexAoK5IO5ohxrMViKsZMvsFANeVluJTa8IlQv6kYxL7hDjrXlGa/XSLrW6hmvt2i0NH7cpDGeuovQkmu5JBjcZQO0E0eRG12WQL0dmZEMtjJYNeaz3G+lpFiBlt2bUGS/WYsqM3aiQvQuA421bZqKkSGAEwqAdGqtIWGjUSAan0filbDwL5mh0DQdk9ECwbVQfC2DJ0Q6kMhM1utD0SFnLS2GZPszXOoVbY8+Czi1a7QNP3lV8enm6efcV2f0TTb7Oru/vTc6j2+h/bGGankr3WSInGAJ/icIrp4rNeextrMPqGzBoMvR54tlew6U14yGfF1rBj7L9k06pY0vsDecIgl/7BW9xMEJIQ7WyE7ZjdeIEmLr0kmD1gbmMTyDYGoGS7NA2Jq0rmyx/j9Zk5c5X/WWo2181cefys7uhKajabAN4PX4fr/Rp1ODg2KpCzrUpcq0GB91KJl5NMB0pxrapr8VmLlxypk7V4Jcg2QyeLBUfZmtLcdkuyZ8ZRgg4J0oBa4oKWWs+qRltW1Q+9w7KREHT4a9dqa2idsAaaY/ovv/yYFbHp8L/l0DQsMT6Zi+2Xg0VhcIlizLSBYiHbzbRtM3XQV2VSMQDHiibv8gJZr9irVPKXWX/qfq2xfrCeYXHIwIhhIrtywl8MKjsPq5Ej/jHBoRcgUXwNHRwzroFJyOETJXRnSHUgstxKSDVtC43dNiFV12Uj9LWMEhZBVXnPVKlXpcqDB1W9dqd0b+XYxucuWGMCo5qhcbBxAPoVFcD7RkE32kyvj4K6rwZs9LquBEGd9zRCJ2vH2bzTiu1yl24lLihYthDTcrwQ5MHKxil7AJqRCVb0YTlaFEdlApGzkSIVKdIQXeIhWsZgWiYihbgyNjD2t/IVayCFtV6u12uTlYFMfIAKapEVZnq4KCyL+ILkjXTm6Wl45V/o5uxqev7z7Ac9jz23141KpMB9X/K3NdrbMMRodauXvbW3+621t6vPuQ5eWXfhhSTuozn0OJ8dRgUUENIcGLQ6CX6Osrf6qxK+gSxHr0r4ljYGZpu9BFORjaJXtPzM9/xaqYJmfXgj5c2cPRjpOx49PLhz5W58ZVij296l3qeVb/G2SwNkDrCVAQj4VYvgm0Pxu8Bv7TLH6hhTkF3NsErfgtRlCjoobQRKGzXX1qh00UZebEG/ppjtwDziPl1Q8TXaab6mVr85g60oJjbi7yFsg6UxtB+9ZVj8PaUBDrsHTwDIRaOu13xppdzpqoFPbLj6rVjqK6sf3IHT3w==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

A space is a set with structures. The distance between points in a set defines an essential structure of the set. Important concepts in mathematical analysis including limits, continuity, differentiability, etc. are related to the distance structure. 

In topology, the central notion is that of continuity. Thus it would usually suffice for us to treat "spaces" for  which we can give a workable definition of continuity

````{prf:definition} metric space
:label: metric_space

A metric space is a set $X$ equipped with a *metric* function $d: X\times X\rightarrow \mathbb{R}$ such that the following three laws are satisfied

1. $d(x,y)\ge 0$ and $d(x,y)=0$ only if $x=y$
2. $d(x,y)=d(y,x)$
3. $d(x,z)\le d(x,y)+d(y,z)$ (triangle inequality)
````

With the metric, we can define unit subsets of $X$ in the sense that any subset of $X$ can be generated from the unit subsets through some algebraic operations.

## Open sets

````{prf:definition} open ball
:label: open_ball
The open ball of radius $\epsilon > 0$ centered at a point $x$ in a metric space $X$, denoted by $B_\epsilon(x)$, is defined by the $B_\epsilon(x)=\{y\in X| d(x,y)<\epsilon\}$
````

The open ball is the unit structure/subset in a metric space. The open ball induces a special group of subsets of $X$ called "open sets" which forms a topological structure of $X$.

````{prf:definition} open sets
:label: open_sets
A subset $U\subset X$ is said to be open if for each point $p\in U$ there is an $\epsilon$-ball about $x$ completely contained in $U$.
````
- The $\epsilon$-ball is open
- The union of open sets is open
- The finite intersection of open sets is open

```{prf:remark}
:nonumber:
An alternative definition for open sets: A subset $U\subset X$ is open if it is an union of $\epsilon$-balls.
```

````{prf:definition} neighborhood
:label: neighborhood
In a metric space $M=(X,d)$, a set $V$ is a neighbourhood of a point $x\in X$ if the set $V$ contains an open ball $B_\epsilon(x)$ of the point $x$. 
````

For {prf:ref}`metric spaces <metric_space>`, continuity can be expressed completely in terms of open sets.


## Continuity

```{prf:proposition} continuity
:label: continuity
A function $f:X\rightarrow Y$ between metric spaces is continuous if and only if $f^{-1}(U)$ is open in $X$ for each open subset $U$ of $Y$.
```

````{prf:theorem} equivalent metrics
:label: equivalent_metrics
If $d_1$ and $d_2$ are metrics on the same set $X$ which satisfy
the hypothesis that for any point $x\in X$ and $\epsilon > 0$ there is a $\delta > 0$ such that 

$$d_1 (x, y) < \delta \Rightarrow d_2 (x, y) < \epsilon$$

$$d_2 (x, y) < \delta \Rightarrow d_1 (x, y) < \epsilon$$

Then these metrics define the same open sets in $X$. 
````

## Exercise 
1. If $X$ is a metric space and $x_0$ is a given point in $X$, show that the function $f: X\rightarrow \mathbb{R}$ given by $f(x) = d(x, x_0)$ is continuous.

````{prf:proof} 
Let $U$ be an open subset of $f(X)$. For each point $u\in U$, $f^{-1}(u)$ is a $\epsilon$-ball with $\epsilon = u$. $f^{-1}(U)$ is an union of $\epsilon$-balls and thus is open. This completes the proof.
````
