/* INTERVALLES
 * 
 * faits a mettre en place : 
 * - it( X, T ) : intervalle de nom X et de duree T 
 * - ct( [ L ] ) : contrainte.
 * 
 * L est de la forme [ Type, It1, It2 ] ou Type peut prendre la valeur avant, disjoint, ou de la forme [ allDisj | _ ], la queue de la liste etant la liste des intervalles disjoints.
 *
 * But du jeu :
 * ecrire un predicat solve( Input, TMax ) ou Input contient des intervalles et des contraintes definies comme ci-dessus et essaie de les ordonnancer dans Tmax.
 */

:- use_module( library( 'clp/bounds' ) ).

/* Acces par index dans une liste */
element_at(X,[X|_],1).
element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1).

/* procedure de remplissage de la liste des intervalles */
fill(L,LR) :- it( X, T ),
             not( member( [ X,_,_,_ ], L ) ), !,
             append( L, [ [ X, _, _, T ] ], L1 ),
	     fill( L1, LR ).
fill(L,L).

/* procedure de remplissage des contraintes */
add_contrainte( avant, I1, I2, LIT ) :-
	member( [ I1,_,F1,_ ], LIT ), member( [ I2,D2,_,_ ], LIT ), F1 #< D2.

add_contrainte( disj, I1, I2, LIT ) :-
	member( [ I1,_,F1,_ ], LIT ), member( [ I2,D2,_,_ ], LIT ), F1 #< D2 #\/ D1 #> F2.

fill_contrainte( LC, LRC, LIT ) :-
	ctrt( X ),
        not( member( X, LC ) ), !,
        append( LC, [ X ], L1 ),
	nth0( 0, X, T ),
	nth0( 1, X, I ),
	nth0( 2, X, J ),
	add_contrainte( T, I, J, LIT ),
	fill_contrainte( L1, LRC, LIT ).
fill_contrainte( LC, LC, LIT ).

solve( Input, R_LI, R_LC, TMax ) :-

/* Turn debug mode on */
%spy( add_contrainte/4 ),

/* Chargement des donnees en entree. */
consult( Input ),

LI = [],

fill( LI, R_LI ),

LC = [],

/* Contraintes */
fill_contrainte( LC, R_LC, R_LI ),

/* Turn debug mode off */
%nospy( add_contrainte/4 ),
%notrace,
%nodebug
.
