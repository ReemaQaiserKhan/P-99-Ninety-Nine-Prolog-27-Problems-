/*
Remove the K'th element from a list.
Example:
?- remove_at(X,[a,b,c,d],2,R).
X = b
R = [a,c,d]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

remove_at(Element,[H|T],Position,RemovedList):-
    nth(Position,[H|T],Element),
    remove_at1([H|T],Element,RemovedList),!.

remove_at1([],_,[]).
remove_at1([H|T],X,[H|L]):-
    H\=X,
    remove_at1(T,X,L).
remove_at1([H|T],X,L):-
    H=X,
    remove_at1(T,X,L).

nth(1,[H|_],H):-!.
nth(N,[_|T],Element):-
    N>1,
    N1 is N-1,
    nth(N1,T,Element).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-remove_at(Element,[a,b,c,d,e,f,g,h],2,RemovedList).
OUTPUT:
Element = b,
RemovedList = [a, c, d, e, f, g, h]

?-remove_at(Element,[a,b,c,d,e,f,g,h],5,RemovedList).
OUTPUT:
Element = e,
RemovedList = [a, b, c, d, f, g, h]

?-remove_at(Element,[a,b,c,d,e,f,g,h],8,RemovedList).
OUTPUT:
Element = h,
RemovedList = [a, b, c, d, e, f, g]

?-remove_at(Element,[a,b,c,d,e,f,g,h],9,RemovedList).
OUTPUT:
false
*/
