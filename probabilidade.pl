:- use_module(library(plunit)).

:- begin_tests(count_sintomas).

test(t0) :- count_sintomas([],[], 0).
test(t1) :- count_sintomas([1], [1], 1).
test(t2) :- count_sintomas([1], [1,2], 1).
test(t3) :- count_sintomas([1,2,3], [1,2,3], 3).
test(t4) :- count_sintomas([1,2,3,4], [1,2,3,4,5,6,7,8], 4).

:- end_tests(count_sintomas).

:- begin_tests(probabilidade).

test(t5) :- probabilidade(2,4, 0.5).
test(t6) :- probabilidade(4,4, 1).

:- end_tests(probabilidade).

count_sintomas([], _, 0).

count_sintomas([SPX | SP], SD, N) :-
    count_sintomas(SP, SD, T),
    member(SPX, SD),
    N is T + 1.

probabilidade(Numerador, Denominador, Resultado) :-
    Resultado is Numerador / Denominador.
