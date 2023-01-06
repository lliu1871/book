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

# Chapter 2: Topological spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Topological spaces at Wikipedia](https://en.wikipedia.org/wiki/Topological_space)
```
<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:43:15.552Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;3Ymu-j8wWpgF5lGTqtet\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;R2lEEEUBdFMjLlhIrx00\&quot; name=\&quot;Page-1\&quot;&gt;5Vtdd7MoEP41uWyPChpz2e+92O52txfbvDd7iKKyVfEgaZP31y9ErB+YvGkbE5O0PacyIOI8Mw/DgCNwkyweGMqiR+rjeGQZ/mIEbkeWZUIAxT8pWRaSMbQLQciIrxpVgmfyEyuhoaRz4uO80ZBTGnOSNYUeTVPs8YYMMUbfm80CGjefmqEQa4JnD8W69B/i86iQurZRyX/DJIzKJ5uGqklQ2VgJ8gj59L0hwgt+T1OuhviEWYJSnHJR84jYK2Yj+y7iXL7p1ci6F3+BbH0ZUhrGGGUkv/RoIsReLprcByghsVRzraNr1ZF4HLgbgRtGKS+uksUNjiVWJQzFmO7X1H7ogcl+t7ghuHKur6bTi1tA/01+3vz1RH+gC2tcdPOG4rlSsFIOX5Yax74AQBUp4xENaYriu0p6zeg89bF8jiFKVZvfKc2E0BTC/zDnS2VNaM6pEEU8iVWteAW2fJH3X9plcVqvu12ozovSUpV0HSi15HTOPLzhxUvTRSzEfEM7oAzDb1il0vADpgkW4xENGI4RJ29NI0XKkMKPdurWK8bQstYgo0RaXQ0+cVHrvxKtQP0EwKaGL6cZjWlIhEtJRWVI6KkNeQWoROA9Ihw/rxqC23dBK03wAhLHN6JLtroXBK6HPU/Ic87oK67VzFwb2hthe8OM48VGRata4djFLYrGIFBIvVekYJZuHdUIwTHWY9NQ/mc1ba3T9FJTr2CeTF5GeIGEowiNZJgRMQzMKulTKbK2gWCBS67ugMS3sevDLkhcawYcZ0eQAPfSboIy0UFxbB0T2Bsm7iDo7es0BbakKbhrmvqW2oGmdZrhVL4vViy3M7IJAqubbHxn5ti7suwW2QB4aLKBmoYT+dgZZRGl/gmo2Do4n0Od0A8SGi0IfymDH3E9raIkUariIln4VFiUvMwuHv6+9tjUnz2a/sXLc/7H1nzTT1iULJ5kIFRZBQQtxxuDZhfFC6m7dh89Qd3PTt8G7C1twDyMDUB7vzZgTQZhA1+PISaH8ulv0a+u9RnKyTFGD26Lw2x9Zpt0TGz9BcXOkRt0mYr6pUVbg7Loctg1vQeE5ZLqPKFMjmYkJvxsVovjplvYHWvFzoDP7s0v7GP3i22TWgPzCz1HlWOPpv55OoYJh+YYpr4SmqckoCwZyXE4sRjA9YyJq1BeCejE24Y47UgsniZkcNJavHZBBvY5xwPdp46My3ae0Vqzupi0ozO32UVBpr2tLsAwJp0DbMBAfbLqXI7ufLLqNgTbaRqC6YL9GsIwovIBG8K+8g2Gc1BDMPWcUzBPPU7oKoN+pPt17SyOYNoDRzXWMHJ7X3ccS/eb7nbl4YZhhPuWvgz2KGI5Xq2E1+6ZHl2eB451C3f3uvmpb8OdqIHvfGb4nt712DsgaWHe+mrpdAze7qD0vRo8ONfDTMDd0lPgzqeCPR9ngsPgtA+IzTrANbz3AvGm3bvel0ulKa3blet7uaSf7DmNg22OPbSDbUDfijuzk23OeHAn26AeZJwHEcKOzb9NR1l6J8KWv2pHVHomQqgvp477sF2bAPd62G5T4knXcJmX0dVc8mDGqIflxwC/UvUMea/hCpw/5zwWy4VuCJBlGJZ0LvnhQRMa8dMFjXNviJ8PaDQcOtBaCw2wm5N+eWzhYMhYGjJeTHNh3ueHDZw4w8JmGPnszklgZ2cj10fge0g+bBpkI7mWcpLO6Vx4gpGg7GwcAhqtoA3YZimpe4VhdsRtoCd89O2+iCbil2URyZNzgaZ9pLPHNY4oVt/YFUFX9WEkuPsf&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

````{prf:definition} topological space
:label: topological_space
A topological space is a set $X$ together with a collection of
subsets of $X$ called open sets such that:
1. the intersection of two open sets is open;
2. the union of any collection of open sets is open; 
3. the empty set 0 and whole space X are open.
````

- A subset $U\subset X$ is called "closed" if its complement $X-C$ is open.


## Neighborhood

````{prf:definition} topological neighborhood
:label: topo_neighborhood
A subset $N$ of a topological space $X$ is called
a neighborhood of a point $x\in X$ if there is an open set $U\subset N$ with $x\in U$.
````

A collection $B(x)$ of neighborhoods of a point $x$ in a topological space $X$ is called a **neighborhood basis** if each neighborhood of $x$ subsets of $X$ contains some element of $B(x)$.


````{prf:definition} basis
:label: basis
If X is a topological space and B is a collection of subsets
of X, then B is called a basis for the topology of X if the open sets are
precisely the unions of members of B. (In particular, the members of Bare
open.) 
````

A collection S of subsets of $X$ is called a **subbasis** for the topology of
X if the set $B$ of finite intersections of members of $S$ is a basis.

````{prf:example}
In a metric space the collection of $\epsilon$-balls, for all $\epsilon > 0$, is a basis, So is the collection of $\epsilon$-balls for $E = 1, 1/2, 1/3,\dots$.
````

## Countability

````{prf:definition} first countability
A topological space is said to be first countable if each point
has a countable neighborhood basis.
````

````{prf:definition} second countability
:label: second_countability
A topological space is said to be second countable if its
topology has a countable basis.
````

## Continuity
````{prf:definition} topological continuity
:label: topo_continuity
A map $f: X \rightarrow Y$ from a topological space $X$ to a topological space $Y$  is said to be continuous if $f^{-1}(U)$ is open for each open set $U\subset Y$.
A map is a continuous function.
````


````{prf:definition} homeomorphism
:label: homeomorphism
A continuous function $f: X \rightarrow Y$ between topological spaces is called a
homeomorphism if its inverse $f^{-1}: Y \rightarrow X$ exists and continuous. 

If such a function exist, we say that $X$ is homoeomorphic to $Y$, denoted by $X ~ Y$.
````

Homeomorphic spaces are considered as essentially the same.
One of the main problems in topology is to find methods of deciding when
two spaces are homeomorphic or not.

````{prf:definition} uniform convergence
A sequence $f_1, f_2, ...$ of functions from a topological space
$X$ to a metric space $Y$ is said to converge uniformly to a function $f: X \rightarrow Y$ if, for each $\epsilon > 0$, there is a number $n$ such that when $i>n$, $d(f_i(x), f(x)) < \epsilon$ for all $x\in X$.
````

````{prf:definition} open functions
:label: open_function
A function $f: X \rightarrow Y$ between topological spaces is said to
be open if $f(U)$ is open in $Y$ for all open $U\subset X$.
````

````{prf:definition} closed functions
A function $f: X \rightarrow Y$ between topological spaces is said to
be closed if $f(U)$ is closed in $Y$ for all closed $U\subset X$.
````

A topology $T^*$ of a topological space $X$, whose open sets satisfy a presribed condition, is said to be the **coarsest** topology if for any
topology $T$ whose open sets satisfy the condition, the $T^*$-open sets are
also $T$-open, i.e., $T^* \subset T$. On the other hand, if $T\subset T^*$, then $T^*$ is the **finest** topology satisfying the condition.

