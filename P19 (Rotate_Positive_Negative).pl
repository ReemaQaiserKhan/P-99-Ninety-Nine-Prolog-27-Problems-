/*
Rotate a list N places to the left.
Examples:
?- rotate([a,b,c,d,e,f,g,h],3,X).
X = [d,e,f,g,h,a,b,c]

?- rotate([a,b,c,d,e,f,g,h],-2,X).
X = [g,h,a,b,c,d,e,f]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rotate([H|T],Counter,Rotated):-
    (   Counter>0 ->  
        rotate_positive([H|T],Counter,Rotated1),
        last_Element(Rotated,Rotated1),!;
        Counter<0 ->  
        rotate_negative([H|T],Counter,Rotated1),
        last_Element(Rotated,Rotated1),!).

rotate_positive(_,0,[]):-!.
rotate_positive([H|T],Counter,[W|L]):-
        append(T,[H],W),
    Counter1 is Counter-1,
    rotate_positive(W,Counter1,L).

rotate_negative(_,0,[]):-!.
rotate_negative([H|T],Counter,[W|L]):-
    last_Element(Last,[H|T]),
    remove_Last_Element([H|T],Removed),
    append([Last],Removed,W),
    Counter1 is Counter+1,
    rotate_negative(W,Counter1,L).

last_Element(X,[X]).
last_Element(X,[_|L]):-
    last_Element(X,L).

remove_Last_Element(L1,L2):-
    append(L2,[_],L1).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-rotate([a,b,c,d,e,f,g,h],3,Rotated).
OUTPUT:
Rotated = [d, e, f, g, h, a, b, c]

?-rotate([a,b,c,d,e,f,g,h],-2,Rotated).
OUTPUT:
Rotated = [g, h, a, b, c, d, e, f]

?-rotate([a,b,c,d,e,f,g,h],-5,Rotated).
OUTPUT:
Rotated = [d, e, f, g, h, a, b, c]

?-rotate([a,b,c,d,e,f,g,h],5,Rotated).
OUTPUT:
Rotated = [f, g, h, a, b, c, d, e]

*/
