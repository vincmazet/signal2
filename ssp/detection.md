(P:ssp:detection)=
# Détection de signaux


Lorsque l'on parle de « détecter un signal », cela signifie répondre à la question : « le signal $x$ est-il présent dans le signal observé $y$ ? ».
Différentes techniques de détection existent, en fonction des connaissances que l'on a sur le signal recherché $x$.

Dans cette section, le bruit est supposé blanc, gaussien et additif (AWGN).

<!------------------------------------------------------------------------------------------------>

## Détection de signaux périodiques inconnus de période inconnue

Dans le cas où l'on cherche dans l'observation $y$ un signal $x$ périodique, mais qu'on ne connait ni sa période ni sa forme,
alors l'autocorrélation de $y$ permet de déterminer si le signal $x$ est présent et quelle est sa période.
On rappelle que l'[autocorrélation](https://vincmazet.github.io/signal1/xcorr/intro/#autocorr-lation)
correspond à mesurer la ressemblance d'un signal avec une version plus ou moins décalée de lui-même.

L'autocorrélation de l'observation $y = x + b$ est :

\begin{align*}
R_y[m] &= \sum_{n=-\infty}^{+\infty} y[n+m] y[n] \\
       &= \sum_{n=-\infty}^{+\infty} (x[n+m]+b[n+m]) (x[n]+b[n]) \\
       &= R_{x}[m] + R_{xb}[m] + R_{bx}[m] + R_{b}[m]
\end{align*}

où :
* $R_{x}$ est l'autocorrélation de $x$, elle est périodique de même période que $x$ ;
* $R_{xb}$ et $R_{bx}$ sont les intercorrélations entre $x$ et $b$ ; elles sont nulles puisque les deux signaux sont décorrélés ;
* $R_{b}$ est l'autocorrélation du bruit $b$ et elle est nulle (sauf en zéro) puisque le bruit est blanc (ses échantillons sont décorrélés).

Finalement, l'autocorrélation $R_y$ est égale à l'autocorrélation de $x$ (sauf en zéro).
Si $x$ est bien présent dans l'observation, alors $R_y$ est périodique et sa période est égale à la période de $x$.

:::{figure} figs/detection1.svg
:name: F:ssp:detection1
Le signal $y$ est la somme du signal $x$ (périodique, mais de forme et de période inconnues) et d'un bruit blanc $b$.
L'autocorrélation $R_{y}$ fait apparaître un motif périodique de période 50
qui confirme la présence dans $y$ d'un signal de même période.
:::

<!------------------------------------------------------------------------------------------------>

## Détection de signaux périodiques inconnus de période connue

Ce cas est plus favorable que le précédent car on dispose d'une information supplémentaire.
On cherche à déterminer si l'observation $y$ correspond au signal périodique $x$ (de période $T$) bruité par un bruit blanc $b$.
Le principe de détection consiste à effectuer l'intercorrélation de $y$ avec un signal auxiliaire $z$ périodique et de période $T$
(par exemple une simple sinusoïde).

En effet, l'intercorrélation de  $y$ et $z$ est égale à :

\begin{align*}
R_{yz}[m] &= \sum_{n=-\infty}^{+\infty} y[n+m] z[n] \\
       &= \sum_{n=-\infty}^{+\infty} (x[n+m]+b[n+m]) z[n] \\
       &= R_{xz}[m] + R_{bz}[m].
\end{align*}

$R_{xz}$ est périodique puisque $x$ et $z$ sont de même période,
alors que $R_{bz}$ est nulle puisque $b$ et $z$ sont décorrélés.
Ainsi, $R_{yz}$ sera périodique de période $T$ si le signal $x$ est présent.

:::{figure} figs/detection2.svg
:name: F:ssp:detection2
Le signal observé $y$ est la somme du signal périodique $x$ (de forme inconnue mais de période connue) et d'un bruit blanc $b$.
Le signal auxiliaire $z$ est ici une sinusoïde de même période que $x$.
L'intercorrélation $R_{yz}$ fait apparaître un motif périodique de période 50
qui confirme la présence dans $y$ d'un signal de même période.
:::

<!------------------------------------------------------------------------------------------------>

(P:ssp:filtre-adapte)=
## Détection d'un motif

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
cette technique est un filtrage, qu'on appelle «&nbsp;filtre adapté&nbsp;» (*matched filter*).
On peut montrer qu'elle est la solution optimale pour maximiser le RSB dans le cadre d'un bruit additif.
Elle est notamment utilisé dans des applications radar ou en communications numériques.

:::{figure} figs/filtre-adapte.svg
:name: F:ssp:filtre-adapte
Le motif $x$ est une porte et le signal observé $y$ correspond à $x$ décalé de $k=60$ échantillons
et bruité par un bruit blanc gaussien de RSB 15 dB.
Seules les corrélations de $x$ avec $x$ et $y$ présentent un maximum clair,
ce qui indique la présence du motif à cet instant.
:::

✏️ @P:ssp:exercice-4