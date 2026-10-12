(C:ssp:moindres-carres)=
# Approximation par moindres carrés


La méthode des moindres carrés (*least squares method*) a été proposée par Gauss et Legendre à la fin du XVII<sup>e</sup> siècle.
Dans le cadre de l'approximation d'un signal, elle permet de décrire un signal bruité par un modèle mathématique.

<!------------------------------------------------------------------------------------------------>

## Problématique

On considère le cas où les observations $y$ contiennent $N$ échantillons
et sont la somme d'un signal $x=f_{\theta}$ bruité :

:::{math}
:label: E:mc:y
:enumerated: true
\forall n\in\{0,\dots,N-1\}, \quad y[n] = f_{\theta}[n] + b[n]
:::

où :
* $f_{\theta}$ est une fonction paramétrique (sinusoïde, polynôme, etc.) connue, dont les paramètres sont regroupés dans $\theta$,
* $\theta$ est un ensemble de paramètres $\theta_0, \theta_1, \dots, \theta_{M-1}$ inconnus,
* $f_{\theta}[n]$ est la valeur de la fonction $f_{\theta}$ en $n$,
* $b$ est un bruit de moyenne nulle.

De manière générale, $f$ peut être n'importe quelle fonction paramétrée,
comme par exemple :
* un polynôme de degré 2 : $f_{\theta}[n] = \theta_0 + \theta_1 n + \theta_2 n^2$,
* une exponentielle : $f_{\theta}[n] = \theta_0 \exp(\theta_1 n)$.

