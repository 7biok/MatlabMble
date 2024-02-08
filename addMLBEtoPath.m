function addMLBEtoPath

% Get the current course folder
rootDir = fileparts(mfilename('fullpath'));

% Populate list of folders to add to path
path2add = {};
path2add{end+1} = rootDir;
path2add{end+1} = fullfile(rootDir,'electricity');
path2add{end+1} = fullfile(rootDir,'epl');
path2add{end+1} = fullfile(rootDir,'gasoline');
path2add{end+1} = fullfile(rootDir,'programming');
path2add{end+1} = fullfile(rootDir,'exercises');
path2add{end+1} = fullfile(rootDir,'supplemental','analysis');

% Add folders to the path
addpath(path2add{:},'-end');
