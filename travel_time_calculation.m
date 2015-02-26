%function [ total_time, updated_vehicle_availability_map] = travel_time_calculation( start_node,target_node, connectivity_matrix, vehicle_availability_map)

function [total_time] = total_time_calculation( origin_target_pair, map, vehicle_availability_map,waiting_time)
%   Detailed explanation goes here
%   Calculate time to travel from the start_node (generated demand
%   location) to target_node (destination), not including waiting time at start node
%   output an updated vehicle availability map after each 
%   depends on rider's speed

scooter_riding_speed = 5*1000/3600; %m/s = 5 km/hr 
possible_movements = [-1 0; % go up
         0 -1;   % go left
         1 0; % go down
         0 1];% go right
map_size = size(vehicle_availability_map);
grid_size = 10; %m

for iii = 1:1:size(origin_target_pair,1)
    
    %caculcate the time for traveling
    grids_traveled = pdist2(origin_target_pair(iii,1:2),origin_target_pair(iii,3:4),'cityblock');
    human_travel_time = grids_traveled * grid_size /scooter_riding_speed;
    total_time = waiting_time + human_travel_time; %s 
    %put the bike in its new location at target coordinate after total_time
    vehicle_availability_map (origin_target_pair(iii,3),origin_target_pair(iii,4),time+total_time)= vehicle_availability_map (origin_target_pair(iii,3),origin_target_pair(iii,4),time+total_time)+ 1;

end

