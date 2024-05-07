% Define the graph
edge(a, b).
edge(b, c).
edge(c, d).
edge(d, e).
edge(e, f).
% Define the heuristic function
heuristic(a, 6).
heuristic(b, 5).
heuristic(c, 4).
heuristic(d, 3).
heuristic(e, 2).
heuristic(f, 1).
% Define the A* search algorithm
a_star_search(Start, Goal, Path) :-
    a_star_search([(Start, [], 0)], Goal, Path).
% Termination: Empty agenda
a_star_search([], _, []).
% Goal reached
a_star_search([(Goal, Path, _)|_], Goal, Path).
% Explore neighbors
a_star_search([(Node, CurrentPath, Cost)|Rest], Goal, FinalPath) :-
    findall(
        (Next, [Next|CurrentPath], NewCost),
        (edge(Node, Next, EdgeCost), not(member(Next, CurrentPath)), NewCost is Cost + EdgeCost + heuristic(Next)),
        Children),
    append(Rest, Children, NewAgenda),
    sort_agenda(NewAgenda, SortedAgenda),
    SortedAgenda = [(BestNode, BestPath, _)|_],
    a_star_search([(BestNode, BestPath, _)|Rest], Goal, FinalPath).
% Sort the agenda based on the total cost (f = g + h)
sort_agenda(Agenda, SortedAgenda) :-
    maplist(node_cost, Agenda, Costs),
    keysort(Costs, SortedCosts),
    pairs_values(SortedCosts, SortedAgenda).
% Calculate the total cost (f = g + h) of a node
node_cost((Node, Path, Cost), TotalCost-(Node, Path, Cost)) :-
    heuristic(Node, H),
    TotalCost is Cost + H.


