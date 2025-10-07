(C:ssp-traitement)=
# Traitement des signaux bruités


Nous présentons trois types de techniques de traitement de signaux bruités :
* la détection de signal, c'est-à-dire déterminer si un signal particulier est présent dans des données bruitées,
* le débruitage, c'est-à-dire réduire le plus possible le bruit présent dans un signal,
* l'approximation, c'est-à-dire estimer le signal sous-jacent dans des données bruitées.

Sauf indication contraire, nous supposons que le bruit est blanc, gaussien et additif :
par conséquent, le signal observé $y$ est la somme d'un signal non bruité $x$ et d'un bruit $b$.


## Détection de signaux

Lorsque l'on parle de « détecter un signal », cela signifie répondre à la question : « le signal $x$ est-il présent dans le signal observé $y$ ? ».
Différentes techniques de détection existent, en fonction des connaissances que l'on a sur le signal recherché $x$.


### Détection de signaux périodiques inconnus de période inconnue

Dans le cas où l'on cherche dans l'observation un signal $x$ périodique, mais qu'on ne connait ni sa période ni sa forme,
alors l'autocorrélation de $y$ permet de déterminer si le signal $x$ est présent et quelle est sa période.
On rappelle que l'[autocorrélation](https://vincmazet.github.io/signal1/xcorr/intercorrelation.html#autocorrelation)
correspond à mesurer la ressemblance d'un signal avec une version plus ou moins décalée de lui-même.

L'autocorrélation de l'observation $y = x + b$ est :

$$
R_y[m] &= \sum_{n=-\infty}^{+\infty} y[n+m] y[n] \\
       &= \sum_{n=-\infty}^{+\infty} (x[n+m]+b[n+m]) (x[n]+b[n]) \\
       &= R_{x}[m] + R_{xb}[m] + R_{bx}[m] + R_{b}[m]
$$

où :
* $R_{x}$ est l'autocorrélation de $x$, elle est périodique de même période que $x$ ;
* $R_{xb}$ et $R_{bx}$ sont les intercorrélations entre $x$ et $b$ ; elles sont nulles puisque les deux signaux sont décorrélés ;
* $R_{b}$ est l'autocorrélation du bruit $b$ et elle est nulle (sauf en zéro) puisque le bruit est blanc (ses échantillons sont décorrélés).

Finalement, l'autocorrélation $R_y$ est égale à l'autocorrélation de $x$ (sauf en zéro).
Si $x$ est bien présent dans l'observation, alors $R_y$ est périodique et sa période est égale à la période de $x$.

```{figure} detection1.svg
---
name: F:ssp:detection1
---
Le signal $y$ est la somme du signal $x$ (périodique, mais de forme et de période inconnues) et d'un bruit blanc $b$.
L'autocorrélation $R_{y}$ fait apparaître un motif périodique de période 50
qui confirme la présence dans $y$ d'un signal de même période.
```


### Détection de signaux périodiques inconnus de période connue

Ce cas est plus favorable que le précédent car on dispose d'une information supplémentaire.
On cherche à déterminer si l'observation $y$ correspond au signal périodique $x$ (de période $T$) bruité par un bruit blanc $b$.
Le principe de détection consiste à effectuer l'intercorrélation de $y$ avec un signal auxiliaire $z$ périodique et de période $T$
(par exemple une simple sinusoïde).

En effet, l'intercorrélation de  $y$ et $z$ est égale à :

$$
R_{yz}[m] &= \sum_{n=-\infty}^{+\infty} y[n+m] z[n] \\
       &= \sum_{n=-\infty}^{+\infty} (x[n+m]+b[n+m]) z[n] \\
       &= R_{xz}[m] + R_{bz}[m].
$$

$R_{xz}$ est périodique puisque $x$ et $z$ sont de même période,
alors que $R_{bz}$ est nulle puisque $b$ et $z$ sont décorrélés.
Ainsi, $R_{yz}$ sera périodique de période $T$ si le signal $x$ est présent.

```{figure} detection2.svg
---
name: F:ssp:detection2
---
Le signal observé $y$ est la somme du signal périodique $x$ (de forme inconnue mais de période connue) et d'un bruit blanc $b$.
Le signal auxiliaire $z$ est ici une sinusoïde de même période que $x$.
L'intercorrélation $R_{yz}$ fait apparaître un motif périodique de période 50
qui confirme la présence dans $y$ d'un signal de même période.
```


