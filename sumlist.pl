% Base case: An empty list has a sum of 0.
sumlist([], 0).

% Recursive case: Sum the head of the list with the sum of the tail.
sumlist([Head|Tail], S) :-
    sumlist(Tail, RestSum),
    S is Head + RestSum.
