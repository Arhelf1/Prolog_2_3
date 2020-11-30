%Дан список положительных чисел посроить список положительных
%простых делителей числа без повторений

%Нужно уметь читать список и записывать в него
rlist([],0):- !.
rlist([Text|List],N):- read(Text), N1 is N-1, rlist(List,N1).

wlist([]):-!. 
wlist([Text|List]):- write(Text), write(" "), wlist(List).

%Теперь нужна проверка простоты числа
pr(X):- 0 =\= X mod 2,
pr(X,3).
pr(X,X) :- !. 
pr(2):- !.
pr(X,Y):- 0=\= X mod Y, Y1 is Y+2, pr(X,Y1).

main:-
	write("List length: "),read(N),
	write("List: "), rlist(L,N), 
	%Обработка списка тут будет
	write("[ "), wlist(L), write("]"),!.
	%Вместо L тут / будет обработанный список, а пока мы просто проверяем ввод и вывод
