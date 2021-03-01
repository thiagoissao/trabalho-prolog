find_paciente(Paciente) :-
    read_pacientes(Pacientes),
    member(Paciente, Pacientes).

read_pacientes(Pacientes) :-
    open('pacientes.txt', read, Y),
    read_file(Y, PacientesWithEOF),
    delete(PacientesWithEOF, end_of_file, Pacientes),
    close(Y).

read_file(X, []) :-
    at_end_of_stream(X), !.

read_file(X, [P | Pacientes]) :-
    !, read(X, P),
    read_file(X, Pacientes).


write_file([]).

write_file([P | Pacientes]) :-
    string_concat(P, '.', NewP),
    write(NewP),
    nl,
    write_file(Pacientes).


write_pacientes(Pacientes) :-
    open('pacientes.txt', write, X),
    current_output(Stream),
    set_output(X),
    write_file(Pacientes),
    close(X),
    set_output(Stream).
