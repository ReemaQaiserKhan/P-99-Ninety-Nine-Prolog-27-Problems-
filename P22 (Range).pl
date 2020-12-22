/*
Create a list containing all integers within a given range.
Example:
?- range(4,9,L).
L = [4,5,6,7,8,9]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range(StartRange,EndRange,Range):-
    Counter is EndRange-StartRange+1,
    range1(StartRange,Counter,Range).

range1(_,0,[]):-!.
range1(StartRange,Counter,[StartRange|Range]):-
    StartRange1 is StartRange+1,
    Counter1 is Counter-1,
    range1(StartRange1,Counter1,Range).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-range(4,7,Range).
OUTPUT:
Range = [4, 5, 6, 7]

?-range(55,67,Range).
OUTPUT:
Range = [55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67]

?-range(10,15,Range).
OUTPUT:
Range = [10, 11, 12, 13, 14, 15]

*/
