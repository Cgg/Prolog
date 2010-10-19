/* predicats */

/* arbre genealogique
 * le predicat parent s'utilise comme suit :
 * parent( X, Y ) <=> X est le parent de Y.
 */
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
parent(ursula, josh).
parent(marc, josh).
parent(martin, toto).
parent(yoko, toto).

/* sexe */
m(brice).
m(jean).
m(paul).
m(octave).
m(cosinus).
m(marc).
m(martin).
m(kevin).
m(obiwan).
m(josh).
f(yoko).
f(ursula).
f(marie).
f(renee).
f(murielle).


/* Pere, mere */
pere(Pere,Enfant) :- parent(Pere,Enfant), m(Pere). 
mere(Mere,Enfant) :- parent(Mere,Enfant), f(Mere). 

/* frere ou soeur */
sibling(Enfant, AutreEnfant) :- parent(Parent, Enfant),!, parent(Parent,AutreEnfant), Enfant\==AutreEnfant.
frere(Sibling, Frere) :- sibling(Sibling, Frere), m(Frere).
soeur(Sibling, Soeur) :- sibling(Sibling, Soeur), f(Soeur).

/* cousin */
cousin( X, Y ) :- parent( P1, X ), parent( P2, Y ), sibling( P1, P2 ). 
