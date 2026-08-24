(C:modulation:bande-de-base)=
# Modulation numérique en bande de base


La modulation en bande de base est une modulation numérique :
le message $m$ est donc discret et regroupe $N$ symboles binaires (0 ou 1)
ou $M$-aires ($M=16$ en hexadécimal par exemple).

## Modulation

Le signal transmis $x(t)$ est une suite de formes d'onde $h(t)$ de durée $d$
chacune étant multipliée par une amplitude $\alpha_k$ qui est directement liée aux symboles $m_k$.
Ainsi, le signal analogique $x(t)$ est :

$$
x(t) = \sum_{k=0}^{N-1} \alpha_k h(t-kd)
$$

Le lien entre les symboles $m_k$ et les amplitudes $\alpha_k$ se fait par l'intermédiaire d'une table de correspondance.
Le choix de la forme d'onde $h$ et de la table de correspondance entre $m_k$ et $\alpha_k$
définit un _code en ligne_, quelques exemples sont donnés ci-après.



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


## Démodulation

Le signal reçu après transmission via un canal bruité s'écrit :

$$
y(t) = x(t) + b(t) = \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) + b(t)
$$

où $b(t)$ et le bruit.

Pour retrouver le message, il faut connaître les amplitudes $\alpha_k$,
et donc déterminer où se trouvent les formes d'onde $h$ dans le signal $y$.
Un [filtre adapté](C:ssp:filtre-adapte) est donc appliqué sur le signal reçu $y(t)$.
Le signal filtré est ensuite échantillonné tous les $d$
puis comparé à un seuil pour déterminer le symbole correspondant ({numref}`F:demodulation-bruit-bb`).
Dans le cas d'un message binaire le seuil est la moyenne des amplitudes associées aux symboles 0 et 1.

```{figure} demodulation-bruit-bb.svg
---
name: F:demodulation-bruit-bb
width: 100%
---
Démodulation d'un signal en bande de base.
Les points en couleur correspondent aux informations de la {numref}`F:demodulation-bb-signaux`.
```

```{figure} demodulation-bb-signaux.svg
---
name: F:demodulation-bb-signaux
width: 100%
---
Illustration de la démodulation d'un signal en bande de base (code Manchester) pour le message 10011010.
```
