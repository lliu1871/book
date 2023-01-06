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

# Chapter 15: Covex bodies

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Convex body at Wikipedia](https://en.wikipedia.org/wiki/Convex_body)
```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:22:20.508Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; version=\&quot;20.7.3\&quot; etag=\&quot;kYM_GJRR1_H4T_Ktu0-x\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;gZeC39JvC-sQbOatrAUu\&quot; name=\&quot;Page-1\&quot;&gt;5VjbctowEP0aHtuRryGPLbk9tNPMMJkkj8IWthrb68oCTL++K1vGNjKEdggJUzID2qObdc5qd+ORM0nLW0Hz+DuELBnZJCxHztXItsfEx28FrGvAc50aiAQPa8hqgSn/zTRINLrgISt6AyVAInneBwPIMhbIHkaFgFV/2ByS/q45jZgBTAOamOgjD2Wsj+WRFr9jPIqbnS2ie1LaDNZAEdMQVh3IuR45EwEg61ZaTliiuGt4qefd7OjdPJhgmTxkwji0biF/esjnzw93M+shjX89ftJiLGmy0AfWDyvXDQMsREK0CULGEEFGk+sW/SpgkYVMbUPQasd8A8gRtBD8yaRca3XpQgJCsUwT3VvvqTbaeTYNFbAQAdtzoMZHqIiY3DPO3iiAnssgZVKscZ5gCZV82X8Oqn0o2oxracaGZvovWLes/5V2i7wr7wbtGDaWrERsBuHa0KBlWNG1irlk05xWRKww2vXZnPMkmUACoprrzOdzOwgQL6SAF9bpCf2Z7/kb/pdMSFbuV8AkTE9wXB1ddHi1XK+2V22wspoIFHcClU/eiGPb4JhmlcK0+oZUbZqpVTLJBEdS8LyARgMVGMYL5Usxq3RBCWh1ZKqGpFCon5HtJ3iSrzOc7keqBRlrV9rSEUNvrpoxKyleERyd49Z4XiZa9L6B7EO0LlmTrAa0Dz02Dt0h7cf2zPGPpL23rb1DTO29Ae0v30p719C+le/sr5bjD9B70qvlG/ROm3tQLPLmImQqzNUo7tLpOEMN/A+nwcUBmTsLv6jKE60goUXBa5qokCbcIbifzpEgsX7qGs/K+Ow15lXZ7bxaN1bJ5ZNeUbU7s9BqJymjmXPEOsA9sA7wh2XvyDoUuBrs4GpB73Cv84v2Ktfue5VHtrylPub9Jpfc7Froor+Q620tVPNgLFR53ubY/+6Ml4YzxpDin8hjXqQ702AuIGBF8fqdn9HgJar88sdCJjzbke6oTYitXGwOmezHCPwMxQj/huDnSGmQbMWI8UCMsAa8yXmrGGGZNZAZJM6rvCcH3mt3WKoTlffE4D2AFL1b1i8I9lT6r1yEfqb8EOXIJhi+Wyq0zHLv3N3cOdDNd0h1Ijc3X9pIyNHrooBTNbuo/Pio1d44YMMuPht7KusdxcWtE/4zi2b76q3Ox+37S+f6Dw==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

````{prf:definition}
A convex body in $\mathbf{R}^n$ is a closed set $C \subset \mathbf{R}^n$ with the property that whenever $p, q \in C$ the line segment between $p$ and $q$ is contained in $C$. The boundary of $C$ is $\partial C=C-\operatorname{int}(C)$.
````


````{prf:proposition}
If $C \subset \mathbf{R}^n$ is a convex body and $0 \in \operatorname{int}(C)$ then any ray from the origin intersects $\partial C$ in at most one point.
````
ProOF. Suppose $R$ is a ray from the origin and $p, q \in R \cap C$, with neither $p$ nor $q$ being the origin. Suppose $q$ is further from the origin than $p$. Since the origin is assumed to lie in int $(C)$ there is a ball $B$ about the origin completely contained in $C$. Then consider the union of all line segments from points in $B$ to $q$ (the cone on $B$ subtended from $q$ ). The point $p$ is clearly in the interior of this cone, and the cone is contained completely in $C$, since $C$ is convex, and so $p$ must be in int $(C)$.


````{prf:proposition} 
Let $C \subset \mathbf{R}^n$ be a compact convex body with $0 \in \operatorname{int}(C)$. Then the function $f: \partial C \rightarrow \mathbf{S}^{n-1}$ given by $f(x)=x /\|x\|$ is a homeomorphism.
````
Proof. Since $f$ is the composition of the inclusion $\partial C \subset \mathbf{R}^n-\{0\}$ with the radial retraction $r: \mathbf{R}^n-\{0\} \rightarrow \mathbf{S}^{n-1}$, it is continuous. Proposition $16.2$ implies that $f$ is one-one, and $f$ is obviously onto. By Theorem $7.8, f$ is a homeomorphism.

````{prf:theorem} 
A compact convex body $C$ in $\mathbf{R}^n$ with nonempty interior is homeomorphic to the closed $n$-ball, and $\partial C \approx \mathbf{S}^{n-1}$.
````