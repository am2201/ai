% nth_element(N, L, X) succeeds if X is the Nth element of list L.
nth_element(1, [X|_], X). % Base case: X is the first element.
nth_element(N, [_|Rest], X) :-
    N > 1, % Ensure N is positive.
    N1 is N - 1, % Decrement N.
    nth_element(N1, Rest, X). % Recurse on the rest of the list.

% Example usage:
% ?- nth_element(3, [a, b, c, d, e], X).
% X = c
