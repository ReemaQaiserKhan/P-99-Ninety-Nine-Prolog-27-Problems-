/*
Extract a given number of randomly selected elements from a list.
The selected items shall be put into a result list.
Example:
?- rnd_select([a,b,c,d,e,f,g,h],3,L).
L = [e,d,a]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
?-random_select([a,s,d,f],3,Random).
OUTPUT:
Random = [s, d, d]

?-random_select([a,s,d,f],3,Random).
OUTPUT:
Random = [d, s, a]

?-random_select([a,s,d,f,g,f,r,c,d,h,g],5,Random).
OUTPUT:
Random = [d, s, c, c, h]

?-random_select([a,s,d,f,g,1,5,8,9],5,Random).
OUTPUT:
Random = [8, s, g, f, d]

?-random_select([a,s,d,f,g,1,5,8,9],5,Random).
OUTPUT:
Random = [g, s, d, 8, 1]

*/
