% insert_nth(I, N, L, R) succeeds if R is the list obtained by inserting I at position N in L.
insert_nth(I, 1, L, [I|L]). % Base case: Insert I at the beginning.
insert_nth(I, N, [X|Rest], [X|R]) :-
    N > 1, % Ensure N is positive.
    N1 is N - 1, % Decrement N.
    insert_nth(I, N1, Rest, R). % Recurse on the rest of the list.

% Example usage:
% ?- insert_nth(42, 3, [1, 2, 3, 4, 5], Result).
% Result = [1, 2, 42, 3, 4, 5]
