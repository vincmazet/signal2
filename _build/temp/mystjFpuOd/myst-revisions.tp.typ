/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

== Exercices sur machine

Comme la séance précédente, ce TP est un rappel des notions de première année.

Ouvrez Jupyter Lab en tapant dans un terminal :

```
jupyter lab
```

Créez ensuite un nouveau notebook dans lequel la première cellule sera en markdown et contiendra :

```
# TP 1
```

Tapez ~+~ pour exécuter la cellule courante et en créer une nouvelle.

=== Représentation d'un signal <repr-sentation-dun-signal>

Représentez entre 0 et~10~s la sinusoïde amortie

$ x (t) = A e^(-a t) sin (2 pi f t + phi.alt). $
où $A = 2$, $a = 0, 5$, $phi.alt = 1$ et $f = 2$~Hz. Vous pouvez vous inspirer de l'exemple donné en section #link(<p:python:python>)[Écrire un programme Python]. Choisissez un pas de temps correct pour obtenir une jolie courbe.

=== Transformée de Fourier discrète <transform-e-de-fourier-discr-te>

On considère le signal créneau suivant de période $N = 100$ :

$ x [ n ] = $
- Créez et affichez le signal $x [ n ]$ sur 100 échantillons. Une porte discrète peut être générée avec la fonction `numpy.where` (voir sa #link("https://numpy.org/doc/stable/reference/generated/numpy.where.html")[syntaxe]).
- Tracez la transformée de Fourier discrète (TFD) $X [ k ]$ de $x [ n ]$ entre 0 et $N -1$ (`scipy.fft.fft`).
- Centrez la TFD pour la représenter entre $-N \/ 2$ et $N \/ 2 -1$ (`scipy.fft.fftshift`).
- Modifiez les abscisses pour représenter la TFD en fonction des fréquences (et non des échantillons). On suppose que $T_e = 2, 5$~ms.

=== Analyse spectrale <analyse-spectrale>

//  https://opendata.reseaux-energies.fr/explore/dataset/consommation-quotidienne-brute/table/?sort=-date_heure 

Le signal #link("/consommation-a51d3a18795052d152c77d6e5168b08a.csv")[consommation.csv] contient la consommation horaire en gaz (deuxième colonne, en MW) et en électricité (troisième colonne, en MW) en France métropolitaine (hors Corse) de 2012 à 2021.

- Chargez (`numpy.loadtxt`) et affichez la consommation électrique en fonction des indices des échantillons (inutile de graduer en fonction du temps).
- Affichez la TFD du signal.
- Déterminez les valeurs des principales fréquences.
- Identifiez quelles phénomènes correspondent aux principales fréquences.

=== Produit de convolution <produit-de-convolution>

Représentez le produit de convolution $(x * y) [ n ]$ où~:

$ x [ n ] = wide wide y [ n ] = $
Pour définir $x [ n ]$, remarquez que le signal correspond à la somme de deux impulsions discrètes, et qu'une impulsion discrète n'est rien d'autre qu'une porte très étroite.