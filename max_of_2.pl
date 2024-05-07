max(X, Y, X) :- X>=Y.
max(X, Y, Y) :- Y>X.
maximum():-
    write("Enter the first number : "),
    read(X),
    write("Enter the second number : "),
    read(Y),
    max(X, Y, M),
    write("The maximum number is :"), write(M).
