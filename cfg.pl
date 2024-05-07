% Defining the grammar
s --> [].
s --> [a], s, [b].

% Checking a sentence
check(Sentence) :-
    s(Sentence, []).
