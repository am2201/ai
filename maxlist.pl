% maxlist(L, M) succeeds if M is the maximum number in the list L.
maxlist([X], X). % Base case: Single-element list, M is that element.
maxlist([Head|Tail], Max) :-
    maxlist(Tail, TailMax), % Recurse on the tail of the list.
    (Head > TailMax -> Max = Head ; Max = TailMax). % Compare Head with TailMax.
% Example usage:
% ?- maxlist([5, 8, 3, 12, 7], Max).
% Max = 12
