(C:modulation:bande-de-base)=
# Modulation en bande de base


La modulation en bande de base est une modulation numérique :
le signal $m$ est donc discret et ses valeurs sont des symboles binaires (0 ou 1)
ou $M$-aires ($M=16$ en hexadécimal par exemple).

## Modulation

Le signal transmis $x(t)$ est une suite de formes d'onde $h(t)$ de durée $d$
multipliées par une amplitude $\alpha_k$, celle-ci étant directement liée aux symboles $m_k$.
Ainsi, le signal analogique $x(t)$ s'obtient grâce à l'équation 
(notez que la somme est écrite avec une infinité de termes car le message peut être considéré, en toute généralité, de taille infinie) :

$$
x(t) = \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd)
$$

où $h$ est un signal prédéfini appelé forme d'onde et les $\alpha_k$ sont les amplitudes de la forme d'onde qui dépendent du message.
En général, le lien entre le message et les amplitudes se fait par l'intermédiaire d'une table de correspondance,
c'est-à-dire que pour chaque symbole de l'alphabet correspond une amplitude particulière.

Le choix de la forme d'onde $h$ et de la table de correspondance entre $m_k$ et les amplitudes $\alpha_k$ défini ce qu'on appelle un _code en ligne_.
Il existe beaucoup de codes en ligne, quelques exemples sont donnés ci-après.



### Code NRZ bipolaire

Le code NRZ (non retour à zéro) bipolaire est défini par la table de correspondance et la forme d'onde ci-dessous :


::::{grid} 1 1 1 2
:gutter: 3

:::{grid-item-card} Forme d'onde
$$
h(t) =
\begin{cases}
  V &\text{si } t \in [0,d], \\
  0 &\text{sinon}
\end{cases}
$$

```{image} code-nrz.svg
:width: 70%
:align: center
```
:::

:::{grid-item-card} Amplitudes
| $m_k$ | $\alpha_k$ |
| ----- | ---------- |
| $0$   | $-1$       |
| $1$   | $+1$       |
:::

::::


### Code Manchester

Le code Manchester est utilisé pour le protocole Ethernet.

::::{grid} 1 1 1 2
:gutter: 3

:::{grid-item-card} Forme d'onde
$$
h(t) =
\begin{cases}
  V  &\text{si } t \in [0,d/2], \\
  -V &\text{si } t \in [d/2,d], \\
  0  &\text{sinon}
\end{cases}
$$

```{image} code-manchester.svg
:width: 70%
:align: center
```
:::

:::{grid-item-card} Amplitudes
| $m_k$ | $\alpha_k$ |
| ----- | ---------- |
| $0$   | $-1$       |
| $1$   | $+1$       |
:::

::::


### Code AMI

Le code AMI (_alternate mark inversion_) a été utilisé dans certaines communications téléphoniques.

::::{grid} 1 1 1 2
:gutter: 3

:::{grid-item-card} Forme d'onde
$$
h(t) =
\begin{cases}
  V &\text{si } t \in [0,d], \\
  0 &\text{sinon}
\end{cases}
$$

```{image} code-ami.svg
:width: 70%
:align: center
```
:::

:::{grid-item-card} Amplitudes
| $m_k$ | $\alpha_k$ |
| ----- | ---------- |
| $0$   | $0$        |
| $1$   | $\pm1$ alternativement |
:::

::::

<a class="exercise btn btn-light" href="td.html#exercice-5" role="button">5</a>


## Démodulation en présence de bruit

Considérons le cas où le canal est de bande passante infinie
(le cas inverse est plus compliqué à traiter et dépasse le cadre de ce cours).
Le signal reçu $y(t)$ est donc égal à

$$
y(t) = x(t) + b(t) = \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) + b(t)
$$

où $b(t)$ et le bruit.

Pour retrouver la séquence binaire que représente ce signal, il faut déterminer les amplitudes $\alpha_k$ des formes d'onde $h(t-kd)$.
Cela revient à chercher en chaque instant $kd$ la ressemblance du signal reçu $y$ avec la forme d'onde $h$ :
une intecorrélation entre le signal reçu $y(t)$ et la forme d'onde $h(t)$ est donc effectuée ;
cette technique est appelée filtre adapté (_matched filter_).
Ensuite, le signal filtré est échantillonné tous les $d$ puis comparé à un seuil pour décider du symbole émis.

Schématiquement, la démodulation est représentée {numref}`F:demodulation-bruit-bb` :

```{figure} demodulation-bruit-bb.svg
---
name: F:demodulation-bruit-bb
width: 500px
---
Démodulation d'un signal en bande de base avec un canal idéal.
```

Le filtre de réception est le filtre adapté $r(t)=h(-t)$ et $d$ est la durée d'un symbole.
Quant au seuil, sa valeur optimale dépend du nombre de symboles dans l'alphabet et de la probabilité d'émettre les bits $0$ et $1$.
Dans le cas d'une communication binaire et lorsque les probabilités sont égales, alors le seuil optimal est la moyenne des amplitudes associées à ces deux bits.
<!-- Dans le cas $M$-aire, il y a plusieurs seuils, chacun étant situé au milieu de l'intervalle défini par les amplitudes de deux symboles consécutifs. -->
