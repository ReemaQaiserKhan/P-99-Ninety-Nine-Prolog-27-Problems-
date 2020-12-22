/*
Generate a random permutation of the elements of a list.
Example:
?- rnd_permu([a,b,c,d,e,f],L).
L = [b,a,d,c,e,f]

Hint: Use the solution of problem P23.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

random_permuation([H|T],Permutation):-
    length([H|T],Length),
    random_select([H|T],Length,Permutation).

random_select([H|T],Number,Random):-
    random_select1([H|T],Number,Random).

random_select1(_,0,[]):-!.
random_select1([H|T],Counter,[Random|List]):-
    length([H|T],Length),
    random(1,Length,RandomIndex),
    nth(RandomIndex,[H|T],Random),
    Counter1 is Counter-1,
    random_select1([H|T],Counter1,List).

nth(1,[H|_],H):-!.
nth(N,[_|T],E):-
    N>1,
    N1 is N-1,
    nth(N1,T,E).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-random_permutation([a,b,c,d,e,f,g,h],Permutation).
OUTPUT:
Permutation = [f, e, b, h, a, g, d, c]

?-random_permutation([a,b,c,d,e,f,g,h],Permutation).
OUTPUT:
Permutation = [c, d, e, f, a, g, b, h]

?-random_permutation([a,b,c,d,e,f,g,h],Permutation).
OUTPUT:
Permutation = [h, d, a, f, c, e, b, g]

?-random_permutation([a,b,c,d,e,f,g,h],Permutation).
OUTPUT:
Permutation = [d, f, h, e, g, b, c, a]

*/
