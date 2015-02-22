function [ updated_vehicle_availability_map ] = vehicle_location_initialization( vehicle_availability_map, varargin )

%%   Detailed explanation goes here
%   initialization of each scooter's location at the beginning of each day
%   based on vehicle_availability_map at the end of last day and day of
%   week (include vacation in the future), could be during 3-4 am. 

p = inputParser;

p.addOptional('day',1,@isscalar); % day of week is optional input

p.parse(input1,varargin{:})

updated_vehicle_availability_map = vehicle_availability_map; 


end

