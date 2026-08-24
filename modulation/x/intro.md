# Introduction


La transmission d'un message depuis un émetteur vers un récepteur
se fait en envoyant un signal porteur de l'information du message.
Le message peut être analogique (voix, mesure d'une quantité physique...) ou numérique (texte, vidéo...),
mais dans tous les cas, le signal émis est forcément analogique
puisque le canal de transmission est un système physique (atmosphère, fibre optique, câble électrique, etc.).
Or ce dernier n'est capable de transmettre que certaines plages fréquences,
ce qui implique que le signal émis doit être centré autour d'une fréquence qui peut transiter à travers le canal.

Si le message n'est pas analogique ou ne peut être transmis tel quel,
alors il est indispensable de le traiter pour l'adapter au canal de transmission :
ce traitement est appelé _modulation_, l'opération inverse est la _démodulation_.

Le canal modifie le signal porteur de l'information :
On le modélise généralement comme étant un filtre passe-bas $g$
suivi d'un bruitage par un bruit additif $b$ ({numref}`F:modulation-demodulation`).

```{figure} modulation-demodulation.svg
---
name: F:modulation-demodulation
width: 100%
---
Modèle de canal de transmission.
```

Dans ce cours, nous ne considérons que les modulations linéaires, qui sont les plus simples et les plus répandues.
On distingue deux types de modulations, selon la nature du message.

* la _[modulation analogique](C:modulation:analogique)_ permet de transmettre un message analogique
  (par exemple un signal de parole).
  La modulation analogique nécessite l'utilisation d'une porteuse,
  qui permet au signal de parcourir de longues distances dans des milieux très divers.

* la _modulation numérique_ permet de transmettre un message numérique
  (par exemple un fichier sonore informatique).
  Dans ce cas, le message peut être binaire (il n'est constitué que des symboles 0 et 1) ou $M$-aire
  (il est constitué à partir de $M$ symboles différents ; par exemple $M=16$ pour un message hexadécimal).
  Une modulation numérique consiste à associer à chaque symbole du message un signal de durée $d$.
  Plus précisément, une modulation numérique consiste à modifier l'amplitude d'un signal spécifique
  en fonction du symbole (on parle de modulation linéaire).
  Cette modulation numérique peut être en bande de base ou sur porteuse :
  * la _[modulation en bande de base](C:modulation:bande-de-base)_
    génère des signaux dont le spectre contient des basses fréquences.
    Elle est principalement utilisée dans les conducteurs métalliques ;
  * la _[modulation sur porteuse](C:modulation:porteuse)_
    génère des signaux de bande passante réduite
    et centrée autour d'une fréquence spécifique appelée fréquence porteuse (_carrier_).
    Elle est utilisée principalement pour les communications sans fil.

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