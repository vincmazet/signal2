/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

= Exercices sur feuille

== Signaux élémentaires <signaux-l-mentaires>

=== Exercice 1 <exercice-1>

Donnez des exemples concrets de signaux échantillonnés, de signaux à temps continu, de signaux quantifiés, de signaux analogiques et de signaux numériques.

=== Exercice 2 <exercice-2>

Qu'est-ce qu'un signal causal~?

=== Exercice 3 <exercice-3>

Donnez la définition mathématique des signaux suivants~puis représentez-les :

- un échelon,
- une impulsion de Dirac,
- une impulsion discrète,
- une fonction de Heaviside,
- un peigne de Dirac.

=== Exercice 4 <exercice-4>

Représentez les signaux

$ x (t) = 4 thin sin (3 pi t + pi), wide y (t) = 2 thin delta (t -1) -delta (t + 1). $
=== Exercice 5 <exercice-5>

Donnez la définition du sinus cardinal. Parmi les signaux suivants, lequel pourrait correspondre à $upright(s i n c) (t)$~?

#show figure: set block(breakable: breakableDefault)
#figure(
  image("sinc.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
) <f:quatre-sinc>

== Produit de convolution <produit-de-convolution>

=== Exercice 6 <exercice-6>

Calculez le produit de convolution $(x * y) [ n ]$ où ($a in RR$)~:

$ x [ n ] = wide wide y [ n ] = $
=== Exercice 7 <exercice-7>

Représentez schématiquement les produits de convolution des signaux ci-dessous.

- A :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("conv-1.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

- B :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("conv-2.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

- C :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("conv-3.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

=== Exercice 8 <exercice-8>

Simplifiez les expressions suivantes :

- $(x * d_0) (t) thick$   où~: $quad d_0 (t) = delta (t -tau) thick$ et $thick x (t)$ est un signal quelconque.
- $(d_1 * d_2) (t) thick$ où~: $quad d_1 (t) = delta (t + t_1) thick$  et $thick d_2 (t) = delta (t + t_2)$.

== Analyse de Fourier <analyse-de-fourier>

=== Exercice 9 <exercice-9>

Le signal défini ci-dessous est-il continu ou discret ? périodique ou apériodique ? Calculez sa transformée de Fourier.

$ x (t) = A thin upright(r e c t) (2 t \/ T) = $
=== Exercice 10 <exercice-10>

- Rappelez le théorème de l'échantillonnage (ou théorème de Nyquist-Shannon).
- Le contenu fréquentiel d'un signal analogique $x$ est situé dans la bande $[ 0, 100 ]$~Hz. Quelle fréquence d'échantillonnage convient pour éviter le repliement spectral~?
- Le contenu fréquentiel d'un signal analogique $y$ est situé dans la bande $[ 30, 150 ]$~Hz. Quelle fréquence d'échantillonnage convient pour éviter le repliement spectral~?
- Une sinusoïde de fréquence 320 Hz est échantillonnée à 600 Hz. Quel signal obtient-on après échantillonnage ?

=== Exercice 11 <exercice-11>

Quel est, intuitivement, le spectre d'un signal temporel constant~? En déduire le spectre d'une impulsion de Dirac centrée en 0. Qu'en concluez-vous sur la composition fréquentielle d'une impulsion de Dirac~?

=== Exercice 12 <exercice-12>

La transformée de Fourier discrète est-elle périodique~? à support continu~? à valeurs réelles~?

=== Exercice 13 <exercice-13>

Représentez le spectre de $cos (t)$ sans calculer sa série de Fourier.

=== Exercice 14 <exercice-14>

Un signal temporel est enregistré avec une période d'échantillonnage définie en jour plutôt qu'en seconde. Le spectre du signal fait apparaître un pic très franc aux alentours de $12, 37$ an$""^(-1)$. À quel phénomène correspond ce pic ?

/*
* Modulation :
   - Donnez l'expression d'un signal $m(t)$ modulé en amplitude par une porteuse $p(t)$ de fréquence $f_p$
     (dans le cas d'une modulation à double bande avec porteuse).
   - En considérant $m(t)$ sinusoïdal de fréquence 1~Hz et $f_p=10$~Hz,
     représentez les signaux $m(t)$, $p(t)$ et $y(t) = m(t) \times p(t)$, ainsi que leurs spectres.
   - Quelle opération peut-on effectuer pour démoduler le signal~?
*/

/*
*  Quels sont les intérêts de moduler un signal~?
   - possibilité de transmettre simultanément plusieurs signaux (multiplexage spatial fréquentiel)
   - transmission d'un message sur une très longue distance avec une puissance d'émission raisonnable
    et un signal adapté au canal de transmission (en particulier, la transmission d'information par voie hertzienne
    nécessite une antenne dont les dimensions sont de l'ordre de grandeur de la longueur d'onde du signal transmit).
*/