/*
Insert an element at a given position into a list.
Example:
?- insert_at(alfa,[a,b,c,d],2,L).
L = [a,alfa,b,c,d]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

insert_at(Element,[H|T],Position,InsertedList):-
    Position1 is Position-1,
    insert_at1([H|T],Position1,K,Rest),
    append(K,[Element],K1),
    append(K1, Rest,InsertedList).

insert_at1(L,0,[],L):-!.
insert_at1([H|T],Counter,[H|L],Rest):-
    Counter1 is Counter-1,
    insert_at1(T,Counter1,L,Rest).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-insert_at(alfa,[a,b,c,d,e,f,g,h,i,k],2,InsertedList).
OUTPUT:
InsertedList = [a, alfa, b, c, d, e, f, g, h, i, k]

?-insert_at(hope,[a,b,c,d],4,InsertedList).
OUTPUT:
InsertedList = [a, b, c, hope, d]

?-insert_at(cat,[1,5,2,a,b,c,d],4,InsertedList).
OUTPUT:
InsertedList = [1, 5, 2, cat, a, b, c, d]

?-insert_at(c,[1,5,2,a,b,c,d],4,InsertedList).
OUTPUT:
InsertedList = [1, 5, 2, c, a, b, c, d]

*/
