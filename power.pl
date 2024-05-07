pow(_, 0, 1).
pow(N, 1, N).
pow(N, P, A) :-
    P>1,
    P1 is P-1,
    pow(N, P1, A1),
    A is N*A1.
power():-
    write("Enter the number : "), read(X),
    write("Enter the power : "), read(Y),
    pow(X,Y,Z),
    write("Answer : "), write(Z).

