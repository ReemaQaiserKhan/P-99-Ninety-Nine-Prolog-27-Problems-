/*
Find out whether a list is a palindrome.
A palindrome can be read forward or backward; e.g. [x,a,m,a,x].
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

check_palindrome([H|T]):-
    reverse1([H|T],Reverse,[]),
    [H|T]=Reverse.
    
reverse1([],Z,Z).
reverse1([H|T],Z,Acc):-
    reverse1(T,Z,[H|Acc]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-check_palindrome([l,o,l]).
OUTPUT:
1true

?-check_palindrome([r,a,d,a,r]).
OUTPUT:
1true

?-check_palindrome([r,o,t,a,t,o,r]).
OUTPUT:
1true

?-check_palindrome([a,_,s,a,n,t,a,_,a,t,_,n,a,s,a]).
OUTPUT:
false

?-check_palindrome([a,s,a,n,t,a,a,t,n,a,s,a]).
OUTPUT:
1true
*/
