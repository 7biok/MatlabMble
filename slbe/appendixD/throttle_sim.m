%% Create copy of original configuration set
load_system("etc_plant_simple");
configSetOrig = getActiveConfigSet("etc_plant_simple");
configSetNew = configSetOrig.copy;

%% Simulate etc_plant_simple with original inputs 
simOutOrig = sim("etc_plant_simple",configSetOrig);

%% simulate the model with a different input
tin = [0, .1, .1, 5, 5 ,10]';
duty2 = [0, 0, 1,  1 , 1, 1]';
direction2 = [-1, -1, -1,-1, 1, 1]';
set_param(configSetNew,"ExternalInput","[tin, direction2, duty2]");
simOutNew = sim("etc_plant_simple",configSetNew);

%% Plot results
% Original Inputs
xout = get(simOutOrig,"xout");
x1 = getElement(xout,1);
x2 = getElement(xout,2);

figure % Create a new figure
subplot(2,1,1) 
plot(x1.Values.Time,x1.Values.Data) % Time vs. Angle (first state)
title("\theta (rads) Default Input")

subplot(2,1,2)
plot(x2.Values.Time,x2.Values.Data) % Time vs. Angular Velocity (second state)
title("\omega (rads/s) Default Input")

% New Inputs
xout = get(simOutNew,"xout");
x1 = getElement(xout,1);
x2 = getElement(xout,2);

figure % Create a new figure
subplot(2,1,1) 
plot(x1.Values.Time,x1.Values.Data) % Time vs. Angle (first state)
title("\theta (rads) New Input")

subplot(2,1,2)
plot(x2.Values.Time,x2.Values.Data) % Time vs. Angular Velocity (second state) 
title("\omega (rads/s) New Input")

%% clean up
close_system("etc_plant_simple");

