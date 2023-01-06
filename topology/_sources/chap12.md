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

# Chapter 12: Quotient spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Quotient spaces at Wikipedia](https://en.wikipedia.org/wiki/Quotient_space_(topology))
```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:35:18.108Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;T9rNxHGbz5Jv4oR7yV4h\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;z5M0ZofERbhTtGgGiIKp\&quot; name=\&quot;Page-1\&quot;&gt;7Vrbdps4FP0aP7bLIG55nHHcZLraJDNZrad+6ZJBGBqMiBCx6ddXGBFAkimt8SWTebJ1ECD23jpnH+wRmKw2VwQmwUfsoWikj73NCFyOdF0zgME+ikheRmzDLANLEnp8Uh24D78jHhzzaBZ6KG1NpBhHNEzaQRfHMXJpKwYJwev2NB9H7bsmcImkwL0LIzk6Cz0alFHHHNfxaxQug+rO2pgfWcFqMg+kAfTwuhEC0xGYEIxp+W21maCoAK/CpTzv3Y6jzwsjKKZ9Tri+uLl8nC/+yqx09sW1c+rP/35jlVd5glHGH5gvluYVAshjgPAhJjTASxzDaFpH/yQ4iz1U3GbMRvWcDxgnLKix4DdEac7ZhRnFLBTQVcSPsicg+b/F+W/NaviFX247uNy0RjkfyRBwVFKcEZev/zqcgq+3nx7QHN4+pA7Ov7+fvamkBMkS0Q58uFgLDBo34ABfIbxCbD1sAkERpOFTWzSQa2/5PO/51DscsiXrY75PDIuLhO8SUImmukS5UH5WTTL70lhGHdpSv0MGHXA0ZPCYYRqi7RrTBDIsRVnUpBcMroOQovvtRHC5ZqmgTbAfRtEER5hszwW+4yLXZfGUEvyAGkcWjmmYndQ+IULRppOMCtRxG1S9Gq/rjaxVQAeNTWyNd/PXQr4LZpWa9LPYbf12jWr9ql3TIafhds1eqMvipjhhkluGLM2/YH1r2rnpG0hIo8csZMMykbgRTFNWzEWoWWVMiq8B2kAmZYZOgkjIloRIHb2rQnofOjao8hIKejwTOZ6hosfRF8CyhqFHd0R6TIkeW8GOeSh2jK4kz7dE/krIMfQ2OZot7x1HQQ44FDlmZwXOFgdIUr6vq5OUZy0scyighSIMrCMmqcVVev8N3dA5DR6/Btkn21h/VCB9tkVYuf6TWde9UJeL8GsuDZpo949XGpTsyKXhFHsCxd4fRcvOhjGOUasxbLWFdZe4V2PY0+J26XngxpA9PswbE5Ki4Uub9EqtoybaDDFxlo8stY5yDypmalFtw/WgM3T77p+bz8nd1IaJP5ktvHl2JhpM2VNSQYVKqn8qL+VDWrK8lPPAkXK18uZym0rQMosgqX3i6VsnKdsqCNmZgE1b2DTaEV3JbsJ/7Q3MT4Bts3ASmB3j3GCWzd81zFIPE99/Od5jP05Ms8XJc/04QufTlRIblLgRTplwWcqVLOIrIckWN44uk6QyiMahSLLPojjLBnHA0qz3LM3WnqVZ7b5s8WWeSGVfGyflXPFCB7ZxmtzpnUYqv9c5HNj/aX1VdnFKA+hIFMaYrLaO77/p/4Aivx7XmFz8uv87f5jFXHR6mKssq5D2qzAWjvBDs37Rz1gczP1VCfF/+9e0f0DcN/Zb+Q2hyqVX/64Znie5QX1JZf2gztHpWdNLrQ9vHYXfsqQXd79rHYd7A8iG9R+dyun138XA9Ac=&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

````{prf:definition} quotient topology
Let $X$ be a topological space, $Y$ a set, and $f: X \rightarrow Y$ an onto function. Then we define a topology on $Y$ called the topology induced by $f$ or the quotient topology, by specifying a set $V \subset Y$ to be open $\Leftrightarrow f^{-1}(V)$ is open in $X$. 
````
- Quotient topology is the largest topology on $Y$ which makes $f$ continuous.

````{prf:definition} quotient space
Let $X$ be a topological space and $\sim$ an equivalence relation on $X$. Let $Y=X / \sim$ be the set of equivalence classes and $\pi: X \rightarrow Y$ the canonical map taking $x \in X$ to its equivalence class $[x] \in X / \sim$. Then $Y$, with the topology induced by $\pi$, is called a quotient space of $X$.
````

- A quotient space of a quotient space of $X$ is a quotient space of $X$. That is, if $X \rightarrow Y \rightarrow Z$ are two onto functions and $Y$ is given the quotient topology from $X$, and $Z$ is given the quotient topology from $Y$, then $Z$ has the quotient topology from $X$ induced by the composition of the two functions.

## Properties
````{prf:definition} identification map
A map $X \rightarrow Y$ is called an identification map if it is onto and $Y$ has the quotient topology.
````

````{prf:definition} single-set quotient space
If $X$ is a space and $A \subset X$, then $X / A$ denotes the quotient space obtained via the equivalence relation whose equivalence classes are $A$ and the single point sets $\{x\}, x \in X-A$.
````
- If $X$ is regular and $A$ is closed then $X / A$ is Hausdorff. 
- If $X$ is normal and $A$ is closed, then $X / A$ is normal.

