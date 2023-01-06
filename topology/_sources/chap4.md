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

# Chapter 4: Connectivity

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Connectivity at Wikipedia](https://en.wikipedia.org/wiki/Connected_space)
```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:55:34.304Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;6ur-OZpSzA_Zc3k0vE_W\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;DogbfA1H08O7bIKuk2Kf\&quot; name=\&quot;Page-1\&quot;&gt;5VpLc5s6FP41XrYDEmCybJO0mbnt3Mx40XTVkUE2ajCiQsT4/vpKRgpGwjbtxdhJvLDR4ej1nYc+SZ7A61X1maE8+UpjnE6AE1cTeDMBwPWgJ36kZFNLpp5fC5aMxEqpEczIf1gJHSUtSYyLliKnNOUkbwsjmmU44i0ZYoyu22oLmrZ7zdESW4JZhFJb+o3EPKmloe808jtMlonu2XXUmxXSykpQJCim6x0RvJ3Aa0Ypr59W1TVOJXgal7repz1vnwfGcMb7VPjn4e5n5szu8ujx/uusekp/fPv1blq38oTSUk1YDZZvNAI4FoCoImU8oUuaofS2kX5ktMxiLLtxRKnR+UJpLoSuEP7EnG+UdVHJqRAlfJWqt/ZU1OwKWrIIHxi/dgnElpgf0FNOJ+ey04EC6jOmK8zZRigwnCJOntrGR8qHls96DcziQSH9B6i7Fuqc5jSlSyIcT047R2LWpiEamCVm64RwPNsqwpu1CL42pAuSpteiSbatCxdhhKNIyAvO6CPeeTMPfc93DhnhCTOOq4Ow6bfa+VWwu1Dhvm5Cx9XxkOyGjc4Kg0PtW1BHKc1xNiy6iwXoRjcO5oEfDIMuuGqjC5ye6AbOicC92ufHGwtekf1y+ZjgConkIBDJMSNiGJg10nstAn1MUGG9XnSYJPZxGHtdJgnBHAYDmcQFftvh9bK1Y5Jph0XAqdzdfekJ3euZ0N3LyuienWZoVnAkpi+4DykiJtz63fZ1XLMVTrKSlsWWKeR7wyVnNMJFcTwc5ih6XG7t9m/JU5LtCQsEHEc4n5CLEbQzmPh0hUvwyRGfYcIFhsb6AOxwGTeD6Xg9c7zgLP4gyaooZlTabgRK5A0dQKrqPSVbr9c2B4bNr8B7I/vVU1L1dhms0ZTvmU0ZblHP2WpIQIs2O2q5VCgODNnsx3cOjuuIvnioR9C46TO8/8Nzg4vw3L/30/BlZvrQgv1BdpPJtJ6V2/oCDDmxRH7TLJVj06TTKcp5gWvnewMJ3wsujbK69t7rpSd8v2cgheMkfM/IhgD+ZboP9u13jqT7wTKsvb05j6uIaTzsFr7Lxt77unhTqcbr0kaXKsIfGk1R+q4bEc9NJVnQdQRjZXwwx9SBfTzFj+SavpGOoD+yR3WcRtTnlttdwes4BAqgEbYde+Jxcz6wYX9ZVMnty5XAaUj9HxPoqRlnRwi0oe85YxBom8m9vmD0jN0XBD0JmH+yYLR33G/0NMRMlPDspyHgUsjxeIxn0JOXvkxcG/XUfMdi0FPDc/qfvLTPuccmTuAyDjsGpsfTS13VBzcffINLrSYxZ1xqO28lXhnsrslwpmdfRe07uDIj1L5yPhWtGefuExiXOTC0qWXQgTs8Ge6Xcl4zHKPQifP4EjEdh1FYSc68ye7LKIC3J1sOfZdjbi3VgEfaiopi8w+vWr35nxy8/Q0=&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---

````{prf:definition}
A topological space $X$ is called connected if it is not the
disjoint union of two nonempty open subsets.
````

- A topological space $X$ is connected if and only if its only clopen subsets
are $X$ and $\emptyset$·

## Discrete valued map
````{prf:definition}
A discrete valued map is a map (continuous) from a
topological space $X$ to a discrete space $D$.
````

- A topological space $X$ is connected if and only if every discrete valued
map on $X$ is constant.
- If $f: X\rightarrow Y$ is continuous and $X$ is connected, then $f(X)$ is
connected.
- If $\{Y_i\}$ is a collection of connected sets in a topological space $X$ and if no two of the $Y_i$ are disjoint, then $\cup Y_i$ is connected


````{prf:proposition}
The statement that $d(p) = d(q)$ for every discrete valued map $d$
on $X$ is an equivalence relation.
````