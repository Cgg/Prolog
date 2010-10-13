/*
* Ceci est un fichier Prolog, espèce de vim de mes klzhenf!
*/

it(a,30). %% pour a est un intervalle de durée 30
it(z,5). %% si la duréé est inconnue on mettrait
it(b,14). %% par exemple it(a,unknown)
it(c,6).

%%pour décrire les contraintes entre intervalles des clauses du type :

ctrt([avant,a,z]). ctrt([avant,a,d]).
ctrt([avant,z,b]).
ctrt([avant,b,c]).

%% Comme cela ne vous aura pas échappé il s’agit de l’exemple sur la
%% méthode pert traité en td 3if. Il est réalisable en 93 unités de temps.
%% On pourrait ajouter aussi la contrainte de disjonction entre les tâches
%% a,b,c,e,f,h (toujours comme dans le td)

% ctrt([allDisj,a,b,c,e,f,h]).

%% ou plus artisanalement :

ctrt([disj,a,b]). ctrt([disj,a,c]). ctrt([disj,a,e]). ctrt([disj,f,h]).

%% Avec ces disjonctions il faut 98 unités de temps pour réaliser l'ensemble.

