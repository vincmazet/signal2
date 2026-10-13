# Corrections


## Rappels de probabilité

### Exercice 1

$$
\mathbb{E}[x] = \frac{1}{2}
\qquad\text{et}\qquad
\sigma = \frac{1}{\sqrt{12}}
$$


### Exercice 2

$$
\hat{\mathbb{E}}[x] = 14,5
\qquad\text{et}\qquad
\hat{\sigma}[x] = \sqrt{\frac{21}{3}} \approx 2,646
$$


## Le bruit dans les signaux

### Exercice 3

Pour rappel, l'espérance d'un bruit blanc est nulle.

* Par définition de l'estimateur de la variance, l'écart-type $\sigma_b$ du bruit est égal à la racine carrée de la puissance du bruit multipliée par $\frac{N}{N-1}$ puisque
  
  $$
  \sigma_b^2 = \frac{1}{N-1} \sum_{n=1}^N b_n^2 = \frac{N}{N-1}P_b.
  $$

* Expression de l'écart-type du bruit en fonction du RSB et des échantillons du signal $x$ :

  $$
  \sigma_b = 10^{-\text{RSB}/20} \sqrt{ \frac{\sum_n x_n^2}{N-1} }.
  $$



## Traitement des signaux bruités

### Exercice 4

L'[intercorrélation](https://vincmazet.github.io/signal1/xcorr/intro/#d-finition) $R_{yx}$ est définie par :

$$
R_{yx}[n] = \sum_{m=-\infty}^{+\infty} y[n+m] x[m].
$$

Par changement de variable $k=n+m \Leftrightarrow m=k-n$, l'intercorrélation peut s'écrire :
$$
R_{yx}[n] = \sum_{n=-\infty}^{+\infty} y[k] x[k-n].
$$

Le produit de convolution a pour définition :

$$
(y*h)[n] = \sum_{k=-\infty}^{+\infty} y[k] h[n-k]
$$

Il y a égalité entre le produit de convolution et l'intercorrélation lorsque $h[n-k]=x[k-n]$,
  ce qui signifie que la réponse impulsionnelle $h[n]$ du filtre est égale à $x[-n]$.
  Le filtre adapté est donc bien un filtre dont la réponse impulsionnelle est le signal $x$ retourné dans le temps.


### Exercice 5

La sortie du filtre moyenneur est :

$$
z[n] = \frac{1}{M} \sum_{m=n-\frac{M-1}{2}}^{n+\frac{M-1}{2}} y[m]
     = \sum_{m=n-\frac{M-1}{2}}^{n+\frac{M-1}{2}} y[m] \frac{1}{M}
     = \sum_{m=n-\frac{M-1}{2}}^{n+\frac{M-1}{2}} y[m] h[n-m]
$$

où

$$
h[n-m]
&=
\begin{cases}
  1/M \text{ si } m \in \{n-\frac{M-1}{2},\dots,n+\frac{M-1}{2}\} \\
  0 \text{ sinon}
\end{cases} \\
&=
\begin{cases}
  1/M \text{ si } n-m \in \{-\frac{M-1}{2},\dots,\frac{M-1}{2}\} \\
  0 \text{ sinon}
\end{cases}
$$

soit

$$
h[n] =
\begin{cases}
  1/M \text{ si } n \in \{-\frac{M-1}{2},\dots,\frac{M-1}{2}\} \\
  0 \text{ sinon}
\end{cases}
$$

Le filtre moyenneur s'écrit donc bien comme la convolution entre le signal observé $y$ et une porte $h$.


### Exercice 6

* La moyenne des mesures $y_i$ est :
  
  $$
  \forall n,\qquad
  \frac{1}{I} \sum_{i=1}^I y_i[n]
  = \underbrace{ \frac{1}{I} \sum_{i=1}^I x[n] }_{\tilde{x}[n]} + \underbrace{ \frac{1}{I} \sum_{i=1}^I b_i[n] }_{\tilde{b}[n]}
  $$
  
  où $\tilde{x}[n] = x[n]$.

* On montre déjà que l'espérance de $\tilde{b}$ est nulle (rappelons que les $b_i$ sont blanc et gaussien, donc d'espérance nulle) :

  $$
  \mathbb{E}\left[\tilde{b}\right]
  = \mathbb{E}\left[\frac{1}{I} \sum_{i=1}^I b_i[n]\right]
  = \frac{1}{I} \sum_{i=1}^I \mathbb{E}\left[b_i[n]\right]
  = \frac{1}{I} \sum_{i=1}^I 0
  = 0
  $$

* On peut donc calculer la variance de $\tilde{b}$ :

  $$
  \mathbb{V}\left[\tilde{b}\right]
  &= \mathbb{E}\left[\tilde{b}^2\right] - \mathbb{E}\left[\tilde{b}\right]^2 \\
  &= \mathbb{E}\left[\tilde{b}^2\right] - 0 \\
  &= \mathbb{E}\left[\frac{1}{I^2} \left( \sum_{i=1}^I b_i[n] \right)^2 \right] \\
  &= \frac{1}{I^2} \sum_{i=1}^I \mathbb{E}\left[b_i[n]^2\right] + \frac{1}{I^2} \sum_{i=1}^I \sum_{j \neq i} \mathbb{E}\left[b_i[n]b_j[n]\right]
  $$

  or, puisque les échantillons $b_i$ du bruit sont indépendants, alors $\mathbb{E}\left[b_i[n]b_j[n]\right]=0$ quels que soient $i$ et $j$.
  Il reste donc :

  $$
  \mathbb{V}\left[\tilde{b}\right]
  = \frac{1}{I^2} \sum_{i=1}^I \mathbb{E}\left[b_i[n]^2\right]
  = \frac{1}{I} \mathbb{V}\left[b_i\right]
  $$

* Ce derner résultat implique que le RSB du signal moyenné $\widetilde{\text{RSB}}$
  est égal au RSB d'un signal $y_i$ plus un facteur $10\log(I)$ :

  \begin{align*}
  \widetilde{\text{RSB}}
  &= 10 \log_{10} \left(\frac{P_{\tilde{x}}}{P_{\tilde{b}}}\right) \\
  &= 10 \log_{10} \left(\frac{P_{\tilde{x}}}{\frac{1}{I}P_{b_i}}\right) \\
  &= 10 \log_{10}(I) + 10 \log_{10} \left(\frac{P_{\tilde{x}}}{P_{b_i}}\right) \\
  &= 10 \log_{10}(I) + \text{RSB}
  \end{align*}


### Exercice 7

* $\boldsymbol{\theta}=2,5$ est la valeur de la constante qui approxime au mieux les données.
  On peut calculer $\mathcal{J}=0,5$.

* $\boldsymbol{\theta}=\begin{pmatrix}\frac{7}{3} \\ 1\end{pmatrix}$ regroupe les coefficients de la droite qui approxime au mieux les données.
  Celle-ci est donc d'équation $z = \frac{7}{3} + n$.
  On peut calculer $\mathcal{J}=\frac{2}{3}$.