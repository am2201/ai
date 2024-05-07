% delete_nth(N, L, R) succeeds if R is the list obtained by removing the Nth element from L.
delete_nth(1, [_|Tail], Tail). % Base case: Remove the first element.
delete_nth(N, [X|Rest], [X|R]) :-
    N > 1, % Ensure N is positive.
    N1 is N - 1, % Decrement N.
    delete_nth(N1, Rest, R). % Recurse on the rest of the list.

% Example usage:
% ?- delete_nth(3, [a, b, c, d, e], Result).
% Result = [a, b, d, e]
