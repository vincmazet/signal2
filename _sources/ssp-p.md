(C:tp-ssp)=
# TP Traitement statistique du signal


## Détection de motifs par filtrage adapté

Le codage Manchester est une norme de transmission de signaux binaires,
utilisée notamment dans certaines communications Ethernet.
Les bits du signal binaire sont transmis les uns à la suite des autres.
un 1 logique est représenté par le motif $h$,
tandis qu'un 0 logique est représenté par $-h$ où

$$
h(t) =
\begin{cases}
1  &\text{ si } t \in [0,T/2[, \\
-1 &\text{ si } t \in [T/2,T[,
\end{cases}
$$

Dans cet exercice, nous reproduisons la chaîne de communication avec un émetteur qui crée un message binaire codé en Manchester,
un canal de transmission où s'ajoute du bruit au signal émis,
et enfin un récepteur dont l'objectif est de décoder le signal reçu.

* Créez un vecteur contenant le motif $h$ de durée $T=10^{-7}$ s et échantillonné à $10^{9}$ Hz.

* En concaténant plusieurs motifs (par exemple avec `numpy.concatenate`),
  créez le signal correspondant à la séquence binaire $1\ 0\ 1\ 1$.
  Pensez à définir un nouveau vecteur de temps pour afficher le signal.

* Ajoutez un bruit gaussien (`numpy.random.normal`) à ce signal de sorte à obtenir un RSB de 10 dB
  (utilisez le résultat de l'exercice 3 du TD pour obtenir le lien entre le RSB et l'écart-type du bruit).
  La norme peut être calculée avec `np.linalg.norm`.
  Vérifiez notamment que le niveau de bruit évolue conformément à la valeur du RSB.
  
On se place maintenant au niveau du récepteur :
un filtre adapté est utilisé pour retrouver la séquence binaire à partir du signal bruité.

* On a vu en cours que le filtre adapté peut s'implémenter comme la convolution entre le signal bruité
  et une réponse impulsionnelle.
  Quelle est cette réponse impulsionnelle ?

* Appliquez le filtre adapté avec une convolution sur le signal bruité.
  Décrivez le signal obtenu.
  Comment retrouver la séquence binaire à partir de ce signal ?  

* Évaluez la robustesse du filtrage adapté en fonction du niveau de bruit :
  comment se comporte cette méthode lorsque le RSB évolue ?

* Appliquez le filtre adapté sur le signal <a href="_static/files/manchester.csv">manchester.csv</a>
  pour décoder la séquence binaire correspondante
  (la durée $T$ du motif et la fréquence d'échantillonnage restant les mêmes que dans les questions précédentes).
  Vous pouvez déterminer visuellement les bits de la séquence (sans programmation, donc)
  et retrouver le message correspondant sachant que la norme ASCII a été utilisée.


## Lissage par filtre moyenneur

```{margin}
Source : NASA/GISS, [climate.nasa.gov/vital-signs/global-temperature](https://climate.nasa.gov/vital-signs/global-temperature/).
```

Le fichier <a href="_static/files/temperatures.csv">temperatures.csv</a> regroupe l'ensemble des températures moyennes à la surface de la Terre
pour chaque année depuis 1880.
Les températures sont données par rapport à la moyenne des températures relevées sur la période de référence 1951–1980.
Ces données illustrent la hausse de températures mondiales.

* Chargez le fichier <a href="_static/files/temperatures.csv">temperatures.csv</a> et affichez les données.

* Appliquez un filtre moyenneur sur les données pour obtenir une courbe plus lisse.
  Choisissez le filtre de sorte à obtenir des températures lissées sur une fenêtre de 5 ans,
  qui est le choix traditionnel pour ces données.
  

## Approximation par moindres carrés

<!-- supprimer la 1re partie + ajouter des questions d'analyse et de compréhension ? -->

À la place d'un filtre moyenneur, on souhaite effectuer une approximation de l'évolution des températures par une parabole.

* Calculez l'approximation des températures
  (<a href="_static/files/temperatures.csv">temperatures.csv</a> ) par une parabole.
  Pour cela :
  - normalisez les abscisses entre 0 et 1 pour éviter les problèmes numériques ;
  - la transposée est obtenue avec `numpy.transpose` ;
  - la multiplication matricielle est obtenue avec `numpy.dot` ;
  - l'inverse matricielle est obtenue avec `numpy.linalg.pinv` ;
  - attention à la dimension des matrices et vecteurs (vérifiez bien chaque étape du calcul avec `shape` !) ;
  - Pour générer la matrice $H$ des coefficients et le vecteur des données $y$,
    vous pouvez vous inspirer du code suivant :
<!--     ```
    y = np.transpose(np.array([temperatures]))
    H = np.transpose(np.array([ n**0, n**1, n**2 ]))
    ``` -->
    ```
    H = np.transpose( np.array([ n**0, n**1, n**2 ]) )
    ```
  
  Affichez le résultat sur la courbe des températures pour vérifier
  la bonne adéquation de l'approximation par rapport aux données.
  
* En définissant une nouvelle matrice $H$,
  extrapolez l'évolution des températures pour connaître, selon ce modèle,
  la hausse des températures attendue l'année de votre 70<sup>e</sup> anniversaire...