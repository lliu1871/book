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

# Chapter 7: Compact spaces

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*

-- Lao Tzu
```

```{seealso}
- [Compact spaces at Wikipedia](https://en.wikipedia.org/wiki/Compact_space)

```

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-12-17T15:59:26.372Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\&quot; etag=\&quot;XT5i2YIfaMpaktbU2Oom\&quot; version=\&quot;20.7.3\&quot; type=\&quot;dropbox\&quot;&gt;&lt;diagram id=\&quot;vPBJ5dAMEV_lWuYlAB-_\&quot; name=\&quot;Page-1\&quot;&gt;5Vtdd5s2GP41OWe7aA9ICDuXW5K267bTrsk5TXazI4NsaABRISd2f/0kGxkQAmMHY7LlJuhFCHif5/0UvoBX8eo9w2nwJ/VJdAEsf3UBry8AsB3oiH9Sst5KJg7aChYs9PNJheA2/EFyoZVLl6FPsspETmnEw7Qq9GiSEI9XZJgx+lydNqdR9a4pXpCa4NbDUV36NfR5sJVOkVXIP5BwEag721Z+JsZqci7IAuzT55II3lzAK0Yp3x7FqysSSeUpvWyve9dwdvdgjCS8ywWTu3/o49xdRPZ35ge//bi7+x28gdtVnnC0zF84f1i+VhogvlBIPqSMB3RBExzdFNJfGV0mPpG3scSomPMHpakQ2kL4jXC+ztHFS06FKOBxlJ/NOGb8F4mWECQ0kYuKt2Lre7nmW6SGD/ktNoPrVWW0VqNVyO/zdeXxQ7GEGBUXyYG6pq7KXLsZXTJPMeHjHfprfnv/N/PtaPHx+1cr/PRGURKzBeEtelZ0lsos3SFH6j2hMREvISYwEmEePlXZh3MSL3bzdpd+pqF4ZmDlBuco88rNDViousT2SfOrymzRFoKX1YVsx6outFVNbSFxUHqfQrQh4wHEdEdBzIKEFQoWjOyRhCYjOJ6YYGTE1PkE4LHEhFb7Qicmpg3GwcycYdYBDDvWpXZioVlZXVlon4SFwprwujQhlaTImkm6C97K6eXcauKiPh9cts+Hk9b54mD7xP0StsZXTlMa0UUoshwJYooFhjqFC4JKtj0HISe3m4nw+llkelUyzsMouhJLss21cD71iOdtXBqjj6R0ZjZFDmql1BNhnKxaOaDOAg0sFeqeizxtNyco5WiuFsnKtKl4i0M1jcbhGRK/MZU6LIr1avdt6dOpgw9wzHa9L2bUDdjWFtKzooYo1pctT0fCsJdlRUWceihFs6aYpbP59KwEw7DSnmpkco9kJdiXEp2YlcooSrT0aCyiBd9U6/+FYOPokf7swcZ2xuUL7CN9Qd9lemt+uT8RhX3b/otAVpi+dpAPcPgvABl1BXmgtGOiOQ2kN2NOXKqCcTRRjm5smF9q0hFlgEZlyna9DgvwMvMpm89fcWDUM2KIzh4Y6z3tIhvJlrOMyAMvoplQbK8Kn8+BWeG+O3OR21PZizoo3BpS4aDO7HO4mQECB+i9WfoixcNxlIMDKB5ORqV4u97pOazg2eNYql7oLH7dRaMreCYd2F50C7wIZ1noNSm2VU37M8jecwtzBonAcZsdtYVqcA7cIgCGFkEegYuYHGYyMCtD6tNkBonMuo5tlRqdzWSAKRVKeJgs6VLqehZ+I96GnuKx5GkrEHemMWVpEGbxBXBxLPWczLJ0p6MSJlmAU3mYMuqRLNufMc2w97jYQPVpyaNQlgImvDCwLIBMeLnvLPEnrxDvUUVY/PWDI+qS0jqD4liPNwll8avuqOmFA7LObi31ANPkjBTxA7LCIlkSGkkJC8VjEFZIPysR6ALBiqivnwyQ+IhMfccEyRTMoNuTA9MhcZyOkMCTQTKODLfXTYiuOQboPefttint2Mdujk0aLHqgHAPW61C98M/6dZSDpBWX2u4OdM/tKGF96yHGK3mnROZzcZi0qNk6WM3DOD9X241zpgY1m/oqJ3N+8HIUzu94Vwe7tmqV5Y6kvHfGsbU2gOJVgB+J4mE9A/sihj99UI3yn2s4jL+TMtVLb1NZaBscC0InUrMzjq++j+e3ou1+x+KMit9OSxdkGztnuVKbE5bx90Em7tgSFgd0ILypdVjZuuzQURzye/EhzKdrXC4hi0yeLJe9sFLRU7Rdo+bQSkVnKNJzuP4qlbbPHkt0nIeJMGshoykR2bPlUWFvNY6Otu1Qcw4GYnZuO5g+5FW/HujbXbR9/2eCRxCCsIx4IacSppQJvBhf/0+QAvp2hAkpk2PvIZMxIrWnvx0LLTYhc7KedVNnurmX3QMySP8E1J687fhdgP4JcwdwxLD43eLWKRa//oQ3/wI=&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

---


A covering of a topological space $X$ is a collection of sets
whose union is X. It is an open covering if the sets are open. A subcover is
a subset of this collection which still covers the space.


````{prf:definition} compact
:label: compact
A topological space $X$ is said to be compact if every open covering of $X$ has a finite subcover. (This is sometimes referred to as the Heine-Borel property.)
````

```{admonition} Finite intersection property
A collection $C$ of sets has the finite intersection property if
the intersection of any finite subcollection is nonempty.
```

````{prf:theorem}
A topological space $X$ is compact if and only if for every collection of closed
subsets of $X$ which has the finite intersection property, the intersection of the
entire collection is nonempty. 
````

- The unit interval [0,1] is compact.
- If $X$ is a Hausdorff space, then any compact subset of $X$ is closed.
- If $X$ is compact and $f: X \to Y$ is continuous, then $f(X)$ is
compact.
- If $X$ is compact, and $A \subset X$ is closed, then $A$ is compact.


## Properties
- If $X$ is compact and $Y$ is Hausdorff and $f: X \to Y$ is continuous and bijective, then $f$ is a homeomorphism.
- A real valued map on a compact space assumes a maximum value.
- A compact Hausdorff space is normal.


````{prf:definition} proper
:label: proper
A map $f:X\to Y$ between topological spaces is said to be
proper if $f^{-l}(C)$ is compact for each compact subset $C$ of $Y$.
````

````{prf:theorem}
If $f: X \to Y$ is a closed map and $f^{-1}(y)$ is compact for each
$y\in Y$, then $f$ is proper.
````

````{prf:theorem}
For a topological space $X$ the following are equivalent:

1. $X$ is compact.
2. Every collection of closed subsets of $X$ with the finite intersection property
has a nonempty intersection.
3. Every universal net in $X$ converges.
4. Every net in $X$ has a convergent subnet.
````




