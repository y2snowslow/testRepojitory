function renameLoadMat(MatfileName,HeaderName)
%RENAMELOADMAT *.matファイルを接頭語をつけて読み出す
%   MatfileName = *.mat
%   HeaderName = 'Data1_'

% y2_o3 wrote this file.
% 
% As long as you retain this notice you can do whatever you want
% with this stuff. If we meet some day, and you think this stuff
% is worth it, you can buy me a ** ushi ** in return.

%initialize
i = 0; 

load(MatfileName);

%Get a list of variables
VariableList = who();

% assign variable for caller workspace with header name
for i = 1:length(VariableList)
    TempVariableName  = VariableList{i};
    
    if strcmp(TempVariableName,'i') || ...
        strcmp(TempVariableName,'MatfileName') || ...
        strcmp(TempVariableName,'HeaderName')
        continue;
    end
    
    assignin('caller', [HeaderName,TempVariableName], eval(TempVariableName));
end

end

