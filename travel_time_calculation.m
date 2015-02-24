%function [ total_time, updated_vehicle_availability_map] = travel_time_calculation( start_node,target_node, connectivity_matrix, vehicle_availability_map)

function [ total_time, updated_vehicle_availability_map] = travel_time_calculation( origin_target_pair, map, vehicle_availability_map)
%   Detailed explanation goes here
%   Calculate time to travel from the start_node (generated demand
%   location) to target_node (destination), not including waiting time at start node
%   output an updated vehicle availability map after each 
%   depends on rider's speed

scooter_riding_speed = 5*1000/3600; %m/s = 5 km/hr 

for i in origin_target_pair ....

end

