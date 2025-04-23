% This example shows how to run parallel simulation runs from the
% MATLAB command line using parsim. It generates vectors of
% damping and spring constant values to simulate.

% Open model
etc_plant_simple

% Create parameter vectors to sweep over
N_Ks = 10;
N_Kd = 10;
Ks_values = linspace(0.005,0.5,N_Ks);
Kd_values = linspace(0.003,0.3,N_Kd);

% Initialize simIn array
simIn(1:N_Ks,1:N_Kd) = Simulink.SimulationInput("etc_plant_simple");

% Configure each SimulationInput variable
for ai = 1:N_Ks
    for bi = 1:N_Kd       
        % Set the Stop Time
        simIn(ai,bi) = simIn(ai,bi).setModelParameter("StopTime","3");
        
        % Configure the Ks and Kd variable values
        simIn(ai,bi) = simIn(ai,bi).setVariable("Ks",Ks_values(ai));
        simIn(ai,bi) = simIn(ai,bi).setVariable("Kd",Kd_values(bi));
    end
end

% Run all simulations
simOut = parsim(simIn,"ShowSimulationManager","on");
