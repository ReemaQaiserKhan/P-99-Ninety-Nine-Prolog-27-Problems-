/*
Flatten a nested list structure.
Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

Example:
?- my_flatten([a, [b, [c, d], e]], X).
X = [a, b, c, d, e]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

flatten1([],[]):-!.
flatten1([L|Ls],FlatL):-
    !,
    flatten1(L,NewL),
    flatten1(Ls,NewLs),
    append(NewL,NewLs,FlatL).
flatten1(L,[L]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-flatten1([[a],[f,g,h],k,[p],[r],e],Flatten).
OUTPUT:
Flatten = [a, f, g, h, k, p, r, e]

?-flatten1([a, [b, [c, d], e]],Flatten).
OUTPUT:
Flatten = [a, b, c, d, e]

?-flatten1([[1,[2,3]],l,[4,k]],Flatten).
OUTPUT:
Flatten = [1, 2, 3, l, 4, k]

*/
