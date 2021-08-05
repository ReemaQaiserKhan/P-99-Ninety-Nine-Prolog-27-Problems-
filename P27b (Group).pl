/*
Group the elements of a set into disjoint subsets.
b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups.

Example:
?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
Gs = [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
...
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
group3([H|T],Numbers,Gs):-
    Numbers=[Num1,Num2,Num3],
    combination(Num1,[H|T],C1),
    combination(Num2,[H|T],C2),
    combination(Num3,[H|T],C3),
    append(C1,C2,K1),
    append(K1,C3,K2),
    all_diff(K2),
    Gs=[C1,C2,C3].

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
?-group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
OUTPUT:
Gs = [[aldo, beat], [carla, david], [evi, flip, gary, hugo, ida]]
Gs = [[aldo, beat], [hugo, ida], [carla, david, evi, flip, gary]]
Gs = [[carla, david], [aldo, beat], [evi, flip, gary, hugo, ida]]
Gs = [[flip, gary], [hugo, ida], [aldo, beat, carla, david, evi]]
Gs = [[hugo, ida], [aldo, beat], [carla, david, evi, flip, gary]]
Gs = [[hugo, ida], [flip, gary], [aldo, beat, carla, david, evi]]
. . .
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
group([H|T],[S1,S2,S3],Gs):-
    combination(9,[H|T],Combination),
    g(Combination,S1,G1,Rest1),
    g(Rest1,S2,G2,Rest2),
    g(Rest2,S3,G3,_),
    Gs=[G1,G2,G3].

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
?-group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
OUTPUT:
Gs = [[aldo, beat], [carla, david], [evi, flip, gary, hugo, ida]]                                        1.140 seconds cpu time
Gs = [[aldo, beat], [carla, david], [evi, flip, gary, ida, hugo]]
Gs = [[aldo, beat], [carla, david], [evi, flip, hugo, gary, ida]]
...

?-group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[3,3,3],Gs).
OUTPUT:
Gs = [[aldo, beat, carla], [david, evi, flip], [gary, hugo, ida]]                                        1.139 seconds cpu time
Gs = [[aldo, beat, carla], [david, evi, flip], [gary, ida, hugo]]
Gs = [[aldo, beat, carla], [david, evi, flip], [hugo, gary, ida]]
...

?-group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,3,4],Gs).
OUTPUT:
Gs = [[aldo, beat], [carla, david, evi], [flip, gary, hugo, ida]]                                        1.201 seconds cpu time
Gs = [[aldo, beat], [carla, david, evi], [flip, gary, ida, hugo]]
Gs = [[aldo, beat], [carla, david, evi], [flip, hugo, gary, ida]]
...

*/
