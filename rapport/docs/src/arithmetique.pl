/* element : renvoie le n-ieme element de la liste, ou donne le rang dans
 * la liste de l'element donne.
 *
 * N = rang donne ou a chercher
 * X = element a chercher ou donne
 * L = liste dans laquelle s'effectue la recherche.
 */

element( N, X, L ) :-
	atom( X ),
	element2( 1, N, X, L ).

element( N, X, L ) :-
	not( atom( X ) ),
	element1( N, X, L ).

element1( 1, X, [ X | _ ] ).

element1( N, X, [ _ | L ] ) :-
	N > 1,
	N1 is N - 1,
	element1( N1, X, L ).

element2( NC, NR, X, [] ). 

element2( NC, NC, X, [ X | L ] ) :-
	N1 is NC + 1,
	element2( N1, NC, X, L ).

element2( NC, NR, X, [ _ | L ] ) :-
	N1 is NC + 1,
	element2( N1, NR, X, L ).
