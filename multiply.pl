multi(X, Y, Z) :-
    Z is X*Y.
multiply():-
    write("Enter the first number : "), read(X),
    write("Enter the second number : "), read(Y),
    multi(X,Y,Z),
    write("Product : "), write(Z).



