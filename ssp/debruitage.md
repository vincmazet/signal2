(P:ssp:debruitage)=
# Débruitage de signaux


Débruiter un signal, c'est réduire le plus possible le bruit présent dans le signal.
Sauf cas très particulier, il n'est pas possible d'éliminer complètement le bruit puisqu'il est inconnu.

<!------------------------------------------------------------------------------------------------>

## Débruitage d'un signal unique

On observe un signal $x$ bruité par un bruit blanc gaussien additif :

$$
\forall n, \quad y[n] = x[n] + b[n].
$$

Pour réduire le bruit dans le signal, on peut remplacer chaque échantillon $y[n]$
par la moyenne des $M$ échantillons autour de $n$.
On obtient alors un nouveau signal $z$ :

$$
\forall n, \quad z[n] = \frac{1}{M} \sum_{m=n-\frac{M-1}{2}}^{n+\frac{M-1}{2}} y[m]
$$

où $M$ est impair.

::::{admonition} Exemple
:class: exemple

Si le signal observé est :
    
$$
y = [4,\, 9,\, 8,\, 7,\, 12,\, 5,\, 1,\, 0,\, 5,\, 4,\, 3,\, 2,\, 4]
$$

alors le calcul de la moyenne de $M=3$ échantillons autour de chaque échantillons de $y$ donne :
    
$$
z = [?,\, 7,\, 8,\, 9,\, 8,\, 6,\, 2,\, 2,\, 3,\, 4,\, 3,\, 3,\, ?]
$$

où les deux points d'interrogation correspondent à des échantillons qu'on ne peut pas calculer.

La @F:ssp:filtre-moyenneur-exemple représente ces deux signaux.
    
:::{figure} figs/filtre-moyenneur-exemple.svg
:width: 600px
:name: F:ssp:filtre-moyenneur-exemple
Signaux $y$ (en bleu) et $z$ (en orange).
:::
::::

On peut montrer que cette technique peut s'écrire sous la forme d'une convolution :
c'est donc un filtrage appelé « filtre moyenneur ».
La réponse impulsionnelle de ce filtre est une porte de longueur $M$,
dont la transformée de Fourier à temps discret est un sinus cardinal.
Ainsi, le filtre moyenneur est un filtre passe-bas.
Il atténue les fréquences élevées présentes dans le bruit.

Le filtre moyenneur effectue une moyenne glissante pour remplacer chaque échantillon du signal observé
par la moyenne des $M$ échantillons voisins.
Comme on l'observe sur la @F:ssp:filtre-moyenneur,
plus le nombre d'échantillons moyennés $M$ est grand, plus le bruit sera atténué.
Mais la forme du signal d'intérêt $x$ sera lissée.

:::{figure} figs/filtre-moyenneur.svg
:name: F:ssp:filtre-moyenneur
Application d'un filtre moyenneur sur le signal observé $y$ (qui est la somme du signal d'intérêt $x$ et d'un bruit).
:::

Le filtre moyenneur est une très bonne première approche pour débruiter un signal.
Elle reste néanmoins limitée (parce qu'elle a tendance à lisser le signal lui-même),
et il faut parfois recourir à des techniques plus évoluées.

Le filtre moyenneur étant un filtre passe-bas, il peut aussi être utilisé avant de sous-échantillonner un signal.
Cela est bien pratique pour afficher par exemple un signal de mesure contenant beaucoup d'échantillons
sur un graphique ou un écran très petit.

✏️ @P:ssp:exercice-5

<!------------------------------------------------------------------------------------------------>

## Débruitage de plusieurs réalisations d'un même signal

Dans le cas où l'on dispose de $I$ mesures d'un même signal $x$ :

$$
\forall i, n, \quad y_i[n] = x[n] + b_i[n]
$$

et que le bruit est centré ($\mathbb{E}[b_i]=0$), alors la moyenne des $y_i$ permet d'augmenter le RSB d'un facteur $10\log(I)$.
Aussi, plus il y a de signaux moyennés, meilleur sera le débruitage.

:::{figure} figs/moyennage.svg
:name: F:ssp:moyennage
Moyennage de plusieurs réalisations $y_i$ d'un même signal $x$.
Le premier graphe ci-dessous représente 50 réalisations superposées (en gris),
l'une d'elle est en bleu pour être visible.
:::

En photographie, le moyennage de plusieurs images d'une même scène permet de réduire le bruit présent dans la photographie.
En astronomie par exemple, il n'est pas rare de produire des images qui sont le moyennage de plusieurs dizaines d'observations,
elle-même acquises avec un temps de pose très long (plusieurs dizaines de minutes).


✏️ @P:ssp:exercice-6