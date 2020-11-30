%Дан список положительных чисел посроить список положительных
%простых делителей числа без повторений

%Нужно уметь читать список и записывать в него
rlist([],0):- !.
rlist([Text|List],N):- read(Text), N1 is N-1, rlist(List,N1).

wlist([]):-!. 
wlist([Text|List]):- write(Text), write(" "), wlist(List).


