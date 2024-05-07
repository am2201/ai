best_first_search(Start, Goal, Solution) :-
    iterative_deepening([[Start]], Goal, ReversedSolution),
    reverse(ReversedSolution, Solution).

iterative_deepening([[Goal|Path]|_], Goal, [Goal|Path]).%base case

iterative_deepening([[Current|Path]|Paths], Goal, Solution) :-
    length(Path, Depth),
    Depth < 10, % Limiting the search depth
    findall([Next, Current|Path],
            (move(Current, Next), \+ member(Next, [Current|Path])),
            Successors),%finding all the successors of the current node
    append(Paths, Successors, NewPaths),
    sort_paths(NewPaths, SortedPaths),
    iterative_deepening(SortedPaths, Goal, Solution).%iterative call

% Termination condition if depth limit exceeded
iterative_deepening(_, _, _) :- !, fail.

%defining linear graph
move(a, b).
move(b, c).
move(c, d).
move(d, e).
%sorting the paths based on heuristic values
sort_paths(Paths, SortedPaths) :-
    %predsort- predefined predicate
    predsort(compare_paths, Paths, SortedPaths).

compare_paths(Order, [Goal1|_], [Goal2|_]) :-
    heuristic(Goal1, H1),
    heuristic(Goal2, H2),
    compare(Order, H1, H2).

%defining the heuristic values
heuristic(a, 4).
heuristic(b, 3).
heuristic(c, 2).
heuristic(d, 1).
heuristic(e, 0).
