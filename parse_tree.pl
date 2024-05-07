% Defining the grammar
s(s(NP,VP)) --> np(NP), vp(VP).
np(np(Det,N)) --> det(Det), n(N).
vp(vp(V,NP)) --> v(V), np(NP).
det(det(the)) --> [the].
n(n(dog)) --> [dog].
n(n(cat)) --> [cat].
v(v(chases)) --> [chases].

% Parsing a sentence
parse(Tree, Sentence) :-
    s(Tree, Sentence, []).

