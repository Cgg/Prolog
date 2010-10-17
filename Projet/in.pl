/*
 * Ceci est un fichier Prolog, espèce de vim de mes klzhenf!
 */

it(a,30). %% pour a est un intervalle de durée 30
it(z,5). %% si la duréé est inconnue on mettrait
it(b,14). %% par exemple it(a,unknown)
it(c,6).

%%pour décrire les contraintes entre intervalles des clauses du type :

ctrt([avant,a,z]).
ctrt([avant,z,b]).

ctrt([disj,a,c]).
