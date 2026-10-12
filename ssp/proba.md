(P:ssp:proba)=
# Rappels de probabilité


<!--
[Jutten] DSP, stationnarité et ergodicité
(Stationnarité au sens large) Un processus aléatoire est dit stationnaire au sens large si toutes ses propriétés statistiques d’ordre 1 et 2 sont invariantes à un changement d’origine du temps.
(Ergodicité) Un processus aléatoire est dit ergodique si les valeurs moyennes statistiques (d’ensemble sur ζ) sont égales aux valeurs moyennes temporelles (sur une seule réalisation). La conséquence de cette hypothèse est très importante en pratique. Elle permet de remplacer les calculs de moments statistiques (qui supposent connues les densités de probabilité ou les fonctions de répartition) par les moyennes temporelles sur une seule réalisation (observation). En pratique, faire une estimation de la moyenne temporelle sur une fenêtre de taille infinie est impossible. Il faut se contenter d’une approximation calculée sur une fenêtre de taille finie, qui tendra asymptotiquement, avec la taille de la fenêtre, vers la moyenne temporelle. Cette hypothèse d’ergodicité est cependant difficile à vérifier. On admettra fréquemment que les processus aléatoires usuels sont ergodiques.
-->

Pour analyser et traiter ces signaux, on se base sur leurs propriétés statistiques,
telles que leur moyenne ou une distribution de probabilité : nous allons donc commencer par quelques rappels de probabilités.

Une *variable aléatoire* est une variable mathématique dont la valeur n'est pas fixée.
Lors d'une expérience ou après l'acquisition d'un signal,
on dispose de mesures de la variable aléatoire sous forme de valeurs numériques :
c'est ce qu'on appelle des *réalisations*.

Les valeurs possibles d'une variable aléatoire n'ont pas forcément la même probabilité d'apparaître :
la distribution des probabilités d'apparition des valeurs est appelée *densité de probabilité*
et elle est souvent notée $p$.
Les densités de probabilité les plus courantes en traitement statistique du signal sont listées ci-dessous.

<!------------------------------------------------------------------------------------------------>

## Densité de probabilité gaussienne

La densité de probabilité gaussienne, ou loi normale, est la bien connue « courbe en cloche ».
En notant $x$ la variable aléatoire, elle a pour expression :

$$
p(x) = \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(-\frac{(x-\mu^2)}{2\sigma^2}\right),
$$

et dépend de deux paramètres : la moyenne $\mu$ et l'écart-type $\sigma$.
La moyenne représente la valeur moyenne que prend un échantillon, l'écart-type est l'écart moyen d'un échantillon par rapport à $\mu$.
Ainsi, la variable aléatoire peut prendre n'importe quelle valeur sur $\mathbb{R}$,
les valeurs proches de $\mu$ étant plus probables que les valeurs éloignées de $\mu$.

On note aussi :

$$
x \sim \mathcal{N}(\mu\ ;\sigma).
$$

:::{figure} figs/loi-normale.svg
:name: F:ssp:normale
Densités de probabilité gaussiennes et 500 réalisations
(à gauche : $\mathcal{N}(0\ ;1)$, à droite : $\mathcal{N}(1\ ;0,3)$).
:::

La densité de probabilité gaussienne est un très bon modèle pour la plupart des bruits courants.

<!------------------------------------------------------------------------------------------------>

## Densité de probabilité uniforme

Une variable aléatoire $x$ distribuée suivant la densité de probabilité uniforme
peut prendre n'importe quelle valeur sur un intervalle $[a,b]$, et aucune valeur de cet intervalle n'est privilégiée par rapport à une autre.
Elle a pour expression :

$$
p(x) = 
\begin{cases}
\frac{1}{b-a} &\text{si}\, x\in[a,b], \\
0             &\text{sinon}.
\end{cases}
$$

On note aussi :

$$
x \sim \mathcal{U}[a\ ;b].
$$


:::{figure} figs/loi-uniforme.svg
:name: F:ssp:uniforme
Densités de probabilité uniformes et 500 réalisations
(à gauche : $\mathcal{U}[0\ ;1]$, à droite : $\mathcal{U}[-2\ ;2]$).
:::

La distribution de probabilité uniforme a le mérite d'être très simple,
même si elle représente assez mal les bruits les plus classiques dans les signaux.
Si la variable aléatoire uniforme prend des valeurs discrètes,
sa distribution de probabilité peut modéliser des bruits de quantification.

<!------------------------------------------------------------------------------------------------>

## Loi de Poisson

