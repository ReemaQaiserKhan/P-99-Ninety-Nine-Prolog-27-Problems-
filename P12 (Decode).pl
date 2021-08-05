/*
Decode a run-length encoded list.
Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

decode([H|T],Decoded):-
    decode1([H|T],DList),
    flatten(DList,Decoded).

decode1([],[]).
decode1([H|T],[Decode|List]):-
    H=[Counter,A],
    d1(A,Counter,Decode),
    decode1(T,List).

d1(_,0,[]):-!.
d1(H,Counter,[H|List]):-
    Counter1 is Counter-1,
    d1(H,Counter1,List).

flatten1([],[]):-!.
flatten1([L|Ls],FlatL):-
    !,
    flatten1(L,NewL),
    flatten1(Ls,NewLs),
    append(NewL,NewLs,FlatL).
flatten1(L,[L]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
decode([H|T],Decoded):-
    decode1([H|T],Decoded1),
    flatten1(Decoded1,Decoded).

decode1([],[]).
decode1([H|T],[W|L]):-
    (   \+is_list(H) ->  
        W=H,
        decode1(T,L);
        is_list(H) ->  
        H=[Counter,Element],
        decode2(Counter,Element,W),
        decode1(T,L)).

decode2(0,_,[]):-!.
decode2(Counter,Element,[Element|L]):-
    Counter1 is Counter-1,
    decode2(Counter1,Element,L).

flatten1([],[]):-!.
flatten1([L|Ls],FlatL):-
    !,
    flatten1(L,NewL),
    flatten1(Ls,NewLs),
    append(NewL,NewLs,FlatL).
flatten1(L,[L]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-decode([[4,a],k,[2,b]],Decoded).
OUTPUT:
Decoded = [a, a, a, a, k, b, b]

?-decode([[4,a],b,[2,c],[2,a],d,[4,e]],Decoded).
OUTPUT:
Decoded = [a, a, a, a, b, c, c, a, a, d, e, e, e, e]

?-decode([[5,w],[2,n],[6,q],r,[2,p]],Decoded).
OUTPUT:
Decoded = [w, w, w, w, w, n, n, q, q, q, q, q, q, r, p, p]
*/
