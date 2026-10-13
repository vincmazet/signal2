(P:ssp:intro)=
# Traitement statistique du signal


Jusqu'ici, on considérait les signaux comme étant déterministes, c'est à dire qu'on les connaissait de manière sûre.
Ils étaient définis par une forme analytique
(par exemple : $x[n] = \sin(2\pi f n)$)
ou une suite d'échantillons (par exemple : $x[n] = [1, 2, 3, 4]$).

Mais en pratique, il est rare que les signaux soient connus exactement et parfaitement.
Les signaux aléatoires (c'est-à-dire non déterministes)
sont des signaux qu'on ne peut pas prédire complètement avant de les avoir observés.
Par exemple :
* un signal bruité (il contient des parasites) est un signal aléatoire,
  car le bruit n'est pas parfaitement connu
  (si c'était le cas, alors il serait très simple de supprimer le bruit du signal !) ;
* une sinusoïde de fréquence inconnue peut également être considérée comme un signal aléatoire ;
* un signal de communication numérique, au niveau du récepteur, est un signal aléatoire
  puisque le message émis n'est pas connu a priori du récepteur (sinon, il serait inutile de transmettre le message...).

:::{note} Remarque
Attention, lorsqu'on a mesuré et enregistré un signal physique, cet enregistrement n'est plus aléatoire.
Mais une deuxième mesure du même phénomène physique sera différente.
Lorsqu'on parle de signal aléatoire, c'est en fait le phénomène avant la mesure qui est aléatoire !
Ce qui nous intéresse ici, c'est de concevoir un traitement
sur un signal qui n'a pas encore été mesuré et qui est donc considéré aléatoire.
:::

Ce chapitre commence par définir les outils de base du traitement statistique du signal,
dont la notion de @P:ssp:rsb.
Nous présentons ensuite trois types de techniques de traitement de signaux bruités :
* la [détection de signal](#P:ssp:detection), c'est-à-dire déterminer si un signal particulier est présent dans des données bruitées,
* le [débruitage](#P:ssp:debruitage), c'est-à-dire réduire le plus possible le bruit présent dans un signal,
* l'[approximation](#P:ssp:moindres-carres), c'est-à-dire estimer le signal sous-jacent dans des données bruitées.

Pour simplifier le propos, nous ne considérons dans ce chapitre que des signaux discrets.