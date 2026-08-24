/* Written by MyST v1.10.1 */

#import "myst-imports.typ": *

=== 🖍️ Représentation d'un signal

Cet exercice est fortement fondé sur le code de la section #link("C:python").

Par convention, les modules sont importés en début de notebook. Ils sont également renommés (`numpy` en `np` par exemple) pour raccourcir le code lorsqu'il seront utilisés.

```python
import numpy as np
import matplotlib.pyplot as plt
```

Les valeurs des paramètres sont à mettre à jour en fonction des données de l'énoncé.

```python
A = 2
a = 0.5
phi = 1
f = 2
```

Le pas de temps (ici, 0,02) est choisi par essai-erreur pour obtenir une jolie courbe.

```python
t = np.arange(0, 10, 0.02)
```

Le signal est une sinusoïde amortie. J'utilise deux variables intermédiaires pour la créer.

```python
# Sinusoïde
sinus = np.sin(2*np.pi*f*t + phi)

# Exponentielle décroissante
expo = np.exp(-a*t)

# Le signal est égal à A × sinus × expo
x = A*sinus*expo
```

Affichage !

```python
plt.figure()
plt.plot(t,x)
plt.xlabel("$t$ (s)")
plt.ylabel("$x(t)$")
plt.title("Sinusoïde amortie")
plt.show()
```

#image("files/99965d8eb342230e1e9bace38024a932.png", width: 90%)