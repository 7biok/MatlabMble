% etc_all_data.m
%
% Loads parameters for the etc_parent model, and similar

% Data for the controller
Kp = 0.3;  % Proportional gain
Ki = 2;    % Integral gain
Ts = 0.01; % Sample time

% Data for the plant
J = 2.4500e-004;  % Throttle Plate inertia
Km = 3.0;         % Motor constant
Kd = 0.03;        % Viscous Friction/Damping coefficient
Ks = 0.2;         % Spring constant
theta_eq = pi/6;  % Spring equilibrium angle

% Data for the sensor
degConv = 180/pi; % Conversion factor