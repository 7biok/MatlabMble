% This example shows how to automate simulation runs from the
% MATLAB command line. It reads test data from Excel and uses that 
% data as input data to the throttle model. All simulation results are
% then displayed in a MATLAB figure.

% Open model
etc_plant_simple

% Load test data from an external Excel file
% Data is in the form: time case1 case2 case3
xlsdata = readmatrix("plantTestInputs.xls", ...
    "NumHeaderLines", 4);  % Data begins in Row 5 of Excel file

% Parse the test data
test_time = xlsdata(:,1);
test_signals = xlsdata(:,2:end);
test_duty = abs(test_signals);
test_direction = sign(test_signals);
stopTime = test_time(end);
Ntests = size(test_signals,2);

% Create SimulationInput variables for each test
simIn(1:Ntests) = Simulink.SimulationInput("etc_plant_simple");

% Configure each SimulationInput variable
for ai = 1:Ntests
    % Set the model's stop time parameter
    simIn(ai) = simIn(ai).setModelParameter("StopTime",num2str(stopTime));
    
    % Configure external input for the corresponding test data
    simIn(ai) = simIn(ai).setExternalInput([test_time, test_duty(:,ai), test_direction(:,ai)]);
end

% Run all simulations
simOut = sim(simIn);

% Plot the results
figure;
for ai = 1:Ntests
    % Extract data
    yout = simOut(ai).yout;      % Extract from SimulationOutput
    theta = yout{1};             % Extract from DataSet
    xdata = theta.Values.Time;   % Extract time values
    ydata = theta.Values.Data;   % Extract data values
    
    % Plot the data
    subplot(Ntests,1,ai);
    yyaxis left
    plot(test_time,test_signals(:,ai));
    yyaxis right
    plot(xdata,ydata); 
    title("Test Case " + num2str(ai));
end

% Clean up
close_system("etc_plant_simple");