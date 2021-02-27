:- use_module(library(plunit)).
:- use_module(library(lists)).
:- consult(probabilidade).

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

doenca('ansiedade', ['fadiga', 'suor excessivo', 'náusea', 'coração acelerado']).

doenca('asma', ['ansiedade', 'tosse seca', 'dor no peito']).

doenca('autismo', ['agressão', 'grito', 'apatia']).

doenca('avc', ['dor de cabeça', 'adormecimento no rosto', 'tontura', 'perda de visão']).

doenca('depressão', ['ansiedade', 'apatia', 'insônia', 'fadiga', 'medo', 'insegurança']).

doenca('diabetes', ['fome constante', 'formigamento', 'perda de peso', 'sede']).

doenca('hipertensão arterial', ['dor de cabeça', 'dor no peito', 'dor no braço', 'tontura']).

doenca('meningite', ['dor de cabeça', 'cansaço','febre alta', 'náusea']).

doenca('obesidade', ['artrite', 'dor muscular', 'pressão alta', 'falta de ar']).

doenca('pneumonia', ['tosse seca', 'tosse com catarro', 'falta de ar', 'febre', 'dor no peito', 'dor de cabeça']).

home :- write('\n ----Escolha alguma opção---- \n'),
        write('0. Consultar paciente\n'),
        write('1. Inserir Paciente \n'),
        write('2. Alterar Paciente \n'),
        write('3. Deletar Paciente \n'),
        write('100. Sair\n'),
        read(Op),
        execute(Op).

execute(Op) :- Op == 0, write('Consultando...\n'), consultar, home;
               Op == 1, write('Inserindo...\n'), inserir,  home;
               Op == 2, write('Alterando...\n'), alterar, home;
               Op == 3, write('Deletando...\n'), deletar, home;
               Op == 100, true.

get_nome(Nome) :- write('Digite o nome do paciente'), read(Nome).

ler_arquivo :-
    open('pacientes.txt', read, F),
    ler_pacientes(F, Pacientes),
    close(F),
    write(Pacientes), nl.

ler_pacientes(F, []) :- at_end_of_stream(F).
ler_pacientes(F, [X | L]) :-
              \+ at_end_of_stream(F),
              read(F, X),
              ler_pacientes(F, L).

consultar :-
    get_nome(Nome),
    write(Nome).

inserir :- get_nome(Nome), write(Nome).

alterar :- get_nome(Nome), write(Nome).

deletar :- get_nome(Nome), write(Nome).

:- begin_tests(doenca).

test(ansiedade) :- doenca('ansiedade', ['fadiga', 'suor excessivo', 'náusea', 'coração acelerado']).
test(asma) :- doenca('asma', ['ansiedade', 'tosse seca', 'dor no peito']).
test(autismo) :- doenca('autismo', ['agressão', 'grito', 'apatia']).
test(avc) :- doenca('avc', ['dor de cabeça', 'adormecimento no rosto', 'tontura', 'perda de visão']).
test(depressao) :- doenca('depressão', ['ansiedade', 'apatia', 'insônia', 'fadiga', 'medo', 'insegurança' ]).
test(diabetes) :- doenca('diabetes', ['fome constante', 'formigamento', 'perda de peso', 'sede']).
test(hipertensaoArterial) :- doenca('hipertensão arterial', ['dor de cabeça', 'dor no peito', 'dor no braço', 'tontura']).
test(meningite) :- doenca('meningite', ['dor de cabeça', 'cansaço', 'febre alta', 'náusea']).
test(obesidade) :- doenca('obesidade', ['artrite', 'dor muscular', 'pressão alta', 'falta de ar']).
test(pneumonia) :- doenca('pneumonia', ['tosse seca', 'tosse com catarro', 'falta de ar', 'febre', 'dor no peito', 'dor de cabeça']).

:- end_tests(doenca).
