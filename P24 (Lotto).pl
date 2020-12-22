/*
Lotto: Draw N different random numbers from the set 1..M.
The selected numbers shall be put into a result list.
Example:
?- rnd_select(6,49,L).
L = [23,1,17,33,21,37]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

random_select(0,_,[]):-!.
random_select(List_Size,Number,[Random|List]):-
    random(1,Number,Random),
    List_Size1 is List_Size-1,
    random_select(List_Size1,Number,List).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-random_select(6,49,Random).
OUTPUT:
Random = [31, 36, 12, 24, 3, 28]

?-random_select(6,49,Random).
OUTPUT:
Random = [2, 37, 8, 24, 44, 30]

?-random_select(4,15,Random).
OUTPUT:
Random = [2, 9, 10, 8]

?-random_select(8,10,Random).
OUTPUT:
Random = [2, 2, 4, 1, 5, 9, 2, 3]

*/
