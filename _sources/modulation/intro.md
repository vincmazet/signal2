# Introduction


La transmission d'une information d'un émetteur vers un (ou plusieurs) récepteur est
effectuée en transmettant un signal qui porte l'information du message à transmettre.
Ce signal doit respecter certaines caractéristiques pour que la transmission se fasse correctement :
* le signal doit être adapté au milieu de transmission (câble électrique, fibre optique, atmosphère, etc.).
  Or ce dernier n'est capable de transmettre que certaines plages fréquences,
  ce qui implique que le signal doit être centré autour d'une fréquence qui peut transiter à travers le milieu ;
* on peut vouloir transmettre en même temps plusieurs signaux à travers le même milieu,
  comme par exemple en radio.
  Le multiplexage est une technique qui permet de transmettre des signaux différents à travers le même milieu
  tout en assurant une séparation de ceux-ci au niveau du récepteur ;
* d'autres contraintes peuvent également jouer sur le choix des caractéristiques que doit respecter le signal,
  comme par exemple la robustesse du codage face aux perturbations ou la facilité de décodage.

Le traitement appliqué au message pour l'adapter au milieu de transmission est appelé _modulation_.
L'opération inverse est la _démodulation_.
On distingue deux types de modulations :
* la _modulation analogique_ pour laquelle le message est analogique (par exemple un signal de parole) ;
* la _modulation numérique_ lorsque le message est numérique
  (par exemple un fichier informatique ou tout signal numérique).
  Dans ce cas, le message peut être binaire (il ne porte que des 0 et des 1)
  ou $M$-aire (il porte des entiers entre 0 et $M-1$).
  Une modulation numérique consiste à associer à chaque symbole du message un signal de durée $d$,
  et plus précisément à modifier l'amplitude d'un signal type en fonction du symbole : c'est une modulation linéaire.
  La modulation numérique, elle peut être en bande de base ou sur porteuse :
  * la modulation en bande de base génère des signaux dont le spectre contient des basses fréquences.
    Elle est principalement utilisée dans les conducteurs métalliques ;
  * la modulation sur porteuse génère des signaux de bande passante réduite
    et centrée autour d'une fréquence spécifique appelée fréquence porteuse (_carrier_).
    Elle est utilisée principalement pour les communications sans fil.

Le milieu de transmission est générallement appelé _canal_.
Il modifie le signal porteur de l'information.
Un modèle très simple du canal est de le considérer comme étant un filtre passe-bas $g$
duivi d'un bruitage du signal par un bruit additif $b$.

```{figure} modulation-demodulation.svg
---
name: F:modulation-demodulation
---
Modèle de canal de transmission.
```

<!-- Dans le cadre de ce cours, nous traiterons uniquement les modulations PAM linéaires.
Ainsi, la modulation en déplacement de fréquence (**FSK** pour _frequency shift keying_),
pour laquelle les symboles sont représentés par des sinusoïdes de fréquence différente,
n'est pas linéaire et ne sera donc pas abordée. -->


<!-- Les sections suivantes détaillent ces deux types de modulation puis les techniques de démodulation pour transformer le signal reçu en une séquence $M$-aire.

Par ailleurs, la **rapidité de modulation** (_symbol rate_) $R$ est le nombre de symboles émis par seconde:

$$
R = \frac{1}{d}.
$$

La rapidité de modulation s'exprime en baud (Bd) qui est l'équivalent de symboles par seconde.
On utilise parfois le **débit binaire** (_bit rate_) qui représente la rapidité de modulation en bits (et non en symboles).
Le débit binaire est donc égal à la rapidité de modulation $R$ multipliée par le nombre de bits par symbole du canal. -->