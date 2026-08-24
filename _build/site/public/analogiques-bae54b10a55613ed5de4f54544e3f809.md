(P:filtrage:analogiques)=
# Filtres analogiques

Malgré le développement incontestable du traitement numérique du signal, le filtrage analogique reste incontournable.
En effet, les signaux à filtrer peuvent être analogiques,
mais on peut également citer les filtres anti-repliement pour réduire la bande passante d'un signal analogique,
ou le fait que la conception de certains filtres numériques nécessite de définir un filtre analogique.

Les premiers développements de filtres analogiques sont expérimentaux et datent du début du XX<sup>e</sup> siècle avec la téléphonie.
Les premières théories ont été développées dans les années 1930–1940.


## Synthèse des filtres analogiques

Comme on l'a vu précédemment (cf. [Transformée de Laplace inverse](#P:laplace:inverse)), on ne peut pas construire de filtre idéal pour une application temps réel.
Les fonctions de transfert des filtres analogiques classiques s'écrivent sous la forme d'une fraction rationnelle
et ne peuvent qu'approximer le gain d'un filtre idéal :

$$
H(s) = \frac{ \sum_{m=0}^M b_m s^m }{ \sum_{n=0}^N a_n s^n }
     = \frac{ b_Ms^M + b_{M-1}s^{M-1} + \dots + b_1s + b_0 }{ a_Ns^N + a_{N-1}s^{N-1} + \dots + a_1s + a_0 }
$$

L'enjeu revient donc à déterminer, en fonction du gabarit choisi, les valeurs des coefficients $b_m$ et $a_n$ :
c'est l'objet des travaux de [Butterworth](https://en.wikipedia.org/wiki/Stephen_Butterworth),
[Tchebychev](https://fr.wikipedia.org/wiki/Pafnouti_Tchebychev)
ou [Cauer](https://en.wikipedia.org/wiki/Wilhelm_Cauer) pour ne citer qu'eux.
La réponse fréquentielle d'un filtre varie donc en fonction des coefficients de sa fonction de transfert.

La plupart des méthodes de conception des filtres nécessitent de concevoir avant tout
un filtre passe-bas de fréquence de coupure égale à 1 Hz : c'est ce qu'on appelle un filtre passe-bas normalisé (*low-pass prototype*).
On obtient ensuite le filtre désiré en remplaçant la variable $s$ de la fonction de transfert $H(s)$ du filtre passe-bas normalisé par la transformation adéquate :

```{margin}
La pulsation est égale à la fréquence multipliée par $2\pi$ ;
elle s'exprime en rad.s<sup>-1</sup>.
```

```{margin}
La fréquence «&nbsp;de coin&nbsp;» (*edge frequency* ou *critical frequency*)
est une fréquence particulière du gabarit, qui définit le filtre.
Ce peut être la fréquence de coupure à $-3$ dB, ou la fréquence de la bande passante,
ou la fréquence de la bande atténuée.
```

* Passe-bas de pulsation de coin $w_0$ :

  $$s \rightarrow \frac{s}{\omega_0}$$

* Passe-haut de pulsation de coin $w_0$ :

  $$s \rightarrow \frac{\omega_0}{s}$$

* Passe-bande de pulsations de coin $\omega_1$ et $\omega_2$ :

  $$s \rightarrow \frac{\omega_0}{\omega_2-\omega_1} \frac{s^2+\omega_0^2}{s\omega_0}$$

* Coupe-bande de pulsation de coin $\omega_1$ et $\omega_2$ :

  $$s \rightarrow \frac{\omega_2-\omega_1}{\omega_0} \frac{s\omega_0}{s^2+\omega_0^2}$$

Historiquement, on utilisait des tables ou des formules pour obtenir les coefficients du filtre passe-bas prototype,
et la transformation était effectuée à l'aide de calculs.
Désormais, des programmes déterminent directement les coefficients du filtre attendus à partir du gabarit souhaité.


## Réponses standards

Outre la définition du gabarit, il reste à choisir la famille du filtre à synthétiser.
Les cinq principales familles sont détaillées ci-après,
à noter qu'il existe deux types de filtre de Tchebychev (Chebyshev en anglais) : le type I et le type II.

Une comparaison de ces familles en termes de réponse fréquentielle, réponse impulsionnelle et retard de groupe
est présentée ci-dessous sur la base d'un filtre passe-bas d'ordre 3, de fréquence de coin 1 Hz,
d'ondulation en bande passante 3 dB et d'atténuation en bande atténuée 30 dB.

% Un graphique interactif comme j'en avais fait en Matlab serait vraiment bien,
% mais reste très secondaire par rapport aux objectifs du cours et en tenant compte du temps de création de cette interaction.
% Si je m'y lançais, la solution serait certainement de faire un code en js (type spetsi),
% quite à ce que les données (voire le script js) soit généré par du code Python.
% En tout cas, je n'ai pas réussi à faire fonctionner ipywidgets.

`````{tab-set}
````{tab-item} Gain
```{image} figs/fana-gain.svg
```
````

````{tab-item} Phase
```{image} figs/fana-phase.svg
```
````

````{tab-item} Réponse impulsionnelle
```{image} figs/fana-impulse.svg
```
````

````{tab-item} Retard de groupe
```{image} figs/fana-gd.svg
```
````
`````

Des résultats précédents, on peut en déduire les principales différences et caractéristiques des filtres.

Le **filtre de Butterworth** est caractérisé par :
- aucune ondulation en bande passante,
- aucune ondulation en bande atténuée,
- une bande de transition assez large.

Le **filtre de Bessel** est l'approximation d'un retard pur, et ses caractéristiques sont :
- un retard de groupe quasi-constant dans la bande passante,
- aucune ondulation en bande passante,
- aucune ondulation en bande atténuée,
- une bande de transition très large.

Le **filtre de Tchebychev de type I** possède les caractéristiques suivantes :
- présence d'ondulations en bande passante (mais la valeur maximale de ces atténuations est minimisée),
- aucune ondulation en bande atténuée,
- bande de transition plus étroite que les filtres de Butterworth et Bessel,
- un retard de groupe très distordue près de la fréquence de coupure.

Le **filtre de Tchebychev de type II** possède les caractéristiques suivantes :
- aucune ondulation en bande passante,
- présence d'ondulations en bande atténuée,
- une bande de transition plus étroite que les filtres de Butterworth et Bessel.

Le **filtre de Cauer** (ou **filtre elliptique**) possède les caractéristiques ci-dessous :
* présence d'ondulations en bande passante,
* présence d'ondulations en bande atténuée,
* une transition très rapide,
* un retard de groupe très distordu près de la fréquence de coupure.
