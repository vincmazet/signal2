/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

=== 🖍️ Analyse spectrale

Chargement et affichage du signal :

```python
x = np.loadtxt("../_static/consommation.csv",
               delimiter=",", skiprows=1, usecols=2)
```

#image("files/66e6e1c35f2a7eee79596b9d07e3cb58.png", width: 90%)

Spectre du signal...

#image("files/bf1c92587e214650659a2f070e56bacb.png", width: 90%)

La phase est, comme la plupart des signaux réels, difficile à analyser... Mais le module est informatif.

En zoomant sur les fréquences basses du spectre (`matplotlib.pyplot.xlim`), on peut identifier les fréquences principales. La fonction `scipy.signal.find_peaks` peut aider à trouver les pics.

```python
peaks, _ = find_peaks(module, height=1e8)
```

#image("files/990d25b1f2ed044a76b09e30a600025b.png", width: 90%)

On peut alors afficher les fréquences des raies principales, et la période correspondante.

```
0.006 h^-1 :	phénomène qui se répète 0.006 fois par heure soit toutes les 168.143 h (ou 7.006 jours)
0.042 h^-1 :	phénomène qui se répète 0.042 fois par heure soit toutes les  24.000 h (ou 1.000 jours)
0.083 h^-1 :	phénomène qui se répète 0.083 fois par heure soit toutes les  12.000 h (ou 0.500 jours)

```

On retrouve là les périodicités hebdomadaire, quotidienne et même sur 12 heures de la consommation électrique.