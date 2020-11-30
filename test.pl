%Дан список положительных чисел посроить список положительных
%простых делителей числа без повторений

%Нужно уметь читать список и записывать в него
rlist([],0) :-!.
rlist([Text|L],N):- read(Text), N1 is N-1, rlist(L,N1).

wlist([]):-!.
wlist([Text|List]):- write(Text), write("  "), wlist(List).

%Теперь нужна проверка простоты числа
pr(2):-!.
pr(X):- 0 =\= X mod 2, pr(X,3).
pr(X,X):- !.
pr(X,Y):- 0 =\= X mod Y, Y1 is Y+2,	pr(X,Y1).

%Создаем списки простых делителей
createlist(X,Y,L):- createlist(X,Y,[],L).
createlist(1,_,[],[]) :-!.
createlist(X,Y,[Text|List],[Text|List]):- Y>X.
createlist(X,Y,L1,L) :- Nool is X mod Y, Nool == 0, pr(Y),
  append(L1,[Y],L2), Y1 is Y+1, createlist(X,Y1,L2,L).
createlist(X,Y,L1,L):- Y1 is Y+1, createlist(X,Y1,L1,L).

/Принадлежит ли элемент списку
member(Text,[Text|_]) :- !.
member(Text,[_|List]) :- member(Text,List).

/Формируем список без повторений
nonrepeat([Text|List], ResultL) :- nonrepeat([Text|List], [], ResultL).
nonrepeat([], L, L) :- !.
nonrepeat([Text|List], ResultL1, L) :- createlist(Text,2,ResultL), union(ResultL1, ResultL, ResultL2),
  nonrepeat(List,ResultL2, L), !.

main :-
	write("List length: "),read(N),
	write("List: "), rlist(L,N), 
	nonrepeat(L,ResultL),
	write("[ "), wlist(ResultL), write("]"),!.











