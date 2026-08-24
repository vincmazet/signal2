/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

=== 🖍️ Corrections

==== Signaux élémentaires <signaux-l-mentaires>

===== Exercice 1 <exercice-1>

- Exemples de signal échantillonné : la température de l'air au lever du soleil (le soleil se levant avec une fréquence de 1 jour$""^(-1) = 0, 278$ mHz, la mesure de la température au lever du soleil est forcément à temps discret, tout en étant une mesure continue de la température).
- Exemple de signal à temps continu : tout signal analogique.
- Exemple de signal quantifié : le nombre de personnes dans une pièce en fonction du temps (qui a une valeur forcément entière et qui dépend du temps, variable continue).
- Exemples de signal analogique : le son émis par une personne qui parle, la température effective sur un objet ou tout autre signal naturel.
- Exemples de signal numérique : le signal sonore contenu dans une musique en _streaming_, l'enregistrement numérique d'un capteur ou tout autre signal numérique.

===== Exercice 2 <exercice-2>

Un #link("https://vincmazet.github.io/signal1/notions/proprietes-des-signaux.html\#causalite")[signal causal] st un signal $x (t)$ nul pour $t < 0$. La propriété est équivalente pour les signaux numériques.

===== Exercice 3 <exercice-3>

Échelon (ou fonction de Heaviside) :

