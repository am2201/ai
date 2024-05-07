% memb(X, L) checks if X is a member of the list L.
memb(X, [X | _]).
memb(X, [_ | Rest]) :- memb(X, Rest).


