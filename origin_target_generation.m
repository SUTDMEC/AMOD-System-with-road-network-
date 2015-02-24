%function [ start_node ] = demand_generation(connectivity_matrix,time,day)
%function [ map ] = demand_generation(map,time,day)

function [ origin_map, origin_target_pair, updated_total_map ] = origin_target_generation(map,vehicle_availability_map)

%% Summary of this function goes here
% Input: 
% connectivity matrix (representing road network),
% time (time of day), 
% day (day of week), 
% vacation (binary 1=vacation; 0=term time) (to be included in the future 
% Output: 
% start_node to be input into destination_generation.m and time_calculation.m 

%%
% Data to be included with study of SUTD, for now fictitious demand 

iii = 1;


% for each node i 
for i = 1:size(map,1)
    for j = 1:size(map,2)

        %Customer arrival follows poisson process with arrival rate of 0.2 per unit time
        arrival_rate = 0.2; %to be changed with survey data, location_variant, time_variant 
        delta_t = 5; %minutes

        %Calculate number of arrivals at node (i,j) during 5 min interval, 
        origin_map(i,j) = poisson_fixed_time (arrival_rate, delta_t);
        
        %Obtain trip distribution from survey data, e.g. with prb. 0.2,
        %travels from (i,j) to (i',j') 
        %trip_distribution_table 
        
        %Sample from trip distribution to determine the target node for these origin
        %nodes 
        
        for k = 1:origin_map(i,j)
            t = unidrnd(size(map,1),1,2); %assume discrete unifrom distribution 
            while isequal(t,[i,j])
                t = unidrnd(size(map,1),1,2); %ensure origin and target different 
            end
            origin_target_pair(1,iii)= [[i,j],t]; %collects all origin_target pairs
            iii = iii + 1;
        end 
        
        %plus original number of customers at node (i,j)
        updated_total_map(i,j) = map(i,j) + poisson_fixed_time (arrival_rate, delta_t);      
    end
   
end

