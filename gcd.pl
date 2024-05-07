gcd(X, 0, X) :- X>0.
gcd(X, Y, Z) :- Y>0,
    Y1 is X mod Y,
    gcd(Y, Y1, Z).
cgcd():-
    write("Enter the first number : "), read(X),
    write("Enter the second number : "), read(Y),
    gcd(X,Y,Z),
    write("The GCD is : "), write(Z).


