/* 
Find the last element of a list.
Example:
?- my_last(X,[a,b,c,d]).
X = d
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

last_Element([H|T],LastElement):-
    length([H|T],Len1),
    Len2 is Len1-1,
    nth0(Len2,[H|T],LastElement).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-last_Element([q,b,d,e,r,f,g,w],LastElement).
OUTPUT:
LastElement = w

?-last_Element([1,g,4,d,6],LastElement).
OUTPUT:
LastElement = 6

?-last_Element([a,b,c,d],LastElement).
OUTPUT:
LastElement = d
*/