Enfin, la loi de [Poisson](https://fr.wikipedia.org/wiki/Sim%C3%A9on_Denis_Poisson)
modélise un processus de comptage (par exemple un nombre de photons sur les pixels d'un capteur CCD).
Elle a pour expression :

$$
p(x) = \frac{\lambda^x}{x!} e^{-\lambda}
$$

où $\lambda$ est l'unique paramètre, il correspond à la fois à la moyenne et la variance (c'est-à-dire le carré de l'écart-type).

On note aussi :

$$
x \sim \mathcal{P}(\lambda).
$$

:::{figure} figs/loi-poisson.svg
:name: F:ssp:poisson
Loi de Poisson et 500 réalisations
(à gauche : $\mathcal{P}(1)$, à droite : $\mathcal{P}(5)$).
:::

La loi de Poisson est généralement utilisée lors d'un comptage d'objets
(comme des photons ou des électrons).
C'est donc une loi particulièrement utile dans des signaux électroniques.
Toutefois, lorsque le nombre d'objets comptés est grand,
le bruit peut être modélisé par une distribution de probabilité gaussienne,
qui est plus simple à manipuler mathématiquement.

<!------------------------------------------------------------------------------------------------>

## Caractéristiques statistiques d'une variable aléatoire

### Espérance

L'*espérance* d'une variable aléatoire $x$, notée $\mathbb{E}[x]$, correspond à la valeur moyenne des réalisations :

$$
\mathbb{E}[x] = \int x p(x) dx.
$$

L'espérance est le
[moment d'ordre 1](https://fr.wikipedia.org/wiki/Moment_(probabilit%C3%A9s)#Moment_ordinaire)
de la variable aléatoire $x$.
Lorsqu'on dispose de $N$ réalisations $x[n]$ l'espérance peut être estimée ainsi
(l'accent $\hat{\cdot}$ signifie « estimation ») :

$$
\hat{\mathbb{E}}[x] = \frac{1}{N} \sum_{n=0}^{N-1} x[n].
$$

### Variance

La *variance* d'une variable aléatoire $x$, notée $\mathbb{V}[x]$,
correspond à l'espérance de la dispersion des réalisations $x$
autour de la moyenne $\mathbb{E}[x]$.
Cette dispersion est définie comme le carré de la différence :

$$
\mathbb{V}[x] = \mathbb{E} \Big[ \big(x-\mathbb{E}(x)\big)^2 \Big].
$$
La dispersion est considérée comme le carré de la différence (et pas simplement la différence)
car le carré permet d'avoir des erreurs qui ne peuvent pas être négatives tout en facilitant les calculs, contrairement à la valeur absolue.
On peut montrer que la variance s'écrit également :

$$
\mathbb{V}[x] = \mathbb{E}(x^2) - \mathbb{E}(x)^2.
$$
:::{dropdown} Démonstration

En appliquant la définition de l'espérance puis en développant l'expression :

\begin{align*}
\mathbb{V}[x] &= \mathbb{E} \Big[ \big(x-\mathbb{E}(x)\big)^2 \Big] \\
              &= \int \big(x-\mathbb{E}(x)\big)^2 p(x) dx \\
              &= \int \big(x^2 - 2x\mathbb{E}(x) + \mathbb{E}(x)^2\big) p(x) dx.
\end{align*}

L'intégrale étant linéaire,
et comme en plus $\mathbb{E}(x)$ est une constante par rapport à $x$, alors :

$$
\mathbb{V}[x] = \underbrace{\int x^2 p(x) dx}_{\mathbb{E}(x^2)}
               - 2\mathbb{E}(x) \underbrace{\int x p(x) dx}_{\mathbb{E}(x)}
               + \mathbb{E}(x)^2 \underbrace{\int p(x) dx}_{1}
$$

En simplifiant l'expression, on trouve bien :

$$
\mathbb{V}[x] = \mathbb{E}(x^2) - \mathbb{E}(x)^2.
$$

:::
La variance est le
[moment centré d'ordre 2](https://fr.wikipedia.org/wiki/Moment_(probabilit%C3%A9s)#Moment_centr%C3%A9)
de la variable aléatoire $x$.
Lorsqu'on dispose de $N$ réalisations $x[n]$, la variance peut être estimée ainsi :

$$
\hat{\mathbb{V}}[x] = \frac{1}{N-1} \sum_{n=0}^{N-1} \big(x[n]-\hat{\mathbb{E}}[x]\big)^2.
$$
D'autres estimateurs de la variance existent mais celui-ci est le plus courant :
c'est l'estimateur non biaisé de la variance.

### Écart-type

L'*écart type* d'une variable aléatoire $x$ est la moyenne des écarts des réalisations à la moyenne.
C'est la racine carrée de la variance :

$$
\sqrt{\mathbb{V}(x)}.
$$

✏️ @P:ssp:exercice-1 \
✏️ @P:ssp:exercice-2