:- use_module(library(plunit)).

:- begin_tests(count_sintomas).

test(t0) :- count_sintomas([],[], 0).
test(t1) :- count_sintomas([1], [1], 1).
test(t2) :- count_sintomas([1], [1,2], 1).
test(t3) :- count_sintomas([1,2,3], [1,2,3], 3).
test(t4) :- count_sintomas([1,2,3,4, 10], [1,2,3,4,5,6,7,8], 4).
test(t11) :- count_sintomas([10,11,12,13], [1,2,3,4], 0).

:- end_tests(count_sintomas).

:- begin_tests(probabilidade).

test(t5) :- probabilidade(2,4, 0.5).
test(t6) :- probabilidade(4,4, 1).

:- end_tests(probabilidade).

:- begin_tests(get_probabilidade_by_sintomas).

test(t7) :- get_probabilidade_by_sintomas([1,2,3,4], [1,2,3,4,5,6,7,8], 0.5).
test(t8) :- get_probabilidade_by_sintomas([1,2,3], [1,2,3], 1).
test(t9) :- get_probabilidade_by_sintomas(['náusea'], ['náusea'], 1).
test(t9) :- get_probabilidade_by_sintomas(['náusea', 'dor no braço'], ['náusea', 'dor no braço'], 1).

:- end_tests(get_probabilidade_by_sintomas).

count_sintomas([], _, 0).

count_sintomas([SPX | SP], SD, N) :-
    count_sintomas(SP, SD, T),
    (
        member(SPX, SD) -> N is T + 1 ; N is T
    ).

probabilidade(Numerador, Denominador, Resultado) :-
    Resultado is Numerador / Denominador; true.

get_probabilidade_by_sintomas(SP, SD, P) :-
    count_sintomas(SP, SD, N),
    length(SD, L),
    P is N / L.
