% Base case: concatenating an empty list with another list results in the other list
conc([], L, L).

% Recursive case: if the first list is not empty, we remove the head of the first list
% and append it to the result of concatenating the tail of the first list with the second list
conc([H|T1], L2, [H|T3]) :- conc(T1, L2, T3).
