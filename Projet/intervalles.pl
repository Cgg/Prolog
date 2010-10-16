/* INTERVALLES
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
add_contrainte( I, LIT, TMax ) :-
	member( [ I, D_I, F_I, Duree_I ], LIT ),
	D_I #>0,
	F_I #< TMax,
	( F_I - D_I ) #= Duree_I.
	
add_contrainte( avant, I1, I2, LIT, LFinale ) :-
	member( [ I1,_,F1,_ ], LIT ),
	member( [ I2,D2,_,_ ], LIT ),
	%not( member( F1, LFinale ) ), append( LFinale )
	F1 #< D2.

add_contrainte( disj, I1, I2, LIT, LFinale ) :-
	member( [ I1,_,F1,_ ], LIT ),
	member( [ I2,D2,_,_ ], LIT ),

	F1 #< D2 #\/ D1 #> F2.

fill_contrainte( LC, LRC, LIT, LFinale ) :-
	ctrt( X ),
        not( member( X, LC ) ), !,
        append( LC, [ X ], L1 ),
	nth0( 0, X, T ),
	nth0( 1, X, I ),
	nth0( 2, X, J ),
	add_contrainte( T, I, J, LIT, LFinale ),
	fill_contrainte( L1, LRC, LIT, LFinale ).
fill_contrainte( LC, LC, LIT, LFinale ).

/* Fonction principale */
solve( Input, R_LI, R_LC, TMax ) :-

/* Chargement des donnees en entree. */
consult( Input ),

/* Intervalles */
LI = [],

fill( LI, R_LI ),

/* Contraintes */
LC = [],

fill_contrainte( LC, R_LC, R_LI, LFinale ),

label( LFinale )

.
