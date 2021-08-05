/*
Group the elements of a set into disjoint subsets.
a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a predicate that generates all the possibilities via backtracking.

Example:
?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
G1 = [aldo,beat], G2 = [carla,david,evi], G3 = [flip,gary,hugo,ida]
...

Hint: P26 (Combination).pl
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

group3([H|T],G1,G2,G3):-
    combination(2,[H|T],C1),
    combination(3,[H|T],C2),
    combination(4,[H|T],C3),
    append(C1,C2,K1),
    append(K1,C3,K2),
    all_diff(K2),
    K2=[A1,A2,A3,A4,A5,A6,A7,A8,A9],
    G1=[A1,A2],
    G2=[A3,A4,A5],
    G3=[A6,A7,A8,A9].

combination(Num,[H|T],Combination):-
    subset(S,[H|T]),
    length(S,Num),
    Combination=S.

subset(S,L):-
    append(_L1,L2,L),
    append(S,_L3,L2).
    
all_diff(L) :- \+ (select(X,L,R), memberchk(X,R)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
OUTPUT:
G1 = [aldo, beat],
G2 = [carla, david, evi],
G3 = [flip, gary, hugo, ida]
G1 = [aldo, beat],
G2 = [gary, hugo, ida],
G3 = [carla, david, evi, flip]
. . .
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

group3([H|T],G1,G2,G3):-
    combination(9,[H|T],Combination),
    g(Combination,2,G1,Rest1),
    g(Rest1,3,G2,Rest2),
    g(Rest2,4,G3,_).

g(L,0,[],L):-!.
g([H|T],Counter,[H|L],Rest):-
    Counter1 is Counter-1,
    g(T,Counter1,L,Rest).

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
?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
OUTPUT:
G1 = [aldo, beat],
G2 = [carla, david, evi],
G3 = [flip, gary, ida, hugo]

G1 = [aldo, beat],
G2 = [carla, david, evi],
G3 = [flip, hugo, gary, ida]

G1 = [aldo, beat],
G2 = [carla, david, evi],
G3 = [flip, hugo, ida, gary]
...

*/
