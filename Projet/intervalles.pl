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

/* procedure de remplissage de la liste des intervalles */
fill(L,LR) :- it( X, T ),
             not( member( [ X,_,_,_ ], L ) ), !,
             append( L, [ [ X, _, _, T ] ], L1 ),
	     fill( L1, LR ).
fill(L,L).

/* procedure de remplissage des contraintes */
fill_contrainte( avant, I1, I2, LT ) :-
	member( ( I1,_,F1,_ ), LT ), member( ( I2,D2,_,_ ), LT ), F1 #< D2,
	fill_contrainte( T, I3, I4, LT ).

fill_contrainte( disj, I1, I2, LT ) :-
	member( ( I1,_,F1,_ ), LT ), member( ( I2,D2,_,_ ), LT ), F1 #< D2 #\/ D1 #> F2,
	fill_contrainte( T, I3, I4, LT ).

fill_contrainte( Type, I1, I2, LT ) :-
	ctrt( X ),
        not( member( X, LT ) ), !,
        append( LT, [ X ], L1 ),
	fill( L1, LR ).


solve( Input, L, TMax ) :-

/* Chargement des donnees en entree. */
consult( Input ),

LI = [],

fill( LI,L )

/* Contraintes */


.
