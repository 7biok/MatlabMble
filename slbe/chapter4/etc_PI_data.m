% etc_PI_data.m
%
% Loads parameters for the etc_PI model

% Controller parameters
Kp = 0.3;  % Proportional gain
Ki = 2;    % Integral gain
Ts = 0.01; % Sample time

% Input step signal
t = [0 1 1 10]';
u = [0 0 1 1]';