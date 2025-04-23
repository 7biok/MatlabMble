% This script copies all files needed for the demo into a local folder 
% named sldem_mdlref_files.
%
% For the full demo, see Simulink > Modeling > Design Model
% Architecture > Model References > Visualizing Model Reference
% Architectures in the documentation.

% Make a folder to contain the copied files
target_dir = fullfile(pwd,"sldemo_mdlref_files");
if ~exist(target_dir,"dir")
    mkdir("sldemo_mdlref_files");
end

% Copy all necesessary files from the MATLAB root directory
try
    copyfile(which("sldemo_mdlref_depgraph"),fullfile(target_dir,"sldemo_mdlref.slx"));
    copyfile(which("sldemo_mdlref_heat2cost"),target_dir);
    copyfile(which("sldemo_mdlref_house"),target_dir);
    copyfile(which("sldemo_mdlref_F2C"),target_dir);
    copyfile(which("sldemo_mdlref_outdoor_temp"),target_dir);
    copyfile(which("sldemo_mdlref_thermostat"),target_dir);
    copyfile(which("sldemo_mdlref_heater"),target_dir);
catch ME
    warning("Copy failed. Delete the following folder and try again. %s",target_dir);
    return
end
disp("All files for sldemo_mdlref copied successfully.");

% Add the folder to the path
addpath(target_dir);

% Open the top-level model
open_system("sldemo_mdlref");

% Clean up
clear target_dir;