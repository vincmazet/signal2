# Modulation en bande de base


## Modulation

Le signal analogique $x(t)$ modulé en bande de base à partir d'un message $m$ s'obtient grâce à l'équation :

$$
x(t) = \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd)
$$

où $h$ est un signal prédéfini appelé forme d'onde et les $\alpha_k$ sont les amplitudes de la forme d'onde et elles dépendent du message.
Notez que la somme est écrite avec une infinité de termes car le message peut être considéré, en toute généralité, de taille infinie.

Le choix de la forme d'onde $h$ et du lien entre le message $m$ et les amplitudes $\alpha$ défini un code en ligne.
Il existe beaucoup de codes en ligne, quelques exemples sont donnés ci-après.
En général, le lien entre le message et les amplitudes se fait par l'intermédiaire d'une table de correspondance,
c'est-à-dire que pour chaque symbole de l'alphabet correspond une amplitude particulière.


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

Dans le cas où le canal est bruité et de bande passante infinie, le signal reçu $y(t)$ est égal à

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
