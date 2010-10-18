:-use_module(library('clp/bounds')).
zebre(Nationalites, Boissons, Animaux, Cigarettes, Couleurs) :-
/* Variables */
Nationalites = [Norvegien, Anglais, Espagnol, Ukrainien, Japonais],
Boissons = [Lait, Cafe, The, Vin, Eau],
Couleurs = [Bleue, Rouge, Jaune, Verte, Blanche],
Animaux = [Zebre, Chien, Escargot, Renard, Cheval],
Cigarettes = [Kools, Cravens, Oldgolds, Chesterfields, Gitanes],

/* Domaines (numéros des maisons) */
Nationalites in 1..5,
Boissons in 1..5,
Couleurs in 1..5,
Animaux in 1..5,
Cigarettes in 1..5,

/* Contraintes de domaines */
all_different(Nationalites),
all_different(Boissons),
all_different(Couleurs),
all_different(Cigarettes),
all_different(Animaux),

/* Contraintes de l'énoncé */
Norvegien #= 1,
Bleue #= Norvegien + 1,
Lait #= 3,
Anglais #= Rouge,
Verte #= Cafe,
Jaune #= Kools,
Blanche #= Verte+1,
Espagnol #= Chien,
Ukrainien #= The,
Japonais #= Cravens,
Oldgolds #= Escargot,
Gitanes #= Vin,
abs(Chesterfields - Renard) #= 1,
abs(Kools - Cheval) #= 1,

/* Résultat */
label(Couleurs),
label(Nationalites),
label(Boissons),
label(Animaux),
label(Cigarettes).
