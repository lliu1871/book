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

# Chapter 3: Renewal processes

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Continuous function Wikipedia](https://en.wikipedia.org/wiki/Continuous_function)
```

Let $F_n(x)$ be the probablity distribution of $S_n = \sum_{i=1}^n x_i$. Let $N_t$ be the number of events before time $t$. The probablity of $S_{n} < t$ is equal to the probability of $N_t > n$. 
