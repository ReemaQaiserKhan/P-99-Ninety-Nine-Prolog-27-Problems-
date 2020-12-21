/*
Drop every N'th element from a list.
Example:
?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
X = [a,b,d,e,g,h,k]
*/
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
