fib_term(1, 0).
fib_term(2, 1).
fib_term(N, T) :-
    N>0,
    N1 is N-1,
    N2 is N-2,
    fib_term(N1, T1),
    fib_term(N2, T2),
    T is T1+T2.
fib():-
    write("Enter the n-th term : "), read(X),
    fib_term(X, T),
    write("The term is : "), write(T).
