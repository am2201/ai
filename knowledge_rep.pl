% Frame for an animal
frame(animal, has, legs).
frame(animal, has, eyes).
frame(animal, eats, food).

% Frame for a bird, which is a kind of animal
frame(bird, isa, animal).
frame(bird, has, wings).
frame(bird, can, fly).

% Frame for a penguin, which is a kind of bird
frame(penguin, isa, bird).
frame(penguin, cannot, fly).

% Frame for a mammal, which is a kind of animal
frame(mammal, isa, animal).
frame(mammal, has, fur).

% Frame for a dog, which is a kind of mammal
frame(dog, isa, mammal).
frame(dog, can, bark).

% A predicate to check if something has a property
has(X, Y) :-
    frame(X, has, Y);
    frame(X, isa, Z),
    has(Z, Y).

% A predicate to check if something can do something
can(X, Y) :-
    \+ cannot(X, Y),
    (frame(X, can, Y);
    frame(X, isa, Z),
    can(Z, Y)).


% A predicate to check if something cannot do something
cannot(X, Y) :-
    frame(X, cannot, Y);
    frame(X, isa, Z),
    cannot(Z, Y).
