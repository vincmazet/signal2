(C:ssp-bruit)=
# Bruit dans les signaux

On appelle *bruit* les modifications non souhaitées et inconnues
que subit un signal lors de son acquisition, de son enregistrement, de son traitement ou de sa transmission.

Ce qu'on appelle bruit dépend très fortement du contexte [[Jutten 2018](#B:Jutten2018)].
Par exemple, pour l'opérateur sonar d'un sous-marin militaire,
le signal utile est émis par les navires alors que les bancs de poissons
émettent des signaux qui sont des perturbations pour le signal utile, donc du bruit.
À l'inverse, pour l'opérateur sonar d'un navire de pêche,
le signal utile est celui émis par les bancs de poissons
et les autres signaux sont des perturbations et constituent du bruit.

Le bruit est donc un signal qui va perturber le signal original.
Comme les modifications apportées par le bruit sont inconnues,
alors ce dernier est modélisé par un signal aléatoire dont les amplitudes sont des variables aléatoires.
La densité de probabilité du bruit peut être gaussienne, uniforme, de Poisson, etc.

<!------------------------------------------------------------------------------------------------>

## Le bruit blanc

Un bruit $b[n]$ *blanc* est un signal aléatoire d'espérance nulle et de densité spectrale de puissance constante.
Cela implique que la puissance du bruit est répartie de manière uniforme sur les fréquences, justifiant l'appelation de « blanc » par analogie avec la lumière.

En notant $\sigma_b^2$ la valeur constante de la densité spectrale de puissance,
l'autocorrélation du bruit blanc $b$ est nulle partout sauf en $0$ :

$$
S_b(f) = \sigma_b^2
\quad\Leftrightarrow\quad
R_b[m] = \sigma_b^2 \delta[m].
$$

Ce résultat implique que les échantillons d'un bruit blanc sont décorrélés.

La valeur de l'autocorrélation en $0$ étant égale à la puissance du signal,
le bruit blanc a pour puissance $\sigma_b^2$.

Cette valeur $\sigma_b^2$ est la variance du signal $b$ puisque $R_b[0] = \sigma_b^2 \delta[0]$
et que, sachant que $\mathbb{E}[b] = 0$ on a :

$$
R_b[0] = \mathbb{E}\Big[ b[n+0] b[n] \Big] = \mathbb{E}\Big[ b^2 \Big] = \mathbb{V}\Big[ b \Big].
$$

<!------------------------------------------------------------------------------------------------>

## Le bruit blanc i.i.d.

un bruit blanc $b[n]$ est *indépendant et identiquement distribué* (i.i.d.) si :
- ses échantillons sont sans relation les uns avec les autres (ils sont indépendants),
- ses échantillons ont tous la même densité de probabilité (ils sont identiquement distribués).

<!------------------------------------------------------------------------------------------------>

## Le bruit blanc gaussien additif

Le bruit blanc gaussien additif (AWGN : *additive white Gaussian noise*)
est un modèle très répandu et assez simple de bruit qui possède les caractéristiques suivantes :
- le bruit est blanc,
- ses réalisations sont i.i.d.,
- la densité de probabilité de ses réalisations est une loi normale,
- le bruit s'ajoute au signal d'intérêt.

Ainsi, un signal $x$ bruité par un bruit AWGN se modélise :

$$
\forall n, \quad
y[n] = x[n] + b[n]\quad
\text{où}\; b[n] \sim \mathcal{N}(0,\sigma).
$$

::::{admonition} Exemple
:class: exemple

Dans cet exemple, une sinusoïde $x$ de 440 Hz (correspondant à la note *la*)
est bruité par un bruit blanc gaussien additif $b$.

:::{dropdown} Signal $x$
:open:
![](#C:ssp:signal-x)
:::

:::{dropdown} Signal $b$
:open:
![](#C:ssp:signal-b)
:::

:::{dropdown} Signal $y$
:open:
![](#C:ssp:signal-y)
:::

::::

<!------------------------------------------------------------------------------------------------>

(P:ssp:rsb)=
## Rapport signal à bruit

Le rapport signal-à-bruit (RSB, ou en anglais SNR : *signal-to-noise ratio*) est une mesure de l'intensité du bruit dans un signal.
Il correspond au rapport entre la puissance du signal $x$ et la puissance du bruit $b$
et est généralement exprimé en décibels :

$$
\text{RSB} = 10 \log_{10} \left(\frac{P_x}{P_b}\right)
$$

où les puissances s'expriment :

$$
P_x = \frac{1}{N} \sum_{n=0}^{N-1} |x[n]|^2
\quad\text{et}\quad
P_b = \frac{1}{N} \sum_{n=0}^{N-1} |b[n]|^2.
$$

Notez que dans le cas d'un bruit blanc, la puissance du bruit $P_b$ est égale à la variance du bruit.

:::{figure} figs/rsb.svg
:width: 100%
:name: F:ssp:rsb
Exemples d'une même sinusoïde bruitée à différents RSB.
:::

Le RSB n'est bien évidemment pas utilisé dans un traitement réel,
puisque le bruit $b$ n'est pas connu.
Le RSB est utilisé pendant la phase de développement d'une méthode de traitement du signal.
En effet, les tests effectués durant cette phase de développement
nécessitent d'avoir à disposition le signal non bruité et le bruit.
Il est alors possible de calculer le RSB,
ce qui permet de comparer les performances du traitement réalisé avec d'autres méthodes.

✏️ @P:ssp:exercice-3