$ u (t) = $
#show figure: set block(breakable: breakableDefault)
#figure(
  image("echelon.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

Impulsion de Dirac :

$ delta (t) = 0 thick "si"thick t eq.not 0 wide "et"wide integral delta (t) d t = 1 $
#show figure: set block(breakable: breakableDefault)
#figure(
  image("dirac.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

Impulsion discrète :

$ delta [ n ] = $
#show figure: set block(breakable: breakableDefault)
#figure(
  image("kronecker.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

Peigne de Dirac ($T > 0$) :

$ Ш_T (t) = sum_(k = -infinity)^(+ infinity) delta (t -k T) $
#show figure: set block(breakable: breakableDefault)
#figure(
  image("peigne.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

===== Exercice 4 <exercice-4>

#show figure: set block(breakable: breakableDefault)
#figure(
  image("signal-x.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

#show figure: set block(breakable: breakableDefault)
#figure(
  image("signal-y.svg", width: 90%),
  kind: "figure",
  supplement: [Figure],
)

===== Exercice 5 <exercice-5>

A est un sinus cardinal.

==== Produit de convolution <produit-de-convolution>

===== Exercice 6 <exercice-6>

D'après la définition du produit de convolution, et comme le signal $x$ est nul presque partout (sauf aux échantillons $n = 1$ et $n = -1$), alors :

$ (x * y) [ n ] & = sum_(m = -infinity)^(+ infinity) x [ m ] y [ n -m ] \
& = x [ -1 ] y [ n + 1 ] + x [ 1 ] y [ n -1 ] $
Les valeurs de $x [ -1 ]$ et $x [ 1 ]$ sont données par la définition de $x$, donc :

$ (x * y) [ n ] = -y [ n + 1 ] + y [ n -1 ]. $ <e:rev:convolution>
D'après la définition de $y$, on a d'une part :

$ y [ n + 1 ] = = $
et d'autre part :

$ y [ n -1 ] = =. $
D'après l'équation #link(<e:rev:convolution>)[Equation], on peut finalement définir la valeur de tous les échantillons de $(x * y)$. Il n'y a qu'en $n = 0$ que les deux signaux $y [ n + 1 ]$ et $y [ n -1 ]$ sont tous les deux non nuls (ils valent $a$). Ainsi :

$ (x * y) = $
===== Exercice 7 <exercice-7>

- A :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("conv-1-result.svg", width: 37.5%),
  kind: "figure",
  supplement: [Figure],
)

- B :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("conv-2-result.svg", width: 37.5%),
  kind: "figure",
  supplement: [Figure],
)

- C :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("conv-3-result.svg", width: 37.5%),
  kind: "figure",
  supplement: [Figure],
)

===== Exercice 8 <exercice-8>

- $(x * d_0) (t) = x (t) * delta (t -tau) = x (t -tau)$.
- $(d_1 * d_2) (t) = delta (t + t_1) * delta (t + t_2) = delta (t + t_1 + t_2)$.

==== Analyse de Fourier <analyse-de-fourier>

===== Exercice 9 <exercice-9>

Le signal $x (t)$ est continu car il dépend de la variable $t$ (généralement continue), et il est apériodique (c'est une porte). La transformation de Fourier associée est donc la transformée de Fourier.

$ X (f) & = integral_(-infinity)^(+ infinity) A thin upright(r e c t) (2 t \/ T) e^(-j 2 pi f t) thin d t \
& = A integral_(-frac(T, 4))^(+ frac(T, 4)) e^(-j 2 pi f t) thin d t \
& = A [ frac(e^(-j 2 pi f t), -j 2 pi f) ]_(-frac(T, 4))^(+ frac(T, 4)) \
& = A (frac(e^(-j 2 pi f frac(T, 4)), -j 2 pi f) -frac(e^(+ j 2 pi f frac(T, 4)), -j 2 pi f)) \
& = A frac(1, j 2 pi f) (e^(+ j 2 pi f frac(T, 4)) -e^(-j 2 pi f frac(T, 4))) \
& = A frac(1, j 2 pi f) 2 j sin (2 pi f frac(T, 4)) \
& = A frac(1, pi f) sin (pi f frac(T, 2)) \
& = A frac(frac(T, 2), pi f frac(T, 2)) sin (pi f frac(T, 2)) \
& = frac(A T, 2) upright(s i n c) (f frac(T, 2)) \
 $
===== Exercice 10 <exercice-10>

- Le théorème de l'échantillonnage peut s'énoncer ainsi : si un signal analogique $x (t)$ de fréquence maximale $f_(upright(m a x))$ est échantillonné à une fréquence $f_e > 2 f_(upright(m a x))$, alors $x (t)$ peut être exactement reconstruit à partir de ses échantillons (à l'aide d'une interpolation par sinus cardinal). Dit autrement, un signal à temps continu $x (t)$ est déterminé de manière unique par les échantillons $x [ n ] = x (n T_e)$ à condition que $f_e > 2 f_(upright(m a x))$.
- Ainsi, la fréquence d'échantillonnage pour un signal dans la bande $[ 0, 100 ]$~Hz doit être supérieure à $2 times 100 = 200$ Hz.
- De même, la fréquence d'échantillonnage pour un signal dans la bande $[ 30, 150 ]$~Hz doit être supérieure à $2 times 150 = 300$ Hz.
- Dans le cas d'une sinusoïde de fréquence 320 Hz échantillonnée à 600 Hz, la condition $f_e > 2 f_(upright(m a x))$ n'est pas respectée. Une représentation graphique permet d'identifier le signal obtenu après échantillonnage. On sait que l'échantillonnage d'un signal à la fréquence $f_e$ produit une périodisation de son spectre à la période $f_e$. Graphiquement, on obtient donc :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("spectre-sampling.svg", width: 100%),
  kind: "figure",
  supplement: [Figure],
)

===== Exercice 11 <exercice-11>

Un signal constant est équivalent à une unique exponentielle complexe de fréquence nulle. Son spectre est donc une unique impulsion de Dirac à la fréquence nulle.

Par dualité, le spectre d'une impulsion de Dirac centrée en 0 et un spectre constant.

Cela implique qu'une impulsion de Dirac~contient toutes les fréquences en amplitudes égales, donc en puissances égales.

===== Exercice 12 <exercice-12>

La transformée de Fourier discrète est périodique, à support discret et valeurs complexes. Elle peut être réelle dans le cas particulier ou le signal temporel est pair.

===== Exercice 13 <exercice-13>

Grâce à la formule d'Euler, on sait que $cos (t) = (e^(j t) + e^(-j t)) \/ 2$. Comme le spectre est la représentation graphique de la décomposition en exponentielles complexes du signal, alors le spectre de $cos (t)$ n'est non nul qu'aux fréquences 1 et -1 :

#show figure: set block(breakable: breakableDefault)
#figure(
  image("spectre-cos.svg", width: 62.5%),
  kind: "figure",
  supplement: [Figure],
)

===== Exercice 14 <exercice-14>

Une fréquence $f = 12, 37$ an$""^(-1)$ correspond à un phénomène qui apparaît de façon périodique 12,37 fois par an. Sa péridicité est donc $1 \/ f = 80, 84 dot.op 10^(-3)$ ans soit $1 \/ f times 365 = 29, 5$ jours environ. Il peut donc s'agir par exemple de la luminosité de la Lune qui tourne avec une période de 29,5 jours autour de la Terre.