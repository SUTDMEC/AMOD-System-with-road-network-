%function [ waiting_time,waited_time, updated_vehicle_availability_map, time ] = vehicle_assignment(start_node,connectivity_matrix, vehicle_availability_map)
function [ waiting_time,waited_time, updated_vehicle_availability_map, time ] = vehicle_assignment(origin_coordinate, target_coordinate, vehicle_availability_map)

%%   Detailed explanation goes here

%   Input: 
%   vehicle_availability_map (position of each vehicle in the road network
%   and its states (available/occupied/booked/down); road represented as
%   nodes every 10 meters along the road; map has n nodes; at each node, 0 
%   = does not have a scooter, o/w has scooter 

%   Output: 
%   matches demand to the nearest "available" efloater and provide
%   an estimated waiting time to arrive, if waiting time is within the customers'
%   tolerance time, the status becomes "booked" and the customer
%   waits at his position for the scooter to come, output waiting_time; if there is 
%   more demand than available vehicle, for demand that
%   are not matched, reiterate till exceeds tolerance time,waited_time =+1
%   At each time iteration, a "booked" scooter has a probability to change its status to
%   "available" as a customer may cancel the order while waiting for the
%   scooter to arrive; if not cancel but leave, change from "booked" to
%   "available" upon arrival
%   
%   waiting_time (the time it takes to wait for the scooter to arrive when
%   you've already got a scooter matched to you and is on its way)
%
%   waited_time: counter to remember how much time customer has waited for an available
%   scooter when there is no available scooter yet; if waited_time exceeds
%   tolerance time, the person leaves the queue

%   update vehicle_availability_map after each iteration, update the status
%   of each vehicle and its position on the map (node)

%   assumptions: person stays at the same place while waiting for the
%   scooter to arrive 

%   * lost demand definition 

%%  Other parameters

%   probability distribution of scooter changing from "available", "occupied", "booked" to "down" 
%   distribution of customer tolerance time 

scooter_auto_speed  = 4*1000/3600; %m/s = 4 km/hr 
possible_movements = [-1 0; % go up
         0 -1;   % go left
         1 0; % go down
         0 1];% go right
map_size = size(vehicle_availability_map);
%heuristic used for A* is manhattan because bike travels on city block
heuristic = generate_manhattan_huristic (map_size, end_coordinate);
        
%%  Scooter states: A - Available, O - Occupied, B - Booked, D - Down 
%find the nearest scooter that is available "A"
closest_vehicle_position = find_closest_vehicle(vehicle_availability_map, possible_movements,target_coordinate,heuristic);

%assign any "A" scooter at closest_vehicle_position for this request 
customer_tolerance_time = 5; %minutes
waited_time = 0;

while waited_time <= customer_tolerance_time
    waited_time = waited_time + 1;
    if ....
end
    
        
