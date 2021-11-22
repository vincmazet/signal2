(C:td-ssp)=
# Exercices : Traitement statistique du signal


**Exercice 1**

Calculez l'espérance et l'écart-type d'une variable aléatoire distribuée suivant une loi uniforme $\ \mathcal{U}[0;1]$.


**Exercice 2**

Calculez une estimation de l'espérance et de l'écart-type de la série de $N=4$ échantillons ci-dessous :

$$
  x = [ 0,81,\ 0,90,\ 0,12,\ 0,91 ].
$$


**Exercice 3**

Un signal $x$ est bruité par un bruit blanc gaussien additif.
* Quel est le lien entre la puissance du bruit et son écart-type ?
* Exprimez l'écart-type du bruit en fonction du RSB et des échantillons du signal $x$.

<!-- Le calcul en TD du RSB est compliqué (notions de variances, espérance, covariance, indépendance...) -->


**Exercice 4**

On rappelle que le filtre adapté correspond à l'intercorrélation $R_{yx}$
entre un signal observé $y$ et le motif recherché $x$.

* Donnez la définition de l'intercorrélation $R_{yx}$.

* En effectuant un changement de variable dans cette dernière expression,
  montrez que l'intercorrélation $R_{yx}$ s'écrit comme la convolution de $y$ avec un signal $h$ à déterminer.

Cette dernière question montre que le filtre adapté s'exprime également comme une convolution :
c'est donc bien un filtre dont la réponse impulsionnelle est $h$.


**Exercice 5**

Montrez que le filtre moyenneur peut s'écrire comme une convolution entre le signal observé $y$
et une porte $h$.


**Exercice 6**

On dispose de plusieurs mesures $y_i$ d'un même signal $x$ :

$$
\forall i\in\{1,\dots,N\}, \forall n, \quad y_i[n]=x[n]+b_i[n]
$$

où les bruits $b_i$ sont supposés blancs gaussiens additifs.

* Écrivez la moyenne des mesures $y_i$ comme la somme d'un signal (que l'on notera $\tilde{x}$)
  et d'un bruit (que l'on notera $\tilde{b}$).
  Que valent $\tilde{x}$ et $\tilde{b}$ ?
  
* Déterminez l'espérance de $\tilde{b}$ en fonction de l'espérance de $b_i$.
  
* Déterminez la variance de $\tilde{b}$ en fonction de la variance de $b_i$.

* Montrez finalement que le RSB du signal moyenné est égal au RSB d'un signal $y_i$ plus un facteur $10\log(I)$.


**Exercice 7**

* Déterminez le polynôme de degré 0 (une constante, donc...) qui approxime au mieux
  les données d'abscisses $n=[0,\ 1]^T$ et d'ordonnées $y=[2,\ 3]^T$.

* Déterminez le polynôme de degré 1 (une droite affine) qui approxime au mieux
  les données d'abscisses $n=[0,\ 1,\ 2]^T$ et d'ordonnées $y=[2,\ 4,\ 4]^T$.

On rappelle que l'inverse d'une matrice $2\times2$ $\begin{pmatrix} a & b \\ c & d \end{pmatrix}$
est égale à $\displaystyle\frac{1}{ad-bc} \begin{pmatrix} d & -b \\ -c & a \end{pmatrix}$.