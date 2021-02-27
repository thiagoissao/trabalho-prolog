:- use_module(library(plunit)).
:- use_module(library(lists)).

sintoma('agressão').
sintoma('adormecimento no rosto').
sintoma('ansiedade').
sintoma('apatia').
sintoma('artrite').
sintoma('boca seca').
sintoma('calafrios').
sintoma('coração acelerado').
sintoma('dor de cabeça').
sintoma('dor muscular').
sintoma('dor no braço').
sintoma('dor no peito').
sintoma('dor nas costas').
sintoma('fadiga').
sintoma('falta de ar').
sintoma('falta de motivação').
sintoma('febre alta').
sintoma('febre baixa').
sintoma('fome constante').
sintoma('formigamento').
sintoma('grito').
sintoma('insegurança').
sintoma('insônia').
sintoma('medo').
sintoma('náusea').
sintoma('visao embaçada').
sintoma('perda de peso').
sintoma('perda de visão').
sintoma('pessimismo').
sintoma('pressão alta').
sintoma('sede').
sintoma('suor excessivo').
sintoma('tontura').
sintoma('tosse seca').
sintoma('tosse com catarro').
sintoma('vômito').

doenca('ansiedade', A) :-
    member('fadiga', A),
    member('suor excessivo', A),
    member('náusea', A),
    member('coração acelerado', A).

doenca('asma', A) :-
    member('ansiedade', A),
    member('tosse seca', A),
    member('dor no peito', A).

doenca('autismo', A) :-
    member('agressão', A),
    member('grito', A),
    member('apatia', A).

doenca('avc', A) :-
   member('dor de cabeça', A),
   member('adormecimento no rosto', A),
   member('tontura', A),
   member('perda de visão', A).

doenca('depressão', A) :-
    member('ansiedade', A),
    member('apatia', A),
    member('insônia', A),
    member('fadiga', A),
    member('medo', A),
    member('insegurança', A).

doenca('diabetes', A) :-
   member('fome constante', A),
   member('formigamento', A),
   member('perda de peso', A ),
   member('sede', A).

doenca('hipertensão arterial', A) :-
    member('dor de cabeça', A),
    member('dor no peito', A),
    member('dor no braço', A),
    member('tontura', A).

doenca('meningite', A) :-
    member('dor de cabeça', A),
    member('cansaço', A),
    member('febre alta', A),
    member('náusea', A).

doenca('obesidade', A) :-
    member('artrite', A),
    member('dor muscular', A),
    member('pressão alta', A),
    member('falta de ar', A).

doenca('pneumonia', A) :-
    member('tosse seca', A),
    member('tosse com catarro', A),
    member('falta de ar', A),
    member('febre', A),
    member('dor no peito', A),
    member('dor de cabeça', A).

:- begin_tests(doenca).

test(ansiedade) :- doenca('ansiedade', ['fadiga', 'suor excessivo', 'náusea', 'coração acelerado']).
test(asma) :- doenca('asma', ['ansiedade', 'tosse seca', 'dor no peito']).
test(autismo) :- doenca('autismo', ['agressão', 'grito', 'apatia']).
test(avc) :- doenca('avc', ['dor de cabeça', 'adormecimento no rosto', 'tontura', 'perda de visão']).
test(depressao) :- doenca('depressão', ['ansiedade', 'apatia', 'insônia', 'fadiga', 'medo', 'insegurança' ]).
test(diabetes) :- doenca('diabetes', ['fome constante', 'formigamento', 'perda de peso', 'sede']).
test(hipertensaoArterial) :- doenca('hipertensão arterial', ['dor de cabeça', 'dor no peito', 'dor no braço', 'tontura']).
test(meningite) :- doenca('meningite', ['cansaço', 'dor de cabeça', 'febre alta', 'náusea']).
test(obesidade) :- doenca('obesidade', ['artrite', 'dor muscular', 'pressão alta', 'falta de ar']).
test(pneumonia) :- doenca('pneumonia', ['tosse seca', 'tosse com catarro', 'falta de ar', 'febre', 'dor no peito', 'dor de cabeça']).

:- end_tests(doenca).
