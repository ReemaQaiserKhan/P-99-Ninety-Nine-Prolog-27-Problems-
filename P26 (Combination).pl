/*
Generate the combinations of K distinct objects chosen from the N elements of a list
In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known 
binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities (via backtracking).

Example:
?- combination(3,[a,b,c,d,e,f],L).
L = [a,b,c] ;
L = [a,b,d] ;
L = [a,b,e] ;
...
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

combination(Length,[H|T],Combinations):-
    splitSet([H|T],_,Subset),
    Subset=[_|_], %disallowing empty lists
    permute(Subset,Combinations),
    length(Combinations,Len2),
    Length=Len2.
           
splitSet([ ],[ ],[ ]).
splitSet([H|T],[H|L],R) :-
    splitSet(T,L,R).
splitSet([H|T],L,[H|R]) :-
    splitSet(T,L,R).

permute([ ],[ ]):-!.
permute(L,[X|R]) :-
    omit(X,L,M),
    permute(M,R).

omit(H,[H|T],T).
omit(X,[H|L],[H|R]) :-
    omit(X,L,R).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-combination(3,[a,b,c,d,e,f,g,h],Combination).
OUTPUT:
Combination = [f, g, h]
Combination = [f, h, g]
Combination = [g, f, h]
Combination = [g, h, f]
...

?-combination(5,[a,b,c,d,e,f,g,h],Combination).
OUTPUT:
Combination = [d, e, f, g, h]
Combination = [d, e, f, h, g]
Combination = [d, e, g, f, h]
Combination = [d, e, g, h, f]
...

?-combination(1,[a,b,c,d,e,f,g,h],Combination).
OUTPUT:
Combination = [h]
Combination = [g]
Combination = [f]
Combination = [e]
...

?-combination(2,[a,b,c,d,e,f,g,h],Combination).
OUTPUT:
Combination = [g, h]
Combination = [h, g]
Combination = [f, h]
Combination = [h, f]
...
*/
