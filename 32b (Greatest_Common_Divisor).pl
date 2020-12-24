/*
Determine the greatest common divisor of two positive integer numbers.
Use Euclid's algorithm.
Define gcd as an arithmetic function; so you can use it like this:
?- G is gcd(36,63).
G = 9
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gcd(A,B):-
    A=0, 
    write('G ='), write(' '), write(B),!.
gcd(A,B):-
    C is B mod A,
    gcd(C,A).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execte the Program:-
?-gcd(10,15).
OUTPUT:
G = 5
1true

?-gcd(36,63).
OUTPUT:
G = 9
1true

?-gcd(31,2).
OUTPUT:
G = 1
1true

*/
