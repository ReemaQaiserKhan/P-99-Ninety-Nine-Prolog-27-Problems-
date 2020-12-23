/*
Sorting a list of lists according to length of sublists
a) We suppose that a list (InList) contains elements that are lists themselves. The objective is to sort the elements of InList according to their length. E.g. short lists first, longer lists later, or vice versa.

Example:
?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lsort([H|T],Sorted):-
    lengthList([H|T],LengthList),
    max(LengthList,Max),
    counter(Max,[H|T],Sorted1),
    reverse(Sorted1,Sorted2),
    append(Sorted2,Sorted),!. % append/2 is used to decrease the brackets i.e. [[[o],[b,b],[c,c,c]]] -> [[o],[b,b],[c,c,c]]

lengthList([],[]).
lengthList([H|T],[Length|W]):-
    length(H,Length),
           lengthList(T,W).

max([],0):-!.
max([H|T],Max):-
    max(T,TailMax),
    H>TailMax,
    Max is H.
max([H|T],Max):-
    max(T,TailMax),
    H<TailMax,
    Max is TailMax.

counter(0,_,[]):-!.
counter(Max,[H|T],[W|L]):-
    counter1(Max,[H|T],W),
    Max1 is Max-1,
    counter(Max1,[H|T],L).

counter1(_,[],[]):-!.
counter1(Max,[H|T],[H|L]):-
    length(H,Len),
    Max=Len,
    counter1(Max,T,L).
counter1(Max,[H|T],L):-
    length(H,Len),
    Max\=Len,
    counter1(Max,T,L).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],Sorted).
OUTPUT:
Sorted = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]

?-lsort([[1,5,4,3],[1,m],[e,e,e,3],[t,6,r,4],[d],[w,w,w]],Sorted).
OUTPUT:
Sorted = [[d], [1, m], [w, w, w], [1, 5, 4, 3], [e, e, e, 3], [t, 6, r, 4]]

?-lsort([[2,f,2],[p,p,p,p],[6,6,4,4],[c],[f],[g,g,g]],Sorted).
OUTPUT:
Sorted = [[c], [f], [2, f, 2], [g, g, g], [p, p, p, p], [6, 6, 4, 4]]

*/
