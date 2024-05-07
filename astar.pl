% Define the vertices using vertex(name, x_val, y_val).
vertex(a, 1, 1).
vertex(b, 2, 2).
vertex(c, 3, 3).
vertex(d, 4, 4).
vertex(e, 5, 5).
vertex(f, 1, 5).
vertex(g, 2, 4).
vertex(h, 3, 2).
vertex(i, 5, 1).
vertex(j, 4, 3).

% Define the edges using edge(name1, name2).
edge(a, b).
edge(a, c).
edge(b, d).
edge(d, e).
edge(c, f).
edge(d, g).
edge(e, h).
edge(f, i).
edge(g, j).
edge(h, j).
edge(i, j).
edge(j, a). % Cycle

% Define the heuristic function for A* using Manhattan distance.
heuristic(Vertex1, Vertex2, Distance) :-
    vertex(Vertex1, X1, Y1),
    vertex(Vertex2, X2, Y2),
    Distance is abs(X2 - X1) + abs(Y2 - Y1).

% Define the cost function for A* using Manhattan distance.
cost(Vertex1, Vertex2, Cost) :-
    vertex(Vertex1, X1, Y1),
    vertex(Vertex2, X2, Y2),
    Cost is abs(X2 - X1) + abs(Y2 - Y1).

% Implement the A* algorithm.
astar(Start, Goal, Path, Distance) :-
    astar([[0, Start, null, 0]], Goal, [], RevPath, Distance),
    reverse(RevPath, Path).

astar([[_, Goal, Prev, Dist]|_], Goal, _, [Goal|Path], Dist) :-
    build_path(Goal, Prev, [], Path).

astar([[_, Current, _, Dist]|Queue], Goal, Visited, Path, TotalDist) :-
    findall([FNew, Next, Current, NewDist],
            (edge(Current, Next),
             not(member(Next, Visited)),
             cost(Current, Next, StepCost),
             heuristic(Next, Goal, H),
             NewDist is Dist + StepCost,
             FNew is NewDist + H),
            Children), 
    append(Children, Queue, NewQueue),
    sort(NewQueue, SortedQueue),
    astar(SortedQueue, Goal, [Current|Visited], Path, TotalDist).

build_path(null, _, Path, Path).

build_path(End, Prev, AccPath, Path) :-
    build_path(Prev, _, [End|AccPath], Path).

% Example query: astar(a, e, Path, Distance).
