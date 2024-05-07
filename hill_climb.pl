% Define the hill climbing algorithm
hill_climb(List, Max) :-  % The main function that takes a list and a variable Max as input.
    select_first(List, Current, Rest),  % It selects the first element from the list.
    hill_climb(Rest, Current, Max).  % It then calls the hill_climb function with the rest of the list, the current element, and Max.

hill_climb([], Max, Max).  % Base case: If the list is empty, the maximum value found so far is returned.

hill_climb([H|T], CurrentMax, Max) :-  % Recursive case: If the list is not empty,
    H > CurrentMax,  % and if the head of the list is greater than the current maximum,
    hill_climb(T, H, Max).  % the function is called again with the tail of the list, the head of the list as the new current maximum, and Max.

hill_climb([H|_], CurrentMax, Max) :-  % If the head of the list is less than or equal to the current maximum,
    H =< CurrentMax,  % the current maximum is kept,
    Max is CurrentMax.  % and the maximum value found so far is returned.

% Select the first value in a list
select_first([H|T], H, T).  % This function takes a list and returns the head and the tail of the list.
