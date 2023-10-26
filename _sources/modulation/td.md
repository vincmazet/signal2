# Excercices sur feuille


## Modulation analogique

### Exercice 1

<!-- Source : Oppenheim exo 8.3 -->

Le signal $m(t)$ est à bande limitée : $M(f)=0$ pour $|f|>1$ kHz.
Il est modulé en amplitude par une porteuse sinusoïdale de fréquence $f_p=1$ kHz :

$$
  x(t) = m(t) \sin(2\pi f_p t)
$$

Sa démodulation est effectuée par le dispositif suivant :

```{image} chaine-modulation.svg
:width: 300px
:align: center
```

où le filtre passe-bas $h(t)$ est idéal, de gain 2 et de fréquence de coupure $f_c=1$ kHz.
Déterminez $y(t)$.


### Exercice 2

Un message $m(t)$ est modulé en amplitude avec une porteuse de fréquence $f_p$ et de phase nulle.
Le signal $y(t)$ est issu d'une démodulation cohérente avec une porteuse de fréquence $f_q$.
Calculez la transformée de Fourier de $y(t)$ lorsque $f_q \neq f_p$.


### Exercice 3

<!-- ancien chiffrement du son Canal+ -->
<!-- Source : Ventre exo 2.1 -->

Lorsque Canal+ émettait encore en analogique,
le son $s(t)$ était chiffré en inversant son spectre comme schématisé ci-dessous.
Proposez une technique pour réaliser cette opération.

```{image} canalplus.svg
:width: 600px
:align: center
```


### Exercice 4

<!-- Ventre exo 2.5 -->

Un enregistrement stéréo est composé des voies gauche $g(t)$ et droite $d(t)$.
Le signal composite stéréo $x(t)$ est défini spectralement sur la figure ci-après (seule la partie positive est représentée) :
les voies gauche et droite sont transmises par multiplexage fréquentiel.
La somme $g(t)+d(t)$ est transmise en bande de base (c'est-à-dire autour de 0 Hz) ;
la différence $g(t)-d(t)$ est transmise à la fréquence $f_p=38$ kHz ; <!-- (en modulation double bande sans porteuse) -->
enfin, une sous-porteuse à 19 kHz est également transmise pour faciliter la synchronisation du démodulateur.

```{image} composite-stereo.svg
:width: 400px
:align: center
```

1. Justifiez les choix utilisés.
1. Donnez l'expression de $x(t)$.
1. Donnez un schéma de décodeur utilisant une démodulation cohérente et des filtres.


## Modulation numérique

### Exercice 5

Représentez la séquence binaire <code>01011</code> modulée en NRZ bipolaire, Manchester et AMI.


### Exercice 6

Représentez les constellations des modulations suivantes :

* OOK (_on-off keying_) définie dans [Wikipédia](https://en.wikipedia.org/w/index.php?title=On-off_keying&oldid=669950443) par :
  > On-off keying (OOK) denotes the simplest form of amplitude-shift keying (ASK) modulation
    that represents digital data as the presence or absence of a carrier wave.
    In its simplest form, the presence of a carrier for a specific duration represents a binary one,
    while its absence for the same duration represents a binary zero.
* 4-ASK ;
* 2-PSK (appelée aussi BPSK pour _binary PSK_) ;
* 8-QAM.

### Exercice 7

* Représentez la forme d'onde $h_1(t)$ :

$$
h_1(t) =
\begin{cases}
  1       &\text{si $t\in[0,\,T[$}, \\
  0       &\text{sinon}.
\end{cases}
$$

* Quelle est la réponse impulsionnelle du filtre de réception associé à $h_1(t)$ ?
* Calculez le signal en sortie du filtre lorsque l'entrée est $h_1(t)$.
* Mêmes questions pour la forme d'onde

$$
h_2(t) =
\begin{cases}
  1       &\text{si $t\in[0,\,T/2[$}, \\
  0       &\text{sinon}.
\end{cases}
$$