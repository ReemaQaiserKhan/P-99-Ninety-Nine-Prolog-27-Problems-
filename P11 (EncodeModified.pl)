/*
Modified run-length encoding.
Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates 
are transferred as [N,E] terms.

Example:
?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],b,[2,c],[2,a],d,[4,e]]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

encode_modified([H|T],Modified):-
    pack([H|T],Packed),
    encoded2(Packed,Encoded1),
    modify(Encoded1,Modified).

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
    
modify([],[]).
modify([H|T],[A2|L]):-
    H=[A1,A2],
    A1=1,
    modify(T,L).
modify([H|T],[H|L]):-
    H=[A1,_],
    A1\=1,
    modify(T,L).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-encode_modified([v,v,b,b,b,b,b,g,t,t,t,t,t,t,t],Modified).
OUTPUT:
Modified = [[2, v], [5, b], g, [7, t]]
false

?-encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],Modified).
OUTPUT:
Modified = [[4, a], b, [2, c], [2, a], d, [4, e]]
false

?-encode_modified([2,3,3,3,6,6,8,9,9],Modified).
OUTPUT:
Modified = [2, [3, 3], [2, 6], 8, [2, 9]]
false
*/
