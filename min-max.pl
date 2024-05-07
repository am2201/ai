% Define the game state
state([_, _, _, _, _, _, _, _, _]).

% Define the players
player(x).
player(o).

% Define the moves
move(state([_, B, C, D, E, F, G, H, I]), 1, state([x, B, C, D, E, F, G, H, I])) :- player(x).
move(state([A, _, C, D, E, F, G, H, I]), 2, state([A, x, C, D, E, F, G, H, I])) :- player(x).
move(state([A, B, _, D, E, F, G, H, I]), 3, state([A, B, x, D, E, F, G, H, I])) :- player(x).
move(state([A, B, C, _, E, F, G, H, I]), 4, state([A, B, C, x, E, F, G, H, I])) :- player(x).
move(state([A, B, C, D, _, F, G, H, I]), 5, state([A, B, C, D, x, F, G, H, I])) :- player(x).
move(state([A, B, C, D, E, _, G, H, I]), 6, state([A, B, C, D, E, x, G, H, I])) :- player(x).
move(state([A, B, C, D, E, F, _, H, I]), 7, state([A, B, C, D, E, F, x, H, I])) :- player(x).
move(state([A, B, C, D, E, F, G, _, I]), 8, state([A, B, C, D, E, F, G, x, I])) :- player(x).
move(state([A, B, C, D, E, F, G, H, _]), 9, state([A, B, C, D, E, F, G, H, x])) :- player(x).

move(state([_, B, C, D, E, F, G, H, I]), 1, state([o, B, C, D, E, F, G, H, I])) :- player(o).
move(state([A, _, C, D, E, F, G, H, I]), 2, state([A, o, C, D, E, F, G, H, I])) :- player(o).
move(state([A, B, _, D, E, F, G, H, I]), 3, state([A, B, o, D, E, F, G, H, I])) :- player(o).
move(state([A, B, C, _, E, F, G, H, I]), 4, state([A, B, C, o, E, F, G, H, I])) :- player(o).
move(state([A, B, C, D, _, F, G, H, I]), 5, state([A, B, C, D, o, F, G, H, I])) :- player(o).
move(state([A, B, C, D, E, _, G, H, I]), 6, state([A, B, C, D, E, o, G, H, I])) :- player(o).
move(state([A, B, C, D, E, F, _, H, I]), 7, state([A, B, C, D, E, F, o, H, I])) :- player(o).
move(state([A, B, C, D, E, F, G, _, I]), 8, state([A, B, C, D, E, F, G, o, I])) :- player(o).
move(state([A, B, C, D, E, F, G, H, _]), 9, state([A, B, C, D, E, F, G, H, o])) :- player(o).

% Define the win conditions
win(state([X, X, X, _, _, _, _, _, _]), X).
win(state([_, _, _, X, X, X, _, _, _]), X).
win(state([_, _, _, _, _, _, X, X, X]), X).
win(state([X, _, _, X, _, _, X, _, _]), X).
win(state([_, X, _, _, X, _, _, X, _]), X).
win(state([_, _, X, _, _, X, _, _, X]), X).
win(state([X, _, _, _, X, _, _, _, X]), X).
win(state([_, _, X, _, X, _, X, _, _]), X).

% Define the draw condition
draw(State) :-
    \+ win(State, x),
    \+ win(State, o),
    \+ move(State, _, _).

% Define the utility function
utility(state([A, B, C, D, E, F, G, H, I]), Value) :-
    (win(state([A, B, C, D, E, F, G, H, I]), x) -> Value = 1;
    win(state([A, B, C, D, E, F, G, H, I]), o) -> Value = -1;
    draw(state([A, B, C, D, E, F, G, H, I])) -> Value = 0).

% Define the minimax algorithm
minimax(State, Value) :-
    utility(State, Value).
minimax(State, Value) :-
    findall(NewState, move(State, _, NewState), NewStates),
    best(NewStates, Value).

best([State], Value) :-
    minimax(State, Value).
best([State|States], Value) :-
    minimax(State, V1),
    best(States, V2),
    (player(x) -> max(V1, V2, Value); min(V1, V2, Value)).
