% Define the capacities of the jugs
capacity(jug1, 5).
capacity(jug2, 3).

% Define the initial state
initial_state(state(0, 0)).

% Define the goal state
goal_state(state(4, _)).

% Define the actions
action(fill(jug1), state(_, Y), state(5, Y)) :-
    capacity(jug1, 5).
action(fill(jug2), state(X, _), state(X, 3)) :-
    capacity(jug2, 3).
action(empty(jug1), state(_, Y), state(0, Y)).
action(empty(jug2), state(X, _), state(X, 0)).
action(pour(jug1, jug2), state(X, Y), state(X1, Y1)) :-
    capacity(jug2, C2),
    Sum is X + Y,
    Sum =< C2,
    X1 is 0,
    Y1 is Sum.
action(pour(jug1, jug2), state(X, Y), state(X1, Y1)) :-
    capacity(jug2, C2),
    Sum is X + Y,
    Sum > C2,
    X1 is Sum - C2,
    Y1 is C2.
action(pour(jug2, jug1), state(X, Y), state(X1, Y1)) :-
    capacity(jug1, C1),
    Sum is X + Y,
    Sum =< C1,
    X1 is Sum,
    Y1 is 0.
action(pour(jug2, jug1), state(X, Y), state(X1, Y1)) :-
    capacity(jug1, C1),
    Sum is X + Y,
    Sum > C1,
    X1 is C1,
    Y1 is Sum - C1.

% Define the solve predicate
solve(State, _, []) :-
    goal_state(State).
solve(State, Visited, [Action|Actions]) :-
    action(Action, State, NewState),
    not(member(NewState, Visited)),
    solve(NewState, [NewState|Visited], Actions).
