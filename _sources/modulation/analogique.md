# Modulation analogique


## Modulation

La transmission d'un signal $m(t)$ avec une modulation en amplitude consiste à transmettre le signal $x(t)$
qui est le produit du message $m(t)$ par une porteuse sinusoïdale :

$$
x(t) = m(t) \sin(2\pi f_p t)
$$


```{image} mod1.png
:width: 400px
:align: center
```

On peut considérer le signal $m(t)$ comme un signal à bande limité,
c'est-à-dire que son spectre est nul au delà d'une certaine fréquence.
D'un point de vue fréquentiel, la modulation correspond à un décalage du spectre du message :

$$
X(f)
&= M(f) * \mathcal{F}[\sin(2\pi f_p t)](f) \\
&= M(f) * \frac{1}{2j}\left[\delta(f-f_p)-\delta(f+f_p)\right] \\
&= \frac{1}{2j}\left[M(f-f_p)-M(f+f_p)\right]
$$

```{image} mod2.png
:width: 400px
:align: center
```

```{margin}
Attention, ce problème n'est pas du repliement spectral car il n'y a pas de fréquence d'échantillonnage ici.
```

Il n'y a pas de chevauchement tant que $f_p>f_\text{max}$.
Au contraire, si $f_p<f_\text{max}$ alors on ne pourrait pas démoduler le message.

## Démodulation

Il existe plusieurs techniques de démodulation.
la plus efficace, bien que délicate à mettre en pratique, est la _démodulation cohérente_.
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

```{image} mod3.png
:width: 400px
:align: center
```

Un filtre passe-bas permet dans un deuxième temps de filtrer les hautes fréquences
pour retrouver le spectre original, et donc le signal $m(t)$.


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

