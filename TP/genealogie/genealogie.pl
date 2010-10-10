/*
	TODO: predicats

	pere( pere, fils/fille ) / mere( mere, fils/fille )
	fils( fils, pere/mere ) / fille( fille, pere/mere )
	frere / soeur	
	cousin / cousine -> ce predicat renvoie le degre
	ancetre / descendant -> ces predicats renvoient le degre
	adultere
	consanguin
	inceste	
*/

/* predicats */


/* arbre genealogique
 * le predicat parent s'utilise comme suit :
 * parent( X, Y ) <=> X est le parent de Y.
 */
parent(lancelot, claude).
parent(genevieve, claude).
parent(jacqueline, jason).
parent(maxime, jason).
parent(renee, jean).
parent(renee, paul).
parent(renee, octave).
parent(renee, cosinus).
parent(brice, jean).
parent(brice, paul).
parent(brice, octave).
parent(brice, cosinus).
parent(jean, marc).
parent(jean, martin).
parent(jean, murielle).
parent(marie, marc).
parent(marie, martin).
parent(marie, murielle).
parent(murielle, obiwan).
parent(kevin, obiwan).
parent(jason,henriette).
parent(jeanne,henriette).
parent(jacques,jeanne).
parent(jacques,marie).
parent(raoulette,jeanne).
parent(raoulette,marie).
parent(raoulette,brice).

/* sexe (oh oui) */
m(lancelot).
m(maxime).
m(jacque).
m(claude).
m(jason).
m(brice).
m(jean).
m(paul).
m(octave).
m(cosinus).
m(marc).
m(martin).
m(kevin).
m(obiwan).
f(genevieve).
f(jacqueline).
f(raoulette).
f(jeanne).
f(henriette).
f(marie).
f(renee).
f(murielle).


/* Père, mère */
pere(Pere,Enfant) :- parent(Pere,Enfant), m(Pere). 
mere(Mere,Enfant) :- parent(Mere,Enfant), f(Mere). 

/* frere ou soeur */
sibling(X, Y) :- parent(Z,X) ,!, parent(Z,Y), X\==Y.
frere(X, Y) :- sibling(X, Y), m(Y).
soeur(X, Y) :- sibling(X, Y), f(Y).

/* oncle et tante */
oncle(X, Y) :- frere(X, Z), parent(Z, Y).
tante(X, Y) :- soeur(X, Z), parent(Z, Y).

/* cousin, retourne le degre (variable N) (est-ce vraiment bien necessaire
 * ?) 
 */
cousin( X, Y ) :- parent( P1, X ), parent( P2, Y ), sibling( P1, P2 ). 
