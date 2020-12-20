/*
Run-length encoding of a list.
Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where
N is the number of duplicates of the element E.

Example:
?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

encode([H|T],Encoded):-
    pack([H|T],Packed),
    encoded2(Packed,Encoded).

encoded2([],[]).
encoded2([H|T],[[Len,Element]|Ph]):-
    length(H,Len),
    nth0(0,H,Element),
    encoded2(T,Ph).
    
pack([],[]).
pack([H|T],[Z|Zs]):-
    transfer(H,T,Ys,Z),
    pack(Ys,Zs).

transfer(X,[],[],[X]).
transfer(X,[X|Xs],Ys,[X|Zs]):-
    transfer(X,Xs,Ys,Zs).
transfer(X,[Y|Ys],[Y|Ys],[X]):-
    X\=Y.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],Encoded).
OUTPUT:
Encoded = [[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]]
false

?-encode([2,3,3,3,6,6,8,9,9],Encoded).
OUTPUT:
Encoded = [[1, 2], [3, 3], [2, 6], [1, 8], [2, 9]]
false

?-encode([v,v,b,b,b,b,b,g,t,t,t,t,t,t,t],Encoded).
OUTPUT:
Encoded = [[2, v], [5, b], [1, g], [7, t]]
false
*/
