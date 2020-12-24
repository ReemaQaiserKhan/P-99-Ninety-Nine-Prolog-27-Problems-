/* Prolog Approach
Goldbach's conjecture.
Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23.
It is one of the most famous facts in number theory that has not been proved to be correct in the general case. 
It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system). 
Write a predicate to find the two prime numbers that sum up to a given even integer.
Example:
?- goldbach(28, L).
L = [5,23]

Note: A clpfd Prolog code is also available on https://github.com/ReemaQaiserKhan/P-99-Ninety-Nine-Prolog-Problems/blob/main/P40%20(Goldbach_Conjecture%20_clpfd).pl
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

goldbach(Number,Goldbach):-
    counterNumber(Number,Goldbach1),
    check_goldbach(Goldbach1,Number,[G1|_]),
    G1=[A,B], %reversing because of question requirement [A,B] to [B,A]
    Goldbach=[B,A],!.

counterNumber(-1,[]).
counterNumber(Counter,[Counter|List]):-
    prime(Counter,R1),
    R1=1,
    Counter1 is Counter-1,
    counterNumber(Counter1,List).
counterNumber(Counter,List):-
    prime(Counter,R1),
    R1\=1,
    Counter1 is Counter-1,
    counterNumber(Counter1,List).

check_goldbach([],_,[]):-!.
check_goldbach([H1|T],Number,[W|List]):-
    check_goldbach1(H1,T,Number,W),
    check_goldbach(T,Number,List).

check_goldbach1(_,[],_,[]):-!.
check_goldbach1(H1,[H2|T2],Number,[H1,H2|List1]):-
    Number is H1+H2,
    check_goldbach1(H1,T2,Number,List1).
check_goldbach1(H1,[H2|T2],Number,List1):-
    H1+H2\=Number,
    check_goldbach1(H1,T2,Number,List1).

prime(Number,Result):-
    (((Number=0);(Number=1);(Number=2))->   
    Result=1,!).
prime(Number,Result):-
    Number2 is Number-1,
    check_factors(_Counter,Number,Number2,L),
    sum(L,S1),
    (   S1>0 ->  
        Result=0,!;
        S1=0 ->  
        Result=1,!).
    
check_factors(_,_,1,[]).
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
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /* Execute the Program:-
 ?-goldbach(28,Goldbach).
 OUTPUT:
 Goldbach = [5, 23]
 
 ?-goldbach(244,Goldbach).
 OUTPUT:
 Goldbach = [3, 241]
 
 ?-goldbach(23,Goldbach).
 OUTPUT:
 Goldbach = [23, 0]
 
 ?-goldbach(5005,Goldbach).
 OUTPUT:
 Goldbach = [2, 5003]                                                                21.836 seconds cpu time 
 
 */
 
 
 
 
