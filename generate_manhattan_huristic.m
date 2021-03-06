function [ heuristic] = generate_manhattan_huristic( map_size, end_coordinate ) 
%Creates matrix the size of the the map assigns the distance to the end 
%coordinate as the heuristic

heuristic = zeros(map_size);

for iii = 1 : map_size(1)
    for jjj = 1: map_size(2)
        heuristic (iii,jjj) = pdist2([iii,jjj],end_coordinate,'cityblock'); % travel from point [iii,jjj] to end_coordinate(randi between 1 and 10, e.g. [4,7]
    end
end

end