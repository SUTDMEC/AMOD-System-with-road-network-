function [ waiting_time,waited_time, updated_vehicle_availability_map, time ] = vehicle_assignment(start_node,vehicle_availability_map)

%%   Detailed explanation goes here

%   Input: 
%   vehicle_availability_map (position of each vehicle in the road network
%   and its status (available/occupied/booked/down); road represented as
%   nodes every 2 meters along the road; map has n nodes; at each node, 1=
%   has a scooter, 0 = does not have a scooter

%   Output: 
%   matches demand to the nearest "available" efloater and provide
%   an estimated waiting time to arrive, if waiting time is within the customers'
%   tolerance time, the status becomes "booked" and the customer
%   waits at his position for the scooter to come, output waiting_time; if there is 
%   more demand than available vehicle, for demand that
%   are not matched, reiterate till exceeds tolerance time,waited_time =+1
%   At each time iteration, a "booked" scooter has a probability to change its status to
%   "available" as a customer may cancel the order while waiting for the
%   scooter to arrive 
%   
%   waiting_time (the time it takes to wait for the scooter to arrive when
%   you've already got a scooter matched to you and is on its way)
%
%   waited_time: counter to remember how much time customer has waited for an available
%   scooter when there is no available scooter yet; if waited_time exceeds
%   tolerance time, the person leaves the queue

%   update vehicle_availability_map after each iteration, update the status
%   of each vehicle and its position on the map (node)

%%  Other parameters

%   probability distribution of scooter changing from "available", "occupied", "booked" to "down" 
%   distribution of customer tolerance time 



end

