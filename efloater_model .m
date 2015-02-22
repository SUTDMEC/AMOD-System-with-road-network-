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
num_nodes = size(connectivity_matrix,1);
vehicle_availability_map = zeros(num_nodes,1);
total_num_scooter = 10;  
num_charging_stations = 2; 
%can be changed for further analysis: as more charging station means more
%scooters with higher battery level running at at time instance and maybe
%less customer waiting time? will perform simulation for different number
%of charging stations


datetime.setDefaultFormats('default','yyyy-MM-dd hh:mm:ss'); 
yyyy = 2015;
MM = 3;
dd = 1;
datestr(now,formatOut)


%run simulation continuously for 31 days (1 month)
for  iteration = 1:1:31 % day1 to day31
     
    t = datetime(yyyy,MM,dd,3,0,0); % every day system restarts at 3 a.m.
    time = [t.Hour, t.Minute, t.Second]; 
    formatOut = 8;
    day = sprintf('%MM-%dd-%yyyy',MM,dd,yyyy); %first three letter of the day e.g. Wed
    datestr('%MM-%yyyy-%dd',formatOut)
    vehicle_availability_map = vehicle_location_initialization( vehicle_availability_map, varargin); %Initialization of scooters at beginning of day
    [ start_node ] = demand_generation(connectivity_matrix,time,day,vacation);
    
   
    
    dd = dd+1;
end

