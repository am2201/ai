% Base case: An empty list has an even length.
evenlength([]).

% Recursive case: A list has an even length if its tail has an odd length.
evenlength([_|T]) :- oddlength(T).

% Base case: A list with a single element has an odd length.
oddlength([_]).

% Recursive case: A list has an odd length if its tail has an even length.
oddlength([_|T]) :- evenlength(T).
