/*
Determine whether a given integer number is prime.
Example:
?- is_prime(7).
Yes
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

prime(Number):-
    (((Number=0);(Number=1);(Number=2))->   
    write('Prime'),!).
prime(Number):-
    Number2 is Number-1,
    check_factors(_Counter,Number,Number2,L),
    sum(L,S1),
    (   S1>0 ->  
        write('Not Prime'),!;
        S1=0 ->  
        write('Prime'),!).
    
check_factors(_,_,2,[]).
check_factors(Counter,Number,Number2,[Counter|L]):-
      0 is Number mod Number2,
      Number3 is Number2-1,
      Counter is 1+0,
    check_factors(Counter,Number,Number3,L).
check_factors(Counter,Number,Number2,L):-
     \+( 0 is Number mod Number2),
      Number3 is Number2-1,
      Counter is 1+0,
    check_factors(Counter,Number,Number3,L).

sum([],0).
sum([H|T],Sum):-
    sum(T,Sum1),
    Sum is Sum1+H.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-prime(0).
OUTPUT:
Prime
1true

?-prime(79).
OUTPUT:
Prime
1true

?-prime(407).
OUTPUT:-
Not Prime
1true
*/
