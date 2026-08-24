(C:modulation:porteuse)=
# Modulation numérique sur porteuse


En modulation numérique, le message $m$ est discret et ses valeurs sont des symboles binaires (0 ou 1)
ou $M$-aires ($M=16$ en hexadécimal par exemple).

## Modulation

### Principe

Une modulation numérique sur porteuse est une modulation en amplitude et en phase d'un message numérique.
À chaque symbole $k$ du message numérique sont associés : une amplitude $A_k$ et une phase $\varphi_k$.
Le signal modulé $x(t)$ s'écrit donc :

$$
x(t) = \sum_{k=0}^{N-1}  A_k h(t-kd) \cos(2\pi f_p t + \varphi_k)
$$

où $N$ est le nombre de symboles dans le message,
$f_p$ est la fréquence de la porteuse
et $h(t-kd)$ est une porte de durée $d$
qui permet de fenêtrer l'effet du symbole $k$ à l'intervalle $[kd, (k+1)d]$ :

$$
h(t-kd) =
\begin{cases}
  1 &\text{si}\quad kd \leq t < (k+1)d \\
  0 &\text{sinon}
\end{cases}
$$

En utilisant les propriétés de trigonométrie, on peut montrer que $x(t)$ s'écrit comme la somme de deux termes :

$$
x(t) = \underbrace{ \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) \cos(2\pi f_p t) }_{ \text{Composante en phase} }
     + \underbrace{ \sum_{k=-\infty}^{+\infty} \beta_k  h(t-kd) \sin(2\pi f_p t) }_{ \text{Composante en quadrature} }.
$$

où $\alpha_k =   A_k \cos(\varphi_k)$ et $\beta_k  = - A_k \sin(\varphi_k)$.

```{dropdown} Démonstration
Puisque $\cos(a+b) = \cos a \cdot \cos b - \sin a \cdot \sin b$, alors :

$$
x(t) &= \sum_{k=0}^{N-1}  A_k h(t-kd) \cos(2\pi f_p t + \varphi_k) \\
     &= \sum_{k=-\infty}^{+\infty} A_k h(t-kd) \big[ \cos(2\pi f_p t)\cos(\varphi_k) - \sin(2\pi f_p t)\sin(\varphi_k) \big] \\
$$

Et donc en développant l'expression :

$$
x(t) &= \sum_{k=-\infty}^{+\infty} \big[ A_k h(t-kd) \cos(2\pi f_p t)\cos(\varphi_k) - A_k h(t-kd) \sin(2\pi f_p t)\sin(\varphi_k) \big] \\
     &= \sum_{k=-\infty}^{+\infty} \underbrace{   A_k \cos(\varphi_k) }_{\alpha_k} h(t-kd) \cos(2\pi f_p t)
      + \sum_{k=-\infty}^{+\infty} \underbrace{ - A_k \sin(\varphi_k) }_{\beta_k} h(t-kd) \sin(2\pi f_p t).
$$
```

Une modulation numérique sur porteuse est donc la somme de deux signaux modulés en amplitude !

Pour réaliser une modulation numérique sur porteuse, il faut donc définir la fréquence de la porteuse $f_p$ et les amplitudes $\alpha_k$ et $\beta_k$ :
* la fréquence de la porteuse $f_p$ est choisie en fonction des contraintes liées à l'application (capacité à traverser les obstacles, capacités du matériel, normes, etc.) ;
* les amplitudes $\alpha_k$ et $\beta_k$ sont définies en choisissant, pour chacun des types des symboles, un couple $(\alpha_k,\beta_k)$ qui lui est propre.


### Constellation

Il se trouve que les modulations numériques sur porteuse sont très souvent utilisées dans le cas de signaux $M$-aires avec $M$ grand.
On utilise donc généralement une représentation graphique qu'on appelle « constellation »
({numref}`F:modulation:4qam`):
c'est un graphe 2D où chaque point correspond à un symbole dont les coordonnées sont les amplitudes $\alpha_k$ et $\beta_k$.
Les axes sont nommés $I$ (pour _in-phase component_) et $Q$ (pour _quadrature component_).

```{margin}
Chaque point de la constellation correspond à une amplitude des composantes en phase et en quadrature,
lesquelles sont directement reliées à l'énergie du signal.
Par conséquent, l'énergie du signal est directement reliée au module des points de la constellation.
En d'autres termes, plus l'espace occupé par la constellation est important,
plus l'énergie nécessaire pour générer le signal modulé est importante.
```

