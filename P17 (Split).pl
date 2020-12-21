/*
Split a list into two parts; the length of the first part is given.
Do not use any predefined predicates.

Example:
?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c]
L2 = [d,e,f,g,h,i,k]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

split(L,0,[],L).
split([H|T],Counter,[H|L],Rest):-
    Counter1 is Counter-1,
    split(T,Counter1,L,Rest).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-split([p,2,g,4,b,5,u,3,v,6,s,7],3,L1,L2).
OUTPUT:
L1 = [p, 2, g],
L2 = [4, b, 5, u, 3, v, 6, s, 7]
false

?-split([p,2,g,4,b,5,u,3,v,6,s,7],5,L1,L2).
OUTPUT:
L1 = [p, 2, g, 4, b],
L2 = [5, u, 3, v, 6, s, 7]

?-split([p,2,g,4,b,5,u,3,v,6,s,7],10,L1,L2).
OUTPUT:
L1 = [p, 2, g, 4, b, 5, u, 3, v, 6],
L2 = [s, 7]
false
*/
