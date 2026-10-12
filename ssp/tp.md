(C:tp-ssp)=
# Exercices sur machine




## Lissage par filtre moyenneur

```{margin}
Source : NASA/GISS, [climate.nasa.gov/vital-signs/global-temperature](https://climate.nasa.gov/vital-signs/global-temperature/).
```

Le fichier [temperatures.csv](https://vincmazet.github.io/signal2/_static/temperatures.csv) regroupe l'ensemble des températures moyennes à la surface de la Terre
pour chaque année depuis 1880.
Les températures sont données par rapport à la moyenne des températures relevées sur la période de référence 1951–1980.
Ces données illustrent la hausse de températures mondiales.

* Chargez le fichier [temperatures.csv](https://vincmazet.github.io/signal2/_static/temperatures.csv) et affichez les données.

* Appliquez un filtre moyenneur sur les données pour obtenir une courbe plus lisse.
  Choisissez le filtre de sorte à obtenir des températures lissées sur une fenêtre de 5 ans,
  qui est le choix traditionnel pour ces données.
  

## Approximation par moindres carrés

<!-- supprimer la 1re partie + ajouter des questions d'analyse et de compréhension ? -->

À la place d'un filtre moyenneur, on souhaite effectuer une approximation de l'évolution des températures par une parabole.

* Calculez l'approximation des températures
  ([temperatures.csv](https://vincmazet.github.io/signal2/_static/temperatures.csv)) par une parabole.
  Pour cela :
  - normalisez les abscisses entre 0 et 1 pour éviter les problèmes numériques ;
  - la transposée est obtenue avec `numpy.transpose` ;
  - la multiplication matricielle est obtenue avec `numpy.dot` ;
  - l'inverse matricielle est obtenue avec `numpy.linalg.pinv` ;
  - attention à la dimension des matrices et vecteurs (vérifiez bien chaque étape du calcul avec `shape` !) ;
  - Pour générer la matrice $H$ des coefficients et le vecteur des données $y$,
    vous pouvez vous inspirer du code suivant :

    ```python
    H = np.transpose( np.array([ n**0, n**1, n**2 ]) )
    ```
  
  Affichez le résultat sur la courbe des températures pour vérifier
  la bonne adéquation de l'approximation par rapport aux données.
  
* En définissant une nouvelle matrice $H$,
  extrapolez l'évolution des températures pour connaître, selon ce modèle,
  la hausse des températures attendue l'année de votre 70<sup>e</sup> anniversaire...