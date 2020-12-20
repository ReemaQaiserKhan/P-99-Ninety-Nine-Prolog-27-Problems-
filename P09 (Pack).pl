/*
Pack consecutive duplicates of list elements into sublists.
If a list contains repeated elements they should be placed in separate sublists.

Example:
?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pack([],[]).
pack([H|T],[Z|Zs]):-
    transfer(H,T,Ys,Z),
    pack(Ys,Zs).

transfer(X,[],[],[X]).
transfer(X,[X|Xs],Ys,[X|Zs]):-
    transfer(X,Xs,Ys,Zs).
transfer(X,[Y|Ys],[Y|Ys],[X]):-
    X\=Y.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-pack([a,a,a,b,b,c,c],Packed).
OUTPUT:
Packed = [[a, a, a], [b, b], [c, c]]
false

?-pack([2,3,3,3,6,6,8,9,9],Packed).
OUTPUT:
Packed = [[2], [3, 3, 3], [6, 6], [8], [9, 9]]
false

?-pack([1,2,3,4,5],Packed).
OUTPUT:
Packed = [[1], [2], [3], [4], [5]]
false
*/