### Détection d'un motif

Un « motif » est un signal déterministe connu et de durée finie.
La technique suivante permet de déterminer si le motif est présent dans l'observation $y$,
et si oui à obtenir son instant d'apparition.
L'observation est donc modélisée :

$$
y[n] = x[n-k] + b[n]
$$

où $k$ est l'instant d'apparition du motif $x$.

On peut déterminer l'instant $k$ où le motif apparaît en calculant l'intercorrélation entre $y$ et $x$.

Comme l'intercorrélation entre $y$ et $x$ est équivalente à la convolution entre $y$ et le motif $x$ retourné dans le temps ($x[-n]$),
cette technique est un filtrage, qu'on appelle « filtrage adapté » (_matched filter_).
On peut montrer qu'elle est la solution optimale pour maximiser le RSB dans le cadre d'un bruit additif.
Elle est notamment utilisé dans des applications radar ou en communications numériques.

```{figure} filtre-adapte.svg
---
name: F:ssp:filtre-adapte
---
Le motif $x$ est une porte et le signal observé $y$ correspond à $x$ décalé de $k=60$ échantillons
et bruité par un bruit blanc gaussien de RSB 15 dB.
Seules les corrélations de $x$ avec $x$ et $y$ présentent un maximum clair,
ce qui indique la présence du motif à cet instant.
```

<a class="exercise btn btn-light" href="td.html#exercice-4" role="button">4</a>


## Débruitage de signaux

Débruiter un signal, c'est réduire le plus possible le bruit présent dans le signal.
Sauf cas très particulier, il n'est pas possible d'éliminer complètement le bruit puisqu'il est inconnu.


### Débruitage d'un signal unique

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

La {numref}`F:ssp:filtre-moyenneur-exemple` représente ces deux signaux.
    
```{figure} filtre-moyenneur-exemple.svg
---
width: 600px
name: F:ssp:filtre-moyenneur-exemple
---
Signaux $y$ (en bleu) et $z$ (en orange).
```
::::

On peut montrer que cette technique peut s'écrire sous la forme d'une convolution :
c'est donc un filtrage appelé « filtre moyenneur ».
La réponse impulsionnelle de ce filtre est une porte de longueur $M$,
dont la transformée de Fourier à temps discret est un sinus cardinal.
Ainsi, le filtre moyenneur est un filtre passe-bas.
Il atténue les fréquences élevées présentes dans le bruit.

Le filtre moyenneur effectue une moyenne glissante pour remplacer chaque échantillon du signal observé
par la moyenne des $M$ échantillons voisins.
Comme on l'observe sur la {numref}`F:ssp:filtre-moyenneur`,
plus le nombre d'échantillons moyennés $M$ est grand, plus le bruit sera atténué.
Mais la forme du signal d'intérêt $x$ sera lissée.

```{figure} filtre-moyenneur.svg
---
name: F:ssp:filtre-moyenneur
---
Application d'un filtre moyenneur sur le signal observé $y$ (qui est la somme du signal d'intérêt $x$ et d'un bruit).
```

