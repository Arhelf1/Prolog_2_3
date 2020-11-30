%Дан список положительных чисел посроить список положительных
%простых делителей числа без повторений

%Нужно уметь читать список и записывать в него
rlist([],0):- !.
rlist([Text|List],N):- read(Text), N1 is N-1, rlist(List,N1).

wlist([]):-!. 
wlist([Text|List]):- write(Text), write(" "), wlist(List).

%Теперь нужна проверка простоты числа
pr(2):- !.
pr(X):- 0 =\= X mod 2, pr(X,3).
pr(X,X) :- !. 
pr(X,Y):- 0=\= X mod Y, Y1 is Y+2, pr(X,Y1).

createlist(X, Y, L):- createlist(X,Y,[], L).
createlist(1,_,[],[]):-!.
createlist(X,Y,[Text|List], [Text|List]):- Y>X.
createlist(X,Y,L1,L):- Nool is X mod Y, Nool ==0, pr(Y), append(L1, [Y], L2), Y1 is Y+1,
	createlist(X,Y1,L2,L).
createlist(X,Y,L1,L):- Y1 is Y+1, createlist(X,Y1,L1,L).

checkeleminlist(X,[X|_]):- !.
checkeleminlist(X,[_|List]):- checkeleminlist(X,List).

unite([], L, L):-!.
unite([X|List], L, Y):- checkeleminlist(X,L), !, unite(List,L, Y).
unite([X|List], L, [X|Y]):- unite(List, L, Y).

nonrepeat([X|List], Otvet):- nonrepeat([X|List], [], Otvet).
nonrepeat([], L, L):-!.
nonrepeat([X,List], Otvet1, L):- createlist(X,2, Otvet), unite(Otvet1,Otvet,Otvet2), 
	checkelemlist(List,Otvet2, L), !.

main:-
	write("List length: "),read(N),
	write("List: "), rlist(L,N), 
	%nonrepeat(L,Reasultat),
	write("[ "), wlist(L), write("]"),!.
	
