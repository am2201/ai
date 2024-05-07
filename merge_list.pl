% Base case: If both lists are empty, the merged list is also empty.
merge([], [], []).

% If L1 is empty, L3 is simply L2.
merge([], L2, L2).

% If L2 is empty, L3 is simply L1.
merge(L1, [], L1).

% Merge the heads of L1 and L2 into L3.
merge([X | Rest1], [Y | Rest2], [X | Rest3]) :-
    X =< Y, % X is less than or equal to Y
    merge(Rest1, [Y | Rest2], Rest3).

merge([X | Rest1], [Y | Rest2], [Y | Rest3]) :-
    X > Y, % X is greater than Y
    merge([X | Rest1], Rest2, Rest3).
