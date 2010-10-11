it(a,30). %% pour a est un intervalle de dur�e 30
it(z,5). %% si la dur�� est inconnue on mettrait
it(b,14). %% par exemple it(a,unknown)
it(c,6).
it(d,28).
it(e,15).
it(f,7).
it(g,6).
it(h,15).
it(j,10).
it(k,3).

%%pour d�crire les contraintes entre intervalles des clauses du type :

ctrt([avant,a,z]). ctrt([avant,a,d]).
ctrt([avant,z,b]).
ctrt([avant,b,c]).
ctrt([avant,c,e]). ctrt([avant,c,f]). ctrt([avant,c,g]).
ctrt([avant,d,e]). ctrt([avant,d,f]). ctrt([avant,d,g]).
ctrt([avant,e,k]).
ctrt([avant,f,h]).
ctrt([avant,g,k]).
ctrt([avant,h,j]).
ctrt([avant,j,k]).

%% Comme cela ne vous aura pas �chapp� il s�agit de l�exemple sur la
%% m�thode pert trait� en td 3if. Il est r�alisable en 93 unit�s de temps.
%% On pourrait ajouter aussi la contrainte de disjonction entre les t�ches
%% a,b,c,e,f,h (toujours comme dans le td)

ctrt([allDisj,a,b,c,e,f,h]).

%% ou plus artisanalement :

ctrt([disj,a,b]). ctrt([disj,a,c]). ctrt([disj,a,e]). ctrt([disj,f,h]).

%% Avec ces disjonctions il faut 98 unit�s de temps pour r�aliser l�ensemble.