Par simplicité, nous nous concentrons dans cette section sur les fonctions $f_{\theta}$ linéaires en $\theta$
(si $f$ n'est pas linéaire, alors il faut utiliser une méthode de moindres carrés non linéaires).
Plus précisément, nous nous concentrons sur des fonctions $f_{\theta}$ polynomiales :

$$
\forall n, \quad f_{\theta}[n] = \theta_0 + \theta_1 n + \theta_2 n^2 + \dots + \theta_{M-1} n^{M-1}.
$$


L'objectif est d'estimer la valeur des $M$ inconnues $\theta_m$ où $m\in\{0,\dots,M-1\}$.

<!------------------------------------------------------------------------------------------------>

## Écriture matricielle

Dans la suite, les calculs sont effectués avec la représentation vectorielle.
En considérant toutes les valeurs que prend $n$,
l'équation @E:mc:y devient un système de $N$ équations à $M$ inconnues :

$$
\begin{cases}
y[0] = \theta_0 + \theta_1 0 + \theta_2 0^2 + \dots + \theta_{M-1} 0^{M-1} + b[0] \\
y[1] = \theta_0 + \theta_1 1 + \theta_2 1^2 + \dots + \theta_{M-1} 1^{M-1} + b[1] \\
\quad\vdots \\
y[N-1] = \theta_0 + \theta_1 (N-1) + \theta_2 (N-1)^2 + \dots + \theta_{M-1} (N-1)^{M-1} + b[N-1]
\end{cases}
$$

ce système peut s'écrire plus simplement sous forme matricielle :

:::{margin}
Pour identifier les variables maricielles, on a l'habitude de les écrire en gras.
:::

$$
\boldsymbol{y} = \boldsymbol{H} \boldsymbol{\theta} + \boldsymbol{b}
$$

où la matrice $\boldsymbol{H}$ est de taille $N \times M$ et regroupe les vecteurs des abscisses aux puissances $0$ à $M-1$ :

$$
\boldsymbol{H} =
\begin{bmatrix}
    0^0     & 0^1     & 0^2     & \dots & 0^{M-1}     \\
    1^0     & 1^1     & 1^2     & \dots & 1^{M-1}     \\
    \vdots  & \vdots  & \vdots  &       & \vdots      \\
    (N-1)^0 & (N-1)^1 & (N-1)^2 & \dots & (N-1)^{M-1}
\end{bmatrix}.
$$

et :

$$
\boldsymbol{y} = \begin{bmatrix} y[0] \\ \vdots \\ y[N-1] \end{bmatrix},
\quad
\boldsymbol{\theta} = \begin{bmatrix} \theta_0 \\ \vdots \\ \theta_{M-1} \end{bmatrix},
\quad
\boldsymbol{b} = \begin{bmatrix} b[0] \\ \vdots \\ b[N-1] \end{bmatrix}
$$

<!------------------------------------------------------------------------------------------------>

## Minimisation du critère des moindres carrés

L'objectif est de retrouver $\theta$ à partir de $y$.
Il est logique de choisir $\theta$ comme le paramètre qui minimise les différences entre $y$ et $f_\theta$.
Mathématiquement, il faut donc minimiser

$$
\mathcal{J} = \sum_{n=0}^{N-1} \left(y[n] - f_{\theta}[n]\right)^2.
$$

La parenthèse, qui exprime la différence entre $y$ et $f_{\theta}$ en chaque échantillon $n$,
est au carré car les calculs sont plus simples à effectuer qu'avec une valeur absolue.
On cherche donc à minimiser les différences au carrés, d'où le nom de la méthode.
Remarquez que $\mathcal{J}$ est le carré de la norme du signal $y - f_{\theta}$ :

\begin{align*}
\mathcal{J}
&= \| \boldsymbol{y} - \boldsymbol{H}\boldsymbol{\theta} \|^2 \\
&= (\boldsymbol{y} - \boldsymbol{H}\boldsymbol{\theta})^T (\boldsymbol{y} - \boldsymbol{H}\boldsymbol{\theta}) \\
&= \boldsymbol{y}^T\boldsymbol{y}
 - \boldsymbol{y}^T\boldsymbol{H}\boldsymbol{\theta}
 - \boldsymbol{\theta}^T\boldsymbol{H}^T\boldsymbol{y}
 + \boldsymbol{\theta}^T\boldsymbol{H}^T\boldsymbol{H}\boldsymbol{\theta}
\end{align*}

Trouver la valeur de $\theta$ qui minimise $\mathcal{J}$ revient à trouver la valeur qui annule la dérivée de $\mathcal{J}$,
et on peut montrer que :

$$
\frac{\partial \mathcal{J}}{\partial \boldsymbol{\theta}} = - 2\boldsymbol{H}^T\boldsymbol{y} + 2\boldsymbol{H}^T\boldsymbol{H}\boldsymbol{\theta}
$$

Et donc :

$$
\frac{\partial \mathcal{J}}{\partial \boldsymbol{\theta}} = 0
\qquad\Leftrightarrow\qquad
2\boldsymbol{H}^T\boldsymbol{y} = 2\boldsymbol{H}^T\boldsymbol{H}\boldsymbol{\theta}
\qquad\Leftrightarrow\qquad
\boldsymbol{\theta} = (\boldsymbol{H}^T\boldsymbol{H})^{-1} \boldsymbol{H}^T\boldsymbol{y}.
$$

Cette dernière équation définit donc la valeur de $\theta$ qui minimise l'erreur des moindres carrés,
c'est donc la valeur de $\theta$ qui permet d'avoir une fonction $f_{\theta}$ qui approxime au mieux les données $y$.

<!------------------------------------------------------------------------------------------------>

## Illustration

La solution obtenue est issue du calcul $\boldsymbol{\theta} = (\boldsymbol{H}^T\boldsymbol{H})^{-1} \boldsymbol{H}^T\boldsymbol{y}$.
Sur l'exemple de la @F:ssp:moindres-carres, l'observation $y$ est une version bruitée d'un polynôme $x$.
L'approximation par moindres carrés est plus appréciable que celle obtenue avec le filtre moyenneur
car on bénéficie ici du fait que le signal inconnu est un polynôme.

:::{figure} figs/moindres-carres.svg
:name: F:ssp:moindres-carres
Les données $y$ sont approximées par un polynôme d'ordre 3 avec la méthode des moindres carrés.
Le résultat est comparé avec un filtre moyenneur de taille 20, qui donne une estimation moins « propre ».
:::

La figure @F:ssp:moindres-carres-differences représente en orange les différences entre l'observation et l'estimation.
C'est la somme de ces différences qui est minimisée par la méthode des moindres carrés.

:::{figure} figs/moindres-carres-differences.svg
:name: F:ssp:moindres-carres-differences
Mise en évidence des erreurs à minimiser.
:::

✏️ @P:ssp:exercice-7