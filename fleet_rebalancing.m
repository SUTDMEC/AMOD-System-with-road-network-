
%function [ rebalanced_vehicle_availability_map, time] = fleet_rebalancing( connectivity_matrix, vehicle_availability_map, time)

function [ rebalanced_vehicle_availability_map, time] = fleet_rebalancing(total_num_scooter, origin_target_pair, vehicle_availability_map,time)
%%   Detailed explanation goes here

% We consider two levels of fleet rebalancing. We divide the entire study
% area into zones, we then compute a balance value for each zone based on
% normalized available vehicle and expected demand (origin within the
% zone). To estimate expected travel demand within each zone, a
% queuing-theoretical perspective is used and we introduce the notion of
% "virtual passenger"; 
% 

total_demand = size(origin_target_pair,1);
% 4 grids = 1 block
num_of_blocks = 4; % for 4x4 grid 

% blk 1  blk 2
% blk 3  blk 4

for row = 1:2:3
    for column = 1:2:3
        iii = 1
        demand_in_block = 0;
        % sum all 'A' scooter within the block 
        for i = 1:size(vehicle_availability_map,3)
            num_scooter_in_block = length(find(vehicle_availability_map(row,column,:,time)=='A'))+length(find(vehicle_availability_map(row+1,column,:,time)=='A'))+length(find(vehicle_availability_map(row,column+1,:,time)=='A'))+length(find(vehicle_availability_map(row+1,column+1,:,time)=='A'));
        end
        % sum all origin_target_pair originated from the block in the 5-min
        % time interval 
        %check all rows of o-t pair, if origin in that block,
        %demand_in_block +1
        for i = 1:total_demand
            if and(or(origin_target_pair(i,1) == row, origin_target_pair(i,1) == row+1), or(origin_target_pair(i,2) == column, origin_target_pair(i,1) == column+1))
                demand_in_block = demand_in_block + 1;
            end
        end
        block_balance(1,iii) = total_num_scooter*(num_scooter_in_block/total_num_scooter - demand_in_block/total_demand);
        iii = iii+1;
    end
end

threshold_value = 3; % if block_balance < -3 or >3, need to rebalance 

for i = 1:num_of_blocks
    if or(block_balance(1,i) > 3, block_balance(1,i) < -3)
        %check its neighboring blocks, choose the one with the largest
        %difference to either push or pull the vehicle to or from that
        %block;     
        
        %to decide which vehicle to push to or pull from that block, choose
        %the 'A' vehicle nearest to block i's center, e.g. (2,2) for block 1 
        
        %generate a virtual passenger at block i's center node, moves the
        %chosen vehicle towards that direction, but still with state 'A'
        
    end
end

end

