/* CLPFD Approach
Goldbach's conjecture.
Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23.
It is one of the most famous facts in number theory that has not been proved to be correct in the general case. 
It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system).
Write a predicate to find the two prime numbers that sum up to a given even integer.
Example:
?- goldbach(28, L).
L = [5,23]

Note: A simple Prolog code is also available on https://github.com/ReemaQaiserKhan/P-99-Ninety-Nine-Prolog-Problems/blob/main/P40%20(Goldbach_Conjecture%20_Prolog).pl
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(clpfd)).

goldbach(Number,L):-
    L=[A,B],L ins 0..sup,
    all_different(L),
    Number#>2,
    A+B#=Number,
    labeling([],L),
    prime(A,R1),prime(B,R2),
    R1#=1 #/\ R2#=1,!.

prime(Number,R):-  % R=1 means Prime and R=0 means Not Prime
    (((Number=0);(Number=1);(Number=2))->   
    R#=1,!).
prime(Number,R):-
    Number2#=Number-1,
    check_factors(_Counter,Number,Number2,L),
    sum(L,S1),
    (   S1#>0 ->  
        R#=0,!;
        S1#=0 ->  
        R#=1,!).
    
check_factors(_,_,1,[]).
check_factors(Counter,Number,Number2,[Counter|L]):-
      Number mod Number2#=0,
      Number2-1 #= Number3,
      Counter #= 1+0,
    check_factors(Counter,Number,Number3,L).
check_factors(Counter,Number,Number2,L):-
     \+(Number mod Number2#=0),
      Number2-1 #= Number3,
      Counter #= 1+0,
    check_factors(Counter,Number,Number3,L).

sum([],0).
sum([H|T],Sum):-
    sum(T,Sum1),
    Sum1+H#= Sum.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-goldbach(244,Goldbach).
OUTPUT:
Goldbach = [3, 241]

?-goldbach(28,Goldbach).
OUTPUT:
Goldbach = [5, 23]

?-goldbach(10,Goldbach).
OUTPUT:
Goldbach = [3, 7]

?-goldbach(5005,Goldbach).
OUTPUT:
Goldbach = [2, 5003]

*/
