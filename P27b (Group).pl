/*
Group the elements of a set into disjoint subsets.
b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups.

Example:
?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
Gs = [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
...
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
