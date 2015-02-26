%function [ total_time, updated_vehicle_availability_map] = travel_time_calculation( start_node,target_node, connectivity_matrix, vehicle_availability_map)

function [total_time,vehicle_availability_map] = total_time_calculation( origin_target_pair, vehicle_availability_map,index,waiting_time,time)
%   Detailed explanation goes here
%   Calculate time to travel from the start_node (generated demand
%   location) to target_node (destination), not including waiting time at start node
%   output an updated vehicle availability map after each 
%   depends on rider's speed

scooter_riding_speed = 5*1000/3600; %m/s = 5 km/hr 
%map_size = size(vehicle_availability_map);
grid_size = 10; %m

for iii = 1:1:size(origin_target_pair,1)
    
    %caculcate the time for traveling
    grids_traveled = pdist2(origin_target_pair(iii,1:2),origin_target_pair(iii,3:4),'cityblock');
    human_travel_time = grids_traveled * grid_size /scooter_riding_speed;
    total_time = round(waiting_time + human_travel_time) %s , rounded for indexing
    %put the bike in its new location at target coordinate after total_time
    vehicle_availability_map (origin_target_pair(iii,3),origin_target_pair(iii,4),index,time+total_time)= 'A' %after the scooter drops the passenger off, it returns to state "A"

end

