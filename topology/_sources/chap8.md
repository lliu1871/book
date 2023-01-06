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

# Chapter 8: Product spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Product spaces at Wikipedia](https://en.wikipedia.org/wiki/Product_topology)
```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:46:56.362Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;bKLxZqhiqJcpkHeWkdO0\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;hovWZoKODrZj6ISTjIV3\&quot; name=\&quot;Page-1\&quot;&gt;5VpNc5swEP01PrYDCGRyzFfTziSTZtJpkyOGtSHBiBGiNv31FUYyxpId4jgGJ5cELRJIb9/qadcM0Pl0fkW9NLwhAcQDywjmA3QxsCzTRjb/V1qKyjK0ncowoVEgOtWG++gfCKMhrHkUQNboyAiJWZQ2jT5JEvBZw+ZRSmbNbmMSN9+aehNQDPe+F6vWP1HAwsrqOkZt/w7RJJRvNg1xZ+rJzsKQhV5AZismdDlA55QQVl1N5+cQl+BJXKpx3zbcXU6MQsLaDLi5Oj0Nb04eTtntt+LauP8XY/RFPOWvF+diwSklQc6BLHFOSUwmEQejnH7q+SBWwgoJDyV5EkD5BnOAzmZhxOB+0RFdzDghuC1k01jcHkdxfM4fSRdj0dj1wfe5PWOUPMPKnZHr2BxhdKauUU4YKIP5ikms+QrIFBgteBdx18bWV0E5QUGEhUdmtUNN6aVwxZmynyc4NFk+vIaZXwikX4O6pcCuIAsB56FoEspCMiGJF1/W1rMa+xKqus81IalA/AkYK0RQeTkjTX9wUGnxUI7nCInmo3jconExb7QK0cqYR9lpGVzckJAEtnkqIzn1YQsYcu38oRNgWzriql8JzFbHU4g9Fv1tBrDOh2LoTxIlrCYMRsN1wsg9Sz6kmqoYt8aF5UR2p4fk4pHS4w1UaMkE+zBMsI3OmfDy9lwo1OBCk5aXIcw97nHukRRoxKcCtLb+lCarzb49BynNmn08cMANbN0+7lojhPGe9nFXcQZS9/GhZhtHe9jGs+vv09Hv+Mevu2L0dGs/36XPWOOdLsJ093BDarhp12nuO9zeJJ5IQf1jHFSQ2aS3Y3R9TBn2gt8wj9jDyvVjrUi8VWtQ2Xi7BGliYtvBuScxYW+Kic+iDsheP+XbQzV8sHNAdVB9clzq4LRUB9SrSHA+qDrg3qmD2wt+S3UwDqIOmpg4AnXAn10dcP/UYbmIbsNn51KOflFGS81wexUfGl/wNPsJfBbxEOCDs8GiwMyiJCd5tjFo+CAfsuzloBh5/vNk4bvbnMVRsiE4xuOxpVeWAI+ws6+j05qyILdrZZGh8Dn9ga3e+UNNuTuR+h3rkZAE+ytWtzwASITeu0TpOC+WKKs1KSVKte493CCR+691ajVBPaV0QbLdxc9UqaHt53SlfdtmvYK6T6Z8o2Qbc6UX9tJmKtWPStrJAXdQLcr9qKTtzu22leJ+cVuVrePntlIH6JzbasWlRrn+tUrgjb1piWkyytIlHkeFv/o5AT7k+WxbNrXqgZhkHKdyFgLx6m/lEp7SK8h/zMTflNEhzzQyx1/1laHxlf1ueb/62/5DndKIuNlYnTReXZ0MPHDH2qjAvguj8X5wXn6uJXHWVCddDczWu8GsppBdKO5eU4+2B0wJ6nvnHuvHLNtc82bbzEOJ0vUH7Zx58Gb9gV3Vvf5MEV3+Bw==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

```{admonition} Cartesian product 
The Cartesian product of two sets $A$ and $B$, denoted $A \times B$, is the set of all ordered pairs $(a, b)$ where $a\in A$ and $b\in B$, 

$$A\times B=\{(a,b)\mid a\in A\ {\mbox{ and }}\ b\in B\}$$
```

- $A_1\times B_1 \cup A_2\times B_2 = (A_1 \cup A_2) \times (B_1\cup B_2)$
- $A_1\times B_1 \cap A_2\times B_2 = (A_1 \cap A_2) \times (B_1\cap B_2)$

The Cartesian product of the topological spaces $(X_i,\tau_i)|i\in I$ where $I$ is an index set is denoted by 

$$X=\prod_{i\in I} X_i$$

````{prf:definition} product space
:label: product space
A product space is the Cartesian product of a family of topological spaces $\{(X_i,\tau_i)|i\in I\}$ equipped with the product topology (i.e., Tychonoff topology). The open sets in the product topology are arbitrary unions (finite or infinite) of sets of the form 

$$ \prod _{i\in I}U_{i},$$ 

where $U_{i}\in \tau_i$ and $U_{i}\neq X_{i}$ for only finitely many $i$. 
````

For a finite product $\prod_{i=1}^nX_i$, the set of all Cartesian products between one basis element from each $X_{i}$ gives a basis for the product topology of $\prod_{i=1}^nX_i$.

````{prf:example}
Let $(X,\tau_X)$ and $(Y,\tau_Y)$ be topological spaces. We define a topology on the product space $X \times Y$ by taking the collection $\Psi$ of sets $U \times V$, where $U \in \tau_X$ and $V \in \tau_Y$. Since

$$
(U_1 \times V_1) \cap (U_2 \times V_2)=\left(U_1 \cap U_2\right) \times\left(V_1 \cap V_2\right) \in \Psi
$$

and 

$$
\cup_j(U_j \times V_j) = (\cup_jU_j) \times (\cup_jV_j) \in \Psi,
$$

$\Psi$ is a topology. Similarly we can define a product topology on the finite product $X_1 \times \cdots \times X_n$ of topological spaces.
````

- The projections $\pi_X: X \times Y \to X$ and $\pi_Y: X \times Y \to Y$ are continuous, and the product topology is the smallest topology for which this is true
- If $X$ is compact then $\pi_y: X \times Y \to Y$ is proper.
- If $X$ and $Y$ are both compact, then $X \times Y$ is compact

````{prf:theorem} Tychonoff theorem
The product of an arbitrary collection of compact spaces is compact.
````