```{figure} constellation-4qam.svg
---
width: 300px
name: F:modulation:4qam
---
Exemple de constellation pour une modulation 4-QAM dont les $M=4$ symboles 0, 1, 2 et 3
sont associés respectivement aux couples $(1,1)$, $(-1,1)$, $(-1,-1)$ et $(1,-1)$.
```

En fonction de l'organisation des points dans la constellation, on distingue trois types de modulations numériques sur porteuse :

* dans une **modulation à déplacement d'amplitude** (ASK : _amplitude shift keying_),
  les points de la constellation sont alignés sur une droite passant par l'origine.
  Ainsi, tous les symboles sont associés à une sinusoïde de même phase ;

* dans une **modulation à déplacement de phase** (PSK : _phase shift keying_),
  les points de la constellation sont répartis sur un cercle centré en l'origine.
  Ainsi, les symboles sont associés à une sinusoïde de même amplitude mais de phase différente ;

* dans une **modulation d'amplitude en quadrature** (QAM : _quadrature amplitude modulation_),
  les symboles se répartissent dans l'espace autour de l'origine.
  La modulation QAM est ainsi très intéressante lorsque le nombre de symboles $M$ devient grand.

```{figure} constellation-ask-psk-qam.svg
---
width: 650px
name: F:modulation:ask-psk-qam
---
Exemple de constellations.
```

<!-- Le signal associé au message <code>013302</code> est donc :

```{image} signal-4ask.svg
:width: 600px
:align: center
```

```{image} signal-4psk.svg
:width: 600px
:align: center
``` -->

<a class="exercise btn btn-light" href="td.html#exercice-6" role="button">6</a>


## Démodulation en présence de bruit

Le signal reçu après transmission via un canal bruité s'écrit :

$$
y(t) = x(t) + b(t)
$$

où $b(t)$ et le bruit.

Puisqu'une modulation numérique sur porteuse est la somme de deux signaux modulés en amplitude,
la première étape de la démodulation consiste à effectuer une démodulation cohérente sur les composantes en phase et en quadrature.

Par exemple, pour la composante en phase :

```{div} full-width
$$
w(t) &= y(t) \cos(2\pi f_p t) \\
     &= \left[
          \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) \cos(2\pi f_p t)
        + \sum_{k=-\infty}^{+\infty} \beta_k  h(t-kd) \sin(2\pi f_p t)
        + b(t)
       \right] \cos(2\pi f_p t) \\
     &=   \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) \frac{1}{2} \left(1+\cos(4\pi f_p t)\right)
        + \sum_{k=-\infty}^{+\infty} \beta_k  h(t-kd) \frac{1}{2} \sin(4\pi f_p t)
        + b(t) \cos(2\pi f_p t) \\
     &=   \underbrace{ \frac{1}{2} \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) }_{\text{basse fréquence}}
        + \underbrace{ \frac{1}{2} \sum_{k=-\infty}^{+\infty} \alpha_k h(t-kd) \cos(4\pi f_p t) }_{\text{haute fréquence}}
        + \underbrace{ \frac{1}{2} \sum_{k=-\infty}^{+\infty} \beta_k  h(t-kd) \sin(4\pi f_p t) }_{\text{haute fréquence}}
        + \underbrace{ b(t) \cos(2\pi f_p t) }_{\text{bruit}}
$$
```

Le signal $w(t)$ est donc la somme d'un signal basse fréquence, d'un signal haute fréquence et de bruit.
Comme les signaux haute fréquence sont des modulations sur porteuse centrées autour de $2f_p$,
un filtre passe-bas de fréquence de coupure égale à $f_p$ permet d'éliminer ces signaux (et une partie du bruit).
Le signal basse fréquence résultant est un signal en bande de base
sur lequel on effectue une démodulation en bande de base (filtre adapté, échantillonnage, seuillage)
pour obtenir les symboles associés aux amplitudes $\alpha_k$.

Pour obtenir les symboles associés aux amplitudes $\beta_k$, on procède de la même manière en multipliant le signal reçu par $\sin(2\pi f_p t)$.

<!-- Schéma d'un démodulateur -->

<!-- Pour terminer, notons que la démodulation cohérente nécessite de connaître parfaitement la fréquence et la phase de la porteuse,
ce qui peut se faire avec une [boucle à verrouillage de phase](https://fr.wikipedia.org/wiki/Boucle_%C3%A0_phase_asservie)
ou une [détection d'enveloppe](https://fr.wikipedia.org/wiki/Circuit_d%C3%A9tecteur_d%27enveloppe). -->

<a class="exercise btn btn-light" href="td.html#exercice-7" role="button">7</a>