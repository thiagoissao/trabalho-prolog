:- use_module(library(plunit)).
:- use_module(library(lists)).
:- consult(probabilidade).
:- consult(file_manager).


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
doenca('pneumonia', ['tosse seca', 'tosse com catarro', 'falta de ar', 'febre alta', 'dor no peito', 'dor de cabeça']).


show_doencas_e_probabilidades(Sintomas) :-
    doenca('ansiedade', Ansiedade),
    doenca('asma', Asma),
    doenca('autismo', Autismo),
    doenca('avc', Avc),
    doenca('depressão', Depressao),
    doenca('diabetes', Diabetes),
    doenca('hipertensão arterial', HipertensaoArterial),
    doenca('meningite', Meningite),
    doenca('obesidade', Obesidade),
    doenca('pneumonia', Pneumonia),
    get_probabilidade_by_sintomas(Sintomas, Ansiedade, AnsiedadeProb),
    get_probabilidade_by_sintomas(Sintomas, Asma, AsmaProb),
    get_probabilidade_by_sintomas(Sintomas, Autismo, AutismoProb),
    get_probabilidade_by_sintomas(Sintomas, Avc, AvcProb),
    get_probabilidade_by_sintomas(Sintomas, Depressao, DepressaoProb),
    get_probabilidade_by_sintomas(Sintomas, Diabetes, DiabetesProb),
    get_probabilidade_by_sintomas(Sintomas, HipertensaoArterial, HipertensaoArterialProb),
    get_probabilidade_by_sintomas(Sintomas, Meningite, MeningiteProb),
    get_probabilidade_by_sintomas(Sintomas, Obesidade, ObesidadeProb),
    get_probabilidade_by_sintomas(Sintomas, Pneumonia, PneumoniaProb),
    nl, nl, write('O resultado do protótipo é apenas informativo e que o paciente deve consultar um médico para obter um diagnóstico correto e preciso'), nl,
    nl, nl,
    write(Sintomas), nl,
    write('Ansiedade: '), write(AnsiedadeProb), nl,
    write('Asma: '), write(AsmaProb), nl,
    write('Autismo: '), write(AutismoProb), nl,
    write('Avc: '), write(AvcProb), nl,
    write('Depressão: '), write(DepressaoProb), nl,
    write('Diabetes: '), write(DiabetesProb), nl,
    write('Hipertensão Arterial: '), write(HipertensaoArterialProb), nl,
    write('Meningite: '), write(MeningiteProb), nl,
    write('Obesidade: '), write(ObesidadeProb), nl,
    write('Pneumonia: '), write(PneumoniaProb),
    nl, nl.


inserir_paciente([], X, [X]).

inserir_paciente([PX | Pacientes], P, [PX | L]) :-
    inserir_paciente(Pacientes, P, L).


home :- write('\n ----Escolha alguma opção---- \n'),
        write('0. Consultar paciente\n'),
        write('1. Inserir Paciente \n'),
        write('2. Alterar Paciente \n'),
        write('3. Deletar Paciente \n'),
        write('4. Diagnosticar Paciente \n'),
        write('5. Listar todos os Pacientes \n'),
        write('100. Sair\n'),
        read(Op),
        execute(Op).

execute(Op) :- Op == 0, write('Consultando...\n'), consultar, home;
               Op == 1, write('Inserindo...\n'), inserir,  home;
               Op == 2, write('Alterando...\n'), alterar, home;
               Op == 3, write('Deletando...\n'), deletar, home;
               Op == 4, write('Diagnosticando...\n'), diagnosticar, home;
               Op == 5, write('Listando todos os pacientes...\n'), listar_todos, home;
               Op == 100, true.

get_nome(Nome) :- write('Digite o nome do paciente'), read(Nome).

ler_sintomas(Sintomas, Entrada) :-
    write('Sintoma (Digite end. para parar) '),
    read(Sintoma),
    (
        Sintoma = end -> reverse(Sintomas, Entrada);
        ler_sintomas(Sintomas, [Sintoma | Entrada])
    ).


consultar :-
    get_nome(Nome),
    find_paciente(Nome), write('Paciente encontrado!'), nl;
    write('Não encontramos este paciente'), nl.

inserir :-
    get_nome(Nome),
    (   find_paciente(Nome) ->
        write('Já existe paciente com esse nome, ERRO!'),nl;
        read_pacientes(Pacientes),
        inserir_paciente(Pacientes, Nome, NewPacientes),
        nl,
        write('Pacientes'),
        nl,
        write(NewPacientes),
        nl,
        write_pacientes(NewPacientes)
    ).

alterar :-
    get_nome(Nome),
    (  find_paciente(Nome) ->
        write('Digite o novo nome para o paciente'),
        read(NewName),
        read_pacientes(Pacientes),
        delete(Pacientes, Nome, PacientesX),
        inserir_paciente(PacientesX, NewName, NewPacientes),
        nl,
        write('Paciente Atualizado!'),
        nl, write('Nova Listagem'),nl,
        write(NewPacientes),nl,nl,
        write_pacientes(NewPacientes);
        nl,write('Paciente não encontrado!'), nl, nl
    ).

deletar :-
    get_nome(Nome),
    (   find_paciente(Nome) ->
        read_pacientes(Pacientes),
        delete(Pacientes, Nome, NewPacientes),
        nl, write('Paciente Deletado!'), nl,
        write(NewPacientes), nl,
        write_pacientes(NewPacientes);
        nl,
        write('Paciente não encontrado, ERRO NA DELEÇÃO!'), nl
    ).

diagnosticar :-
    get_nome(Nome),
    (   find_paciente(Nome) ->
        ler_sintomas(Sintomas, []),
        show_doencas_e_probabilidades(Sintomas)
    ;
    write('Paciente não encontrado, adicione ele na base para fazer um diagnóstico'), nl
    ).

listar_todos :-
    read_pacientes(Pacientes),
    nl, write(Pacientes), nl.


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