Le filtre moyenneur est une très bonne première approche pour débruiter un signal.
Elle reste néanmoins limitée (parce qu'elle a tendance à lisser le signal lui-même),
et il faut parfois recourir à des techniques plus évoluées.

Le filtre moyenneur étant un filtre passe-bas, il peut aussi être utilisé avant de sous-échantillonner un signal.
Cela est bien pratique pour afficher par exemple un signal de mesure contenant beaucoup d'échantillons
sur un graphique ou un écran très petit.

<a class="exercise btn btn-light" href="td.html#exercice-5" role="button">5</a>


### Débruitage de plusieurs réalisations d'un même signal

Dans le cas où l'on dispose de $I$ mesures d'un même signal $x$ :

$$
\forall i, n, \quad y_i[n] = x[n] + b_i[n]
$$

et que le bruit est centré ($\mathbb{E}[b_i]=0$), alors la moyenne des $y_i$ permet d'augmenter le RSB d'un facteur $10\log(I)$.
Aussi, plus il y a de signaux moyennés, meilleur sera le débruitage.


```{figure} moyennage.svg
---
name: F:ssp:moyennage
---
Moyennage de plusieurs réalisations $y_i$ d'un même signal $x$.
Le premier graphe ci-dessous représente 50 réalisations superposées (en gris),
l'une d'elle est en bleu pour être visible.
```

En photographie, le moyennage de plusieurs images d'une même scène permet de réduire le bruit présent dans la photographie.
En astronomie par exemple, il n'est pas rare de produire des images qui sont le moyennage de plusieurs dizaines d'observations,
elle-même acquises avec un temps de pose très long (plusieurs dizaines de minutes).

<a class="exercise btn btn-light" href="td.html#exercice-6" role="button">6</a>


## Approximation par moindres carrés

La méthode des moindres carrés (_least squares method_) a été proposée par Gauss et Legendre à la fin du XVII<sup>e</sup> siècle.
Dans le cadre de l'approximation, elle permet de décrire un signal bruité par un modèle mathématique.

### Problématique

On considère le cas où les observations $y$ contiennent $N$ échantillons
et sont la somme d'un signal $x=f_{\theta}$ bruité :

```{math}
:label: E:mc:y
\forall n\in\{0,\dots,N-1\}, \quad y[n] = f_{\theta}[n] + b[n]
```

où :
* $f_{\theta}$ est une fonction paramétrique (sinusoïde, polynôme, etc.) connue,
* $\theta$ est un ensemble de paramètres $\theta_0, \theta_1, \dots, \theta_{M-1}$ inconnus,
* $f_{\theta}[n]$ est la valeur de la fonction $f_{\theta}$ en $n$,
* $b$ est un bruit de moyenne nulle.

```{margin}
Si $f$ n'est pas linéaire, alors il faut utiliser une méthode de moindres carrés non linéaires.
```

De manière générale, $f$ peut être n'importe quelle fonction paramétrée,
comme par exemple :
* un polynôme de degré 2 : $f_{\theta}[n] = \theta_0 + \theta_1 n + \theta_2 n^2$,
* une exponentielle : $f_{\theta}[n] = \theta_0 \exp(\theta_1 n)$.

Par simplicité, nous nous concentrons dans cette section sur les fonctions $f_{\theta}$ linéaires en $\theta$,
et en particulier des fonctions $f_{\theta}$ polynomiales :

```{math}
:label: E:mc:f
\forall n, \quad f_{\theta}[n] = \theta_0 + \theta_1 n + \theta_2 n^2 + \dots + \theta_{M-1} n^{M-1}.
```

L'objectif est d'estimer la valeur des $M$ inconnues $\theta_m$ où $m\in\{0,\dots,M-1\}$.

### Écriture matricielle

Dans la suite, les calculs sont effectués avec la représentation vectorielle.
En considérant toutes les valeurs que prend $n$,
l'équation {eq}`E:mc:y` devient un système de $N$ équations à $M$ inconnues :

$$
\begin{cases}
y[0] = \theta_0 + \theta_1 0 + \theta_2 0^2 + \dots + \theta_{M-1} 0^{M-1} + b[0] \\
y[1] = \theta_0 + \theta_1 1 + \theta_2 1^2 + \dots + \theta_{M-1} 1^{M-1} + b[1] \\
\quad\vdots \\
y[N-1] = \theta_0 + \theta_1 (N-1) + \theta_2 (N-1)^2 + \dots + \theta_{M-1} (N-1)^{M-1} + b[N-1]
\end{cases}
$$

```{margin}
Pour identifier les variables maricielles, on a l'habitude de les écrire en gras.
```

ce système peut s'écrire plus simplement sous forme matricielle :

$$
\boldsymbol{y} = \boldsymbol{H} \boldsymbol{\theta} + \boldsymbol{b}
$$

où :

$$
\boldsymbol{y} = \begin{bmatrix} y[0] \\ \vdots \\ y[N-1] \end{bmatrix},
\quad
\boldsymbol{H} = \begin{bmatrix}
    1 & 0 & \dots & 0^{M-1} \\
    1 & 1 & \dots & 1^{M-1} \\
    \vdots & \vdots & & \vdots \\
    1 & N-1 & \dots & (N-1)^{M-1}
\end{bmatrix},
\quad
\boldsymbol{\theta} = \begin{bmatrix} \theta_0 \\ \vdots \\ \theta_M \end{bmatrix}
\quad\text{et}\qquad
\boldsymbol{b} = \begin{bmatrix} b[0] \\ \vdots \\ b[N-1] \end{bmatrix}
$$


### Minimisation du critère des moindres carrés

L'objectif est de retrouver $\theta$ à partir de $y$.
Il est logique de choisir $\theta$ comme le paramètre qui minimise les différences entre $y$ et $f_\theta$.
Mathématiquement, il faut donc minimiser

$$
\mathcal{J} = \sum_{n=0}^{N-1} \left(y[n] - f_{\theta}[n]\right)^2.
$$

La parenthèse, qui exprime la différence entre $y$ et $f_{\theta}$ en chaque échantillon $n$,
est au carré car les calculs sont plus simples à effectuer qu'avec une valeur absolue.
On cherche donc à minimiser les différences au carrés, d'où le nom de la méthode.
Remarquez que $\mathcal{J}$ est le carré de la norme du signal $y - f_{\theta}$ :

$$
\mathcal{J}
&= \| \boldsymbol{y} - \boldsymbol{H}\boldsymbol{\theta} \|^2 \\
&= (\boldsymbol{y} - \boldsymbol{H}\boldsymbol{\theta})^T (\boldsymbol{y} - \boldsymbol{H}\boldsymbol{\theta}) \\
&= \boldsymbol{y}^T\boldsymbol{y}
 - \boldsymbol{y}^T\boldsymbol{H}\boldsymbol{\theta}
 - \boldsymbol{\theta}^T\boldsymbol{H}^T\boldsymbol{y}
 + \boldsymbol{\theta}^T\boldsymbol{H}^T\boldsymbol{H}\boldsymbol{\theta}
$$

Trouver la valeur de $\theta$ qui minimise $\mathcal{J}$ revient à trouver la valeur qui annule la dérivée de $\mathcal{J}$,
et on peut montrer que :

$$
\frac{\partial \mathcal{J}}{\partial \boldsymbol{\theta}} = - 2\boldsymbol{H}^T\boldsymbol{y} + 2\boldsymbol{H}^T\boldsymbol{H}\boldsymbol{\theta}
$$

Et donc :

$$
\frac{\partial \mathcal{J}}{\partial \boldsymbol{\theta}} = 0
\qquad\Leftrightarrow\qquad
2\boldsymbol{H}^T\boldsymbol{y} = 2\boldsymbol{H}^T\boldsymbol{H}\boldsymbol{\theta}
\qquad\Leftrightarrow\qquad
\boldsymbol{\theta} = (\boldsymbol{H}^T\boldsymbol{H})^{-1} \boldsymbol{H}^T\boldsymbol{y}.
$$

Cette dernière équation définit donc la valeur de $\theta$ qui minimise l'erreur des moindres carrés,
c'est donc la valeur de $\theta$ qui permet d'avoir une fonction $f_{\theta}$ qui approxime au mieux les données $y$.


### Illustration

La solution obtenue est issue du calcul $\boldsymbol{\theta} = (\boldsymbol{H}^T\boldsymbol{H})^{-1} \boldsymbol{H}^T\boldsymbol{y}$.
Sur l'exemple de la {numref}`F:ssp:moindres-carres`, l'observation $y$ est une version bruitée d'un polynôme $x$.
L'approximation par moindres carrés est plus appréciable que celle obtenue avec le filtre moyenneur
car on bénéficie ici du fait que le signal inconnu est un polynôme.

```{figure} moindres-carres.svg
---
name: F:ssp:moindres-carres
---
Les données $y$ sont approximées par un polynôme d'ordre 3 avec la méthode des moindres carrés.
Le résultat est comparé avec un filtre moyenneur de taille 20, qui donne une estimation moins « propre ».
```

La figure {numref}`F:ssp:moindres-carres-differences` représente en orange les différences entre l'observation et l'estimation.
C'est la somme de ces différences qui est minimisée par la méthode des moindres carrés.

```{figure} moindres-carres-differences.svg
---
name: F:ssp:moindres-carres-differences
---
Mise en évidence des erreurs à minimiser.
```

<a class="exercise btn btn-light" href="td.html#exercice-7" role="button">7</a>