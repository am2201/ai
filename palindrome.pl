% Base case: An empty list is a palindrome.
palindrome([]).

% Recursive case: A list is a palindrome if its first and last elements are the same,
% and the sublist obtained by removing these elements is also a palindrome.
palindrome([_]).
palindrome([H|T]) :- append(Middle, [H], T), palindrome(Middle).
