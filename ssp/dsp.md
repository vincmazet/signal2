(C:ssp:dsp)=
# Densité spectrale de puissance


<!-- Jutten
(voir au début du chapitre la définition d'un processus aléatoire)
Comme pour les signaux certains à puissance moyenne finie, la transformée de Fourier d’une réalisation xi (t) d’un processus aléatoire n’existe pas, car l’intégrale ne converge pas. On peut définir la densité spectrale de puissance (DSP) comme la limite de la DSP sur une fenêtre de largeur T , lorsque T → +∞, si la limite existe
(Théorème de Wiener-Khintchine) La densité spectrale de puissance d’un processus aléatoire stationnaire au sens large est la transformée de Fourier de sa fonction d’autocorrélation.
Remarques
1. Ce théorème donne une définition unique de la DSP, valide pour des signaux certains et aléatoires.
2. Pour des signaux aléatoires, ce théorème fournit une méthode pratique de calcul de la DSP.
3. Si la DSP d’un signal aléatoire, Sxx(f), est connue, on peut en déduire la fonction d’autocorrélation Rxx(τ) par transformée de Fourier inverse
On appelle bruit blanc un processus aléatoire W dont la densité spectrale de puissance est constante, ∀f. Le bruit à DSP constante est dit blanc par analogie avec la lumière blanche qui contient toutes les longueurs d’onde de la lumière visible. Le bruit blanc correspond à un modèle purement théorique. En effet, il est physiquement irréalisable car il contient des fréquences infinies et sa puissance moyenne est infinie. C’est cependant un modèle très pratique et utile pour représenter des signaux dont le spectre est constant, au moins sur une large bande de fréquence.
(Théomème de la limite centrale) La distribution statistique d’une somme de n variables aléatoires indépendantes, possédant la même loi de probabilité, tend asymptotiquement (lorsque n → +∞) vers une distribution gaussienne, quelle que soit la distribution des variables individuelles. Ce théorème joue un rôle important en théorie du signal, car il justifie que de nombreux phénomènes aléatoires, résultant de la superposition de très nombreux phénomènes aléatoires individuels indépendants, soient modélisés par une loi gaussienne.
Exo possible : exo 6.7.4
-->

## Autocorrélation statistique

L'autocorrélation statistique adapte l'[autocorrélation temporelle](https://vincmazet.github.io/signal1/xcorr/intro/#autocorr-lation) au caractère statistique d'un signal aléatoire.
Ainsi pour un signal aléatoire $x$, son autocorrélation statistique s'écrit :

$$
R_x[m] = \mathbb{E}\Big[ x[n+m] x[n] \Big].
$$

## Densité spectrale de puissance

La densité spectrale de puissance (*power spectral density*) est la transformée de Fourier à temps discret de l'autocorrélation statistique :

$$
S_x(f) = \mathcal{F} \left[ R_x \right](f) = \sum_{m=-\infty}^{+\infty} R_x[m] e^{-j 2 \pi m f}.
$$

La densité spectrale de puissance est définie pour $f\in\left[-\frac{1}{2},+\frac{1}{2}\right]$.
Elle indique comment la puissance du signal aléatoire se localise en fonction des fréquences.

<!-- Si la vraie définition est que la dsp est la puissance répartie sur les fréquences, comment faire le lien avec la transformée de Fourier de l'autocorrélation ? -->

<!-- (EXEMPLES) -->

La densité spectrale de puissance a les propriétés suivantes.

* La densité spectrale de puissance est une fonction réelle : $S_x(f) \in \mathbb{R}$.

* La densité spectrale de puissance est une fonction positive : $S_x(f) \geq 0$.

* L'intégrale de la densité spectrale de puissance est égale à l'autocorrélation en 0 mais aussi à la puissance du signal :
  
  $$
  \int_{-1/2}^{+1/2} S_x(f) df = R_x(0) = P_x
  $$

* La densité spectrale de puissance ne caractérise pas entièrement un signal aléatoire : deux signaux aléatoires peuvent avoir la même densité spectrale de puissance mais être différents !


<!-- 
Démo

$$
\int_{-1/2}^{+1/2} S_x(f) df
= \int_{-1/2}^{+1/2}  e^{+j2 \pi 0 f} df
= \mathcal{F}^{-1} \left[ S_x \right](0)
= R_x(0)
$$

Utiliser Parseval pour faire le lien avec P_x,
en notant qu'en intégrant la densité (de puissance), on obtient le tout (la puissance).

-->