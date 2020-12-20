/*
Find the last but one element of a list. (Second last element)
(zweitletztes Element, l'avant-dernier élément)
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
last_but_one(Element,[H|T]):-
    length([H|T],Len1),
    Len2 is Len1-2,
    nth0(Len2,[H|T],Element).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-last_but_one(LastButOne,[a,b,c,d]).
OUTPUT:
LastButOne = c

?-last_but_one(LastButOne,[q,b,d,e,r,f,g,w]).
OUTPUT:
LastButOne = g

?-last_but_one(LastButOne,[1,g,4,d,6]).
OUTPUT:
LastButOne = d

*/
