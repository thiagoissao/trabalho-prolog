program :-
    open('pacientes.txt', read, X),
    open('paciente_reserva.txt', write, Y),
    current_input(Stream1),
    set_input(X),
    current_output(Stream2),
    set_output(Y),
    get_char(Char),
    le_escreve(Char),
    close(X),
    close(Y),
    set_input(Stream1),
    set_output(Stream2).

le_escreve(X) :-
    X == end_of_file, !.

le_escreve(X) :-
    \+(X=end_of_file),
    put_char(X),
    get_char(Char),
    le_escreve(Char).


find_paciente(Paciente) :-
    read_pacientes(Pacientes),
    member(Paciente, Pacientes).

read_pacientes(Pacientes) :-
    open('pacientes.txt', read, Y),
    read_file(Y, Pacientes),
    close(Y).

read_file(X, []) :-
    at_end_of_stream(X), !.

read_file(X, [P | Pacientes]) :-
    !, read(X, P),
    read_file(X, Pacientes).

