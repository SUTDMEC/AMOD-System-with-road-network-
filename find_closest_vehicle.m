function [closest_vehicle_position] = find_closest_vehicle(vehicle_availability_map, possible_movements, present_location, heuristic)

%find the node with the nearest scooter(s) that is available "A", note that
%there might be many available scooters at the closest_vehicle_position
%node

%Adapted from Andrew's code with modifications to include different vehicle
%states
%Given vehicle availability map, each entry either 0 (no vehicle) or ['A','O'....], return the closest vehicle 
%given present_location coordiante and possible movements
%implementation uses a A star styled search for the closest non zero location
%basically a lazy search for a non zero value which searchs in the
%direction indicated by the heuristic


%store if the present location is checked to prevent rechecking
checked = zeros(size (vehicle_availability_map));
checked(present_location) = 1;

movement_cost = 0;

%flag for end of search
found = false; 
%flag is for if no object is found
resign = false; 

%heuristic cost used in a star
heuristic_cost = heuristic(present_location(1),present_location(2) ) + movement_cost;

%stack of locations left to search
searched_stack = [heuristic_cost, movement_cost, present_location];

%stack of objects  found= [movement cost, y location, x location]
object_found = [];


%If an available bike is found at present location
type = 'A';
C = vehicle_availability_map(present_location(1), present_location(2)); 
if is_type_in_C == any(strfind(C,type))
   found = true;
   object_found= [0, present_location];
end


count = 0;
    while  not(found) && not(resign)
        
        %check if stack is empty ie. no more left to check
        if (~size(searched_stack,1))
            resign = true;
        
        else
            %sort so the least total cost is on top
            searched_stack = sortrows(searched_stack);

            %pop the top of search stack
            next_travel = searched_stack (1, :);
            searched_stack (1, :) = [];

            %get new cost and coordinates
            cost = next_travel (2);
            y = next_travel (3);
            x = next_travel (4);
            %since we moved 1, add to cost
            cost = cost +1;
            %Make checked non zero to indicated we have traved to location 
            checked(y,x) = count;
            count = count + 1;
            
            %if an object is found
            if is_type_in_C == any(strfind(C,type))
               found = true;
               object_found = [cost+ heuristic(y,x), y, x];    
            %search all possible movements
            else
                for iii= 1: size (possible_movements,1)
                    y2 = y + possible_movements(iii,1);
                    x2 = x + possible_movements(iii,2);

                    if (y2> 0 && y2 < size(vehicle_availability_map,1)+1 && x2>0 && x2 < size(vehicle_availability_map,2)+1)
                        if (checked(y2, x2) == 0 && vehicle_availability_map(y2,x2)> -1)
                            total_cost = cost + heuristic(y2,x2);
                            searched_stack = [searched_stack ; total_cost, cost, y2, x2];
                            checked(y2,x2) = count;

                             %if an available vehicle is found
                             if is_type_in_C == any(strfind(C,type))
                                 object_found = [cost, y2, x2];
                                 found = true;
                             end
                        end
                    end
                end
            end
        end
    end
    
closest_object_found = sortrows(object_found);   

%in case no object is found, return nothing
object_find_check = size (closest_object_found);
if(object_find_check)
    closest_vehicle_position = closest_object_found(1,2:3);
end

end

       

end

