/*
Calculate Euler's totient function phi(m).
Euler's so-called totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime to m.
Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.

?- Phi is totient_phi(10).
Phi = 4
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

totient_phi(Number):-
    R=1,
    rList(Number,R,RList),
    coprime_check(Number,RList,Coprime),
    writeln(Coprime),
    length(Coprime,Length),
    write('Phi = '),write(Length),!.
    
rList(Number,Number,[]).
rList(Number,R,[R|List]):-
      R<Number,
      R1 is R+1,
      rList(Number, R1,List).

coprime_check(_,[],[]):-!.
coprime_check(Number,[H|T],[H|W]):-
              coprime(Number,H),
    coprime_check(Number,T,W).
coprime_check(Number,[H|T],W):-
              \+coprime(Number,H),
    coprime_check(Number,T,W).

coprime(A,B):-
    gcd(A,B,G),
        G=1.
        %write('Yes').

gcd(A,B,G):-
    A=0,
    B=G,!.
gcd(A,B,G):-
    C is B mod A,
    gcd(C,A,G).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /* Execute the Program:-
 ?-totient_phi(10).
 OUTPUT:
 [1, 3, 7, 9]
 Phi = 4
 1true
 
 ?-totient_phi(18).
 OUTPUT:
 [1, 5, 7, 11, 13, 17]
 Phi = 6
 1true
 
 ?-totient_phi(19).
 OUTPUT:
 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
 Phi = 18
 1true
 
 ?-totient_phi(204).
 OUTPUT:
 [1, 5, 7, 11, 13, 19, 23, 25, 29, 31, 35, 37, 41, 43, 47, 49, 53, 55, 59, 61, 65, 67, 71, 73, 77, 79, 83, 89, 91, 95, 97, 101, 103, 107, 109, 113, 115, 121, 125, 127, 131, 133, 137, 139, 143, 145, 149, 151, 155, 157, 161, 163, 167, 169, 173, 175, 179, 181, 185, 191, 193, 197, 199, 203]
 Phi = 64
 1true
 
 */
 
 
