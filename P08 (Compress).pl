/*
Eliminate consecutive duplicates of list elements.
If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

Example:
?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [a,b,c,a,d,e]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

compress([],[]).
compress([X],[X]).
compress([H1,H2|Xs],Zs) :-
H1=H2,
compress([H2|Xs],Zs).
compress([H1,H2|Ys],[H1|Zs]) :-
H1 \= H2,
compress([H2|Ys],Zs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],Compressed).
OUTPUT:
Compressed = [a, b, c, a, d, e]
false

?-compress([5,4,4,4,4,4,9,9,7,8],Compressed).
OUTPUT:
Compressed = [5, 4, 9, 7, 8]
false

?-compress([w,g,g,t,r,r,2,4,4,t,t,3,3],Compressed).
OUTPUT:
Compressed = [w, g, t, r, 2, 4, t, 3]
false

*/
