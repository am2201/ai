% Base case: the reverse of an empty list is the empty list
reverse([], []).

% Recursive case: the reverse of a non-empty list is the reverse of the tail
% followed by the head
reverse([Head|Tail], Reversed) :-
    reverse(Tail, ReversedTail),
    append(ReversedTail, [Head], Reversed).
