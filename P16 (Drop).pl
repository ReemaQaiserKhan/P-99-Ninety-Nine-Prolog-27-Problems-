/*
Drop every N'th element from a list.
Example:
?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
X = [a,b,d,e,g,h,k]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

drop([H|T],Num,DList):-
    d1([H|T],Num,1,DList),!.

d1([],_,_,[]).
d1([H|T],Num,Counter,[H|List]):-
    \+(0 is Counter mod Num),
    Counter1 is Counter + 1,
    d1(T,Num,Counter1,List).
d1([_H|T],Num,Counter,List):-
    Counter1 is Counter + 1,
    d1(T,Num,Counter1,List).
    
 % drop([a,b,c,d,e,f,g,h,i],5,DroppedList).
 % DroppedList = [a, b, c, d, f, g, h, i]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
drop([H|T],P,X):-
    element_at(E,[H|T],P),
    modify(E,[H|T],X),!.
element_at(X,[X|_],1).
element_at(X,[_|L],K):-
    K>1,
    K1 is K-1,
    element_at(X,L,K1).

modify(_,[],[]).
modify(E,[H|T],[H|Z]):-
    E\=H,
    modify(E,T,Z).
modify(E,[_|T],Z):-
    modify(E,T,Z).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
drop([H|T],Counter,Dropped):-
    drop1([H|T],Counter,Dropped1),
    flatten1(Dropped1,Dropped).

drop1([],_,[]).
drop1([X],_,[X]).
drop1([H|T],Counter,[W|K]):-
    drop2([H|T],Counter,L,Rest),
    removeLastElement(L,W),
    drop1(Rest,Counter,K).

drop2(L,0,[],L).
drop2([H|T],Counter,[H|L],Rest):-
    Counter1 is Counter-1,
    drop2(T,Counter1,L,Rest).

removeLastElement(L1,L2):-
    append(L2,[_],L1).

flatten1([],[]):-!.
flatten1([L|Ls],FlatL):-
    !,
    flatten1(L,NewL),
    flatten1(Ls,NewLs),
    append(NewL,NewLs,FlatL).
flatten1(L,[L]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-drop([a,d,c,s,e,g,k],2,Dropped).
OUTPUT:
Dropped = [a, c, e, k]
false

?-drop([a,d,c,s,e,g,k],3,Dropped).
OUTPUT:
Dropped = [a, d, s, e, k]
false

?-drop([a,b,c,d,e,f,g,h,i,k],3,Dropped).
OUTPUT:
Dropped = [a, b, d, e, g, h, k]
false
*/
