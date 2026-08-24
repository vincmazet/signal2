# Représentation en schéma-blocs
# V 18/08/2026

import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

plt.rcParams.update({
    'font.size': 22,
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": "Source Sans Pro",
})

def block(ax, x, y, w, h, txt):
    """Bloc"""
    p = plt.Rectangle((x, y), w, h, facecolor="white", edgecolor="black")
    ax.add_patch(p)
    plt.text(x+w/2, y+h/2, txt, ha="center", va="center")
    
def add(ax, x, y):
    """Sommateur"""
    p = mpatches.Circle((x, y), .5, facecolor="white", edgecolor="black")
    ax.add_artist(p)
    plt.text(x, y, "+", ha="center", va="center")
    
def arrow(ax, x, y, w, h):
    """Flèche"""
    ax.arrow(x, y, w, h, fc="k", ec="k", head_width=0.1, head_length=0.1, linewidth=.5, length_includes_head=True)
    
def line(ax, x, y, w, h):
    """Ligne"""
    ax.arrow(x, y, w, h, fc="k", ec="k", head_width=0)
    
def label(ax, x, y, txt):
    """Étiquette de texte simple"""
    plt.text(x, y, txt, ha="center", va="center")

def drawing(w, h, debug=False):
    """Fenêtre et axe"""
    fig, ax = plt.subplots(1, 1, figsize=(w,h))
    ax.set_aspect('equal')
    ax.axis('off')
    ax.set_xlim(0, w)
    ax.set_ylim(0, h)
    if debug:
        p = plt.Rectangle((0, 0), w, h, fill=False, edgecolor="tab:cyan", linewidth=2)
        ax.add_patch(p)
    return fig, ax
    
def saving(ax, filename):
    """Enregistrement et affichage"""
    plt.savefig(filename, bbox_inches='tight')
    # plt.show() # suppression pour pouvoir utiliser saving une fois de plus pour enregistrer dans un autre format