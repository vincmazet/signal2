(C:modulation:analogique)=
# Modulation analogique


La modulation analogique consiste à transmettre une porteuse (une sinusoïde de fréquence $f_p$)
dont l'un des paramètres (amplitude, phase ou fréquence instantanée) évolue dans le temps en fonction du message $m(t)$.
* Un signal modulé en amplitude (AM pour _amplitude modulation_) a pour expression :

  $$
  x(t) = m(t) \sin(2\pi f_p t) ;
  $$
  
* Un signal modulé en phase (PM pour phase modulation_) a pour expression :

  $$
  x(t) = a \sin(2\pi f_p t + \varphi(t))
  $$

  où $\varphi(t)$ est une fonction de $m(t)$ ;

* Un signal modulé en fréquence (FM pour _frequency modulation_) a pour expression :

  $$
  x(t) = a \sin(2\pi f(t) t)
  $$

  où $f(t)$ est une fonction de $m(t)$.

Nous détaillons ci-après la modulation en amplitude qui est la technique la plus simple.
En pratique, la modulation d'amplitude est utilisée par exemple en radio
(grandes ondes, ondes moyennes ou ondes courtes),
en particulier dans le cas de communications longues distances
(dans le secteur militaire, maritime voire aéronautique).

## Modulation

La transmission d'un signal $m(t)$ en modulation en amplitude consiste à transmettre le signal $x(t)$
qui est le produit du message $m(t)$ par une porteuse sinusoïdale de fréquence $f_p$ :

$$
x(t) = m(t) \sin(2\pi f_p t)
$$

```{figure} modulation-analogique-1.svg
---
name: F:analogique:1
width: 500px
---
Exemple de modulation d'amplitude du signal $m(t)$ avec une porteuse de fréquence $f_p = 10$ Hz.
```

On peut considérer le signal $m(t)$ comme un signal à bande limité,
c'est-à-dire que son spectre est nul au delà d'une certaine fréquence.
D'un point de vue fréquentiel, la modulation correspond à un décalage du spectre du message
autour de $-f_p$ et $+f_p$ :

$$
X(f)
&= M(f) * \mathcal{F}[\sin(2\pi f_p t)](f) \\
&= M(f) * \frac{1}{2j}\left[\delta(f-f_p)-\delta(f+f_p)\right] \\
&= \frac{1}{2j}\left[M(f-f_p)-M(f+f_p)\right]
$$

```{figure} modulation-analogique-2.svg
---
name: F:analogique:2
width: 500px
---
Effet de la modulation sur le spectre.
```

```{margin}
Attention, ce problème n'est pas du repliement spectral car il n'y a pas de fréquence d'échantillonnage ici.
```

Il convient de faire attention à éviter qu'il n'y ait pas de chevauchement
entre les deux parties du spectre, donc il faut faire en sorte que $f_p>f_\text{max}$.
Si cette condition n'est pas remplie, alors la démodulation n'est pas en mesure de retrouver le message original.


## Démodulation

Il existe plusieurs techniques de démodulation.
La plus efficace, bien que délicate à mettre en pratique, est la _démodulation cohérente_.
Cela consiste dans un premier temps à multiplier le signal reçu $y(t)$ par la porteuse :

$$
w(t) = y(t) \sin(2\pi f_p t)
$$

soit en fréquentiel :

```{div} full-width
$$
W(f)
&= Y(f) * \frac{1}{2j}\left[\delta(f-f_p)-\delta(f+f_p)\right] \\
&= \frac{1}{2j}\left[Y(f-f_p)-Y(f+f_p)\right] \\
&= \frac{1}{2j}\left[ \frac{1}{2j}\big(M(f-2f_p)-M(f+f_p-f_p)\big) - \frac{1}{2j}\big(M(f-f_p+f_p)- M(f+2f_p)\big) \right] \\
&= -\frac{1}{4} M(f-2f_p) + \frac{1}{2} M(f) - \frac{1}{4} (f+2f_p)
$$
```

```{figure} modulation-analogique-3.svg
---
name: F:analogique:3
width: 500px
---
Effet de la multiplication du signal modulé par la porteuse.
```

Le résultat de cette multiplication par la porteuse produit un spectre
contenant trois occurrences du spectre du message :
* une occurrence centrée sur $0$ dont l'amplitude est divisée par 2,
* une occurrence centrée sur $-2f_p$ dont l'amplitude est divisée par 4,
* une occurrence centrée sur $+2f_p$ dont l'amplitude est divisée par 4.

Pour récupérer l'occurrence en basse fréquence et supprimer les occurrences
dans les hautes fréquences, il suffit d'appliquer un filtre passe-bas
de fréquence de coupure $f_p$.
Un gain appliqué sur la sortie du filtre permet de retrouver le message $m(t)$
avec une amplitude convenable.


<a class="exercise btn btn-light" href="td.html#exercice-1" role="button">1</a>
<a class="exercise btn btn-light" href="td.html#exercice-2" role="button">2</a>
<a class="exercise btn btn-light" href="td.html#exercice-3" role="button">3</a>
<a class="exercise btn btn-light" href="td.html#exercice-4" role="button">4</a>


<!-- # Modulation angulaire

## Principe

On module la phase du signal modulé :

$$
x(t) = \sin(2\pi f_p t + \varphi(t))
$$

* En modulation de phase, $$\varphi(t) = k \cdot m(t)$ où $k$ est l'_indice de modulation_.
  On doit avoir $k<\pi/\mathrm{max}(m(t))$ pour éviter les ambiguités.

* En modulation de fréquence, $$\varphi(t) = 2\pi k \int_0^t m(\tau) d\tau$
  où $k$ est l'_excursion en fréquence_ et doit respecter $k<f_p$.

## Spectre d'une modulation angulaire

* si $\mathrm{max}(|\varphi(t)|)$ est faible (inférieur à 0,5)

  **FIGURE**

* si $\mathrm{max}(|\varphi(t)|)$ est grand (supérieur à 0,5)

  **FIGURE**
(cf Ventre)

Théorème de Woodward : le module du spectre du signal modulé $y(t)$ a la même forme que la densité de probabilité du message $m(t)$.

## Génération de la modulation

Le principe est de transformer les variations d'amplitude du message en variation de fréquences.

Méthode directe : un oscillateur commandé en tension (VCO : _voltage controlled oscillator_)
transforme les variations d'amplitudes en variation de fréquence.
C'est un circuit électronique constitué de :
* une diode varicap (revient à un condensateurs dont la capacité est fonction de la tension appliquée),
* un circuit oscillant commandé par la diode varicap.

## Génération de la démodulation

Il existe de nombreuses méthodes.
Pour certaines applications, comme en radiodiffusion
où le nombre de récepteurs est très supérieur au nombre d'emetteurs,
il est important d'avoir des techniques de démodulation simples, fiables et peu coûteuses.

Par exemple à l'aide d'une boucle à verrouillage de phase (PLL : _phase locked loop_).

**FIGURE**

La sortie du comparateur de phase est une tension proportionnelle à la différence de phase en entrée. -->

