/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

=== 🖍️ Produit de convolution

Génération des signaux avec la fonction `numpy.where`. Il est utile de définir au préalable un tableau contenant les abscisses.

```python
# Abscisses de -10 à 10 (penser à rajouter +1 à la limite de droite)
n = np.arange(-10, 10+1)

# Signal x
x = np.where( n==1, 1, 0) + np.where( n==-1, -1, 0)

# Signal y
y = np.where( abs(n)<=1, 2, 0)
```

On affiche les signaux pour vérifier qu'ils sont bien construits...

#image("files/2e4e6d9bdd8c28a240f142f1e5b292cb.png", width: 90%)

La convolution est obtenue avec `numpy.convolve`. Attention à bien choisir la valeur du troisième paramètre (`mode`) !

```python
z = np.convolve(x, y, "same")
```

Résultat :

#image("files/cc25cc958ff5106e23900c93039a57a4.png", width: 90%)

Le résultat obtenu peut s'interpréter comme la somme des deux signaux ci-dessous, chacun d'eux étant la convolution de $y$ avec l'une des deux impulsions de $x$ : l'impulsion en -1 donne le signal orange et l'impulsion en +1 donne le signal vert.

#image("files/92c88047dad1fe468d0effa6d1c511a3.png", width: 90%)