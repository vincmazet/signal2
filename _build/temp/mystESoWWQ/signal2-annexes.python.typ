/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

= Installer et utiliser Python

Python est un langage de haut niveau moderne et très répandu dans l'industrie et les disciplines scientifiques. Cette page décrit comment :

- installer Python et Jupyter avec la distribution Anaconda,
- écrire des _notebooks_ avec Jupyter Lab,
- utiliser des modules additionnels et commencer à programmer.

== Installation <installation>

Anaconda est une distribution Python spécialisée notamment dans la science des données et l'apprentissage machine. Pour un usage individuel, elle est gratuite et suffisante pour effectuer les TP de traitement du signal. #link("https://www.anaconda.com/download")[Téléchargez] et installer Anaconda si Python n'est pas déjà présent sur votre ordinateur.

En plus de regrouper le cœur de Python et les modules scientifiques principaux, Anaconda propose un environnement de développement pour écrire des programmes et des notebooks appelé #link("https://jupyterlab.readthedocs.io/")[JupyterLab].

La #link(<f:python:jupyterlab>)[figure 1] montre l'interface de Jupyter Lab : elle est suffisamment intuitive pour se débrouiller sans aide, mais vous pouvez toujours consulter #link("https://jupyterlab.readthedocs.io/en/latest/user/interface.html")[cette page] pour en savoir plus.

#show figure: set block(breakable: breakableDefault)
#figure(
  image("files/undefined", width: 90%),
  caption: [
Jupyter Lab.
],
  kind: "figure",
  supplement: [Figure],
) <f:python:jupyterlab>

Normalement, Jupyter Lab est inclus dans l'installation d'Anaconda. Mais si ce n'est pas le cas, vous trouverez les instructions pour installer Jupyter Lab #link("https://jupyter.org/install.html")[ici].

Pour ouvrir Jupyter Lab, tapez dans un terminal `jupyter lab` ou `jupyter-lab`.

== Notebooks Python <p:python:notebook>

Après avoir installé Anaconda, vous êtes prêt à écrire et exécuter des notebooks Python ! Un #link("https://jupyterlab.readthedocs.io/en/latest/user/notebook.html")[notebook] est un fichier contenant du code, mais également les résultats produits par ce code (comme des valeurs numériques ou des images) et du texte qui accompagnera le code. Un notebook est divisé en _cellules_ qui peuvent être de deux types : «~code~» ou « markdown~». En appuyant sur ~+~ dans une cellule, le code de celle-ci (et uniquement de celle-ci) est exécuté. Si à la place vous appuyez sur ~+ , alors le code de la cellule courante est exécuté et le curseur passe sur la cellule suivante.

=== Cellules de code <cellules-de-code>

Les cellules contiennent par défaut du code Python (_input_) et le résultat (_output_).

Par exemple~le code (_input_) suivant :

```python
a = 21
b = 42
c = a + b
print("La valeur est " + str(c))
```

produit le résultat (_output_) :

```
La valeur est 63
```

=== Cellules Markdown <cellules-markdown>

Il est possible de changer une cellule de «~code~» en cellule «~markdown~» en sélectionnant _Markdown_ dans la liste déroulante de la barre d'outils. Le #link("https://en.wikipedia.org/wiki/Markdown")[Markdown] est aussi un langage informatique, mais il sert à mettre en forme du texte (par exemple en écrivant des titres, des listes, des équations...). Cela peut être utile pour ajouter des notes et commenter votre code et ses résultats.

Ainsi :

```code
  ### Définition

  la _sinusoïde_ a pour expression :
  
  $$
    x(t) = A \sin(2 \pi f t + \varphi)
  $$
  
  où :
  * $A$ est l'amplitude
  * $f$ est la fréquence
  * $\varphi$ est le déphasage
```

produit :

Vous trouverez le résumé de la syntaxe Markdown sur #link("https://en.wikipedia.org/wiki/Markdown\#Examples")[cette page].

== Écrire un programme Python <p:python:python>

Le cœur du langage Python ne dispose pas de toutes les fonctions utiles pour la programmation scientifique, et en particulier le traitement du signal. Il est donc nécessaire d'importer des modules dans votre code (normalement, ces modules sont installés avec Anaconda). En général, nous n'utiliserons que deux modules :

- #link("https://numpy.org/")[numpy], qui fournit des fonctions générales pour la programmation scientifique,
- #link("https://matplotlib.org/")[matplotlib], pour afficher les signaux.

Les modules Python sont importés dans votre code en utilisant l'instruction `import`.

Par exemple, le code suivant affiche la sinusoïde~$sin (2 pi f n)$ de fréquence $f = 0, 3$ Hz :

```python
# Une ligne qui commence par le symbole # est un commentaire
# et n'est donc pas exécutée

# Import du module 'numpy' et renommage en 'np' car c'est
# plus court à écrire
import numpy as np

# Import du sous-module 'pyplot' du module 'matplotlib',
# et renommage en 'plt'
import matplotlib.pyplot as plt

# Abscisses sur lesquelles sera calculée la sinusoïde :
# un point tous les 0,1 s entre 0 et 10 s
n = np.arange(0, 10, 0.1)

# Fréquence de la sinusoïde
f = 0.3

# Sinusoïde : c'est tout simple, il suffit d'écrire
# l'expression mathématique 😎
x = np.sin(2*np.pi*f*n)

# Création d'une figure, dont on définit la taille
plt.figure(figsize=(6,3))

# Affichage de la sinusoïde (dans la figure créée)
plt.plot(n, x, label="sinusoïde")

# Légende
plt.legend()

# Légende des axes et titre
plt.xlabel("$n$")
plt.ylabel("$x[n]$")
plt.title("Une belle sinusoïde")

# Affichage (pas toujours nécessaire, mais parfois indispensable)
plt.show()
```

#image("files/b21d3e1237cbb13b65dd622d39152e3b.png", width: 90%)