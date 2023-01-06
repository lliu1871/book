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

# Chapter 10: Locally compact spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Locally compact space at Wikipedia](https://en.wikipedia.org/wiki/Locally_compact_space)
```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:44:31.036Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;WYBC4L6ttYApDuBdlXNe\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;lUgC7Vi0-Q75xOtu7TcB\&quot; name=\&quot;Page-1\&quot;&gt;5Vtbc5s4FP41ftwOd5PHxEmbzmQ3nfHuNn0UIEBbGTFCxHZ//QojhYsIpjGOif0UdCSBdL5z+Y7kzMzFavOFgjT+kwQQzwwt2MzM25lh6JZp8T+FZFtK5pZdCiKKAjGoEizRLyiEmpDmKIBZYyAjBDOUNoU+SRLos4YMUErWzWEhwc2vpiCCimDpA6xKv6OAxaXUtbVKfg9RFMsv65roWQE5WAiyGARkXROZdzNzQQlh5dNqs4C4UJ7USznv8yu9LwujMGFDJrC7f8ENufnrq7tE9/88/fj7a379h0DnGeBcbFgslm2lBmDAFSKahLKYRCQB+K6S3lCSJwEsPqPxVjXmgZCUC3Uu/A8ythXogpwRLorZCotedStidxnJqQ971i9NAtAIsp5xZjmu2EvtA0JRXyBZQUa3fACFGDD03AQfCBuKXsaJqdeUgm1tQEpQwrLam78VAj5AuIPlCFsQzmCYLch+bzx/KFcgW7WtVKKdGfyGSTgXYhL22CZRg6VX659xsMweQfqguwt476dPa+PxHB2xc5/GpLSuT0PtGVcbuy6yFRckJIFDoejelD0QC330qDgUjD4TqmGBCU/Eu+S+SoFfBMZ7kGcBoWFYKILLoAJXBUah2XWMGFzuBpq3a05RmooPEcYLggndzTVD14e+vwOEkp+w1uO5tmVrfbA8Q8rgpleNotect6K6JBPrimDokjXENXIhs8HomjcVzVcaT4oFeITGhAS86YEMZeMqPQyNbqUHjufYzjhKt6RXCKXr5qmVbncqHUMGcelzUY4BVVTNaWRaPMZwA3iU4dpJIUV8SZBW0m9SZAyBYwMl8e6AJ7ChG1hd8LiGZzojwWNcaS14bBUerQMe+1jwzAdkhiSQQdvHIMuQ39RsMy/ADWJPoqd4/lHIP9midbupDbvdykbCt/JUb9RmFc1q2q4l5x2fPcn6bGRGrVBgW2sFy/nVJ7v5knJPYl4Pm3b2v6rctvKqsai1q9hUkes5UGKhM8PBXOk3Hnd7JyqeRBxGKEQ+VyP39y568gA8XnZzg4MZ+gW8XZfWtEWAUZQUhsotoogUN4Vv8nfia9GxQkGAu4lHn3+Iult8dPZS7Q5w/feheB++nNEGsrmJkTlN0ft5sTjHOiGL6y6thqSsiZh6X224v4YcPfccpndF7ZdRt1jaqS3eVIPMx7J4c6jFT+vYpK9ePAdLb8f201t6Rzo9haWPfFA19NBwPinr7yrcE4aSnOTZrLj4SRVoZNGeUuLDLNtv9h7wf0Y7uB5zhlHyWnEOoBt2uoPju9ALRwr8btMdTKvDHbqKc+tY7qAynTOHwLHtvRBcvScC0ndrEHDNpvBSDqxso+0T6oGV2wGIeTRAVBp6igxROxM7OD8MvsfQx84Pr1zHtuNgO90PPolqe3P7ReOdQ/Ve/BxYsuzx0ybPOwmR042pFen61STc9ADSNtgr3UmxNl2lbTJhnSFfMNp3jHPV8OfvyhemcQ77xvR00E8e9NF/adKdVZR7ZfeN6cloH222X3Ts9KTek/iYZBz3y+CWnB806UHHZWgXt7Ts103msBPOaTjv25OWTPH7D9pGp5KHKV499nkhasIjtCz3jnDO9i4/yjDdpqHb+rCqdoxL/174+4jxRYQgBRn31Mh8dN4s17s/BJ3sIrd33Wcagtql+OlD0IDa/CJCkILM8UIQb1b/h1Gy2Oq/Wcy7/wE=&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

````{prf:definition} locally compact space
:label: local_compact_space
A topological space is said to be locally compact if every point has a compact neighborhood.
````
- Every compact space is locally compact

The following statements are equivalent if $X$ is a Hausdorff space 
1. every point of $X$ has a compact neighbourhood.
2. every point of $X$ has a closed compact neighbourhood.
3. every point of $X$ has a local base of compact neighbourhoods.
4. every point of $X$ has a local base of closed compact neighbourhoods.

If $X$ is a locally compact Hausdorff space, then $X$ is completely regular (Tychonoff space).

## Locally closed subset
````{prf:definition}
A subspace $A$ of a topological space $X$ is said to be locally closed if each point $a \in A$ has an open neighborhood $U_a$ in $X$ such that $U_a \cap A$ is closed in $U_a$.
````

````{prf:proposition}
A subspace $A \subset X$ is locally closed $\Leftrightarrow$ it has the form $A=C \cap U$ where $U$ is open in $X$ and $C$ is closed in $X$.
````

For a Hausdorff space $X$ the following conditions are equivalent:
1. $X$ is locally compact.
2. $X$ is a locally closed subspace of a compact Hausdorff space.
3. $X$ is a locally closed subspace of a locally compact Hausdorff space.


## One-point compactification

Let $X$ be a locally compact Hausdorff space. Put
$X^+ = X\cup \infty$ where $\infty$ just represents some point not in X. Define an open
set in $X^+$ to be either an open set in $X\subset X^+$ or $X^+ - C$ where $C \subset X$ is
compact. Then this defines a topology on $X^+$ which makes $X^+$ into a compact
Hausdorff space called the **one-point compactification** of $X$. Moreover, this
topology on $X^+$ is the only topology making $X^+$ a compact Hausdorff space
with $X$ as a subspace.

````{prf:theorem}
Suppose that $X$ and $Y$ are locally compact, Hausdorff spaces and that $f: X \rightarrow Y$ is continuous. Then $f$ is proper $\Leftrightarrow f$ extends to a continuous $f^{+}: X^{+} \rightarrow Y^{+}$by setting $f^{+}\left(\infty_X\right)=\infty_Y$
````

If $f:X \rightarrow Y$ is a proper map between locally compact
Hausdorff spaces, then $f$ is closed.

## Stone-Cech compactification
````{prf:definition}
If $X$ is a completely regular space, and $\Phi: X \rightarrow[0,1]^F$ is defined as above then the closure of $\Phi(X)$ is called the Stone-Cech compactification of $X$ and is denoted by $\beta(X)$.
````

````{prf:theorem} 
If $X$ is a completely regular space, then $\beta(X)$ is compact Hausdorff and $\Phi: X \rightarrow \beta(X)$ is an embedding.
````

````{prf:theorem} 
If $X$ is completely regular and $f: X \rightarrow R$ is a bounded real
valued map, then $f$ can be extended uniquely to a map $\beta(X) \rightarrow R$.
````