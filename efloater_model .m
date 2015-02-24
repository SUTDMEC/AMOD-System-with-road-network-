% Written by Wei Wei and Nishaan 
% Description: free floating scooter sharing (efloater) 
% Main modules included:
% demand_generation.m 
% destination_generation.m
% vehicle_assignment.m 
% vehicle_routing.m
% rider_travel_time_calculation.m
% fleet_rebalancing.m


%% charging, battery life ~ 15kms after full charging, every trip within 2~3 mins in SUTD campus; one more states that define "to be sent for charging"
%  vehicle_assignment => also need to consider battery level (kms left) 

clc; clear;

% initialization 

%num_nodes = size(connectivity_matrix,1);
total_num_scooter = 5;  
num_charging_stations = 1; %can be changed for further analysis: as more charging station means more
%scooters with higher battery level running at at time instance and maybe
%less customer waiting time? will perform simulation for different number
%of charging stations


% road network initialization: grid 4x4, 16 nodes, distance between
% two nodes = 10 meters 
map = zeros(4);
vehicle_availability_map = map;
% put all scooters at (1,1) node as available
vehicle_availability_map(1,1) = repmat('A',1,total_num_scooter);
    

datetime.setDefaultFormats('default','yyyy-MM-dd hh:mm:ss'); 
yyyy = 2015;
MM = 3;
dd = 1;


%run simulation continuously for 31 days (1 month)
for  iteration = 1:1:31 % day1 to day31
    
    %time format conversion
    t = datetime(yyyy,MM,dd,3,0,0); % every day system restarts at 3 a.m.
    time = [t.Hour, t.Minute, t.Second]; 
    formatOut = 8;
    day = sprintf('%MM-%dd-%yyyy',MM,dd,yyyy); %first three letter of the day e.g. Wed
    datestr('%MM-%yyyy-%dd',formatOut)

    %Initialization of scooters at beginning of day
    vehicle_availability_map = vehicle_location_initialization( vehicle_availability_map, varargin); 
    
    for time = 1:5:1440%minutes a day
        [origin_map,origin_target_pair] = origin_target_generation(map); %generate origin-target pair for each 5 min interval for all nodes 
        
    end
    
    


end

