(P:modulation:tp)=
# Exercices sur machine


L'objectif de ce TP est de simuler la démodulation d'un message numérique modulé en bande de base.

Le codage Manchester est une norme de transmission de messages binaires,
utilisée notamment dans certaines communications Ethernet.
La forme d'onde et la table de correspondance sont définies dans le cours.
Dans cet exercice, nous reproduisons la chaîne de communication avec :
1. un émetteur qui crée un message binaire codé en Manchester,
1. un canal de transmission où s'ajoute du bruit au signal émis,
1. un récepteur dont l'objectif est de décoder le signal reçu.


## Création du signal par l'émetteur

* Créez et affichez le motif $h$ de durée $T=10^{-7}$ s et échantillonné à $10^{9}$ Hz.

:::{margin}
Dans la réalité, les signaux qui circulent sur le canal sont analogiques car le canal de communication est physique.
Comme la chaîne de communications est ici simulée, l'ordinateur traite en fait des signaux numériques !
Il est donc nécessaire de fixer une fréquence d'échantillonnage qui n'a aucune interprétation physique.
:::

* En concaténant plusieurs motifs (par exemple avec `numpy.concatenate`),
  créez le signal correspondant à la séquence binaire $1\ 0\ 1\ 1$.
  Pensez à définir un nouveau vecteur de temps pour afficher ce signal.


## Simulation du canal de transmission

* Ajoutez un bruit gaussien (`numpy.random.normal`) à ce signal.
* Question subsidiaire : réglez la quantité de bruit pour avoir un RSB de 10 dB.
  Utilisez pour cela le lien entre RSB et écart-type du bruit
  [calculé en TD](#P:ssp:exercice-3).
  La norme peut être calculée avec `np.linalg.norm`.
  Vérifiez notamment que le niveau de bruit évolue conformément au RSB.


## Décodage du signal par le récepteur
  
On se place maintenant au niveau du récepteur :
un filtre adapté est utilisé pour retrouver la séquence binaire à partir du signal bruité.

* On a vu en cours que le filtre adapté peut s'implémenter comme la convolution entre le signal bruité
  et une réponse impulsionnelle.
  Quelle est cette réponse impulsionnelle ?

* Appliquez le filtre adapté en calculant une convolution sur le signal bruité.
  Décrivez le signal obtenu.
  Comment retrouver la séquence binaire à partir de ce signal ?  


## Étude des performances du filtrage adapté

* Évaluez la robustesse du filtrage adapté en fonction du niveau de bruit :
  comment se comporte cette méthode lorsque le RSB évolue ?

* Appliquez le filtre adapté sur le signal {download}`data/manchester.csv`
  pour décoder la séquence binaire correspondante
  (la durée $T$ du motif et la fréquence d'échantillonnage restant les mêmes que dans les questions précédentes),
  sachant que la norme ASCII a été utilisée.