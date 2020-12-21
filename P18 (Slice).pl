/*
Extract a slice from a list.
Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). 
Start counting the elements with 1.

Example:
?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
X = [c,d,e,f,g]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

slice([H|T],StartPosition,EndPosition,Sliced):-
    Counter1 is StartPosition-1,
    Counter2 is EndPosition-StartPosition,
    slice1([H|T],Counter1,_,Rest),
    slice2(Rest,Counter2,Sliced).

slice1(L,0,[],L).
slice1([H|T],Counter,[H|L],Rest):-
    Counter1 is Counter-1,
    slice1(T,Counter1,L,Rest).

slice2(_,-1,[]).
slice2([H|T],Counter,[H|L]):-
    Counter1 is Counter-1,
    slice2(T,Counter1,L).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-slice([p,2,g,4,b,5,u,3,v,6,s,7],3,7,Sliced).
OUTPUT:
Sliced = [g, 4, b, 5, u]
false

?-slice([p,2,g,4,b,5,u,3,v,6,s,7],5,10,Sliced).
OUTPUT:
Sliced = [b, 5, u, 3, v, 6]
false

?-slice([a,b,c,d,e,f,g,h,i,k],3,7,Sliced).
OUTPUT:
Sliced = [c, d, e, f, g]
false

*/

