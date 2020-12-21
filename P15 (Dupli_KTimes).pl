/*
Duplicate the elements of a list a given number of times.
Example:
?- dupli([a,b,c],3,X).
X = [a,a,a,b,b,b,c,c,c]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dupli([H|T],Counter,Duplicate):-
    dupli1([H|T],Counter,Duplicate1),
    flatten1(Duplicate1,Duplicate).

dupli1([],_,[]).
dupli1([H|T],Counter,[W|L]):-
    dupli2(H,Counter,W),
    dupli1(T,Counter,L).

dupli2(_,0,[]):-!.
dupli2(H,Counter,[H|L]):-
    Counter1 is Counter-1,
    dupli2(H,Counter1,L).

flatten1([],[]):-!.
flatten1([L|Ls],FlatL):-
    !,
    flatten1(L,NewL),
    flatten1(Ls,NewLs),
    append(NewL,NewLs,FlatL).
flatten1(L,[L]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-dupli([2,0,1,6,4],3,Duplicate).
OUTPUT:
Duplicate = [2, 2, 2, 0, 0, 0, 1, 1, 1, 6, 6, 6, 4, 4, 4]

?-dupli([2,0,1,6,4],8,Duplicate).
OUTPUT:
Duplicate = [2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 4, 4, 4, 4, 4, 4, 4, 4]

?-dupli([r,e,e,m,a],5,Duplicate).
OUTPUT:
Duplicate = [r, r, r, r, r, e, e, e, e, e, e, e, e, e, e, m, m, m, m, m, a, a, a, a, a]
*/
