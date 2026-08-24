(C:filtrage:realisables)=
# Filtres réalisables

Comme on l'a vu dans la section {ref}`C:filtrage:ideaux`,
il est impossible de réaliser des filtres idéaux (en temps réel en tout cas).
Par conséquent, les filtres réalisables ne sont que des approximations des filtres idéaux :
* des variations de gain dans les bandes passante et atténuée peuvent apparaître,
* les transitions d'une bande à l'autre ne peuvent pas être aussi brusques que pour les filtres idéaux.

La {numref}`F:filtre-intro:reel` représente un exemple de filtre passe-bas réalisable :
le filtre idéal (en bleu) est en fait approximé par le filtre réalisable (en rouge).
Par conséquent, pour définir un filtre, il faudra avant tout choisir un _gabarit_ (en vert)
qui précise la zone dans laquelle devra se situer la réponse fréquentielle.

```{figure} filtre-reel.svg
---
width: 600px
name: F:filtre-intro:reel
---
Exemple de gain pour un filtre passe-bas réalisable.
```

Très souvent, on utilise une échelle logarithmique pour les ordonnées, comme dans la {numref}`F:filtre-intro:reel-log`.

```{figure} filtre-reel-log.svg
---
width: 600px
name: F:filtre-intro:reel-log
---
Exemple de gain pour un filtre passe-bas réalisable (en échelle logarithmique).
```

## Gabarit d'un filtre

Par conséquent, la définition des caractéristiques d'un filtre nécessite au préalable la définition d'un gabarit
(_filter specification_) qui définit :
* l'ondulation maximale autorisée en bande passante (_pass-band ripple_), que l'on souhaite la plus faible possible,
* l'atténuation minimale en bande atténuée (_stop-band attenuation_), que l'on souhaite la plus forte possible,
* la largeur de transition entre bande passante et bande atténuée (_transition band_),
  que l'on souhaite la plus étroite possible.

À cela s'ajoute la volonté d'avoir un filtre le plus simple possible (car plus facile à réaliser et moins cher),
ce qui implique une fonction de transfert d'ordre le plus faible possible (on le verra plus loin).


## Fréquence de coupure

Par ailleurs, la transition entre les bandes passante et atténuée n'étant plus instantanée,
il faut redéfinir la fréquence de coupure du filtre.
Généralement, la fréquence de coupure est définie comme la fréquence
à laquelle le filtre a perdu la moitié de sa puissance instantanée (définie comme le carré du gain).

On montre alors que la fréquence de coupure $f_c$ est la fréquence à laquelle le gain du filtre
est à 3 dB sous le gain maximal.

```{dropdown} Démonstration

La puissance instantantée à la fréquence $f$ est notée $P(f)$.
On cherche donc la valeur de $f$ pour laquelle $P(f) = \frac{1}{2} P_\mathrm{max}$, donc :

$$
P(f) &= \frac{1}{2} P_\mathrm{max} \\
\Leftrightarrow\qquad |H(f)|^2 &= \frac{1}{2} |H(f)|^2_\mathrm{max} \\
\Leftrightarrow\qquad 10 \log_{10} |H(f)|^2 &= 10 \log_{10} \left[ \frac{1}{2} |H(f)|^2_\mathrm{max} \right] \\
\Leftrightarrow\qquad 20 \log_{10} |H(f)| &= 10 \log_{10} \frac{1}{2} + 20 \log_{10} |H(f)|_\mathrm{max} \\
\Leftrightarrow\qquad G_\text{dB}(f) &\approx -3.010 + {G_\text{dB}}_\mathrm{max} \\
$$
On arrondit la valeur de $10 \log_{10} \frac{1}{2}$ à $3$.
```


## Conception d'un filtre

Pour résumer, la conception d'un filtre commence par la définition d'un gabarit,
puis le choix d'une méthode de conception qui génère un filtre dont la réponse fréquentielle vérifie le gabarit souhaité.
Les sections {ref}`C:filtrage:numeriques` et {ref}`C:filtrage:analogiques` présenteront des méthodes pour cela.

Jusqu'ici, on a beaucoup plus parlé des spécifications des filtres en gain, et non en phase.
En effet, la réalisation de filtres vérifiant à la fois des spécifications en gain et en phase est trop difficile,
voire impossible.
Heureusement, dans la plupart des applications, seul le gain est important ;
dans ce cas, la phase n'est pas spécifiée et acceptée telle quelle.

En revanche, si le gain et la phase sont tous les deux importants,
alors on conçoit d'abord un filtre vérifiant le gain puis, si la phase obtenue n'est pas satisfaisante,
on ajoute des filtres appelés « égaliseurs de phase » qui n'agissent que sur la phase.

<a class="exercise btn btn-light" href="td.html#exercice-3" role="button">3</a>
<a class="exercise btn btn-light" href="td.html#exercice-4" role="button">4</a>
<a class="exercise btn btn-light" href="td.html#exercice-5" role="button">5</a>
<a class="exercise btn btn-light" href="td.html#exercice-6" role="button">6</a>
