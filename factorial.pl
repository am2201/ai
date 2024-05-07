factorial(0, 1).
factorial(N, F) :-
    N>0,
    N1 is N-1,
    factorial(N1, F1),
    F is N*F1.
fact():-
    write("Enter a Number : "), read(X),
    factorial(X, F),
    write("The factorial of the number is : "), write(F).
